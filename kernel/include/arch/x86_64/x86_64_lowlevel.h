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

#ifndef __X86_64_LOW_LEVEL_H__
#define __X86_64_LOW_LEVEL_H__

#include <stdint.h>
#include <aurora.h>

#define GDT_ENTRY_NULL 0
#define GDT_ENTRY_KERNEL_CODE 1
#define GDT_ENTRY_KERNEL_DATA 2
#define GDT_ENTRY_USER_CODE32 3
#define GDT_ENTRY_USER_DATA 4
#define GDT_ENTRY_USER_CODE 5
#define GDT_ENTRY_KERNEL_CODE32 6
#define GDT_ENTRY_TSS 7
#define GDT_ENTRY_MAX 9		//TSS takes two entries



#define SEGVAL(gdtent, rpl) \
	((gdtent << 3) | rpl)

#define SEGVAL_LDT(ldtent, rpl) \
	((ldtent << 3) | 0x4 | rpl)

enum sregs {
	SREG_CS,
	SREG_DS,
	SREG_ES,
	SREG_FS,
	SREG_GS,
	SREG_SS
};

#define GDT_FLAG_GRAN 0x8
#define GDT_FLAG_32BT 0x4
#define GDT_FLAG_64BT 0x2

#define GDT_ACCESS_PRESENT 0x80
#define GDT_ACCESS_PRIVL(x) (x << 5)
#define GDT_ACCESS_TYPE 0x10
#define GDT_ACCESS_EX 0x8
#define GDT_ACCESS_DC 0x4
#define GDT_ACCESS_RW 0x2
#define GDT_ACCESS_AC 0x1

#define MSR_IA32_MTRRCAP 0xFE
#define MSR_IA32_MTRRBASE 0x200
#define MSR_IA32_PAT 0x277
#define MSR_IA32_MTRR_DEF_TYPE 0x2FF

#define MSR_IA32_MISC_ENABLE 0x1A0
#define MSR_IA32_ENERGY_PERF_BIAS 0x1B0
#define MSR_IA32_PERF_CTL 0x199
#define MSR_IA32_PERF_STATUS 0x198
#define MSR_IA32_PM_ENABLE 0x770
#define MSR_IA32_HWP_CAPABILITIES 0x771
#define MSR_IA32_HWP_REQUEST_PKG 0x772
#define MSR_IA32_HWP_INTERRUPT 0x773
#define MSR_IA32_HWP_REQUEST 0x774
#define MSR_IA32_HWP_PECI_REQUEST_INFO 0x775
#define MSR_IA32_HWP_STATUS 0x777
#define MSR_IA32_FS_BASE 0xC0000100
#define MSR_IA32_GS_BASE 0xC0000101
#define MSR_IA32_KERNELGS_BASE 0xC0000102
#define IA32_EFER  0xC0000080

#pragma pack(push, 1)

typedef struct _gdt {
	uint16_t limit_low;
	uint16_t base_low;
	uint8_t  base_mid;
	uint8_t  access;
	uint8_t  flags_limit;
	uint8_t  base_high;
}gdt_entry, *pgdt_entry;

typedef struct _gdtr{
	uint16_t size;
	pgdt_entry gdtaddr;
}gdtr, *pgdtr;

#pragma pack(pop)


//! Interrupt Descriptor Table
#pragma pack(push, 1)
typedef struct _idt {
	uint16_t offset_1;
	uint16_t selector;
	uint8_t  ist;
	uint8_t  type_attr;
	uint16_t offset_2;
	uint32_t offset_3;
	uint32_t zero;
}IDT;

typedef struct _idtr {
	uint16_t length;
	void*    idtaddr;
} IDTR;

typedef struct _tss {
	uint32_t reserved;
	size_t   rsp[3];
	size_t reserved2;
	size_t   IST[7];
	size_t   resv3;
	uint16_t  resv4;
	uint16_t  iomapbase;
}TSS;

typedef struct _stack_frame_ {
	_stack_frame_* baseptr;
	size_t  rip;
}stack_frame;


struct interrupt_stack_frame {
	stack_frame* baseptr;
	size_t  error;
	size_t  rip;
	size_t  cs;
	size_t  rflags;
	size_t  rsp;
	size_t  ss;
};

#pragma pack (pop)

//!=======================================================
//! G L O B A L     F U N C T I O N S
//!=======================================================
AU_EXTERN AU_EXPORT void x64_cli();
AU_EXTERN AU_EXPORT void x64_sti();
AU_EXTERN AU_EXPORT void x64_hlt();
//! in & out port functions
AU_EXTERN AU_EXPORT uint8_t x64_inportb(uint16_t port);
AU_EXTERN AU_EXPORT uint16_t x64_inportw(uint16_t port);
AU_EXTERN AU_EXPORT uint32_t x64_inportd(uint16_t port);

AU_EXTERN AU_EXPORT void x64_outportb(uint16_t port, uint8_t data);
AU_EXTERN AU_EXPORT void x64_outportw(uint16_t port, uint16_t data);
AU_EXTERN AU_EXPORT void x64_outportd(uint16_t port, uint32_t data);

//! MSR functions
AU_EXTERN AU_EXPORT uint64_t x64_read_msr(size_t msr);
AU_EXTERN AU_EXPORT void x64_write_msr(size_t msr, uint64_t data);

//! GS/FS Base functions
extern "C" uint8_t  x64_read_gs_b(size_t offset);
extern "C" uint16_t x64_read_gs_w(size_t offset);
extern "C" uint32_t x64_read_gs_d(size_t offset);
extern "C" uint64_t x64_read_gs_q(size_t offset);
extern "C" void x64_write_gs_b(size_t offset, uint8_t value);
extern "C" void x64_write_gs_w(size_t offset, uint16_t value);
extern "C" void x64_write_gs_d(size_t offset, uint32_t value);
extern "C" void x64_write_gs_q(size_t offset, uint64_t value);

//!Mfench
extern "C" void x64_mfence();

//!x64_cpuid
extern "C" void x64_cpuid(size_t page, size_t* a, size_t* b, size_t* c, size_t* d, size_t subpage = 0);

//!Control Register
extern "C" size_t x64_read_cr0();
extern "C" size_t x64_read_cr2();
extern "C" size_t x64_read_cr3();
extern "C" size_t x64_read_cr4();
extern "C" void x64_write_cr0(size_t);
extern "C" void x64_write_cr3(size_t);
extern "C" void x64_write_cr4(size_t);

//!GDT &  IDT Function
extern "C" void x64_lgdt(void* location);
extern "C" void x64_sgdt(void* location);
extern "C" void x64_idt_test();
//! TLB Flush
extern "C" void flush_tlb(void* addr);
extern "C" void cache_flush();
extern "C" void x64_pause();

//! SSE & AVX
extern "C" void x64_activate_sse();
extern "C" void x64_activate_avx();
extern "C" uint64_t x64_read_xcr0();
extern "C" void x64_write_xcr0(uint64_t);

extern "C" void x64_stack_switch(size_t address);
extern "C" size_t x64_get_stack();

AU_EXTERN AU_EXPORT void x64_lock_acquire(int * lock);
AU_EXTERN AU_EXPORT void x64_lock_release(int* lock);
#endif