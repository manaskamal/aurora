; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG13533 DB	'[', 00H, 'a', 00H, 'u', 00H, 'l', 00H, 'd', 00H, 'r', 00H
	DB	']', 00H, ':', 00H, ' ', 00H, 'A', 00H, 'u', 00H, 'r', 00H, 'o'
	DB	00H, 'r', 00H, 'a', 00H, ' ', 00H, 'L', 00H, 'o', 00H, 'a', 00H
	DB	'd', 00H, 'e', 00H, 'r', 00H, ' ', 00H, 'v', 00H, '2', 00H, '.'
	DB	00H, '0', 00H, ' ', 00H, 0dH, 00H, 0aH, 00H, 00H, 00H
	ORG $+2
$SG13536 DB	'\', 00H, 'E', 00H, 'F', 00H, 'I', 00H, '\', 00H, 'X', 00H
	DB	'E', 00H, 'N', 00H, 'E', 00H, 'V', 00H, 'A', 00H, '\', 00H, 'x'
	DB	00H, 'n', 00H, 'k', 00H, 'r', 00H, 'n', 00H, 'l', 00H, '.', 00H
	DB	'e', 00H, 'x', 00H, 'e', 00H, 00H, 00H
	ORG $+2
$SG13537 DB	'[auldr]: kernel file loaded successfully ', 0aH, 00H
	ORG $+5
$SG13543 DB	'[auldr]: AuLoader v1.0 ', 0aH, 00H
	ORG $+7
$SG13544 DB	'[auldr]: initializing memory manager', 0aH, 00H
	ORG $+2
$SG13550 DB	'[auldr]: failed to obtain memory map ', 0aH, 00H
	ORG $+1
$SG13555 DB	'[auldr]: early page stack allocation failed ', 0aH, 00H
	ORG $+2
$SG13560 DB	'[auldr]: exit_boot_service failed', 0aH, 00H
	ORG $+5
$SG13562 DB	'[auldr]: memory manager initialized ', 0aH, 00H
	ORG $+2
$SG13569 DB	'[auldr]: Kernel copied to virtual address ', 0aH, 00H
	ORG $+4
$SG13575 DB	'[auldr]: kstack mapped ', 0aH, 00H
	ORG $+7
$SG13583 DB	'[auldr]:Calling Kernel', 0aH, 00H
CONST	ENDS
PUBLIC	main
EXTRN	?aulib_initialize@@YAHPEAXPEAUEFI_SYSTEM_TABLE@@@Z:PROC ; aulib_initialize
EXTRN	?aulib_initialize_console@@YAHXZ:PROC		; aulib_initialize_console
EXTRN	?aulib_allocate@@YAPEAX_K@Z:PROC		; aulib_allocate
EXTRN	?aulib_load_file@@YAPEAEPEA_W@Z:PROC		; aulib_load_file
EXTRN	?aulib_query_gop@@YA_KII@Z:PROC			; aulib_query_gop
EXTRN	?aulib_set_graphics_mode@@YAH_K@Z:PROC		; aulib_set_graphics_mode
EXTRN	?aulib_get_fb_address@@YAPEAIXZ:PROC		; aulib_get_fb_address
EXTRN	?aulib_get_x_resolution@@YAIXZ:PROC		; aulib_get_x_resolution
EXTRN	?aulib_get_y_resolution@@YAIXZ:PROC		; aulib_get_y_resolution
EXTRN	?aulib_get_fb_size@@YA_KXZ:PROC			; aulib_get_fb_size
EXTRN	?aulib_get_pixels_per_line@@YAIXZ:PROC		; aulib_get_pixels_per_line
EXTRN	?aulib_get_acpi_pointer@@YAPEAXXZ:PROC		; aulib_get_acpi_pointer
EXTRN	?aulib_get_recent_file_size@@YA_KXZ:PROC	; aulib_get_recent_file_size
EXTRN	?aulib_copy_mem@@YAXPEAX0_K@Z:PROC		; aulib_copy_mem
EXTRN	?printf@@YAHPEA_WZZ:PROC			; printf
EXTRN	?au_print@@YAXPEBDZZ:PROC			; au_print
EXTRN	?au_puts@@YAXPEBD@Z:PROC			; au_puts
EXTRN	?au_initialize_pmmngr@@YAXUEfiMemoryMap@@PEAX_K@Z:PROC ; au_initialize_pmmngr
EXTRN	?au_pmmngr_allocate@@YA_KXZ:PROC		; au_pmmngr_allocate
EXTRN	?au_get_rsvd_mem_count@@YAHXZ:PROC		; au_get_rsvd_mem_count
EXTRN	?au_get_phys_allocated@@YAPEAXXZ:PROC		; au_get_phys_allocated
EXTRN	?au_initialize_vm@@YAXXZ:PROC			; au_initialize_vm
EXTRN	?au_map_p2v@@YA_N_K00@Z:PROC			; au_map_p2v
EXTRN	au_cli:PROC
EXTRN	au_call_kernel:PROC
pdata	SEGMENT
$pdata$main DD	imagerel $LN14
	DD	imagerel $LN14+1224
	DD	imagerel $unwind$main
pdata	ENDS
xdata	SEGMENT
$unwind$main DD	041301H
	DD	02f0113H
	DD	0600b700cH
xdata	ENDS
; Function compile flags: /Odtp
; File e:\aurora kernel\ldr\auldr\main.cpp
_TEXT	SEGMENT
i$1 = 48
i$2 = 52
status$ = 56
vaddr$ = 64
map$ = 72
kernel$ = 112
kernel_size$ = 120
nt2$ = 128
ke_stack$ = 136
early_phys_page_stack$ = 144
dos$ = 152
entrypoint$ = 160
dos2$ = 168
nt$ = 176
xsdp_address$ = 184
tv162 = 192
mode$ = 200
bootinfo$ = 208
desc_ptr$ = 304
early_page_stack_size$ = 312
$T3 = 320
ImageHandle$ = 400
system_table$ = 408
main	PROC

; 19   : int main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *system_table) {

$LN14:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	push	rsi
	push	rdi
	sub	rsp, 376				; 00000178H

; 20   : 	EFI_STATUS status;
; 21   : 	/* initialize the aulib service */
; 22   : 	aulib_initialize(ImageHandle, system_table);

	mov	rdx, QWORD PTR system_table$[rsp]
	mov	rcx, QWORD PTR ImageHandle$[rsp]
	call	?aulib_initialize@@YAHPEAXPEAUEFI_SYSTEM_TABLE@@@Z ; aulib_initialize

; 23   : 
; 24   : 	system_table->ConOut->ClearScreen(system_table->ConOut);

	mov	rax, QWORD PTR system_table$[rsp]
	mov	rax, QWORD PTR [rax+64]
	mov	rcx, QWORD PTR system_table$[rsp]
	mov	rcx, QWORD PTR [rcx+64]
	call	QWORD PTR [rax+48]

; 25   : 
; 26   : 	/* initialize the console service*/
; 27   : 	aulib_initialize_console();

	call	?aulib_initialize_console@@YAHXZ	; aulib_initialize_console

; 28   : 
; 29   : 	printf(L"[auldr]: Aurora Loader v2.0 \r\n");

	lea	rcx, OFFSET FLAT:$SG13533
	call	?printf@@YAHPEA_WZZ			; printf

; 30   : 
; 31   : 	/* setup the graphics */
; 32   : 	uint64_t mode = aulib_query_gop(1024, 720);

	mov	edx, 720				; 000002d0H
	mov	ecx, 1024				; 00000400H
	call	?aulib_query_gop@@YA_KII@Z		; aulib_query_gop
	mov	QWORD PTR mode$[rsp], rax

; 33   : 	aulib_set_graphics_mode(mode);

	mov	rcx, QWORD PTR mode$[rsp]
	call	?aulib_set_graphics_mode@@YAH_K@Z	; aulib_set_graphics_mode

; 34   : 
; 35   : 	uint8_t* kernel = aulib_load_file(L"\\EFI\\XENEVA\\xnkrnl.exe");

	lea	rcx, OFFSET FLAT:$SG13536
	call	?aulib_load_file@@YAPEAEPEA_W@Z		; aulib_load_file
	mov	QWORD PTR kernel$[rsp], rax

; 36   : 	au_puts("[auldr]: kernel file loaded successfully \n");

	lea	rcx, OFFSET FLAT:$SG13537
	call	?au_puts@@YAXPEBD@Z			; au_puts

; 37   : 
; 38   : 	IMAGE_DOS_HEADER *dos = (IMAGE_DOS_HEADER*)kernel;

	mov	rax, QWORD PTR kernel$[rsp]
	mov	QWORD PTR dos$[rsp], rax

; 39   : 	IMAGE_NT_HEADERS *nt = (IMAGE_NT_HEADERS*)(kernel + dos->e_lfanew);

	mov	rax, QWORD PTR dos$[rsp]
	movzx	eax, WORD PTR [rax+60]
	mov	rcx, QWORD PTR kernel$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR nt$[rsp], rax

; 40   : 
; 41   : 	uint64_t kernel_size = aulib_get_recent_file_size();

	call	?aulib_get_recent_file_size@@YA_KXZ	; aulib_get_recent_file_size
	mov	QWORD PTR kernel_size$[rsp], rax

; 42   : 
; 43   : 	au_puts("[auldr]: AuLoader v1.0 \n");

	lea	rcx, OFFSET FLAT:$SG13543
	call	?au_puts@@YAXPEBD@Z			; au_puts

; 44   : 
; 45   : 	au_puts("[auldr]: initializing memory manager\n");

	lea	rcx, OFFSET FLAT:$SG13544
	call	?au_puts@@YAXPEBD@Z			; au_puts

; 46   : 	
; 47   : 	EfiMemoryMap map;
; 48   : 	EFI_MEMORY_DESCRIPTOR *desc_ptr = nullptr;

	mov	QWORD PTR desc_ptr$[rsp], 0

; 49   : 	map.MemMapSize = 0;

	mov	QWORD PTR map$[rsp+8], 0

; 50   : 	map.MapKey = map.DescriptorSize = map.DescriptorVersion = 0;

	mov	DWORD PTR map$[rsp+32], 0
	mov	eax, DWORD PTR map$[rsp+32]
	mov	QWORD PTR map$[rsp+24], rax
	mov	rax, QWORD PTR map$[rsp+24]
	mov	QWORD PTR map$[rsp+16], rax

; 51   : 	status = system_table->BootServices->GetMemoryMap(&map.MemMapSize, nullptr, &map.MapKey, &map.DescriptorSize, &map.DescriptorVersion);

	mov	rax, QWORD PTR system_table$[rsp]
	mov	rax, QWORD PTR [rax+96]
	lea	rcx, QWORD PTR map$[rsp+32]
	mov	QWORD PTR [rsp+32], rcx
	lea	r9, QWORD PTR map$[rsp+24]
	lea	r8, QWORD PTR map$[rsp+16]
	xor	edx, edx
	lea	rcx, QWORD PTR map$[rsp+8]
	call	QWORD PTR [rax+56]
	mov	QWORD PTR status$[rsp], rax

; 52   : 
; 53   : 	
; 54   : 	map.MemMapSize += 16 * sizeof(EFI_MEMORY_DESCRIPTOR);

	mov	rax, QWORD PTR map$[rsp+8]
	add	rax, 640				; 00000280H
	mov	QWORD PTR map$[rsp+8], rax

; 55   : 	map.memmap = (EFI_MEMORY_DESCRIPTOR*)aulib_allocate(map.MemMapSize);

	mov	rcx, QWORD PTR map$[rsp+8]
	call	?aulib_allocate@@YAPEAX_K@Z		; aulib_allocate
	mov	QWORD PTR map$[rsp], rax

; 56   : 
; 57   : 	status = system_table->BootServices->GetMemoryMap(&map.MemMapSize, map.memmap, &map.MapKey, &map.DescriptorSize, &map.DescriptorVersion);

	mov	rax, QWORD PTR system_table$[rsp]
	mov	rax, QWORD PTR [rax+96]
	lea	rcx, QWORD PTR map$[rsp+32]
	mov	QWORD PTR [rsp+32], rcx
	lea	r9, QWORD PTR map$[rsp+24]
	lea	r8, QWORD PTR map$[rsp+16]
	mov	rdx, QWORD PTR map$[rsp]
	lea	rcx, QWORD PTR map$[rsp+8]
	call	QWORD PTR [rax+56]
	mov	QWORD PTR status$[rsp], rax

; 58   : 	if (status != EFI_SUCCESS) {

	cmp	QWORD PTR status$[rsp], 0
	je	SHORT $LN11@main

; 59   : 		au_puts("[auldr]: failed to obtain memory map \n");

	lea	rcx, OFFSET FLAT:$SG13550
	call	?au_puts@@YAXPEBD@Z			; au_puts
$LN11@main:

; 60   : 	}
; 61   : 
; 62   : 	
; 63   : 	const size_t early_page_stack_size = 1024*1024;

	mov	QWORD PTR early_page_stack_size$[rsp], 1048576 ; 00100000H

; 64   : 	EFI_PHYSICAL_ADDRESS early_phys_page_stack = 0;

	mov	QWORD PTR early_phys_page_stack$[rsp], 0

; 65   : 	if (!(system_table->BootServices->AllocatePages(AllocateAnyPages, EfiLoaderData, early_page_stack_size / EFI_PAGE_SIZE, (EFI_PHYSICAL_ADDRESS*)early_phys_page_stack))) {

	mov	rax, QWORD PTR system_table$[rsp]
	mov	rax, QWORD PTR [rax+96]
	mov	r9, QWORD PTR early_phys_page_stack$[rsp]
	mov	r8d, 256				; 00000100H
	mov	edx, 2
	xor	ecx, ecx
	call	QWORD PTR [rax+40]
	test	rax, rax
	jne	SHORT $LN10@main

; 66   : 		au_puts("[auldr]: early page stack allocation failed \n");

	lea	rcx, OFFSET FLAT:$SG13555
	call	?au_puts@@YAXPEBD@Z			; au_puts
$LN10@main:

; 67   : 	}
; 68   : 
; 69   : 	void* xsdp_address = aulib_get_acpi_pointer();

	call	?aulib_get_acpi_pointer@@YAPEAXXZ	; aulib_get_acpi_pointer
	mov	QWORD PTR xsdp_address$[rsp], rax

; 70   : 
; 71   : 
; 72   : 
; 73   : 	if (EFI_ERROR(status = system_table->BootServices->ExitBootServices(ImageHandle, map.MapKey))) {

	mov	rax, QWORD PTR system_table$[rsp]
	mov	rax, QWORD PTR [rax+96]
	mov	rdx, QWORD PTR map$[rsp+16]
	mov	rcx, QWORD PTR ImageHandle$[rsp]
	call	QWORD PTR [rax+232]
	mov	QWORD PTR status$[rsp], rax
	cmp	QWORD PTR status$[rsp], 0
	jge	SHORT $LN9@main

; 74   : 		au_print("[auldr]: exit_boot_service failed\n");

	lea	rcx, OFFSET FLAT:$SG13560
	call	?au_print@@YAXPEBDZZ			; au_print

; 75   : 		return EFI_SUCCESS;

	xor	eax, eax
	jmp	$LN12@main
$LN9@main:

; 76   : 	}
; 77   : 
; 78   : 	au_cli();

	call	au_cli

; 79   : 
; 80   : 	au_initialize_pmmngr(map, (void*)early_phys_page_stack, early_page_stack_size);

	lea	rax, QWORD PTR $T3[rsp]
	lea	rcx, QWORD PTR map$[rsp]
	mov	rdi, rax
	mov	rsi, rcx
	mov	ecx, 40					; 00000028H
	rep movsb
	mov	r8d, 1048576				; 00100000H
	mov	rdx, QWORD PTR early_phys_page_stack$[rsp]
	lea	rcx, QWORD PTR $T3[rsp]
	call	?au_initialize_pmmngr@@YAXUEfiMemoryMap@@PEAX_K@Z ; au_initialize_pmmngr

; 81   : 	au_initialize_vm();

	call	?au_initialize_vm@@YAXXZ		; au_initialize_vm

; 82   : 	au_puts("[auldr]: memory manager initialized \n");

	lea	rcx, OFFSET FLAT:$SG13562
	call	?au_puts@@YAXPEBD@Z			; au_puts

; 83   : 
; 84   : 	
; 85   : 	uint64_t vaddr = nt->OptionalHeader.ImageBase;

	mov	rax, QWORD PTR nt$[rsp]
	mov	rax, QWORD PTR [rax+48]
	mov	QWORD PTR vaddr$[rsp], rax

; 86   : 	for (int i = 0; i < (kernel_size + 4095) / 4096; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN8@main
$LN7@main:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN8@main:
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	QWORD PTR tv162[rsp], rax
	mov	rcx, QWORD PTR kernel_size$[rsp]
	add	rcx, 4095				; 00000fffH
	xor	edx, edx
	mov	rax, rcx
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	rcx, QWORD PTR tv162[rsp]
	cmp	rcx, rax
	jae	SHORT $LN6@main

; 87   : 		au_map_p2v(vaddr + i * 4096, au_pmmngr_allocate(), 0);

	call	?au_pmmngr_allocate@@YA_KXZ		; au_pmmngr_allocate
	imul	ecx, DWORD PTR i$1[rsp], 4096		; 00001000H
	movsxd	rcx, ecx
	mov	rdx, QWORD PTR vaddr$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	xor	r8d, r8d
	mov	rdx, rax
	call	?au_map_p2v@@YA_N_K00@Z			; au_map_p2v

; 88   : 	}

	jmp	SHORT $LN7@main
$LN6@main:

; 89   : 	
; 90   : 	aulib_copy_mem((void*)vaddr, kernel, kernel_size);

	mov	r8, QWORD PTR kernel_size$[rsp]
	mov	rdx, QWORD PTR kernel$[rsp]
	mov	rcx, QWORD PTR vaddr$[rsp]
	call	?aulib_copy_mem@@YAXPEAX0_K@Z		; aulib_copy_mem

; 91   : 
; 92   : 	au_print("[auldr]: Kernel copied to virtual address \n");

	lea	rcx, OFFSET FLAT:$SG13569
	call	?au_print@@YAXPEBDZZ			; au_print

; 93   : 
; 94   : 	uint64_t ke_stack = 0xFFFFA00000000000;

	mov	rax, -105553116266496			; ffffa00000000000H
	mov	QWORD PTR ke_stack$[rsp], rax

; 95   : 	for (int i = 0; i < (0x100000 + 4095) / 4096; i++)

	mov	DWORD PTR i$2[rsp], 0
	jmp	SHORT $LN5@main
$LN4@main:
	mov	eax, DWORD PTR i$2[rsp]
	inc	eax
	mov	DWORD PTR i$2[rsp], eax
$LN5@main:
	cmp	DWORD PTR i$2[rsp], 256			; 00000100H
	jge	SHORT $LN3@main

; 96   : 		au_map_p2v(ke_stack + i * 4096, au_pmmngr_allocate(), 0);

	call	?au_pmmngr_allocate@@YA_KXZ		; au_pmmngr_allocate
	imul	ecx, DWORD PTR i$2[rsp], 4096		; 00001000H
	movsxd	rcx, ecx
	mov	rdx, QWORD PTR ke_stack$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	xor	r8d, r8d
	mov	rdx, rax
	call	?au_map_p2v@@YA_N_K00@Z			; au_map_p2v
	jmp	SHORT $LN4@main
$LN3@main:

; 97   : 
; 98   : 	au_print("[auldr]: kstack mapped \n");

	lea	rcx, OFFSET FLAT:$SG13575
	call	?au_print@@YAXPEBDZZ			; au_print

; 99   : 	aurora_info_t bootinfo;
; 100  : 	bootinfo.mem_map = map.memmap;

	mov	rax, QWORD PTR map$[rsp]
	mov	QWORD PTR bootinfo$[rsp], rax

; 101  : 	bootinfo.mem_desc_size = map.DescriptorSize;

	mov	rax, QWORD PTR map$[rsp+24]
	mov	QWORD PTR bootinfo$[rsp+8], rax

; 102  : 	bootinfo.mem_map_size = map.MemMapSize;

	mov	rax, QWORD PTR map$[rsp+8]
	mov	QWORD PTR bootinfo$[rsp+16], rax

; 103  : 	bootinfo.phys_stack_allocated = au_get_phys_allocated();

	call	?au_get_phys_allocated@@YAPEAXXZ	; au_get_phys_allocated
	mov	QWORD PTR bootinfo$[rsp+24], rax

; 104  : 	bootinfo.resvd_mem_count = au_get_rsvd_mem_count();

	call	?au_get_rsvd_mem_count@@YAHXZ		; au_get_rsvd_mem_count
	cdqe
	mov	QWORD PTR bootinfo$[rsp+32], rax

; 105  : 	bootinfo.fb_addr = aulib_get_fb_address();

	call	?aulib_get_fb_address@@YAPEAIXZ		; aulib_get_fb_address
	mov	QWORD PTR bootinfo$[rsp+40], rax

; 106  : 	bootinfo.fb_size = aulib_get_fb_size();

	call	?aulib_get_fb_size@@YA_KXZ		; aulib_get_fb_size
	mov	QWORD PTR bootinfo$[rsp+48], rax

; 107  : 	bootinfo.x_res = aulib_get_x_resolution();

	call	?aulib_get_x_resolution@@YAIXZ		; aulib_get_x_resolution
	mov	DWORD PTR bootinfo$[rsp+56], eax

; 108  : 	bootinfo.y_res = aulib_get_y_resolution();

	call	?aulib_get_y_resolution@@YAIXZ		; aulib_get_y_resolution
	mov	DWORD PTR bootinfo$[rsp+60], eax

; 109  : 	bootinfo.pixels_per_line = aulib_get_pixels_per_line();

	call	?aulib_get_pixels_per_line@@YAIXZ	; aulib_get_pixels_per_line
	mov	WORD PTR bootinfo$[rsp+64], ax

; 110  : 	bootinfo.acpi_table_pointer = xsdp_address;

	mov	rax, QWORD PTR xsdp_address$[rsp]
	mov	QWORD PTR bootinfo$[rsp+66], rax

; 111  : 	bootinfo.kernel_size = kernel_size;

	mov	rax, QWORD PTR kernel_size$[rsp]
	mov	QWORD PTR bootinfo$[rsp+74], rax

; 112  : 	bootinfo.auprint = au_print;

	lea	rax, OFFSET FLAT:?au_print@@YAXPEBDZZ	; au_print
	mov	QWORD PTR bootinfo$[rsp+82], rax

; 113  : 
; 114  : 	IMAGE_DOS_HEADER *dos2 = (IMAGE_DOS_HEADER*)vaddr;

	mov	rax, QWORD PTR vaddr$[rsp]
	mov	QWORD PTR dos2$[rsp], rax

; 115  : 	IMAGE_NT_HEADERS *nt2 = (IMAGE_NT_HEADERS*)(vaddr + dos2->e_lfanew);

	mov	rax, QWORD PTR dos2$[rsp]
	movzx	eax, WORD PTR [rax+60]
	mov	rcx, QWORD PTR vaddr$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR nt2$[rsp], rax

; 116  : 	void* entrypoint = (void*)(nt2->OptionalHeader.ImageBase + nt2->OptionalHeader.AddressOfEntryPoint);

	mov	rax, QWORD PTR nt2$[rsp]
	mov	eax, DWORD PTR [rax+40]
	mov	rcx, QWORD PTR nt2$[rsp]
	add	rax, QWORD PTR [rcx+48]
	mov	QWORD PTR entrypoint$[rsp], rax

; 117  : 
; 118  : 	au_puts("[auldr]:Calling Kernel\n");

	lea	rcx, OFFSET FLAT:$SG13583
	call	?au_puts@@YAXPEBD@Z			; au_puts

; 119  : 	au_call_kernel(&bootinfo, entrypoint, (void*)ke_stack, 0x100000);

	mov	r9d, 1048576				; 00100000H
	mov	r8, QWORD PTR ke_stack$[rsp]
	mov	rdx, QWORD PTR entrypoint$[rsp]
	lea	rcx, QWORD PTR bootinfo$[rsp]
	call	au_call_kernel
$LN2@main:

; 120  : 	for (;;);

	jmp	SHORT $LN2@main

; 121  : 	return EFI_SUCCESS;

	xor	eax, eax
$LN12@main:

; 122  : }

	add	rsp, 376				; 00000178H
	pop	rdi
	pop	rsi
	ret	0
main	ENDP
_TEXT	ENDS
END
