/*
 * Copyright (C) Manas Kamal Choudhury 2022
 * au_mm -- aurora basic memory manager
 */

#include "au_mm.h"
#include "graphics.h"
#include "print.h"
#include "aulib.h"
#include "lowlevel.h"
#include "string.h"

uint64_t* page_stack = 0;
uint64_t* stack_ptr = 0;
uint64_t* allocated_stack = 0;
uint64_t* allocated_ptr = 0;

au_reserved_mem_t *rsvd_mem_first;
au_reserved_mem_t *rsvd_mem_last;
static int rsvd_mem_count;



void au_insert_reserved_mem(au_reserved_mem_t *mem) {
	mem->next = nullptr;
	mem->prev = nullptr;

	if (rsvd_mem_first == NULL) {
		rsvd_mem_first = mem;
		rsvd_mem_last = mem;
	}
	else {
		rsvd_mem_last->next = mem;
		mem->prev = rsvd_mem_last;
		rsvd_mem_last = mem;
	}

	rsvd_mem_count++;
}



void au_reserved_mem_remove(au_reserved_mem_t *mm) {
	if (mm == rsvd_mem_first) {
		rsvd_mem_first = rsvd_mem_first->next;
	}
	else {
		mm->prev->next = mm->next;
	}

	if (mm == rsvd_mem_last) {
		rsvd_mem_last = mm->prev;
	}
	else {
		mm->next->prev = mm->prev;
	}

	aulib_free(mm);
	rsvd_mem_count--;
}

/*
 * au_initialize_pmmngr -- initialize the physical memory manager
 * @param memmap -- obtained memory map from uefi
 * @param buffer -- actual memory map buffer
 * @param bufsize -- buffer size
 */
void au_initialize_pmmngr(struct EfiMemoryMap memmap, void* buffer, size_t bufsize) {
	uint64_t mem_blocks = 0;
	stack_ptr = page_stack = (EFI_PHYSICAL_ADDRESS*)buffer;

	rsvd_mem_first = nullptr;
	rsvd_mem_last = nullptr;
	rsvd_mem_count = 1;

	bufsize /= 2;
	allocated_ptr = allocated_stack = raw_offset<EFI_PHYSICAL_ADDRESS*>(buffer, bufsize);

	EFI_MEMORY_DESCRIPTOR *current = memmap.memmap;
	while (raw_diff(current, memmap.memmap) < memmap.MemMapSize) {
		if (current->Type == EfiConventionalMemory) {
			EFI_PHYSICAL_ADDRESS addr = current->PhysicalStart;
			size_t numpage = current->NumberOfPages;
 
			if (EFI_PAGE_SIZE < 4096) {
				numpage /= (4096 / EFI_PAGE_SIZE);
			}
			else if (EFI_PAGE_SIZE > 4096) {
				numpage *= (EFI_PAGE_SIZE / 4096);
			}
		
			while (numpage > 0 && raw_diff(stack_ptr, page_stack) < bufsize) {
				*stack_ptr++ = addr;
				--numpage;
				addr += 4096;
			}
            
			
			if (raw_diff(stack_ptr, page_stack) >= bufsize)
				break;
		}
		current = raw_offset<EFI_MEMORY_DESCRIPTOR*>(current, memmap.DescriptorSize);
	}
}

/*
 * au_pmmngr_allocate -- allocate a page aligned block and 
 * return it
 */
uint64_t au_pmmngr_allocate() {
	if (stack_ptr == page_stack) {
		return 0;
	}else {
		uint64_t allocated = *--stack_ptr;
		*allocated_ptr++ = allocated;

		/* insert it into the reserved list */
		/*au_reserved_mem_t *rsvd = (au_reserved_mem_t*)aulib_allocate(sizeof(au_reserved_mem_t));
		rsvd->address = allocated;
		au_insert_reserved_mem(rsvd);*/
		rsvd_mem_count++;

		return allocated;
	}
}

/*
 * au_pmmngr_free -- free a page aligned block 
 */
void au_pmmngr_free(uint64_t address) {
	*stack_ptr++ = address;
	
}

/*
 * au_print_reserved_mem -- prints all reserved areas
 */
void au_print_reserved_mem() {
	for (au_reserved_mem_t *rsvd = rsvd_mem_first; rsvd != NULL; rsvd = rsvd->next) {
		au_print("[auldr]: reserved memory -> %x \n", rsvd->address);
	}
}

/*
 * au_get_resvd_mem_first -- returns the first reserved memory pointer
 * for linked list
 */
void* au_get_rsvd_mem_first() {
	return rsvd_mem_first;
}

/*
 * au_get_phys_allocated -- returns the allocated stack of 
 * physical memory
 */
void* au_get_phys_allocated() {
	return allocated_ptr;
}

/*
 * au_get_rsvd_mem_count -- returns the total number of reserved
 * memory count
 */
int au_get_rsvd_mem_count() {
	return rsvd_mem_count;
}


static void* make_canonical_i(size_t addr)
{
	if (addr & ((size_t)1 << 47))
		addr |= 0xFFFF000000000000;
	return (void*)addr;
}

static void* make_canonical(void* addr)
{
	return make_canonical_i((size_t)addr);
}

static size_t decanonical(void* addr)
{
	return (size_t)addr & 0x0000FFFFFFFFFFFF;
}


size_t* set_pml4_recursive(size_t* pml4, size_t slot) {
	pml4[slot] = (size_t)pml4 | 0x1 | 0x2;
	void* new_pml4 = make_canonical((void*)((slot << 39) | (slot << 30) | (slot << 21) | (slot << 12)));
	au_write_cr3((uint64_t)au_read_cr3());
	return (size_t*)new_pml4;
}


/*
 * au_initialize_vm -- initialize the virtual memory system
 */
void au_initialize_vm() {
	uint64_t* pml_root = (uint64_t*)au_read_cr3();

	uint64_t* new_cr3 = (uint64_t*)au_pmmngr_allocate();
	memset(new_cr3, 0, 4096);
	for (int i = 0; i < 512; i++) 
		new_cr3[i] = pml_root[i];

	au_write_cr3((size_t)new_cr3);


	void *pml4ptr = (void*)((size_t)pml_root & ~(size_t)0xFFF);
	size_t* pml4 = (size_t*)pml4ptr;

	size_t cr0 = au_read_cr0();
	au_write_cr0(cr0 & (SIZE_MAX - (1 << 16)));


	for (size_t x = (4096 / sizeof(size_t)); x > 0; --x) {
		if ((pml4[x - 1] & 0x1) == 0) {
			pml4 = set_pml4_recursive(pml4, x - 1);
			break;
		}
	}
	
	au_write_cr0(cr0);
}


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
 * au_map_p2v -- maps physical to virtual address
 */
bool au_map_p2v(uint64_t vaddr, uint64_t paddr, size_t attrib) {
	size_t flags = 0x1 | 0x2 | attrib;

	const long i4 = (decanonical((void*)vaddr) >> 39) & 0x1FF;
	const long i3 = (vaddr >> 30) & 0x1FF;
	const long i2 = (vaddr >> 21) & 0x1FF;
	const long i1 = (vaddr >> 12) & 0x1FF;

	uint64_t *pml4i = (uint64_t*)au_read_cr3();

	if (!(pml4i[i4] & 0x1)) {
		const uint64_t page = (uint64_t)au_pmmngr_allocate();
		pml4i[i4] = page | flags;	
		memset((void*)page, 0, 4096);
		au_flush_tlb((void*)page);
		au_mfence();
	}

	uint64_t* pml3 = (uint64_t*)(pml4i[i4] & ~(4096 - 1));

	if (!(pml3[i3] & 0x1)) {
		const uint64_t page = (uint64_t)au_pmmngr_allocate();
		pml3[i3] = page | flags;
		memset((void*)page, 0, 4096);
		au_flush_tlb((void*)page);
		au_mfence();
	}

	uint64_t* pml2 = (uint64_t*)(pml3[i3] & ~(4096 - 1));
	if (!(pml2[i2] & 0x1)) {
		const uint64_t page = (uint64_t)au_pmmngr_allocate();
		pml2[i2] = page | flags;
		memset((void*)page, 0, 4096);
		au_flush_tlb((void*)page);
		au_mfence();
	}

	uint64_t* pml1 = (uint64_t*)(pml2[i2] & ~(4096 - 1));
	if (pml1[i1] & 0x1) {
		return false;
	}

	pml1[i1] = paddr | flags;
	au_flush_tlb((void*)vaddr);
	return true;
}
