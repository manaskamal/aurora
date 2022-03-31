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

#ifndef __X86_64_PMMNGR_H__
#define __X86_64_PMMNGR_H__

#include <auinfo.h>

/*
* x86_64_pmmngr_init -- initialize the physical memory,
* for early mode it will initialize in a flat way, after
* boot free, it will initialize numa if present else not
* @param info -- aurora boot information passed by auldr
*/
extern void x86_64_pmmngr_init(aurora_info_t *info);

/*
* x86_64_pmmngr_alloc -- allocates memory block in two ways,
* if it is early mode than allocate in a flat way, if it is numa
* way allocate from numa data structure, for higher half it will
* allocate from free page stack
* @return allocated address
*/
extern void* x86_64_pmmngr_alloc();

/*
* x86_64_pmmngr_free -- frees up a physical address
* @param addr - address to free
*/
extern void x86_64_pmmngr_free(void* addr);

/*
* x86_64_pmmngr_get_total_mem -- get total ram
*/
extern uint64_t x86_64_pmmngr_get_total_mem();

/*
* x86_64_pmmngr_set_high -- setup physical memory manager to use
* in higher half memory
* @param value -- boolean value
*/
extern void x86_64_pmmngr_set_high(bool value);

/*
* x86_64_pmmngr_get_bitmap_size -- returns the bitmap
* size
*/
extern uint64_t x86_64_pmmngr_get_bitmap_size();

/*
* x86_64_pmmngr_is_high_mem -- return if higher half mapped
*/
extern bool x86_64_pmmngr_is_high_mem();

extern void x86_64_pmmngr_high_mem_bitmap();



#endif