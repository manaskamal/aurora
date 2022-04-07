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

#ifndef __X86_64_PAGING_H__
#define __X86_64_PAGING_H__

#include <stdint.h>
#include <aurora.h>

#define PAGING_PRESENT 0x1
#define PAGING_WRITABLE 0x2
#define PAGING_USER 0x4

#define PHYSICAL_MEMORY_BASE  0xffff800000000000
#define PHYSICAL_MEMORY_MAX 0x0000400000000000

#define FRAMEBUFFER_ADDRESS 0xFFFFD00000000000

/* Kernel Virtual Address Base */
#define KERNEL_VA  0xFFFFC00000000000

/*
* x86_64_paging_init -- initialise the paging structures
*/
extern int x86_64_paging_init();

/*
* early_map_page -- maps pages to virtual address before moving to
* higher half kernel
* @param physical_address - raw physical address
* @param virtual_address - desired virtual address
* @param attrib -- attributes
*/
extern bool early_map_page(uint64_t physical_address, uint64_t virtual_address, uint8_t attrib);

/*
* x86_64_phys_to_virt -- returns the virtual page of that physical
* address
*/
AU_EXTERN AU_EXPORT uint64_t x86_64_phys_to_virt(uint64_t phys_addr);

/*
* x86_64_virt_to_phys -- returns the physical address of a virtual
* address
*/
AU_EXTERN AU_EXPORT uint64_t x86_64_virt_to_phys(uint64_t phys_addr);

/*
* x86_64_map_page -- maps a page to virtual address
* @param phys --physical address
* @param virt -- virtual address
* @param attrib -- attributes
*/
AU_EXTERN AU_EXPORT bool x86_64_map_page(uint64_t phys, uint64_t virt, uint8_t attrib);

/*
* x86_64_get_free_page -- search for free page
* @param user -- set if return page is needed for user mode
*/
AU_EXTERN AU_EXPORT uint64_t* x86_64_get_free_page(bool user);

/*
* x86_64_check_free -- checks if page is free
* @param address -- virtual address
*/
AU_EXTERN AU_EXPORT bool x86_64_check_free(uint64_t address);

/*
* x86_64_get_boot_pml -- returns the boot pml4 table
*/
AU_EXTERN AU_EXPORT uint64_t* x86_64_get_boot_pml();

/*
* make the lower half available for userspace
*/
extern void x86_64_boot_free();

/*
* x86_64_paging_free -- makes a page entry free
* @param start -- virtual address
*/
AU_EXTERN AU_EXPORT bool x86_64_paging_free(uint64_t start);
#endif