/*
 * Copyright (C) Manas Kamal Choudhury 2022
 * au_mm -- aurora basic memory manager
 */

#ifndef __AU_MM_H__
#define __AU_MM_H__

#include "stdint.h"
#include <Uefi.h>


struct EfiMemoryMap {
	EFI_MEMORY_DESCRIPTOR* memmap;
	uint64_t MemMapSize, MapKey, DescriptorSize;
	UINT32 DescriptorVersion;
};

typedef struct _reserved_mem_ {
	uint64_t address;
	struct _reserved_mem_* next;
	struct _reserved_mem_* prev;
}au_reserved_mem_t;
/*
* au_initialize_pmmngr -- initialize the physical memory manager
* @param memmap -- obtained memory map from uefi
* @param buffer -- actual memory map buffer
* @param bufsize -- buffer size
*/
extern void au_initialize_pmmngr(struct EfiMemoryMap memmap, void* buffer, size_t bufsize);

/*
* au_pmmngr_allocate -- allocate a page aligned block and
* return it
*/
extern uint64_t au_pmmngr_allocate();

/*
* au_pmmngr_free -- free a page aligned block
*/
extern void au_pmmngr_free(uint64_t address);

/*
* au_print_reserved_mem -- prints all reserved areas
*/
extern void au_print_reserved_mem();

/*
* au_get_rsvd_mem_count -- returns the total number of reserved
* memory count
*/
extern int au_get_rsvd_mem_count();

/*
* au_get_phys_allocated -- returns the allocated stack of
* physical memory
*/
extern void* au_get_phys_allocated();

/*
* au_initialize_vm -- initialize the virtual memory system
*/
extern void au_initialize_vm();

/*
* au_map_p2v -- maps physical to virtual address
*/
extern bool au_map_p2v(uint64_t vaddr, uint64_t paddr, size_t attrib);

#endif