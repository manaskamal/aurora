; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_BSS	SEGMENT
ap_lock	DD	01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG3021	DB	'APIC interrupt from cpu id -> %d', 0aH, 00H
	ORG $+6
$SG3027	DB	'***addr[i] -> %x', 0aH, 00H
	ORG $+6
$SG3030	DB	'A[i] -> %d', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_ap_init@@YAXPEAX@Z			; x86_64_ap_init
PUBLIC	?x86_64_apic_handler@@YAX_KPEAX@Z		; x86_64_apic_handler
EXTRN	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ:PROC	; au_get_boot_info
EXTRN	?x86_64_cpu_initialize@@YAX_N@Z:PROC		; x86_64_cpu_initialize
EXTRN	?x86_64_setup_cpu_data@@YAXPEAX@Z:PROC		; x86_64_setup_cpu_data
EXTRN	x64_cli:PROC
EXTRN	x64_lock_acquire:PROC
EXTRN	?x86_64_initialize_apic@@YAH_N@Z:PROC		; x86_64_initialize_apic
EXTRN	?apic_local_eoi@@YAXXZ:PROC			; apic_local_eoi
EXTRN	?x86_64_ap_started@@YAXXZ:PROC			; x86_64_ap_started
EXTRN	?per_cpu_get_cpu_id@@YAEXZ:PROC			; per_cpu_get_cpu_id
EXTRN	?x86_64_initialize_idle@@YAXXZ:PROC		; x86_64_initialize_idle
pdata	SEGMENT
$pdata$?x86_64_ap_init@@YAXPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+166
	DD	imagerel $unwind$?x86_64_ap_init@@YAXPEAX@Z
$pdata$?x86_64_apic_handler@@YAX_KPEAX@Z DD imagerel $LN3
	DD	imagerel $LN3+85
	DD	imagerel $unwind$?x86_64_apic_handler@@YAX_KPEAX@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_ap_init@@YAXPEAX@Z DD 010901H
	DD	08209H
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

; 45   : void x86_64_apic_handler(size_t v, void* p) {

$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 46   : 	x64_lock_acquire(&ap_lock);

	lea	rcx, OFFSET FLAT:ap_lock
	call	x64_lock_acquire

; 47   : 	uint8_t cpu_id = per_cpu_get_cpu_id();

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	mov	BYTE PTR cpu_id$[rsp], al

; 48   : 	au_get_boot_info()->auprint("APIC interrupt from cpu id -> %d\n", cpu_id);

	movzx	eax, BYTE PTR cpu_id$[rsp]
	mov	DWORD PTR tv68[rsp], eax
	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	ecx, DWORD PTR tv68[rsp]
	mov	edx, ecx
	lea	rcx, OFFSET FLAT:$SG3021
	call	QWORD PTR [rax+90]

; 49   : 	apic_local_eoi();

	call	?apic_local_eoi@@YAXXZ			; apic_local_eoi

; 50   : 	ap_lock = 0;

	mov	DWORD PTR ap_lock, 0

; 51   : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_apic_handler@@YAX_KPEAX@Z ENDP			; x86_64_apic_handler
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_ap_init.cpp
_TEXT	SEGMENT
meta$ = 32
a$ = 40
tv75 = 48
cpu_data$ = 80
?x86_64_ap_init@@YAXPEAX@Z PROC				; x86_64_ap_init

; 53   : void x86_64_ap_init(void *cpu_data) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 54   : 	x64_lock_acquire(&ap_lock);

	lea	rcx, OFFSET FLAT:ap_lock
	call	x64_lock_acquire

; 55   : 	x64_cli();

	call	x64_cli

; 56   : 	x86_64_setup_cpu_data(cpu_data);

	mov	rcx, QWORD PTR cpu_data$[rsp]
	call	?x86_64_setup_cpu_data@@YAXPEAX@Z	; x86_64_setup_cpu_data

; 57   : 	x86_64_cpu_initialize(false);

	xor	ecx, ecx
	call	?x86_64_cpu_initialize@@YAX_N@Z		; x86_64_cpu_initialize

; 58   : 	x86_64_initialize_apic(false);

	xor	ecx, ecx
	call	?x86_64_initialize_apic@@YAH_N@Z	; x86_64_initialize_apic

; 59   : 	x86_64_initialize_idle();

	call	?x86_64_initialize_idle@@YAXXZ		; x86_64_initialize_idle

; 60   : 
; 61   : 	meta_data_t *meta = (meta_data_t*)0xFFFFB00000000000;

	mov	rax, -87960930222080			; ffffb00000000000H
	mov	QWORD PTR meta$[rsp], rax

; 62   : 
; 63   : 	au_get_boot_info()->auprint("***addr[i] -> %x\n", meta->magic);

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	rcx, QWORD PTR meta$[rsp]
	mov	edx, DWORD PTR [rcx]
	lea	rcx, OFFSET FLAT:$SG3027
	call	QWORD PTR [rax+90]

; 64   : 	uint64_t *a = (uint64_t*)0x14000;

	mov	QWORD PTR a$[rsp], 81920		; 00014000H

; 65   : 	au_get_boot_info()->auprint("A[i] -> %d\n", a[1]);

	mov	eax, 8
	imul	rax, rax, 1
	mov	QWORD PTR tv75[rsp], rax
	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	rcx, QWORD PTR a$[rsp]
	mov	rdx, QWORD PTR tv75[rsp]
	mov	rdx, QWORD PTR [rcx+rdx]
	lea	rcx, OFFSET FLAT:$SG3030
	call	QWORD PTR [rax+90]

; 66   : 	x86_64_ap_started();	

	call	?x86_64_ap_started@@YAXXZ		; x86_64_ap_started

; 67   : 	ap_lock = 0;

	mov	DWORD PTR ap_lock, 0
$LN2@x86_64_ap_:

; 68   : 	//au_get_boot_info()->auprint("Idle thr rip -> %x \n", x86_64_get_idle_thr()->rip);
; 69   : 	
; 70   : 	/* initialize processor specific functions here !!*/
; 71   : 	/* from here we'll jump to scheduler */
; 72   : 	for (;;);

	jmp	SHORT $LN2@x86_64_ap_

; 73   : }

	add	rsp, 72					; 00000048H
	ret	0
?x86_64_ap_init@@YAXPEAX@Z ENDP				; x86_64_ap_init
_TEXT	ENDS
END
