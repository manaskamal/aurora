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

#ifndef __X86_64_SCHEDULER_H__
#define __X86_64_SCHEDULER_H__

#include <stdint.h>
#include <aurora.h>

#define THREAD_STATE_READY  1
#define THREAD_STATE_BLOCKED 3
#define THREAD_STATE_SLEEP 4

typedef struct _thread_ {
	uint64_t ss;
	uint64_t *rsp;
	uint64_t rflags;
	uint64_t cs;
	uint64_t rip;

	uint64_t rax;
	uint64_t rbx;
	uint64_t rcx;
	uint64_t rdx;
	uint64_t rsi;
	uint64_t rdi;
	uint64_t rbp;
	uint64_t r8;
	uint64_t r9;
	uint64_t r10;
	uint64_t r11;
	uint64_t r12;
	uint64_t r13;
	uint64_t r14;
	uint64_t r15;
	uint64_t ds;
	uint64_t es;
	uint64_t fs;
	uint64_t gs;
	uint64_t cr3;
	uint64_t kern_esp;
	uint8_t state;
	_thread_ *next;
	_thread_ *prev;
}thread_t;


/*
* thread_insert -- insert a thread to thread list
* @param new_thread -- newly created thread address
*/
AU_EXTERN AU_EXPORT void thread_insert(thread_t * new_thread);

/**
* thread_delete -- deletes a thread from its
* thread list
* @param thread -- thread to remove
*/
AU_EXTERN AU_EXPORT void thread_delete(thread_t * thread);

/*
* x86_64_create_kthread -- creates a kernel mode thread
* @param entry -- entry point of the kthread
* @param stack -- stack address of the kthread
* @param cr3 -- pml4 of the thread
*/
AU_EXTERN AU_EXPORT thread_t * x86_64_create_kthread(void(*entry)(void), uint64_t stack, uint64_t cr3);

/*
* x86_64_initialize_scheduler -- initialize the scheduler
* engine
*/
extern int x86_64_initialize_scheduler();

/*
*x86_64_sched_start -- start the scheduler engine
*/
extern void x86_64_sched_start();

/*
* x86_64_initialize_idle -- setup the idle thread in per_cpu basis
*/
extern void x86_64_initialize_idle();

extern thread_t * x86_64_get_idle_thr();

extern void x86_64_sched_enable(bool value);
#endif