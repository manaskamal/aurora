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

#ifndef __AU_SPINLOCK_H__
#define __AU_SPINLOCK_H__

#include <stdint.h>
#include <auinfo.h>
#include <aurora.h>

/* au_spinlock -- spinlock structure*/
typedef struct _au_spinlock_ {
	uint64_t value;
	uint8_t  set_by_cpu;
}au_spinlock_t;


/*
* au_create_spinlock -- creates a spinlock and return
*/
AU_EXTERN AU_EXPORT au_spinlock_t * au_create_spinlock();

/*
* au_remove_spinlock -- deletes a spinlock
* @param spinlock -- spinlock to remove
*/
AU_EXTERN AU_EXPORT void au_remove_spinlock(au_spinlock_t* spinlock);

/*
* au_acquire_spinlock -- acquire a spinlock
* @param spinlock -- spinlock to acquire
*/
AU_EXTERN AU_EXPORT void au_acquire_spinlock(au_spinlock_t *spinlock);

/*
* au_free_spinlock -- free a spinlock
* @param spinlock -- spinlock to free
*/
AU_EXTERN AU_EXPORT void au_free_spinlock(au_spinlock_t* spinlock);

#endif