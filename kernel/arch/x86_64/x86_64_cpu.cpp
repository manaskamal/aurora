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

#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_exception.h>
#include <console.h>
#include <auinfo.h>

//! Global Descriptor Table functions
extern "C" uint16_t x64_get_segment_register(size_t reg);
extern "C" void x64_set_segment_register(size_t reg, uint16_t val);
extern "C" void load_default_sregs();
extern "C" void x64_ltr(uint16_t seg);

//! Interrupt Descriptor Table functions
extern "C" void x64_lidt(void* location);
extern "C" void x64_sidt(void* location);
extern "C" void x64_lgdt(void* location);
extern "C" void x64_sgdt(void* location);


#define GDT_ENTRY_MAX 9

//! Global variables GDT
static const size_t GDT_ENTRIES = GDT_ENTRY_MAX;
__declspec(align(4)) static gdt_entry gdt[GDT_ENTRIES];

__declspec(align(4)) static gdtr the_gdtr, old_gdtr;
static uint16_t oldsregs[8];


//!==========================================================================================
//! G L O B A L     D E S C R I P T O R    T A B L E 
//!==========================================================================================

void set_gdt_entry(gdt_entry& entry, size_t base, size_t limit, uint8_t access, uint8_t flags)
{
	entry.base_low = base & 0xFFFF;
	entry.base_mid = (base >> 16) & 0xFF;
	entry.base_high = (base >> 24) & 0xFF;
	entry.limit_low = limit & 0xFFFF;
	entry.access = access;
	entry.flags_limit = (flags << 4) | ((limit >> 16) & 0xF);
}

static void set_gdt_entry(gdt_entry& entry, uint8_t access, uint8_t flags)
{
	access |= GDT_ACCESS_PRESENT | GDT_ACCESS_TYPE;
	flags |= GDT_FLAG_GRAN;
	set_gdt_entry(entry, 0, SIZE_MAX, access, flags);
}

static void fill_gdt(gdt_entry* thegdt)
{
	set_gdt_entry(thegdt[GDT_ENTRY_NULL], 0, 0, 0, 0);    //0x00
	//Kernel Code segment: STAR.SYSCALL_CS
	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);  //0x08
	//Kernel Data segment
	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_DATA], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x10
	//User Code segment (32 bit): STAR.SYSRET_CS
	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x18
	//User Data segment
	set_gdt_entry(thegdt[GDT_ENTRY_USER_DATA], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x20
	//User Code segment (64 bit)
	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);   //0x28  | 3 -- 0x2B
	//Kernel Code segment (32 bit)
	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x30
}

void save_sregs()
{
	for (uint_fast8_t reg = 0; reg < 8; ++reg)
		oldsregs[reg] = x64_get_segment_register(reg);
}

void load_default_sregs()
{
	x64_set_segment_register(SREG_CS, SEGVAL(GDT_ENTRY_KERNEL_CODE, 0));
	x64_set_segment_register(SREG_DS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));
	x64_set_segment_register(SREG_ES, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));
	x64_set_segment_register(SREG_SS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));
	//Per CPU data
	x64_set_segment_register(SREG_FS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));
	x64_set_segment_register(SREG_GS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));
}

//! Initialize the Global Descriptor Table
void x86_64_gdt_initialize()
{
	x64_sgdt(&old_gdtr);
	save_sregs();
	fill_gdt(gdt);
	the_gdtr.gdtaddr = gdt;
	the_gdtr.size = GDT_ENTRIES * sizeof(gdt_entry)-1;
	x64_lgdt(&the_gdtr);
	load_default_sregs();
}


//=====================================================================
// I N T E R R U P T   D E S C R I P T O R   T A B L E
//=====================================================================
static void(*interrupts_handlers[256])(size_t, void*);

extern "C" extern void* default_irq_handlers[];

static void register_irq(IDT* entry, void* function)
{
	size_t faddr = (size_t)function;
	entry->offset_1 = faddr & UINT16_MAX;
	entry->offset_2 = (faddr >> 16) & UINT16_MAX;
	entry->offset_3 = (faddr >> 32) & UINT32_MAX;
}

void setvect(size_t vector, void(*function)(size_t vector, void* param))
{
	interrupts_handlers[vector] = function;
};

extern "C" void interrupt_dispatcher(uint64_t num, interrupt_stack_frame *frame)
{
	interrupts_handlers[num](num, frame);
	return;
}

static IDT the_idt[256];
IDTR idtr;

void default_irq(size_t vect, void* param){
	x64_cli();
	printf("[aurora]: Default interrupt++\n");
	for (;;);
}


void x86_64_idt_initialize() {


	void* m_ist[4];
	uint32_t tss[28];
	for (int i = 0; i < 28; i++) tss[i] = 0xffffffff;
	for (int i = 0; i < 1; i++)
	{
		uint8_t bos[1024];
		m_ist[i] = bos + 1024;
		tss[9 + i * 2] = reinterpret_cast<uint64_t>(m_ist[i]) & 0xffffffff;
		tss[9 + i * 2 + 1] = reinterpret_cast<uint64_t>(m_ist[i]) >> 32;
	}
	gdtr curr_gdt;
	x64_sgdt(&curr_gdt);
	gdt_entry* thegdt = the_gdtr.gdtaddr; //curr_gdt.gdtaddr;
	set_gdt_entry(thegdt[GDT_ENTRY_TSS], reinterpret_cast<uint64_t>(tss)& UINT32_MAX, sizeof(tss), GDT_ACCESS_PRESENT | 0x9, 0);
	*(uint64_t*)&thegdt[GDT_ENTRY_TSS + 1] = (reinterpret_cast<uint64_t>(tss) >> 32);
	x64_ltr(SEGVAL(GDT_ENTRY_TSS, 0));


	//IDTR *idtr = (IDTR*)0xFFFFD80000000000;
	idtr.idtaddr = the_idt;
	idtr.length = 256 * sizeof(IDT)-1;
	x64_lidt(&idtr);
	for (int n = 0; n < 256; n++)
	{
		the_idt[n].ist = 0;
		the_idt[n].selector = SEGVAL(GDT_ENTRY_KERNEL_CODE, 0);
		the_idt[n].zero = 0;
		the_idt[n].type_attr = GDT_ACCESS_PRESENT | 0xE;
		register_irq(&the_idt[n], default_irq_handlers[n]);
	}

}

void x86_64_cpu_feature_enable() {

	size_t a, b, c, d;
	x64_cpuid(1, &a, &b, &c, &d);

	if ((c & (1 << 26)) != 0) {
		au_get_boot_info()->auprint("[aurora]: xcr0 supported\n");
		/* Enable XCR0 register */
		uint64_t cr4 = x64_read_cr4();
		cr4 |= (1 << 18);
		x64_write_cr4(cr4);
	}

	if ((d & (1 << 25)) != 0){
		au_get_boot_info()->auprint("[aurora]: SSE is supported \n");
		size_t cr4 = x64_read_cr4();
		cr4 |= (1 << 10);

		if ((d & (1 << 24)) != 0) {
			au_get_boot_info()->auprint("[aurora]: fxsave supported \n");
			cr4 |= (1 << 9);
		}

		x64_write_cr4(cr4);
	}
	else if ((d & (1 << 26)) != 0) {
		au_get_boot_info()->auprint("[aurora]: SSE2 is supported \n");
	}
	else if ((c & (1 << 0)) != 0)
		au_get_boot_info()->auprint("[aurora]: SSE3 is supported \n");

#ifdef AVX_ENABLED
	if ((c & (1 << 28)) != 0) {
		size_t xcr0 = x64_read_xcr0();
		xcr0 |= 7;
		x64_write_xcr0(xcr0);
		au_get_boot_info()->auprint("[aurora]: AVX enabled\n");
	}
	x64_cpuid(0xD, &a, &b, &c, &d);
	if ((a & (7 << 5)) != 0) {
		size_t ax, bx, cx, dx;
		x64_cpuid(0xD, &ax, &bx, &cx, &dx, 0);
		size_t xcr0 = x64_read_xcr0();
		xcr0 |= (ax&(7<<5));
		x64_write_xcr0(xcr0);
		au_get_boot_info()->auprint("[aurora]: AVX-512 enabled %d bytes\n",bx);
	}
#endif
}

/*
 * x86_64_cpu_initialize -- initialize the cpu
 */
void x86_64_cpu_initialize() {
	x64_cli();
	x86_64_gdt_initialize();
	x86_64_idt_initialize();
	x86_64_exception_init();
	x86_64_cpu_feature_enable();

	/* Enable SYSCALL extension */
	size_t efer = x64_read_msr(IA32_EFER);
	efer |= (1 << 11);
	efer |= 1;
	efer |= (1 << 0);
	efer |= 1;
	x64_write_msr(IA32_EFER, efer);
	x64_sti();
}