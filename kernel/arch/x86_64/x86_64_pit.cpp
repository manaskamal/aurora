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

#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_apic.h>
#include <console.h>
#include <arch\x86_64\x86_64_ioapic.h>
#include <arch\x86_64\x86_64_pit.h>
#include <arch\x86_64\x86_64_pic.h>


static uint64_t pit_count = 1;  
static uint64_t pit_lock = 0;

void x86_64_pit_handler(size_t v, void* p) {
	//x64_lock_acquire(&pit_lock);
	pit_count++;
	apic_local_eoi();
	//pit_lock = 0;
}


void x86_64_pit_initialize() {
	uint32_t divider = 1193181 / 100;
	x64_outportb(0x43, 0x00 | 0x06 | 0x30 | 0x00);
	x64_outportb(0x40, divider & 0xff);
	x64_outportb(0x40, (divider >> 8));
	ioapic_register_irq(0, x86_64_pit_handler, 2);
}

uint64_t x86_64_pit_get_current() {
	return pit_count;
}

void x86_64_pit_sleep(int ms) {
	static int ticks = ms + pit_count;
	while (ticks > pit_count)
		;
}