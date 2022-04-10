; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?info@@3U_AURORA_INFO_@@A			; info
PUBLIC	_fltused
_BSS	SEGMENT
?info@@3U_AURORA_INFO_@@A DB 062H DUP (?)		; info
	ALIGN	4

lock	DD	01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG3483	DB	'Thread test', 0aH, 00H
	ORG $+3
$SG3491	DB	'Aurora Kernel ', 0aH, 00H
$SG3494	DB	'Aurora kernel started ', 0aH, 00H
CONST	ENDS
_DATA	SEGMENT
_fltused DD	01H
_DATA	ENDS
PUBLIC	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ	; au_get_boot_info
PUBLIC	?thread_test@@YAXXZ				; thread_test
PUBLIC	?_kmain@@YAHPEAU_AURORA_INFO_@@@Z		; _kmain
EXTRN	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z:PROC ; x86_64_pmmngr_init
EXTRN	x86_64_pmmngr_alloc:PROC
EXTRN	?x86_64_cpu_initialize@@YAX_N@Z:PROC		; x86_64_cpu_initialize
EXTRN	?x86_64_setup_cpu_data@@YAXPEAX@Z:PROC		; x86_64_setup_cpu_data
EXTRN	x64_cli:PROC
EXTRN	x64_read_cr3:PROC
EXTRN	printf:PROC
EXTRN	?x86_64_paging_init@@YAHXZ:PROC			; x86_64_paging_init
EXTRN	x86_64_phys_to_virt:PROC
EXTRN	?x86_64_initialize_apic@@YAH_N@Z:PROC		; x86_64_initialize_apic
EXTRN	?initialize_cpu@@YAXI@Z:PROC			; initialize_cpu
EXTRN	x86_64_create_kthread:PROC
EXTRN	?x86_64_initialize_scheduler@@YAHXZ:PROC	; x86_64_initialize_scheduler
EXTRN	?x86_64_sched_start@@YAXXZ:PROC			; x86_64_sched_start
EXTRN	memcpy:PROC
EXTRN	?au_fb_initialize@@YAHXZ:PROC			; au_fb_initialize
EXTRN	?au_initialize_serial@@YAHXZ:PROC		; au_initialize_serial
EXTRN	?au_initialize_acpi@@YAHXZ:PROC			; au_initialize_acpi
EXTRN	?au_acpi_get_num_core@@YAIXZ:PROC		; au_acpi_get_num_core
EXTRN	?x86_64_kmalloc_initialize@@YAHXZ:PROC		; x86_64_kmalloc_initialize
EXTRN	?vfs_initialize@@YAXXZ:PROC			; vfs_initialize
pdata	SEGMENT
$pdata$?thread_test@@YAXXZ DD imagerel $LN5
	DD	imagerel $LN5+23
	DD	imagerel $unwind$?thread_test@@YAXXZ
$pdata$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z DD imagerel $LN5
	DD	imagerel $LN5+239
	DD	imagerel $unwind$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?thread_test@@YAXXZ DD 010401H
	DD	04204H
$unwind$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z DD 010901H
	DD	08209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
au_status$ = 32
tv83 = 40
thr$ = 48
bootinfo$ = 80
?_kmain@@YAHPEAU_AURORA_INFO_@@@Z PROC			; _kmain

; 70   : int _kmain(aurora_info_t *bootinfo) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 71   : 	x64_cli();

	call	x64_cli

; 72   : 
; 73   : 	bootinfo->auprint("Aurora Kernel \n");

	lea	rcx, OFFSET FLAT:$SG3491
	mov	rax, QWORD PTR bootinfo$[rsp]
	call	QWORD PTR [rax+90]

; 74   : 	memcpy(&info, bootinfo, sizeof(aurora_info_t));

	mov	r8d, 98					; 00000062H
	mov	rdx, QWORD PTR bootinfo$[rsp]
	lea	rcx, OFFSET FLAT:?info@@3U_AURORA_INFO_@@A ; info
	call	memcpy

; 75   : 
; 76   : 	int au_status = 0;

	mov	DWORD PTR au_status$[rsp], 0

; 77   : 
; 78   : 
; 79   : 	x86_64_pmmngr_init(bootinfo);

	mov	rcx, QWORD PTR bootinfo$[rsp]
	call	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z ; x86_64_pmmngr_init

; 80   : 	x86_64_cpu_initialize(true);

	mov	cl, 1
	call	?x86_64_cpu_initialize@@YAX_N@Z		; x86_64_cpu_initialize

; 81   : 
; 82   : 	/* initialize early drivers*/
; 83   : 	au_status = au_fb_initialize();

	call	?au_fb_initialize@@YAHXZ		; au_fb_initialize
	mov	DWORD PTR au_status$[rsp], eax

; 84   : 	au_status = x86_64_paging_init();

	call	?x86_64_paging_init@@YAHXZ		; x86_64_paging_init
	mov	DWORD PTR au_status$[rsp], eax

; 85   : 	
; 86   : 	au_status = au_initialize_serial();

	call	?au_initialize_serial@@YAHXZ		; au_initialize_serial
	mov	DWORD PTR au_status$[rsp], eax

; 87   : 	au_status = x86_64_initialize_apic(true);

	mov	cl, 1
	call	?x86_64_initialize_apic@@YAH_N@Z	; x86_64_initialize_apic
	mov	DWORD PTR au_status$[rsp], eax

; 88   : 	au_status = au_initialize_acpi();

	call	?au_initialize_acpi@@YAHXZ		; au_initialize_acpi
	mov	DWORD PTR au_status$[rsp], eax

; 89   : 	au_status = x86_64_kmalloc_initialize();

	call	?x86_64_kmalloc_initialize@@YAHXZ	; x86_64_kmalloc_initialize
	mov	DWORD PTR au_status$[rsp], eax

; 90   : 	x86_64_setup_cpu_data(0);

	xor	ecx, ecx
	call	?x86_64_setup_cpu_data@@YAXPEAX@Z	; x86_64_setup_cpu_data

; 91   : 
; 92   : 	/* initialize the vfs root directory */
; 93   : 	vfs_initialize();

	call	?vfs_initialize@@YAXXZ			; vfs_initialize

; 94   : 
; 95   : 	//x86_64_boot_free();
; 96   :     x86_64_initialize_scheduler();

	call	?x86_64_initialize_scheduler@@YAHXZ	; x86_64_initialize_scheduler

; 97   : #ifdef SMP
; 98   : 	/* initialize all the AP's*/
; 99   : 	initialize_cpu(au_acpi_get_num_core());

	call	?au_acpi_get_num_core@@YAIXZ		; au_acpi_get_num_core
	mov	ecx, eax
	call	?initialize_cpu@@YAXI@Z			; initialize_cpu

; 100  : #endif
; 101  : 
; 102  : 	printf("Aurora kernel started \n");

	lea	rcx, OFFSET FLAT:$SG3494
	call	printf

; 103  : 	thread_t *thr = x86_64_create_kthread(thread_test, (uint64_t)x86_64_phys_to_virt((size_t)x86_64_pmmngr_alloc()),
; 104  : 		x64_read_cr3());

	call	x64_read_cr3
	mov	QWORD PTR tv83[rsp], rax
	call	x86_64_pmmngr_alloc
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	rcx, QWORD PTR tv83[rsp]
	mov	r8, rcx
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:?thread_test@@YAXXZ	; thread_test
	call	x86_64_create_kthread
	mov	QWORD PTR thr$[rsp], rax

; 105  : 	x86_64_sched_start();

	call	?x86_64_sched_start@@YAXXZ		; x86_64_sched_start
$LN2@kmain:

; 106  : 	for (;;);

	jmp	SHORT $LN2@kmain

; 107  : 	return 0;

	xor	eax, eax

; 108  : }

	add	rsp, 72					; 00000048H
	ret	0
?_kmain@@YAHPEAU_AURORA_INFO_@@@Z ENDP			; _kmain
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
?thread_test@@YAXXZ PROC				; thread_test

; 62   : void thread_test() {

$LN5:
	sub	rsp, 40					; 00000028H

; 63   : 	printf("Thread test\n");

	lea	rcx, OFFSET FLAT:$SG3483
	call	printf
$LN2@thread_tes:

; 64   : 	for (;;) {
; 65   : 		
; 66   : 	}

	jmp	SHORT $LN2@thread_tes

; 67   : }

	add	rsp, 40					; 00000028H
	ret	0
?thread_test@@YAXXZ ENDP				; thread_test
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ PROC		; au_get_boot_info

; 54   : 	return &info;

	lea	rax, OFFSET FLAT:?info@@3U_AURORA_INFO_@@A ; info

; 55   : }

	ret	0
?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ENDP		; au_get_boot_info
_TEXT	ENDS
END
