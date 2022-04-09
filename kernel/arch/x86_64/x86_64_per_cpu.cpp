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

#include <arch\x86_64\x86_64_per_cpu.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_cpu.h>

/*
 * per_cpu_set_cpu_id -- write the cpu id
 * @param id -- cpu id
 */
void per_cpu_set_cpu_id(uint8_t id) {
	x64_write_gs_b(0, id);
}

/*
 * per_cpu_set_c_thread -- write current thread
 * address
 * @param thread -- current thread address
 */
void per_cpu_set_c_thread(void* thread) {
	x64_write_gs_q(1, (uint64_t)thread);
}


/*
 * per_cpu_get_cpu_id -- gets the current cpu id
 */
uint8_t per_cpu_get_cpu_id() {
	return x64_read_gs_b(0);
}

/*
 * per_cpu_get_c_thread -- gets the current running thread
 */
void* per_cpu_get_c_thread() {
	return (void*)x64_read_gs_q(1);
}