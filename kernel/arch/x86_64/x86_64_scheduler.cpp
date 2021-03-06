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

#include <arch\x86_64\x86_64_scheduler.h>
#include <_null.h>
#include <console.h>
#include <arch\x86_64\x86_64_per_cpu.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_apic.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_pmmngr.h>
#include <kdrivers\au_video.h>
#include <mm\kmalloc.h>
#include <kdrivers\serial.h>
#include <string.h>
#include <kdrivers\serial.h>

extern "C" int x86_64_save_context(thread_t* thread);
extern "C" void x86_64_execute_context(thread_t *thread);

thread_t *thread_list_head = NULL;
thread_t *thread_list_last = NULL;
thread_t *thread_current = NULL;
thread_t * idle = NULL;

au_spinlock_t *scheduler_lock = NULL;
/*
 * thread_insert -- insert a thread to thread list
 * @param new_thread -- newly created thread address
 */
void thread_insert(thread_t * new_thread) {
	new_thread->next = NULL;
	new_thread->prev = NULL;

	if (thread_list_head == NULL) {
		thread_list_last = new_thread;
		thread_list_head = new_thread;
		thread_current = thread_list_last;
	}
	else {
		thread_list_last->next = new_thread;
		new_thread->prev = thread_list_last;
	}

	thread_list_last = new_thread;
}

/**
 * thread_delete -- deletes a thread from its
 * thread list
 * @param thread -- thread to remove
 */
void thread_delete(thread_t * thread) {
	if (thread_list_head == NULL)
		return;

	if (thread == thread_list_head) {
		thread_list_head = thread_list_head->next;
	}
	else {
		thread->prev->next = thread->next;
	}

	if (thread == thread_list_last) {
		thread_list_last = thread->prev;
	}
	else {
		thread->next->prev = thread->prev;
	}
}

/*
 * x86_64_create_kthread -- creates a kernel mode thread
 * @param entry -- entry point of the kthread
 * @param stack -- stack address of the kthread
 * @param cr3 -- pml4 of the thread
 */
thread_t * x86_64_create_kthread(void(*entry)(void), uint64_t stack, uint64_t cr3) {
	
	thread_t *thread = (thread_t*)kmalloc(sizeof(thread_t));
	memset(thread, 0, sizeof(thread_t));
	thread->ss = 0x10;
	thread->rsp = (uint64_t)stack;
	thread->rflags = 0x202;
	thread->cs = 0x08;
	thread->rip = (uint64_t)entry;
	thread->rax = 0;
	thread->rbx = 0;
	thread->rcx = 0;
	thread->rdx = 0;
	thread->rsi = 0;
	thread->rdi = 0;
	thread->rbp = (uint64_t)thread->rsp;
	thread->r8 = 0;
	thread->r9 = 0;
	thread->r10 = 0;
	thread->r11 = 0;
	thread->r12 = 0;
	thread->r13 = 0;
	thread->r14 = 0;
	thread->r15 = 0;
	thread->ds = 0x10;
	thread->es = 0x10;
	thread->fs = 0x10;
	thread->gs = 0x10;
	thread->cr3 = cr3;
	thread->kern_esp = stack;
	thread->state = THREAD_STATE_READY;
	thread->privl = THREAD_PRIVL_KERNEL;
	//thread->cpu_affinity = THREAD_CPU_AFFINITY_ANY;
	thread->fxstate = kmalloc(512);
	memset(thread->fxstate, 0, 512);
	thread_insert(thread);
	return thread;
}


/*
* x86_64_create_uthread -- creates a user mode thread
* @param entry -- entry point of the uthread
* @param stack -- stack address of the uthread
* @param cr3 -- pml4 of the thread
*/
thread_t * x86_64_create_uthread(void(*entry)(void), uint64_t stack, uint64_t cr3) {

	thread_t *thread = (thread_t*)kmalloc(sizeof(thread_t));
	memset(thread, 0, sizeof(thread_t));
	thread->ss = SEGVAL(GDT_ENTRY_USER_DATA, 3);
	thread->rsp = (uint64_t)stack;
	thread->rflags = 0x286;
	thread->cs = SEGVAL(GDT_ENTRY_USER_CODE, 3);
	thread->rip = (uint64_t)entry;
	thread->rax = 0;
	thread->rbx = 0;
	thread->rcx = 0;
	thread->rdx = 0;
	thread->rsi = 0;
	thread->rdi = 0;
	thread->rbp = (uint64_t)thread->rsp;
	thread->r8 = 0;
	thread->r9 = 0;
	thread->r10 = 0;
	thread->r11 = 0;
	thread->r12 = 0;
	thread->r13 = 0;
	thread->r14 = 0;
	thread->r15 = 0;
	thread->ds = SEGVAL(GDT_ENTRY_USER_DATA, 3);
	thread->es = SEGVAL(GDT_ENTRY_USER_DATA, 3);
	thread->fs = SEGVAL(GDT_ENTRY_USER_DATA, 3);
	thread->gs = SEGVAL(GDT_ENTRY_USER_DATA, 3);
	thread->cr3 = cr3;
	thread->kern_esp = (x86_64_phys_to_virt((uint64_t)x86_64_pmmngr_alloc()) + 4096);
	thread->state = THREAD_STATE_READY;
	thread->privl = THREAD_PRIVL_USER;
	//thread->cpu_affinity = THREAD_CPU_AFFINITY_ANY;
	thread->fxstate = kmalloc(512);
	memset(thread->fxstate, 0, 512);
	thread_insert(thread);
	return thread;
}

au_spinlock_t *queue_lock;

/* 
 * x86_64_next_thread -- the main arranger
 * of threads, switch to next thread
 */
void x86_64_next_thread() {
	//au_acquire_spinlock(scheduler_lock);
	thread_t *thr = thread_current;
	do {
		thr = thr->next;
		
		if (thr == NULL)
			thr = thread_list_head;
	} while (thr->state != THREAD_STATE_READY);

end:
	thread_current = thr;
	//au_free_spinlock(scheduler_lock);
}


//static uint64_t sched_start_lock = 0;
//extern "C" uint64_t scheduler_lock = 0;
au_spinlock_t *sched_start_lock;


static bool start_scheduler = false;
/*
 * the main scheduler, heart of aurora
 */
void x86_64_sceduler_isr(size_t v, void* p) {
	x64_cli();
	//interrupt_stack_frame *frame = (interrupt_stack_frame*)p;
#ifdef SMP
	thread_t * current_thr = (thread_t*)per_cpu_get_c_thread();
#endif
	if (x86_64_save_context(thread_current) == 0) {
		thread_current->cr3 = x64_read_cr3();

		if (thread_current->privl == THREAD_PRIVL_USER)
			thread_current->kern_esp = x86_64_get_tss()->rsp[0];

		/*if (x86_64_fxsave_supported())
			x64_fxsave(thread_current->fxstate);*/


		apic_local_eoi();
		x86_64_next_thread();
		

		/*if (x86_64_fxsave_supported())
			x64_fxrstor(thread_current->fxstate);*/
		if (thread_current->privl == THREAD_PRIVL_USER)
			x86_64_get_tss()->rsp[0] = thread_current->kern_esp;

		
		x86_64_execute_context(thread_current);
	}
end:
	apic_local_eoi();
	//au_free_spinlock(queue_lock);
	//x
	
	//
}

static uint64_t idle_lock = 0;
extern "C" uint64_t ap_lock;

/*
 * x86_64_idle_thread -- when no thread is left to execute or simply,
 * there is no threads in ready queue except idle thread, cpu's jump
 * to idle thread and thus, processing never stops
 */
void x86_64_idle_thread() {	
	printf("Idle \n");
	while (1) {	
		//x64_hlt();
	}
}

/*
 * x86_64_initialize_scheduler -- initialize the scheduler
 * engine in BSP
 */
int x86_64_initialize_scheduler() {
	idle = x86_64_create_kthread(x86_64_idle_thread, (x86_64_phys_to_virt((size_t)x86_64_pmmngr_alloc()) + 4096),
		x64_read_cr3());
	printf ("Idle thread rsp -> %x \n", idle->rsp);
#ifdef SMP
	scheduler_lock = au_create_spinlock();
	queue_lock = au_create_spinlock();
	per_cpu_set_c_thread((void*)idle);
#endif
	thread_current = idle;
	return 0;
}

/* 
 * x86_64_initialize_idle -- setup the idle thread in per_cpu basis
 */
void x86_64_initialize_idle() {
	per_cpu_set_c_thread((void*)idle);
}

/* 
 *x86_64_sched_start -- start the scheduler engine
*/
void x86_64_sched_start() {
	x64_cli();
	setvect(0x40, x86_64_sceduler_isr);
	x86_64_execute_context(idle);
}

extern "C" void sched_debug(void* rcx) {
	printf("Sched debug rcx -> %x \n", rcx);
}
/*
 * x86_64_execute_idle -- execute the first thread
 * idle
 */
void x86_64_execute_idle() {	
}

thread_t * x86_64_get_idle_thr() {
	return idle;
}

void x86_64_sched_enable(bool value) {
	start_scheduler = true;
}

au_spinlock_t *x86_64_get_scheduler_lock() {
	return scheduler_lock;
}

thread_t *x86_64_get_current_thread() {
	return thread_current;
}