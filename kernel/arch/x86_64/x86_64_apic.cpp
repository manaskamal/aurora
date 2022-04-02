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

#include <stdint.h>
#include <arch\x86_64\x86_64_apic.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_ioapic.h>


#define IA32_APIC_BASE_MSR  0x1B
#define IA32_APIC_BASE_MSR_BSP  0x100
#define IA32_APIC_BASE_MSR_X2APIC 0x400
#define IA32_APIC_BASE_MSR_ENABLE 0x800

#define IA32_X2APIC_REGISTER_BASE_MSR  0x800
#define IA32_APIC_SVR_ENABLE  0x100

#define IA32_APIC_LVT_MASK 0x10000


static bool x2apic = false;
static void* apic = nullptr;

extern void debug_print(const char *text, ...);

//! Reads APIC register
uint64_t read_apic_register(uint16_t reg){

	if (x2apic){
		size_t msr = IA32_X2APIC_REGISTER_BASE_MSR + reg;
		return x64_read_msr(msr);
	}
	else{

		if (reg == LAPIC_REGISTER_ICR){
			volatile uint32_t* reg_addr = raw_offset<volatile uint32_t*>(apic, reg << 4);
			volatile uint32_t* reg_next_addr = raw_offset<volatile uint32_t*>(apic, (reg + 1) << 4);
			return *reg_addr | ((uint64_t)*reg_next_addr << 32);
		}
		volatile uint32_t* reg_addr = raw_offset<volatile uint32_t*>(apic, reg << 4);
		return *reg_addr;
	}
}


//! Writs APIC Register
void write_apic_register(uint16_t reg, uint64_t value){

	if (x2apic){

		size_t msr = IA32_X2APIC_REGISTER_BASE_MSR + reg;
		x64_write_msr(msr, value);
	}
	else {

		if (reg == LAPIC_REGISTER_ICR){

			volatile uint32_t* reg_addr = raw_offset<volatile uint32_t*>(apic, reg << 4);
			volatile uint32_t* reg_next_addr = raw_offset<volatile uint32_t*>(apic, (reg + 1) << 4);
			uint32_t low_part = value & UINT32_MAX;
			uint32_t high_part = (value >> 32);
			*reg_next_addr = high_part;
			x64_mfence();
			*reg_addr = low_part;
		}
		volatile uint32_t* reg_addr = raw_offset<volatile uint32_t*>(apic, reg << 4);
		*reg_addr = value;
	}
}


//! Sends EOI to APIC
void apic_local_eoi(){

	write_apic_register(LAPIC_REGISTER_EOI, 0);
}


//! Checks if X2APIC is supported or not!!
bool x2apic_supported(){

	size_t a, b, c, d;
	x64_cpuid(0x1, &a, &b, &c, &d);
	return (c & (1 << 21)) != 0;
}

static void io_wait(){
	volatile size_t counter = 0;
	for (; counter < 1000; ++counter);
}


void apic_spurious_interrupt(size_t p, void* param) {
}



#define PIC1  0x20
#define PIC2  0xA0
#define PIC1_COMMAND   PIC1
#define PIC1_DATA      (PIC1+1)
#define PIC2_COMMAND   PIC2
#define PIC2_DATA      (PIC2+1)

#define ICW1_ICW4   0x01
#define ICW1_SINGLE  0x02
#define ICW1_INTERVAL4 0x04
#define ICW1_LEVEL     0x08
#define ICW1_INIT      0x10

#define ICW4_8086  0x01
#define ICW4_AUTO  0x02
#define ICW4_BUF_SLAVE  0x08
#define ICW4_BUF_MASTER 0x0C
#define ICW4_SFNM  0x10

static int apic_timer_count = 0;
//! Interrupt Vector Functions for APIC
void  apic_timer_interrupt(size_t p, void* param) {
	apic_timer_count++;
	apic_local_eoi();
}



//! Initialize our APIC
int x86_64_initialize_apic() {

	size_t apic_base;
	apic_base = (size_t)x86_64_phys_to_virt(0xFEE00000);
	apic_timer_count = 0;
	//map_page (0xFEE00000, 0xFEE00000,0);

	apic = (void*)apic_base;

	if (x2apic_supported()) {
		x2apic = true;
		apic_base |= IA32_APIC_BASE_MSR_X2APIC;
	}

	apic_base |= IA32_APIC_BASE_MSR_ENABLE;
	//! Sends EOI to APIC
	x64_write_msr(IA32_APIC_BASE_MSR,x86_64_virt_to_phys(apic_base));
	//! Sends EOI to APIC
	setvect(0xFF, apic_spurious_interrupt);
	write_apic_register(LAPIC_REGISTER_SVR, read_apic_register(LAPIC_REGISTER_SVR) |
		IA32_APIC_SVR_ENABLE | 0xFF);


	//!Register the time speed
	write_apic_register(LAPIC_REGISTER_TMRDIV, 0xa);  //0xa

	/*! timer initialized*/
	size_t timer_vector = 0x40;
	setvect(timer_vector, apic_timer_interrupt);

	size_t timer_reg = (1 << 17) | timer_vector;
	write_apic_register(LAPIC_REGISTER_LVT_TIMER, timer_reg);
	io_wait();
	write_apic_register(LAPIC_REGISTER_TMRINITCNT, 76);  //100 , 500


	x64_outportb(PIC1_DATA, 0xFF);
	io_wait();
	x64_outportb(PIC2_DATA, 0xFF);

	//! Finally Intialize I/O APIC
	//map_page (ioapic_base,ioapic_base,0);
	ioapic_init((void*)x86_64_phys_to_virt(0xfec00000));
	return 0;
}


void timer_sleep(uint32_t ms) {
	uint32_t tick = ms + apic_timer_count;
	while (tick > apic_timer_count)
		;
}


uint64_t icr_dest(uint32_t processor) {
	if (x2apic)
		return ((uint64_t)processor << 32);
	else
		return ((uint64_t)processor << 56);
}

bool icr_busy() {
	return (read_apic_register(LAPIC_REGISTER_ICR) & (1 << 12)) != 0;
}


#ifdef SMP
void initialize_cpu(uint32_t processor) {

	uint64_t* address = (uint64_t*)pmmngr_alloc();
	void* ap_data = get_ap_address();
	memcpy(address, ap_data, 4096);

	write_apic_register(LAPIC_REGISTER_ICR, icr_dest(processor) | 0x4500);
	while (icr_busy());

	//!startup ipi
	size_t startup_ipi = icr_dest(processor) | 0x4600 | ((size_t)address >> 12);
	write_apic_register(LAPIC_REGISTER_ICR, startup_ipi);
	while (icr_busy());
	for (int i = 0; i < 100; i++)
		;

}
#endif