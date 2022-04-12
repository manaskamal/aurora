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

#include <atomic\au_spinlock.h>
#include <mm\kmalloc.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_per_cpu.h>
#include <console.h>
#include <kdrivers\serial.h>

/*
 * au_create_spinlock -- creates a spinlock and return
 */
au_spinlock_t * au_create_spinlock() {
	au_spinlock_t *spinlock = (au_spinlock_t*)kmalloc(sizeof(au_spinlock_t));
	spinlock->value = 0;
	spinlock->set_by_cpu = 0;
	return spinlock;
}

/*
 * au_remove_spinlock -- deletes a spinlock
 * @param spinlock -- spinlock to remove
 */
void au_remove_spinlock(au_spinlock_t* spinlock) {
	kfree(spinlock);
}

/*
 * au_acquire_spinlock -- acquire a spinlock
 * @param spinlock -- spinlock to acquire
 */
void au_acquire_spinlock(au_spinlock_t *spinlock) {
	if (spinlock->value > 1)
		spinlock->value = 0;
	x64_lock_acquire(&spinlock->value);
	spinlock->set_by_cpu = per_cpu_get_cpu_id();
}

/*
 * au_free_spinlock -- free a spinlock
 * @param spinlock -- spinlock to free
 */
void au_free_spinlock(au_spinlock_t* spinlock) {
	if (spinlock->value > 1){ //corrupted spinlock
		return;
	}

	spinlock->set_by_cpu = per_cpu_get_cpu_id();
	spinlock->value = 0;
	
}