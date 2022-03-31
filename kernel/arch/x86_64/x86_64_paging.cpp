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
	uint64_t* new_cr3 = (uint64_t*)x86_64_pmmngr_alloc();
	memset(new_cr3, 0, 4096);

	/* copy entire address space to new address space */
	for (int i = 0; i < 512; i++) {
		if (i == 511)
			continue;

		if (old_cr3[i] & 0x1)
			new_cr3[i] = old_cr3[i];
		else
			new_cr3[i] = 0;
	}

	x64_write_cr3((size_t)new_cr3);

	/* map entire physical memory to PHYSICAL_MEMORY_BASE */
	for (uint64_t i = 0; i < x86_64_pmmngr_get_total_mem() / 4096; i++)
		early_map_page(0x0 + i * 4096, PHYSICAL_MEMORY_BASE + i * 4096, 0);

	/* clear up the lower half*/
	for (int i = 0; i < 256; i++)
		new_cr3[i] = 0;

	/* from here we are fully boot free*/
	x86_64_pmmngr_set_high(true);
	x86_64_pmmngr_high_mem_bitmap();
	return 0;
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
		return 0;
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
	if (!(x86_64_phys_to_virt(pml4i[i4]) & PAGING_PRESENT)) {
		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml4i[i4] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml3 = (uint64_t*)x86_64_phys_to_virt(pml4i[i4] & ~(4096 - 1));
	if (!(pml3[i3] & PAGING_PRESENT)) {
		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml3[i3] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml2 = (uint64_t*)x86_64_phys_to_virt((pml3[i3] & ~(4096 - 1)));

	if (!(pml2[i2] & PAGING_PRESENT)) {
		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();
		pml2[i2] = page | flags;
		flush_tlb((void*)page);
		x64_mfence();
	}

	uint64_t* pml1 = (uint64_t*)x86_64_phys_to_virt((pml2[i2] & ~(4096 - 1)));
	if (pml1[i1] & PAGING_PRESENT) {
		x86_64_pmmngr_free((void*)phys);
		return false;
	}

	pml1[i1] = phys | flags;
	flush_tlb((void*)virt);
	x64_mfence();
	return true;
}

