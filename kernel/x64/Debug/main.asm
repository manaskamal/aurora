; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?info@@3U_AURORA_INFO_@@A			; info
PUBLIC	_fltused
PUBLIC	?j_@@3HA					; j_
_BSS	SEGMENT
?info@@3U_AURORA_INFO_@@A DB 062H DUP (?)		; info
	ALIGN	8

thr_lock DQ	01H DUP (?)
t_lock	DQ	01H DUP (?)
i_	DQ	01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG3511	DB	'Thread test started ', 0aH, 00H
	ORG $+2
$SG3543	DB	'Aurora Kernel ', 0aH, 00H
$SG3546	DB	'Aurora kernel started ', 0aH, 00H
$SG3549	DB	'Thr addr -> %x ', 0aH, 00H
	ORG $+7
$SG3552	DB	'Thread2-> %x', 0aH, 00H
CONST	ENDS
_DATA	SEGMENT
_fltused DD	01H
?j_@@3HA DD	064H					; j_
_DATA	ENDS
PUBLIC	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ	; au_get_boot_info
PUBLIC	?thread_test@@YAXXZ				; thread_test
PUBLIC	?thread_test2@@YAXXZ				; thread_test2
PUBLIC	?_kmain@@YAHPEAU_AURORA_INFO_@@@Z		; _kmain
EXTRN	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z:PROC ; x86_64_pmmngr_init
EXTRN	x86_64_pmmngr_alloc:PROC
EXTRN	?x86_64_cpu_initialize@@YAX_N@Z:PROC		; x86_64_cpu_initialize
EXTRN	?x86_64_setup_cpu_data@@YAXPEAX@Z:PROC		; x86_64_setup_cpu_data
EXTRN	x64_read_cr3:PROC
EXTRN	x64_lock_acquire:PROC
EXTRN	printf:PROC
EXTRN	?x86_64_paging_init@@YAHXZ:PROC			; x86_64_paging_init
EXTRN	x86_64_phys_to_virt:PROC
EXTRN	?x86_64_initialize_apic@@YAH_N@Z:PROC		; x86_64_initialize_apic
EXTRN	?per_cpu_get_cpu_id@@YAEXZ:PROC			; per_cpu_get_cpu_id
EXTRN	x86_64_create_kthread:PROC
EXTRN	?x86_64_initialize_scheduler@@YAHXZ:PROC	; x86_64_initialize_scheduler
EXTRN	?x86_64_sched_start@@YAXXZ:PROC			; x86_64_sched_start
EXTRN	?x86_64_sched_enable@@YAX_N@Z:PROC		; x86_64_sched_enable
EXTRN	?x86_64_execute_idle@@YAXXZ:PROC		; x86_64_execute_idle
EXTRN	?x86_64_pit_initialize@@YAXXZ:PROC		; x86_64_pit_initialize
EXTRN	memcpy:PROC
EXTRN	?au_fb_initialize@@YAHXZ:PROC			; au_fb_initialize
EXTRN	?au_video_get_fb@@YAPEAIXZ:PROC			; au_video_get_fb
EXTRN	?au_video_get_x_res@@YAIXZ:PROC			; au_video_get_x_res
EXTRN	?au_initialize_serial@@YAHXZ:PROC		; au_initialize_serial
EXTRN	?au_initialize_acpi@@YAHXZ:PROC			; au_initialize_acpi
EXTRN	?x86_64_kmalloc_initialize@@YAHXZ:PROC		; x86_64_kmalloc_initialize
EXTRN	?vfs_initialize@@YAXXZ:PROC			; vfs_initialize
EXTRN	?devfs_initialize@@YAXXZ:PROC			; devfs_initialize
pdata	SEGMENT
$pdata$?thread_test@@YAXXZ DD imagerel $LN5
	DD	imagerel $LN5+46
	DD	imagerel $unwind$?thread_test@@YAXXZ
$pdata$?thread_test2@@YAXXZ DD imagerel $LN20
	DD	imagerel $LN20+316
	DD	imagerel $unwind$?thread_test2@@YAXXZ
$pdata$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z DD imagerel $LN5
	DD	imagerel $LN5+329
	DD	imagerel $unwind$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?thread_test@@YAXXZ DD 010401H
	DD	04204H
$unwind$?thread_test2@@YAXXZ DD 010401H
	DD	08204H
$unwind$?_kmain@@YAHPEAU_AURORA_INFO_@@@Z DD 010901H
	DD	0a209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
au_status$ = 32
tv81 = 40
thr$ = 48
tv91 = 56
thr2$ = 64
bootinfo$ = 96
?_kmain@@YAHPEAU_AURORA_INFO_@@@Z PROC			; _kmain

; 100  : int _kmain(aurora_info_t *bootinfo) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 88					; 00000058H

; 101  : 	bootinfo->auprint("Aurora Kernel \n");

	lea	rcx, OFFSET FLAT:$SG3543
	mov	rax, QWORD PTR bootinfo$[rsp]
	call	QWORD PTR [rax+90]

; 102  : 	memcpy(&info, bootinfo, sizeof(aurora_info_t));

	mov	r8d, 98					; 00000062H
	mov	rdx, QWORD PTR bootinfo$[rsp]
	lea	rcx, OFFSET FLAT:?info@@3U_AURORA_INFO_@@A ; info
	call	memcpy

; 103  : 
; 104  : 	int au_status = 0;

	mov	DWORD PTR au_status$[rsp], 0

; 105  : 
; 106  : 
; 107  : 	x86_64_pmmngr_init(bootinfo);

	mov	rcx, QWORD PTR bootinfo$[rsp]
	call	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z ; x86_64_pmmngr_init

; 108  : 	x86_64_cpu_initialize(true);

	mov	cl, 1
	call	?x86_64_cpu_initialize@@YAX_N@Z		; x86_64_cpu_initialize

; 109  : 	/* initialize early drivers*/
; 110  : 	au_status = au_fb_initialize();

	call	?au_fb_initialize@@YAHXZ		; au_fb_initialize
	mov	DWORD PTR au_status$[rsp], eax

; 111  : 	au_status = x86_64_paging_init();

	call	?x86_64_paging_init@@YAHXZ		; x86_64_paging_init
	mov	DWORD PTR au_status$[rsp], eax

; 112  : 	au_status = x86_64_kmalloc_initialize();

	call	?x86_64_kmalloc_initialize@@YAHXZ	; x86_64_kmalloc_initialize
	mov	DWORD PTR au_status$[rsp], eax

; 113  : 	au_status = au_initialize_serial();

	call	?au_initialize_serial@@YAHXZ		; au_initialize_serial
	mov	DWORD PTR au_status$[rsp], eax

; 114  : 	au_status = x86_64_initialize_apic(true);

	mov	cl, 1
	call	?x86_64_initialize_apic@@YAH_N@Z	; x86_64_initialize_apic
	mov	DWORD PTR au_status$[rsp], eax

; 115  : 	au_status = au_initialize_acpi();

	call	?au_initialize_acpi@@YAHXZ		; au_initialize_acpi
	mov	DWORD PTR au_status$[rsp], eax

; 116  : 	x86_64_pit_initialize();

	call	?x86_64_pit_initialize@@YAXXZ		; x86_64_pit_initialize

; 117  : 
; 118  : 	/* initialize the kernel subsystems */
; 119  : 	vfs_initialize();

	call	?vfs_initialize@@YAXXZ			; vfs_initialize

; 120  : 	devfs_initialize();

	call	?devfs_initialize@@YAXXZ		; devfs_initialize

; 121  : 
; 122  : 	x86_64_setup_cpu_data(0);

	xor	ecx, ecx
	call	?x86_64_setup_cpu_data@@YAXPEAX@Z	; x86_64_setup_cpu_data

; 123  : 	//x86_64_boot_free();
; 124  :     x86_64_initialize_scheduler();

	call	?x86_64_initialize_scheduler@@YAHXZ	; x86_64_initialize_scheduler

; 125  : 	
; 126  : 
; 127  : #ifdef SMP
; 128  : 	/* initialize all the AP's*/
; 129  : 	initialize_cpu(au_acpi_get_num_core());
; 130  : #endif
; 131  : 
; 132  : 	printf("Aurora kernel started \n");

	lea	rcx, OFFSET FLAT:$SG3546
	call	printf

; 133  : 
; 134  : 	/* Start Scheduler, and notify all cpu's 
; 135  : 	 * that scheduler has started and they can
; 136  : 	 * start their jobs
; 137  : 	 */
; 138  : 	
; 139  : 	thread_t *thr = x86_64_create_kthread(thread_test, x86_64_phys_to_virt((uint64_t)x86_64_pmmngr_alloc()), x64_read_cr3());

	call	x64_read_cr3
	mov	QWORD PTR tv81[rsp], rax
	call	x86_64_pmmngr_alloc
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	rcx, QWORD PTR tv81[rsp]
	mov	r8, rcx
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:?thread_test@@YAXXZ	; thread_test
	call	x86_64_create_kthread
	mov	QWORD PTR thr$[rsp], rax

; 140  : 	printf("Thr addr -> %x \n", thr);

	mov	rdx, QWORD PTR thr$[rsp]
	lea	rcx, OFFSET FLAT:$SG3549
	call	printf

; 141  : 	thread_t *thr2 = x86_64_create_kthread(thread_test2, x86_64_phys_to_virt((uint64_t)x86_64_pmmngr_alloc()), x64_read_cr3());

	call	x64_read_cr3
	mov	QWORD PTR tv91[rsp], rax
	call	x86_64_pmmngr_alloc
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	rcx, QWORD PTR tv91[rsp]
	mov	r8, rcx
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:?thread_test2@@YAXXZ	; thread_test2
	call	x86_64_create_kthread
	mov	QWORD PTR thr2$[rsp], rax

; 142  : 	printf("Thread2-> %x\n", thr2);

	mov	rdx, QWORD PTR thr2$[rsp]
	lea	rcx, OFFSET FLAT:$SG3552
	call	printf

; 143  : 	x86_64_sched_enable(true);

	mov	cl, 1
	call	?x86_64_sched_enable@@YAX_N@Z		; x86_64_sched_enable

; 144  : 	x86_64_sched_start();

	call	?x86_64_sched_start@@YAXXZ		; x86_64_sched_start

; 145  : 	x86_64_execute_idle();

	call	?x86_64_execute_idle@@YAXXZ		; x86_64_execute_idle
$LN2@kmain:

; 146  : 	for (;;);

	jmp	SHORT $LN2@kmain

; 147  : 	return 0;

	xor	eax, eax

; 148  : }

	add	rsp, 88					; 00000058H
	ret	0
?_kmain@@YAHPEAU_AURORA_INFO_@@@Z ENDP			; _kmain
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
i$1 = 32
j$2 = 36
i$3 = 40
j$4 = 44
tv73 = 48
tv90 = 56
?thread_test2@@YAXXZ PROC				; thread_test2

; 76   : void thread_test2() {

$LN20:
	sub	rsp, 72					; 00000048H
$LN17@thread_tes:

; 77   : 
; 78   : 	while (1) {

	xor	eax, eax
	cmp	eax, 1
	je	$LN16@thread_tes

; 79   : 		x64_lock_acquire(&thr_lock);

	lea	rcx, OFFSET FLAT:thr_lock
	call	x64_lock_acquire

; 80   : 		
; 81   : 		if (per_cpu_get_cpu_id() == 0) {

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN15@thread_tes

; 82   : 			for (int i = 0; i < 10; i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN14@thread_tes
$LN13@thread_tes:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN14@thread_tes:
	cmp	DWORD PTR i$1[rsp], 10
	jge	SHORT $LN12@thread_tes

; 83   : 			for (int j = 0; j < 10; j++)

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN11@thread_tes
$LN10@thread_tes:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN11@thread_tes:
	cmp	DWORD PTR j$2[rsp], 10
	jge	SHORT $LN9@thread_tes

; 84   : 				au_video_get_fb()[i_ + i * au_video_get_x_res() + i_ + j] = 0xffffffff;

	call	?au_video_get_fb@@YAPEAIXZ		; au_video_get_fb
	mov	QWORD PTR tv73[rsp], rax
	call	?au_video_get_x_res@@YAIXZ		; au_video_get_x_res
	mov	ecx, DWORD PTR i$1[rsp]
	imul	ecx, eax
	mov	eax, ecx
	mov	eax, eax
	mov	rcx, QWORD PTR i_
	add	rcx, rax
	mov	rax, rcx
	add	rax, QWORD PTR i_
	movsxd	rcx, DWORD PTR j$2[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR tv73[rsp]
	mov	DWORD PTR [rcx+rax*4], -1		; ffffffffH
	jmp	SHORT $LN10@thread_tes
$LN9@thread_tes:
	jmp	SHORT $LN13@thread_tes
$LN12@thread_tes:

; 85   : 		}
; 86   : 		else if (per_cpu_get_cpu_id() != 0) {

	jmp	SHORT $LN8@thread_tes
$LN15@thread_tes:
	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN7@thread_tes

; 87   : 			for (int i = 0; i <20; i++) 

	mov	DWORD PTR i$3[rsp], 0
	jmp	SHORT $LN6@thread_tes
$LN5@thread_tes:
	mov	eax, DWORD PTR i$3[rsp]
	inc	eax
	mov	DWORD PTR i$3[rsp], eax
$LN6@thread_tes:
	cmp	DWORD PTR i$3[rsp], 20
	jge	SHORT $LN4@thread_tes

; 88   : 			for (int j = 0; j < 20; j++)

	mov	DWORD PTR j$4[rsp], 0
	jmp	SHORT $LN3@thread_tes
$LN2@thread_tes:
	mov	eax, DWORD PTR j$4[rsp]
	inc	eax
	mov	DWORD PTR j$4[rsp], eax
$LN3@thread_tes:
	cmp	DWORD PTR j$4[rsp], 20
	jge	SHORT $LN1@thread_tes

; 89   : 				au_video_get_fb()[i * au_video_get_x_res() + j] = 0xff0000ff;

	call	?au_video_get_fb@@YAPEAIXZ		; au_video_get_fb
	mov	QWORD PTR tv90[rsp], rax
	call	?au_video_get_x_res@@YAIXZ		; au_video_get_x_res
	mov	ecx, DWORD PTR i$3[rsp]
	imul	ecx, eax
	mov	eax, ecx
	add	eax, DWORD PTR j$4[rsp]
	mov	eax, eax
	mov	rcx, QWORD PTR tv90[rsp]
	mov	DWORD PTR [rcx+rax*4], -16776961	; ff0000ffH
	jmp	SHORT $LN2@thread_tes
$LN1@thread_tes:
	jmp	SHORT $LN5@thread_tes
$LN4@thread_tes:
$LN7@thread_tes:
$LN8@thread_tes:

; 90   : 		}
; 91   : 
; 92   : 		i_ += 10;

	mov	rax, QWORD PTR i_
	add	rax, 10
	mov	QWORD PTR i_, rax

; 93   : 
; 94   : 		thr_lock = 0;

	mov	QWORD PTR thr_lock, 0

; 95   : 	}

	jmp	$LN17@thread_tes
$LN16@thread_tes:

; 96   : 
; 97   : }

	add	rsp, 72					; 00000048H
	ret	0
?thread_test2@@YAXXZ ENDP				; thread_test2
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
?thread_test@@YAXXZ PROC				; thread_test

; 66   : void thread_test() {

$LN5:
	sub	rsp, 40					; 00000028H

; 67   : 	x64_lock_acquire(&t_lock);

	lea	rcx, OFFSET FLAT:t_lock
	call	x64_lock_acquire

; 68   : 	printf("Thread test started \n");

	lea	rcx, OFFSET FLAT:$SG3511
	call	printf

; 69   : 	t_lock = 0;

	mov	QWORD PTR t_lock, 0
$LN2@thread_tes:

; 70   : 	for (;;){
; 71   : 	}

	jmp	SHORT $LN2@thread_tes

; 72   : }

	add	rsp, 40					; 00000028H
	ret	0
?thread_test@@YAXXZ ENDP				; thread_test
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\main.cpp
_TEXT	SEGMENT
?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ PROC		; au_get_boot_info

; 56   : 	return &info;

	lea	rax, OFFSET FLAT:?info@@3U_AURORA_INFO_@@A ; info

; 57   : }

	ret	0
?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ENDP		; au_get_boot_info
_TEXT	ENDS
END
