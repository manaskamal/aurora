; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	ap_lock
_BSS	SEGMENT
ap_lock	DQ	01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG3026	DB	'APIC interrupt from cpu id -> %d', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_ap_init@@YAXPEAX@Z			; x86_64_ap_init
PUBLIC	?x86_64_apic_handler@@YAX_KPEAX@Z		; x86_64_apic_handler
EXTRN	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ:PROC	; au_get_boot_info
EXTRN	?x86_64_cpu_initialize@@YAX_N@Z:PROC		; x86_64_cpu_initialize
EXTRN	x86_64_cpu_print_brand:PROC
EXTRN	?x86_64_setup_cpu_data@@YAXPEAX@Z:PROC		; x86_64_setup_cpu_data
EXTRN	x64_cli:PROC
EXTRN	x64_lock_acquire:PROC
EXTRN	?x86_64_initialize_apic@@YAH_N@Z:PROC		; x86_64_initialize_apic
EXTRN	?apic_local_eoi@@YAXXZ:PROC			; apic_local_eoi
EXTRN	?x86_64_ap_started@@YAXXZ:PROC			; x86_64_ap_started
EXTRN	?per_cpu_get_cpu_id@@YAEXZ:PROC			; per_cpu_get_cpu_id
EXTRN	?x86_64_sched_start@@YAXXZ:PROC			; x86_64_sched_start
EXTRN	?x86_64_initialize_idle@@YAXXZ:PROC		; x86_64_initialize_idle
pdata	SEGMENT
$pdata$?x86_64_ap_init@@YAXPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+65
	DD	imagerel $unwind$?x86_64_ap_init@@YAXPEAX@Z
$pdata$?x86_64_apic_handler@@YAX_KPEAX@Z DD imagerel $LN3
	DD	imagerel $LN3+86
	DD	imagerel $unwind$?x86_64_apic_handler@@YAX_KPEAX@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_ap_init@@YAXPEAX@Z DD 010901H
	DD	04209H
$unwind$?x86_64_apic_handler@@YAX_KPEAX@Z DD 010e01H
	DD	0620eH
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_ap_init.cpp
_TEXT	SEGMENT
cpu_id$ = 32
tv68 = 36
v$ = 64
p$ = 72
?x86_64_apic_handler@@YAX_KPEAX@Z PROC			; x86_64_apic_handler

; 46   : void x86_64_apic_handler(size_t v, void* p) {

$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 47   : 	x64_lock_acquire(&ap_lock);

	lea	rcx, OFFSET FLAT:ap_lock
	call	x64_lock_acquire

; 48   : 	uint8_t cpu_id = per_cpu_get_cpu_id();

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	mov	BYTE PTR cpu_id$[rsp], al

; 49   : 	au_get_boot_info()->auprint("APIC interrupt from cpu id -> %d\n", cpu_id);

	movzx	eax, BYTE PTR cpu_id$[rsp]
	mov	DWORD PTR tv68[rsp], eax
	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	ecx, DWORD PTR tv68[rsp]
	mov	edx, ecx
	lea	rcx, OFFSET FLAT:$SG3026
	call	QWORD PTR [rax+90]

; 50   : 	apic_local_eoi();

	call	?apic_local_eoi@@YAXXZ			; apic_local_eoi

; 51   : 	ap_lock = 0;

	mov	QWORD PTR ap_lock, 0

; 52   : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_apic_handler@@YAX_KPEAX@Z ENDP			; x86_64_apic_handler
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_ap_init.cpp
_TEXT	SEGMENT
cpu_data$ = 48
?x86_64_ap_init@@YAXPEAX@Z PROC				; x86_64_ap_init

; 54   : void x86_64_ap_init(void *cpu_data) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 55   : 	x64_cli();

	call	x64_cli

; 56   : 	x86_64_cpu_initialize(false);

	xor	ecx, ecx
	call	?x86_64_cpu_initialize@@YAX_N@Z		; x86_64_cpu_initialize

; 57   : 	x86_64_cpu_print_brand();

	call	x86_64_cpu_print_brand

; 58   : 	x86_64_initialize_apic(false);

	xor	ecx, ecx
	call	?x86_64_initialize_apic@@YAH_N@Z	; x86_64_initialize_apic

; 59   : 	x86_64_initialize_idle();

	call	?x86_64_initialize_idle@@YAXXZ		; x86_64_initialize_idle

; 60   : 	x86_64_setup_cpu_data(cpu_data);

	mov	rcx, QWORD PTR cpu_data$[rsp]
	call	?x86_64_setup_cpu_data@@YAXPEAX@Z	; x86_64_setup_cpu_data

; 61   : 	
; 62   : 	x86_64_ap_started();

	call	?x86_64_ap_started@@YAXXZ		; x86_64_ap_started

; 63   : 	x86_64_sched_start();

	call	?x86_64_sched_start@@YAXXZ		; x86_64_sched_start
$LN2@x86_64_ap_:

; 64   : 	/* initialize processor specific functions here !!*/
; 65   : 	/* from here we'll jump to scheduler */
; 66   : 	for (;;);

	jmp	SHORT $LN2@x86_64_ap_

; 67   : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_ap_init@@YAXPEAX@Z ENDP				; x86_64_ap_init
_TEXT	ENDS
END
