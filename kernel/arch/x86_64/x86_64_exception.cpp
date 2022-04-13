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

#include <arch\x86_64\x86_64_exception.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_per_cpu.h>

static uint64_t exception_lock = 0;

void panic(const char* msg, ...) {
	x64_lock_acquire(&exception_lock);
	printf("***ARCH x86_64 : Exception Occured ***\n");
	printf("[aurora]: We are sorry to say that, a processor invalid exception has occured\n");
	printf("[aurora]: please inform it to the master of the kernel\n");
	printf("[aurora]: Below is the code of exception\n");
	exception_lock = 0;
	printf(msg);
}

void divide_by_zero_fault(size_t vector, void* param) {
	x64_lock_acquire(&exception_lock);
	x64_cli();
	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;
	panic("\nDivide by 0");

	printf("__PROCESSOR_DATA__\n");
	printf("RIP -> %x\n", frame->rip);
	printf("RSP -> %x\n", frame->rsp);
	printf("RFLAGS -> %x\n", frame->rflags);
	exception_lock = 0;
	for (;;);
}

void single_step_trap(size_t vector, void* param) {
	x64_lock_acquire(&exception_lock);
	x64_cli();
	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;
	panic("\nSingle Step Trap");
	exception_lock = 0;
	for (;;);
}

void nmi_trap(size_t vector, void* param){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nNMI [Non-Muskable-Interrupt] Trap");
	exception_lock = 0;
	for (;;);

}

//! exception function breakpoint_trap
void breakpoint_trap(size_t vector, void* param){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nBreakpoint Trap");
	exception_lock = 0;
	for (;;);
}

//! exception function -- overflow_trap
void overflow_trap(size_t v, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nOverflow Trap");
	exception_lock = 0;
	for (;;);
}

//! exception function -- bounds_check_fault
void bounds_check_fault(size_t v, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nBound Check Fault");
	exception_lock = 0;
	for (;;);
}

//! exception function -- invalid_opcode_fault
void invalid_opcode_fault(size_t v, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	interrupt_stack_frame *frame = (interrupt_stack_frame*)p;
	panic("Invalid Opcode Fault\n");
	printf("CPU ID -> %d \n", per_cpu_get_cpu_id());
	printf("__PROCESSOR TRACE__\n");
	printf("RIP -> %x\n", frame->rip);
	printf("Stack -> %x\n", frame->rsp);
	printf("RFLAGS -> %x\n", frame->rflags);
	printf("CS -> %x\n", frame->cs);
	printf("SS -> %x\n", frame->ss);
	exception_lock = 0;
	for (;;);
}

//! exception function -- no device fault
void no_device_fault(size_t v, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nNo Device Fault");
	exception_lock = 0;
	for (;;);
}

//! exception function -- double fault abort
void double_fault_abort(size_t v, void* p){
	x64_cli();
	panic("\nDouble Fault Abort");
	for (;;);
}

//! exception function -- invalid tss fault
void invalid_tss_fault(size_t v, void* p){
	x64_cli();
	panic("\nInvalid TSS Fault ");
	for (;;);
}

//! exception function -- no_segment_fault
void no_segment_fault(size_t v, void* p){
	x64_cli();
	panic("\nNo Segment Fault");
	for (;;);
}

//! exception function -- stack_fault
void stack_fault(size_t v, void* p){
	x64_cli();
	panic("\nStack Fault at ");
	for (;;);
}

//! exception function --- general protection fault
//   general protection fault is responsible for displaying processor security based error
void general_protection_fault(size_t v, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	interrupt_stack_frame *frame = (interrupt_stack_frame*)p;
	panic ("Genral Protection Fault\n");
	printf("Current CPU id -> %d \n", per_cpu_get_cpu_id());
	printf("Current thread -> %x \n", per_cpu_get_c_thread());
	printf ("__PROCESSOR TRACE__\n");
	printf ("RIP -> %x\n",frame->rip);
	printf ("Stack -> %x\n", frame->rsp);
	printf ("RFLAGS -> %x\n", frame->rflags);
	printf ("CS -> %x, SS -> %x\n", frame->cs, frame->ss);
	exception_lock = 0;
	for(;;);
}

//! Most important for good performance is page fault! whenever any memory related errors occurs
//! it get fired and new page swapping process should be allocated

void page_fault(size_t vector, void* param){
	x64_lock_acquire(&exception_lock);
	x64_cli();

	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;
	void* vaddr = (void*)x64_read_cr2();

	int present = !(frame->error & 0x1);
	int rw = frame->error & 0x2;
	int us = frame->error & 0x4;
	int resv = frame->error & 0x8;
	int id = frame->error & 0x10;

	panic("[aurora]: page fault \n");
	printf("[aurora]: page fault at -> %x \n", vaddr);
	printf("[aurora]: current cpu -> %d \n", per_cpu_get_cpu_id());
	if (present)
		printf("bit: present \n");
	else if (rw)
		printf("bit: rw \n");
	else if (us)
		printf("bit: us \n");
	else if (resv)
		printf("bit: resv \n");
	else if (id)
		printf("bit: id\n");

	printf("RIP -> %x \n", frame->rip);

	exception_lock = 0;

	for (;;);
}


//! exception function -- fpu_fault
void fpu_fault(size_t vector, void* p){
	x64_lock_acquire(&exception_lock);
	x64_cli();
	panic("\nFPU Fault");
	exception_lock = 0;
	for (;;);
}

//! exception function -- alignment_check_fault

void alignment_check_fault(size_t v, void* p){
	x64_cli();
	panic("\nAlignment Check Fault at address ");
	for (;;);
}

//! exception function -- machine_check_abort
void machine_check_abort(size_t v, void* p){
	x64_cli();
	panic("\nMachine Check Abort");
	for (;;);
}

//! exception function -- simd related fault handler
void simd_fpu_fault(size_t v, void* p){
	x64_cli();
	panic("\nSIMD FPU Fault");
	for (;;);
}

void x86_64_exception_init() {
	setvect(0, divide_by_zero_fault);
	setvect(1, single_step_trap);
	setvect(2, nmi_trap);
	setvect(3, breakpoint_trap);
	setvect(4, overflow_trap);
	setvect(5, bounds_check_fault);
	setvect(6, invalid_opcode_fault);
	setvect(7, no_device_fault);
	setvect(8, double_fault_abort);
	setvect(10, invalid_tss_fault);
	setvect(11, no_segment_fault);
	setvect(12, stack_fault);
	setvect(13, general_protection_fault);
	setvect(14, page_fault);
	setvect(16, fpu_fault);
	setvect(17, alignment_check_fault);
	setvect(18, machine_check_abort);
	setvect(19, simd_fpu_fault);
}


