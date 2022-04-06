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

void x86_64_ap_init(void *cpu_data) {
	x64_lock_acquire(&lock);
	x64_cli();
	x86_64_cpu_initialize();
	x86_64_initialize_apic(false);
	x86_64_cpu_print_brand();

	x64_write_msr(MSR_IA32_GS_BASE, (uint64_t)cpu_data);
	au_get_boot_info()->auprint("CPU: id %d \n", x64_read_gs_b(0));

	lock = 0;
	x86_64_ap_started();
	for (;;);
}