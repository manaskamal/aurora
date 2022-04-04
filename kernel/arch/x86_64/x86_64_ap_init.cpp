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
#include <arch\x86_64\x86_64_pmmngr.h>
#include <arch\x86_64\x86_64_paging.h>
#include <kdrivers\serial.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_ap_init.h>
#include <arch\x86_64\x86_64_apic.h>
#include <string.h>

int lock = 0;

void x86_64_apic_handler(size_t v, void* p) {
	au_get_boot_info()->auprint("APIC interrupt \n");
	apic_local_eoi();
}

void x86_64_ap_init() {

	x64_lock_acquire(&lock);
	//au_get_boot_info()->auprint("Lock -> %d \n", lock);
	x86_64_cpu_initialize();

	x64_cli();
	x86_64_initialize_apic(false);
	
	au_get_boot_info()->auprint("APIC Base -> %x \n", x64_read_msr(0x1B));

	size_t maxcpuid, a, b, c, d;
	x64_cpuid(0, &maxcpuid, &b, &c, &d);
	char vendor[13];
	*(uint32_t*)&vendor[0] = b;
	*(uint32_t*)&vendor[4] = d;
	*(uint32_t*)&vendor[8] = c;
	vendor[12] = 0;
	au_get_boot_info()->auprint("CPU: Vendor -> %s \n", vendor);

	char bandstring[49];
	x64_cpuid(0x80000002, &a, &b, &c, &d);
	*(uint32_t*)&bandstring[0] = a;
	*(uint32_t*)&bandstring[4] = b;
	*(uint32_t*)&bandstring[8] = c;
	*(uint32_t*)&bandstring[12] = d;
	x64_cpuid(0x80000003, &a, &b, &c, &d);
	*(uint32_t*)&bandstring[16] = a;
	*(uint32_t*)&bandstring[20] = b;
	*(uint32_t*)&bandstring[24] = c;
	*(uint32_t*)&bandstring[28] = d;
	x64_cpuid(0x80000004, &a, &b, &c, &d);
	*(uint32_t*)&bandstring[32] = a;
	*(uint32_t*)&bandstring[36] = b;
	*(uint32_t*)&bandstring[40] = c;
	*(uint32_t*)&bandstring[44] = d;
	bandstring[48] = 0;
	au_get_boot_info()->auprint("CPU: Brand = %s \n", bandstring);
	//x64_sti();
	lock = 0;

	for (;;);
}