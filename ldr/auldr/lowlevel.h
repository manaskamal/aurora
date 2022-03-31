/*
 * Copyright (C) Manas Kamal Choudhury 2022
 *
 * lowlevel -- low level assembly stuff
 */

#ifndef __LOW_LEVEL_H__
#define __LOW_LEVEL_H__

extern "C" void* au_read_cr3();
extern "C" void au_write_cr3(size_t);
extern "C" void au_mfence();
extern "C" void au_flush_tlb(void* addr);
extern "C" void au_write_cr0(size_t);
extern "C" size_t au_read_cr0();
extern "C" void au_cli();
extern "C" void au_sti();
extern "C" void au_call_kernel(void* param, void* entry, void* stack, size_t stacksz);
#endif