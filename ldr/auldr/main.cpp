/*
 * Copyright (C) Manas Kamal Choudhury 2022
 */

#include <Uefi.h>
#include "aulib.h"
#include "print.h"
#include "graphics.h"
#include "au_mm.h"
#include "string.h"
#include "lowlevel.h"
#include "pe.h"
#include "auinfo.h"


/*
 * the main entry point for auldr
 */
int main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *system_table) {
	EFI_STATUS status;
	/* initialize the aulib service */
	aulib_initialize(ImageHandle, system_table);

	/* initialize the console service*/
	aulib_initialize_console();

	printf(L"[auldr]: Aurora Loader v2.0 \r\n");

	/* setup the graphics */
	uint64_t mode = aulib_query_gop(1024, 720);
	aulib_set_graphics_mode(mode);

	uint8_t* kernel = aulib_load_file(L"\\EFI\\XENEVA\\xnkrnl.exe");
	au_puts("[auldr]: kernel file loaded successfully \n");

	IMAGE_DOS_HEADER *dos = (IMAGE_DOS_HEADER*)kernel;
	IMAGE_NT_HEADERS *nt = (IMAGE_NT_HEADERS*)(kernel + dos->e_lfanew);

	uint64_t kernel_size = aulib_get_recent_file_size();

	au_puts("[auldr]: AuLoader v1.0 \n");

	au_puts("[auldr]: initializing memory manager\n");
	
	EfiMemoryMap map;
	EFI_MEMORY_DESCRIPTOR *desc_ptr = nullptr;
	map.MemMapSize = 0;
	map.MapKey = map.DescriptorSize = map.DescriptorVersion = 0;
	status = system_table->BootServices->GetMemoryMap(&map.MemMapSize, nullptr, &map.MapKey, &map.DescriptorSize, &map.DescriptorVersion);

	
	map.MemMapSize += 16 * sizeof(EFI_MEMORY_DESCRIPTOR);
	map.memmap = (EFI_MEMORY_DESCRIPTOR*)aulib_allocate(map.MemMapSize);

	status = system_table->BootServices->GetMemoryMap(&map.MemMapSize, map.memmap, &map.MapKey, &map.DescriptorSize, &map.DescriptorVersion);
	if (status != EFI_SUCCESS) {
		au_puts("[auldr]: failed to obtain memory map \n");
	}

	
	const size_t early_page_stack_size = 1024*1024;
	EFI_PHYSICAL_ADDRESS early_phys_page_stack = 0;
	if (!(system_table->BootServices->AllocatePages(AllocateAnyPages, EfiLoaderData, early_page_stack_size / EFI_PAGE_SIZE, (EFI_PHYSICAL_ADDRESS*)early_phys_page_stack))) {
		au_puts("[auldr]: early page stack allocation failed \n");
	}

	void* xsdp_address = aulib_get_acpi_pointer();

	if (EFI_ERROR(status = system_table->BootServices->ExitBootServices(ImageHandle, map.MapKey))) {
		au_print("[auldr]: exit_boot_service failed\n");
		return EFI_SUCCESS;
	}

	au_cli();

	au_initialize_pmmngr(map, (void*)early_phys_page_stack, early_page_stack_size);
	au_initialize_vm();
	au_puts("[auldr]: memory manager initialized \n");

	
	uint64_t vaddr = nt->OptionalHeader.ImageBase;
	for (int i = 0; i < (kernel_size + 4095) / 4096; i++) {
		au_map_p2v(vaddr + i * 4096, au_pmmngr_allocate(), 0);
	}
	
	aulib_copy_mem((void*)vaddr, kernel, kernel_size);

	au_print("[auldr]: Kernel copied to virtual address \n");

	uint64_t ke_stack = 0xFFFFA00000000000;
	for (int i = 0; i < (0x100000 + 4095) / 4096; i++)
		au_map_p2v(ke_stack + i * 4096, au_pmmngr_allocate(), 0);

	au_print("[auldr]: kstack mapped \n");
	aurora_info_t bootinfo;
	bootinfo.mem_map = map.memmap;
	bootinfo.mem_desc_size = map.DescriptorSize;
	bootinfo.mem_map_size = map.MemMapSize;
	bootinfo.phys_stack_allocated = au_get_phys_allocated();
	bootinfo.resvd_mem_count = au_get_rsvd_mem_count();
	bootinfo.fb_addr = aulib_get_fb_address();
	bootinfo.fb_size = aulib_get_fb_size();
	bootinfo.x_res = aulib_get_x_resolution();
	bootinfo.y_res = aulib_get_y_resolution();
	bootinfo.pixels_per_line = aulib_get_pixels_per_line();
	bootinfo.acpi_table_pointer = xsdp_address;
	bootinfo.kernel_size = kernel_size;
	bootinfo.auprint = au_print;

	IMAGE_DOS_HEADER *dos2 = (IMAGE_DOS_HEADER*)vaddr;
	IMAGE_NT_HEADERS *nt2 = (IMAGE_NT_HEADERS*)(vaddr + dos2->e_lfanew);
	void* entrypoint = (void*)(nt2->OptionalHeader.ImageBase + nt2->OptionalHeader.AddressOfEntryPoint);

	au_puts("[auldr]:Calling Kernel\n");
	au_call_kernel(&bootinfo, entrypoint, (void*)ke_stack, 0x100000);
	for (;;);
	return EFI_SUCCESS;
}