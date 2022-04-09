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

#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_pmmngr.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <auinfo.h>
#include <console.h>
#include <string.h>
#include <kdrivers\serial.h>

/* search for free page from this address*/
#define PAGE_SEARCH_KERNEL  0xFFFFE00000000000
#define PAGE_SEARCH_USER    0x0000000000000000

uint64_t * boot_cr3;

size_t  pml4_index(uint64_t addr){
	return (addr >> 39) & 0x1ff;
}

size_t pdp_index(uint64_t addr){
	return (addr >> 30) & 0x1ff;
}

size_t pd_index(uint64_t addr){
	return (addr >> 21) & 0x1ff;
}

size_t pt_index(uint64_t addr){
	return (addr >> 12) & 0x1ff;
}

size_t p_index(uint64_t addr){
	return (addr & 0x7ff);
}

/*
 * early_map_page -- maps pages to virtual address before moving to 
 * higher half kernel
 * @param physical_address - raw physical address
 * @param virtual_address - desired virtual address
 * @param attrib -- attributes
 */
bool early_map_page(uint64_t physical_address, uint64_t virtual_address, uint8_t attrib){
	size_t flags = PAGING_WRITABLE | PAGING_PRESENT | attrib;

	const long i4 = (virtual_address >> 39) & 0x1FF;
	const long i3 = (virtual_address >> 30) & 0x1FF;
	const long i2 = (virtual_address >> 21) & 0x1FF;
	const long i1 = (virtual_address >> 12) & 0x1FF;

	uint64_t *pml4i = (uint64_t*)x64_read_cr3();
	if (!(pml4i[i4] & PAGING_PRESENT)){

		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml4i[i4] = page | flags;
		memset((void*)page, 0, 4096);
		flush_tlb((void*)page);
		x64_mfence();
	}
	uint64_t* pml3 = (uint64_t*)(pml4i[i4] & ~(4096 - 1));

	if (!(pml3[i3] & PAGING_PRESENT))
	{
		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml3[i3] = page | flags;
		memset((void*)page, 0, 4096);
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml2 = (uint64_t*)(pml3[i3] & ~(4096 - 1));

	if (!(pml2[i2] & PAGING_PRESENT)){
		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml2[i2] = page | flags;
		memset((void*)page, 0, 4096);
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml1 = (uint64_t*)(pml2[i2] & ~(4096 - 1));

	pml1[i1] = physical_address | flags;
	flush_tlb((void*)virtual_address);
	x64_mfence();
	return true;
}


/*
 * x86_64_paging_init -- initialise the paging structures
 */
int x86_64_paging_init() {

	uint64_t* old_cr3 = (uint64_t*)x64_read_cr3();
	boot_cr3 = old_cr3;
	uint64_t* new_cr3 = (uint64_t*)x86_64_pmmngr_alloc();
	memset(new_cr3, 0, 4096);

	/* copy entire address space to new address space */
	for (int i = 0; i < 512; i++) {
		if (i == 511)
			continue;

		if ((old_cr3[i] & 0x1))
			new_cr3[i] = old_cr3[i];
		else
			new_cr3[i] = 0;
	}

	/* Here! map 16 GiB of Physical Memory to Virtual Memory */

	uint64_t* pdpt = (uint64_t*)x86_64_pmmngr_alloc();
	memset(pdpt, 0, 4096);


	new_cr3[pml4_index(PHYSICAL_MEMORY_BASE)] = (uint64_t)pdpt | PAGING_PRESENT | PAGING_WRITABLE;

	/* Map entire 512 GiB of Physical Memory using 1GiB pages */
	for (size_t i = 0; i < 512; i++)
		pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + i] = i * 512 * 512 * 4096 | 0x80 | PAGING_PRESENT | PAGING_WRITABLE;
	

	/* Copy the mappings to boot page tables */
	old_cr3[pml4_index(PHYSICAL_MEMORY_BASE)] = new_cr3[pml4_index(PHYSICAL_MEMORY_BASE)];

	x64_write_cr3((size_t)new_cr3);

	boot_cr3 = new_cr3;

	/* from here, every physical page = higher half virtual page */
	x86_64_pmmngr_set_high(true);
	x86_64_pmmngr_high_mem_bitmap();

	return 0;
}

/*
 * make the lower half available for userspace
 */
void x86_64_boot_free() {
	uint64_t *cr3 = (uint64_t*)x64_read_cr3();
	for (int i = 0; i < 256; i++)
		cr3[i] = 0;
}

/*
 * x86_64_phys_to_virt -- returns the virtual page of that physical
 * address
 */
uint64_t x86_64_phys_to_virt(uint64_t phys_addr) {
	if (x86_64_pmmngr_is_high_mem())
		return (PHYSICAL_MEMORY_BASE + phys_addr);
	else
		return phys_addr;
}

/*
 * x86_64_virt_to_phys -- returns the physical address of a virtual
 * address
 */
uint64_t x86_64_virt_to_phys(uint64_t phys_addr) {
	if (x86_64_pmmngr_is_high_mem())
		return (phys_addr - PHYSICAL_MEMORY_BASE);
	else
		return phys_addr;
}

/*
 * x86_64_map_page -- maps a page to virtual address
 * @param phys --physical address
 * @param virt -- virtual address
 * @param attrib -- attributes
 */
bool x86_64_map_page(uint64_t phys, uint64_t virt, uint8_t attrib) {

	if (!x86_64_pmmngr_is_high_mem())
		return early_map_page(phys, virt, attrib);

	size_t flags = PAGING_PRESENT | PAGING_WRITABLE | attrib;

	const long i4 = (virt >> 39) & 0x1FF;
	const long i3 = (virt >> 30) & 0x1FF;
	const long i2 = (virt >> 21) & 0x1FF;
	const long i1 = (virt >> 12) & 0x1FF;

	uint64_t *pml4i = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	if (!(pml4i[i4] & PAGING_PRESENT)) {
		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		memset((void*)x86_64_phys_to_virt(page), 0, 4096);
		pml4i[i4] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}
	
	uint64_t* pml3 = (uint64_t*)(x86_64_phys_to_virt(pml4i[i4]) & ~(4096 - 1));
	if (!(pml3[i3] & PAGING_PRESENT)) {
		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		memset((void*)x86_64_phys_to_virt(page), 0, 4096);
		pml3[i3] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}
	
	uint64_t* pml2 = (uint64_t*)(x86_64_phys_to_virt(pml3[i3]) & ~(4096 - 1));
	if (!(pml2[i2] & PAGING_PRESENT)) {
		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		memset((void*)x86_64_phys_to_virt(page), 0, 4096);
		pml2[i2] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml1 = (uint64_t*)(x86_64_phys_to_virt(pml2[i2]) & ~(4096 - 1));
	if (pml1[i1] & PAGING_PRESENT) {
		x86_64_pmmngr_free((void*)phys);
		return false;
	}

	pml1[i1] = phys | flags;
	flush_tlb((void*)virt);
	x64_mfence();
	return true;
}


/*
 * x86_64_get_free_page -- search for free page 
 * @param user -- set if return page is needed for user mode
 */
uint64_t* x86_64_get_free_page(bool user) {
	uint64_t* page = 0;
	uint64_t start = PAGE_SEARCH_KERNEL;
	if (user)
		start = PAGE_SEARCH_USER;

	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());
	
	/* Walk through every page tables */
	for (;;) {
		if (!(pml4[pml4_index(start)] & PAGING_PRESENT))
			return (uint64_t*)start;

		uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));
		if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))
			return (uint64_t*)start;

		uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));
		if (!(pd[pd_index(start)] & PAGING_PRESENT))
			return (uint64_t*)start;

		uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

		if (!(pt[pt_index(start)] & PAGING_PRESENT))
			return (uint64_t*)start;
		
		start += 4096;
	}
	return 0;
}

/*
* x86_64_check_free -- checks if page is free
* @param start -- virtual address
*/
bool x86_64_check_free(uint64_t start) {

	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	if (!(pml4[pml4_index(start)] & PAGING_PRESENT))
		return true;

	uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));
	if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))
		return true;

	uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));
	if (!(pd[pd_index(start)] & PAGING_PRESENT))
		return true;

	uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	if (!(pt[pt_index(start)] & PAGING_PRESENT))
		return true;

	return false;
}


/*
* x86_64_paging_free -- makes a page entry free
* @param start -- virtual address
*/
bool x86_64_paging_free(uint64_t start) {

	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	if (!(pml4[pml4_index(start)] & PAGING_PRESENT))
		return false;

	uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));
	if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))
		return false;

	uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));
	if (!(pd[pd_index(start)] & PAGING_PRESENT))
		return false;

	uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	if (!(pt[pt_index(start)] & PAGING_PRESENT))
		return false;

	uint64_t *page = (uint64_t*)(pt[pt_index(start)] & ~(4096 - 1));
	x86_64_pmmngr_free(page);

	pt[pt_index(start)] = 0;


	return false;
}

/*
 * x86_64_get_boot_pml -- returns the boot pml4 table
 */
uint64_t* x86_64_get_boot_pml() {
	return boot_cr3;
}


void paging_debug(uint64_t va) {
	uint64_t* cr3 = (uint64_t*)x64_read_cr3();
	printf("CR3[I] -> %x \n", cr3[pml4_index(va)]);
}

