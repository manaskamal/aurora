/**
* BSD 2-Clause License
*
* Copyright (c) 2022, Manas Kamal Choudhury
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright notice,
*    this list of conditions and the following disclaimer in the documentation
*    and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
**/

/**
*  Copyright (C) Manas Kamal Choudhury 2021
*
*  ioapic.h -- I/O APIC
*
*  /PROJECT - Aurora v1.0 {Xeneva v1.0}
*  /AUTHOR  - Manas Kamal Choudhury
*
*==================================================
*/

#include <arch\x86_64\x86_64_ioapic.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_ioapic.h>
#include <arch\x86_64\x86_64_apic.h>
#include <arch\x86_64\x86_64_paging.h>
#include <stdint.h>

extern void debug_print(const char *text, ...);

//! Read I/O Apic register
static uint32_t read_ioapic_register(void* apic_base, const uint8_t offset)
{
	volatile uint32_t* ioregsel = reinterpret_cast<volatile uint32_t*>(apic_base);
	volatile uint32_t* ioregwin = raw_offset<volatile uint32_t*>(apic_base, 0x10);

	*ioregsel = offset;
	return *ioregwin;
}

//! Write I/O Apic register
static void write_ioapic_register(void* apic_base, const uint8_t offset, const uint32_t val)
{
	volatile uint32_t* ioregsel = reinterpret_cast<volatile uint32_t*>(apic_base);
	volatile uint32_t* ioregwin = raw_offset<volatile uint32_t*>(apic_base, 0x10);
	*ioregsel = offset;
	*ioregwin = val;
}


/**
*  Here's the special
*  our I/O Apic interrupt router to IDT
*  very very very very special function
*
*  @param vector -- vector number for IDT
*  @param fn     -- handler function
*  @param irq    -- IRQ number to remap to vector
*
*/
void ioapic_register_irq(size_t vector, void(*fn)(size_t, void* p), uint8_t irq)
{
	uint32_t reg = IOAPIC_REG_RED_TBL_BASE + irq * 2;
	write_ioapic_register((void*)x86_64_phys_to_virt(0xfec00000), reg + 1, read_apic_register(0x02) << 24);
	uint32_t low = read_ioapic_register((void*)x86_64_phys_to_virt(0xfec00000), reg);
	//!unmask the irq
	low &= ~(1 << 16);
	//!set to physical delivery mode
	low &= ~(1 << 11);
	low &= ~0x700;

	low &= ~0xff;
	low |= vector + 32;

	low |= (0 << 13);
	low |= (0 << 15);

	write_ioapic_register((void*)x86_64_phys_to_virt(0xfec00000), reg, low);   //vector + 32
	setvect(vector + 32, fn);
}


void ioapic_redirect(uint8_t irq, uint32_t gsi, uint16_t flags, uint8_t apic) {
	uint32_t ioapic_base = 0xfec00000;
	uint64_t redirection = irq + 32;
	if (flags & 2) {
		redirection |= 1 << 13;
	}


	if (flags & 8) {
		redirection |= 1 << 15;
	}

	redirection |= ((uint64_t)apic) << 56;

	uint32_t ioredtbl = (gsi - 0) * 2 + 16;

	write_ioapic_register((void*)x86_64_phys_to_virt(ioapic_base), ioredtbl + 0, (uint32_t)(redirection));
	write_ioapic_register((void*)x86_64_phys_to_virt(ioapic_base), ioredtbl + 1, (uint32_t)(redirection >> 32));
}

void ioapic_mask_irq(uint8_t irq, bool value){
	uint32_t reg = IOAPIC_REG_RED_TBL_BASE + irq * 2;
	write_ioapic_register((void*)x86_64_phys_to_virt(0xfec00000), reg + 1, read_apic_register(0x02) << 24);
	uint32_t low = read_ioapic_register((void*)0xfec00000, reg);
	//!unmask the irq
	if (value)
		low |= (1 << 16);  //mask
	else
		low &= ~(1 << 16); //unmask

	write_ioapic_register((void*)x86_64_phys_to_virt(0xfec00000), reg, low);   //vector + 32
}

//! I/O Apic Initialization
void ioapic_init(void* address)
{
	uint32_t ver = read_ioapic_register(address, IOAPIC_REG_VER);
	uint32_t intr_num = (ver >> 16) & 0xFF;
	for (size_t n = 0; n <= intr_num; ++n)
	{
		uint32_t reg = IOAPIC_REG_RED_TBL_BASE + n * 2;
		write_ioapic_register((void*)address, reg, read_ioapic_register(address, reg) | (1 << 16));
	}
}