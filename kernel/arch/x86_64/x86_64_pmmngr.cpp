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

#include <arch\x86_64\x86_64_pmmngr.h>
#include <arch\x86_64\x86_64_efi.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_paging.h>
#include <kdrivers\serial.h>
#include <stdint.h>
#include <string.h>
#include <auinfo.h>

static uint64_t free_memory = 0;
static uint64_t reserved_memory = 0;
static uint64_t used_memory = 0;
static uint64_t ram_bitmap_index = 0;
static uint64_t total_ram = 0;
static uint64_t ram_bitmap_size = 0;
static bool higher_half_mapped = false;

class Bitmap {
public:
	size_t size;
	uint8_t* buffer;

	bool operator[](uint64_t index) {
		if (index > size * 8) return false;
		uint64_t byte_index = index / 8;
		uint8_t  bit_index = index % 8;
		uint8_t  bit_indexer = 0x80 >> bit_index;

		if ((buffer[byte_index] & bit_indexer) > 0)
			return true;
		return false;
	}

	bool set(uint64_t index, bool value) {
		if (index > size * 8) return false;

		uint64_t byte_index = index / 8;
		uint8_t bit_index = index % 8;
		uint8_t bit_indexer = 0x80 >> bit_index;
	
		buffer[byte_index] &= ~bit_indexer;
		
		if (value)
			buffer[byte_index] |= bit_indexer;

		return true;
	}
};

Bitmap ram_bitmap;

/*
 * x86_64_pmmngr_init_bitmap -- initialize the bitmap
 * @param bitmap_size -- size of the bitmap
 * @param buffer -- bitmap buffer
 */
void x86_64_pmmngr_init_bitmap(size_t bitmap_size, void* buffer) {
	ram_bitmap.size = bitmap_size;
	ram_bitmap.buffer = (uint8_t*)buffer;

	for (int i = 0; i < bitmap_size; i++) {
		*(uint8_t*)(ram_bitmap.buffer + i) = 0;
	}
}

void x86_64_pmmngr_lock_page(void* address) {
	uint64_t index = (uint64_t)address / 4096;
	uint64_t ind = index / 8;
	if (ram_bitmap[index] == true) return;
	if (ram_bitmap.set(index, true)) {
		free_memory--;
		reserved_memory++;
	}
}

void x86_64_pmmngr_lock_pages(void* address, size_t size) {
	for (size_t i = 0; i < size; i++)
		x86_64_pmmngr_lock_page((void*)((size_t)address + i * 4096));
}

void x86_64_pmmngr_unreserve_page(void* address) {
	uint64_t index = (uint64_t)address / 4096;
	if (ram_bitmap[index] == false) return;
	if (ram_bitmap.set(index, false)) {
		free_memory++;
		reserved_memory--;
		if (ram_bitmap_index > index) ram_bitmap_index = index;
	}
}

/*
 * x86_64_pmmngr_alloc -- allocates memory block in two ways,
 * if it is early mode than allocate in a flat way, if it is numa
 * way allocate from numa data structure, for higher half it will
 * allocate from free page stack
 * @return allocated address
 */
void* x86_64_pmmngr_alloc() {
	for (; ram_bitmap_index < ram_bitmap.size * 8; ram_bitmap_index++) {
		if (ram_bitmap[ram_bitmap_index] == true) continue;
		x86_64_pmmngr_lock_page((void*)(ram_bitmap_index * 4096));
		used_memory++;
		return (void*)(ram_bitmap_index * 4096);
	}
}

/*
 * x86_64_pmmngr_alloc_blocks -- allocate more than 
 * one physical 4k mem block
 */
void* x86_64_pmmngr_alloc_blocks(int count) {
	void* first = x86_64_pmmngr_alloc();
	for (int i = 0; i < count - 1; i++)
		x86_64_pmmngr_alloc();


	return first;
}


/*
 * x86_64_pmmngr_free -- frees up a physical address
 * @param addr - address to free
 */
void x86_64_pmmngr_free(void* addr) {
	uint64_t index = (uint64_t)addr / 4096;
	if (ram_bitmap[index] == false) return;
	if (ram_bitmap.set(index, false)) {
		free_memory++;
		used_memory--;
		if (ram_bitmap_index > index) {
			ram_bitmap_index = index;
		}
	}
}
/*
 * x86_64_pmmngr_init -- initialize the physical memory,
 * for early mode it will initialize in a flat way, after
 * boot free, it will initialize numa if present else not
 * @param info -- aurora boot information passed by auldr
 */
void x86_64_pmmngr_init(aurora_info_t *info) {
	free_memory = 0;
	ram_bitmap_size = 0;
	total_ram = 0;
	ram_bitmap_index = 0;

	uint64_t memmap_entries = info->mem_map_size / info->mem_desc_size;
	void* bitmap_area = 0;

	/* Scan a suitable area for the bitmap */
	for (size_t i = 0; i < memmap_entries; i++) {
		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);
		total_ram += efi_mem->num_pages * 4096;
		if (efi_mem->type == 7) {
			if (((efi_mem->num_pages * 4096) > 0x100000) && bitmap_area == 0) {
				bitmap_area = (void*)efi_mem->phys_start;
			}
			uint64_t size_in_mb_kb = 0;
			char* unit = "B";
			if ((efi_mem->num_pages * 4096 / 1024 / 1024) == 0) {
				size_in_mb_kb = efi_mem->num_pages * 4096 / 1024;
				unit = "KB";
			}
			else {
				size_in_mb_kb = (efi_mem->num_pages * 4096 / 1024 / 1024);
				unit = "MB";
			}
			info->auprint("[aurora]: usable memory -> %x length -> %d %s\n", efi_mem->phys_start, size_in_mb_kb, unit);
		}
	}

	info->auprint("[aurora]: total memory -> %d GB \n", (total_ram/ 1024 / 1024 / 1024));
	uint64_t bitmap_size = total_ram / 4096 / 8 + 1;

	x86_64_pmmngr_init_bitmap(bitmap_size, bitmap_area);

	info->auprint("[aurora]: bitmap initialized %d bytes\n", bitmap_size);
	x86_64_pmmngr_lock_pages((void*)bitmap_area, bitmap_size);

	/* No lock all pages, that are not for use */
	for (size_t i = 0; i < memmap_entries; i++) {
		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);
		total_ram += efi_mem->num_pages;
		if (efi_mem->type != 7) {
			x86_64_pmmngr_lock_pages((void*)efi_mem->phys_start, efi_mem->num_pages);
		}
	}

	x86_64_pmmngr_lock_page((void*)0x0);

	/* also lock the early used physical blocks for 
	 * kernel and kernel stack */
	uint32_t allocated_count = info->resvd_mem_count;
	uint64_t* allocated_stack = (uint64_t*)info->phys_stack_allocated;
	while (allocated_count) {
		uint64_t address = *allocated_stack--;
		x86_64_pmmngr_lock_page((void*)address);
		allocated_count--;
	}

	uint64_t *address = (uint64_t*)0xA000;
	x86_64_pmmngr_lock_page((void*)0xA000);
	memset(address, 0, 4096);
	memcpy(address, info->apcode, 4096);

	info->auprint("[aurora]: x86_64 pmmngr initialized\n");
	higher_half_mapped = false;
}

/*
 * x86_64_pmmngr_get_total_mem -- get total ram
 */
uint64_t x86_64_pmmngr_get_total_mem() {
	return total_ram;
}

/*
 * x86_64_pmmngr_get_bitmap_size -- returns the bitmap
 * size
 */
uint64_t x86_64_pmmngr_get_bitmap_size() {
	return ram_bitmap_size;
}

/*
 * x86_64_pmmngr_set_high -- setup physical memory manager to use
 * in higher half memory
 * @param value -- boolean value
 */
void x86_64_pmmngr_set_high(bool value) {
	higher_half_mapped = value;
}

void x86_64_pmmngr_high_mem_bitmap() {
	au_get_boot_info()->auprint("RAM bitmap buffer -> %x \n", ram_bitmap.buffer);
	ram_bitmap.buffer = (uint8_t*)x86_64_phys_to_virt((uint64_t)ram_bitmap.buffer);
	au_get_boot_info()->auprint("after RAM bitmap buffer -> %x \n", ram_bitmap.buffer);
	//_au_debug_print_("RAM Bitmap -> %x \r\n", ram_bitmap.buffer);
}

/*
 * x86_64_pmmngr_is_high_mem -- return if higher half mapped 
 */
bool x86_64_pmmngr_is_high_mem() {
	return higher_half_mapped;
}