; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_BSS	SEGMENT
exception_lock DQ 01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG3072	DB	'[aurora]: current thread -> %x ', 0aH, 00H
	ORG $+7
$SG3074	DB	'bit: present ', 0aH, 00H
	ORG $+1
$SG3077	DB	'bit: rw ', 0aH, 00H
	ORG $+6
$SG3080	DB	'bit: user bit not present ', 0aH, 00H
	ORG $+4
$SG3083	DB	'bit: resv ', 0aH, 00H
	ORG $+4
$SG3086	DB	'bit: id', 0aH, 00H
	ORG $+7
$SG3087	DB	'RIP -> %x ', 0aH, 00H
	ORG $+4
$SG3088	DB	'RFLAGS -> %x ', 0aH, 00H
	ORG $+1
$SG3089	DB	'RSP -> %x ', 0aH, 00H
	ORG $+4
$SG3090	DB	'CS -> %x ', 0aH, 00H
	ORG $+5
$SG3091	DB	'SS -> %x ', 0aH, 00H
	ORG $+5
$SG3099	DB	0aH, 'FPU Fault', 00H
	ORG $+5
$SG3107	DB	0aH, 'Alignment Check Fault at address ', 00H
	ORG $+5
$SG3115	DB	0aH, 'Machine Check Abort', 00H
	ORG $+3
$SG3123	DB	0aH, 'SIMD FPU Fault', 00H
$SG2922	DB	'***ARCH x86_64 : Exception Occured ***', 0aH, 00H
$SG2923	DB	'[aurora]: We are sorry to say that, a processor invalid '
	DB	'exception has occured', 0aH, 00H
	ORG $+1
$SG2924	DB	'[aurora]: please inform it to the master of the kernel', 0aH
	DB	00H
$SG2925	DB	'[aurora]: Below is the code of exception', 0aH, 00H
	ORG $+6
$SG2932	DB	0aH, 'Divide by 0', 00H
	ORG $+3
$SG2933	DB	'__PROCESSOR_DATA__', 0aH, 00H
	ORG $+4
$SG2934	DB	'RIP -> %x', 0aH, 00H
	ORG $+5
$SG2935	DB	'RSP -> %x', 0aH, 00H
	ORG $+5
$SG2936	DB	'RFLAGS -> %x', 0aH, 00H
	ORG $+2
$SG2946	DB	0aH, 'Single Step Trap', 00H
	ORG $+6
$SG2954	DB	0aH, 'NMI [Non-Muskable-Interrupt] Trap', 00H
	ORG $+5
$SG2962	DB	0aH, 'Breakpoint Trap', 00H
	ORG $+7
$SG2970	DB	0aH, 'Overflow Trap', 00H
	ORG $+1
$SG2978	DB	0aH, 'Bound Check Fault', 00H
	ORG $+5
$SG2988	DB	'Invalid Opcode Fault', 0aH, 00H
	ORG $+2
$SG2989	DB	'CPU ID -> %d ', 0aH, 00H
	ORG $+1
$SG2990	DB	'__PROCESSOR TRACE__', 0aH, 00H
	ORG $+3
$SG2991	DB	'RIP -> %x', 0aH, 00H
	ORG $+5
$SG2992	DB	'Stack -> %x', 0aH, 00H
	ORG $+3
$SG2993	DB	'RFLAGS -> %x', 0aH, 00H
	ORG $+2
$SG2994	DB	'CS -> %x', 0aH, 00H
	ORG $+6
$SG2995	DB	'SS -> %x', 0aH, 00H
	ORG $+6
$SG3003	DB	0aH, 'No Device Fault', 00H
	ORG $+7
$SG3011	DB	0aH, 'Double Fault Abort', 00H
	ORG $+4
$SG3019	DB	0aH, 'Invalid TSS Fault ', 00H
	ORG $+4
$SG3027	DB	0aH, 'No Segment Fault', 00H
	ORG $+6
$SG3035	DB	0aH, 'Stack Fault at ', 00H
	ORG $+7
$SG3045	DB	'Genral Protection Fault', 0aH, 00H
	ORG $+7
$SG3046	DB	'Current CPU id -> %d ', 0aH, 00H
	ORG $+1
$SG3047	DB	'Current thread -> %x ', 0aH, 00H
	ORG $+1
$SG3048	DB	'__PROCESSOR TRACE__', 0aH, 00H
	ORG $+3
$SG3049	DB	'RIP -> %x', 0aH, 00H
	ORG $+5
$SG3050	DB	'Stack -> %x', 0aH, 00H
	ORG $+3
$SG3051	DB	'RFLAGS -> %x', 0aH, 00H
	ORG $+2
$SG3052	DB	'CS -> %x, SS -> %x', 0aH, 00H
	ORG $+4
$SG3069	DB	'[aurora]: page fault ', 0aH, 00H
	ORG $+1
$SG3070	DB	'[aurora]: page fault at -> %x ', 0aH, 00H
$SG3071	DB	'[aurora]: current cpu -> %d ', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_exception_init@@YAXXZ			; x86_64_exception_init
PUBLIC	?panic@@YAXPEBDZZ				; panic
PUBLIC	?divide_by_zero_fault@@YAX_KPEAX@Z		; divide_by_zero_fault
PUBLIC	?single_step_trap@@YAX_KPEAX@Z			; single_step_trap
PUBLIC	?nmi_trap@@YAX_KPEAX@Z				; nmi_trap
PUBLIC	?breakpoint_trap@@YAX_KPEAX@Z			; breakpoint_trap
PUBLIC	?overflow_trap@@YAX_KPEAX@Z			; overflow_trap
PUBLIC	?bounds_check_fault@@YAX_KPEAX@Z		; bounds_check_fault
PUBLIC	?invalid_opcode_fault@@YAX_KPEAX@Z		; invalid_opcode_fault
PUBLIC	?no_device_fault@@YAX_KPEAX@Z			; no_device_fault
PUBLIC	?double_fault_abort@@YAX_KPEAX@Z		; double_fault_abort
PUBLIC	?invalid_tss_fault@@YAX_KPEAX@Z			; invalid_tss_fault
PUBLIC	?no_segment_fault@@YAX_KPEAX@Z			; no_segment_fault
PUBLIC	?stack_fault@@YAX_KPEAX@Z			; stack_fault
PUBLIC	?general_protection_fault@@YAX_KPEAX@Z		; general_protection_fault
PUBLIC	?page_fault@@YAX_KPEAX@Z			; page_fault
PUBLIC	?fpu_fault@@YAX_KPEAX@Z				; fpu_fault
PUBLIC	?alignment_check_fault@@YAX_KPEAX@Z		; alignment_check_fault
PUBLIC	?machine_check_abort@@YAX_KPEAX@Z		; machine_check_abort
PUBLIC	?simd_fpu_fault@@YAX_KPEAX@Z			; simd_fpu_fault
EXTRN	printf:PROC
EXTRN	x64_cli:PROC
EXTRN	x64_read_cr2:PROC
EXTRN	setvect:PROC
EXTRN	?per_cpu_get_cpu_id@@YAEXZ:PROC			; per_cpu_get_cpu_id
EXTRN	?x86_64_get_current_thread@@YAPEAU_thread_@@XZ:PROC ; x86_64_get_current_thread
pdata	SEGMENT
$pdata$?x86_64_exception_init@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+312
	DD	imagerel $unwind$?x86_64_exception_init@@YAXXZ
$pdata$?panic@@YAXPEBDZZ DD imagerel $LN3
	DD	imagerel $LN3+98
	DD	imagerel $unwind$?panic@@YAXPEBDZZ
$pdata$?divide_by_zero_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+134
	DD	imagerel $unwind$?divide_by_zero_fault@@YAX_KPEAX@Z
$pdata$?single_step_trap@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+59
	DD	imagerel $unwind$?single_step_trap@@YAX_KPEAX@Z
$pdata$?nmi_trap@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?nmi_trap@@YAX_KPEAX@Z
$pdata$?breakpoint_trap@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?breakpoint_trap@@YAX_KPEAX@Z
$pdata$?overflow_trap@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?overflow_trap@@YAX_KPEAX@Z
$pdata$?bounds_check_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?bounds_check_fault@@YAX_KPEAX@Z
$pdata$?invalid_opcode_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+198
	DD	imagerel $unwind$?invalid_opcode_fault@@YAX_KPEAX@Z
$pdata$?no_device_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?no_device_fault@@YAX_KPEAX@Z
$pdata$?double_fault_abort@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?double_fault_abort@@YAX_KPEAX@Z
$pdata$?invalid_tss_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?invalid_tss_fault@@YAX_KPEAX@Z
$pdata$?no_segment_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?no_segment_fault@@YAX_KPEAX@Z
$pdata$?stack_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?stack_fault@@YAX_KPEAX@Z
$pdata$?general_protection_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+195
	DD	imagerel $unwind$?general_protection_fault@@YAX_KPEAX@Z
$pdata$?page_fault@@YAX_KPEAX@Z DD imagerel $LN16
	DD	imagerel $LN16+448
	DD	imagerel $unwind$?page_fault@@YAX_KPEAX@Z
$pdata$?fpu_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+49
	DD	imagerel $unwind$?fpu_fault@@YAX_KPEAX@Z
$pdata$?alignment_check_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?alignment_check_fault@@YAX_KPEAX@Z
$pdata$?machine_check_abort@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?machine_check_abort@@YAX_KPEAX@Z
$pdata$?simd_fpu_fault@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?simd_fpu_fault@@YAX_KPEAX@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_exception_init@@YAXXZ DD 010401H
	DD	04204H
$unwind$?panic@@YAXPEBDZZ DD 011801H
	DD	04218H
$unwind$?divide_by_zero_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0620eH
$unwind$?single_step_trap@@YAX_KPEAX@Z DD 010e01H
	DD	0620eH
$unwind$?nmi_trap@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?breakpoint_trap@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?overflow_trap@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?bounds_check_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?invalid_opcode_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0620eH
$unwind$?no_device_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?double_fault_abort@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?invalid_tss_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?no_segment_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?stack_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?general_protection_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0620eH
$unwind$?page_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0a20eH
$unwind$?fpu_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?alignment_check_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?machine_check_abort@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?simd_fpu_fault@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?simd_fpu_fault@@YAX_KPEAX@Z PROC			; simd_fpu_fault

; 246  : void simd_fpu_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 247  : 	x64_cli();

	call	x64_cli

; 248  : 	panic("\nSIMD FPU Fault");

	lea	rcx, OFFSET FLAT:$SG3123
	call	?panic@@YAXPEBDZZ			; panic
$LN2@simd_fpu_f:

; 249  : 	for (;;);

	jmp	SHORT $LN2@simd_fpu_f

; 250  : }

	add	rsp, 40					; 00000028H
	ret	0
?simd_fpu_fault@@YAX_KPEAX@Z ENDP			; simd_fpu_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?machine_check_abort@@YAX_KPEAX@Z PROC			; machine_check_abort

; 239  : void machine_check_abort(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 240  : 	x64_cli();

	call	x64_cli

; 241  : 	panic("\nMachine Check Abort");

	lea	rcx, OFFSET FLAT:$SG3115
	call	?panic@@YAXPEBDZZ			; panic
$LN2@machine_ch:

; 242  : 	for (;;);

	jmp	SHORT $LN2@machine_ch

; 243  : }

	add	rsp, 40					; 00000028H
	ret	0
?machine_check_abort@@YAX_KPEAX@Z ENDP			; machine_check_abort
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?alignment_check_fault@@YAX_KPEAX@Z PROC		; alignment_check_fault

; 232  : void alignment_check_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 233  : 	x64_cli();

	call	x64_cli

; 234  : 	panic("\nAlignment Check Fault at address ");

	lea	rcx, OFFSET FLAT:$SG3107
	call	?panic@@YAXPEBDZZ			; panic
$LN2@alignment_:

; 235  : 	for (;;);

	jmp	SHORT $LN2@alignment_

; 236  : }

	add	rsp, 40					; 00000028H
	ret	0
?alignment_check_fault@@YAX_KPEAX@Z ENDP		; alignment_check_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
vector$ = 48
p$ = 56
?fpu_fault@@YAX_KPEAX@Z PROC				; fpu_fault

; 222  : void fpu_fault(size_t vector, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 223  : 	//x64_lock_acquire(&exception_lock);
; 224  : 	x64_cli();

	call	x64_cli

; 225  : 	panic("\nFPU Fault");

	lea	rcx, OFFSET FLAT:$SG3099
	call	?panic@@YAXPEBDZZ			; panic

; 226  : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@fpu_fault:

; 227  : 	for (;;);

	jmp	SHORT $LN2@fpu_fault

; 228  : }

	add	rsp, 40					; 00000028H
	ret	0
?fpu_fault@@YAX_KPEAX@Z ENDP				; fpu_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
tv68 = 32
present$ = 36
rw$ = 40
us$ = 44
resv$ = 48
id$ = 52
frame$ = 56
vaddr$ = 64
vector$ = 96
param$ = 104
?page_fault@@YAX_KPEAX@Z PROC				; page_fault

; 182  : void page_fault(size_t vector, void* param){

$LN16:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 88					; 00000058H

; 183  : 	//x64_lock_acquire(&exception_lock);
; 184  : 	x64_cli();

	call	x64_cli

; 185  : 
; 186  : 	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;

	mov	rax, QWORD PTR param$[rsp]
	mov	QWORD PTR frame$[rsp], rax

; 187  : 	void* vaddr = (void*)x64_read_cr2();

	call	x64_read_cr2
	mov	QWORD PTR vaddr$[rsp], rax

; 188  : 
; 189  : 	int present = !(frame->error & 0x1);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rax, QWORD PTR [rax+8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN14@page_fault
	mov	DWORD PTR tv68[rsp], 1
	jmp	SHORT $LN15@page_fault
$LN14@page_fault:
	mov	DWORD PTR tv68[rsp], 0
$LN15@page_fault:
	mov	eax, DWORD PTR tv68[rsp]
	mov	DWORD PTR present$[rsp], eax

; 190  : 	int rw = frame->error & 0x2;

	mov	rax, QWORD PTR frame$[rsp]
	mov	rax, QWORD PTR [rax+8]
	and	rax, 2
	mov	DWORD PTR rw$[rsp], eax

; 191  : 	int us = frame->error & 0x4;

	mov	rax, QWORD PTR frame$[rsp]
	mov	rax, QWORD PTR [rax+8]
	and	rax, 4
	mov	DWORD PTR us$[rsp], eax

; 192  : 	int resv = frame->error & 0x8;

	mov	rax, QWORD PTR frame$[rsp]
	mov	rax, QWORD PTR [rax+8]
	and	rax, 8
	mov	DWORD PTR resv$[rsp], eax

; 193  : 	int id = frame->error & 0x10;

	mov	rax, QWORD PTR frame$[rsp]
	mov	rax, QWORD PTR [rax+8]
	and	rax, 16
	mov	DWORD PTR id$[rsp], eax

; 194  : 
; 195  : 	panic("[aurora]: page fault \n");

	lea	rcx, OFFSET FLAT:$SG3069
	call	?panic@@YAXPEBDZZ			; panic

; 196  : 	printf("[aurora]: page fault at -> %x \n", vaddr);

	mov	rdx, QWORD PTR vaddr$[rsp]
	lea	rcx, OFFSET FLAT:$SG3070
	call	printf

; 197  : 	printf("[aurora]: current cpu -> %d \n", per_cpu_get_cpu_id());

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	movzx	eax, al
	mov	edx, eax
	lea	rcx, OFFSET FLAT:$SG3071
	call	printf

; 198  : 	printf("[aurora]: current thread -> %x \n", x86_64_get_current_thread());

	call	?x86_64_get_current_thread@@YAPEAU_thread_@@XZ ; x86_64_get_current_thread
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:$SG3072
	call	printf

; 199  : 	if (present)

	cmp	DWORD PTR present$[rsp], 0
	je	SHORT $LN11@page_fault

; 200  : 		printf("bit: present \n");

	lea	rcx, OFFSET FLAT:$SG3074
	call	printf
	jmp	SHORT $LN10@page_fault
$LN11@page_fault:

; 201  : 	else if (rw)

	cmp	DWORD PTR rw$[rsp], 0
	je	SHORT $LN9@page_fault

; 202  : 		printf("bit: rw \n");

	lea	rcx, OFFSET FLAT:$SG3077
	call	printf
	jmp	SHORT $LN8@page_fault
$LN9@page_fault:

; 203  : 	else if (us)

	cmp	DWORD PTR us$[rsp], 0
	je	SHORT $LN7@page_fault

; 204  : 		printf("bit: user bit not present \n");

	lea	rcx, OFFSET FLAT:$SG3080
	call	printf
	jmp	SHORT $LN6@page_fault
$LN7@page_fault:

; 205  : 	else if (resv)

	cmp	DWORD PTR resv$[rsp], 0
	je	SHORT $LN5@page_fault

; 206  : 		printf("bit: resv \n");

	lea	rcx, OFFSET FLAT:$SG3083
	call	printf
	jmp	SHORT $LN4@page_fault
$LN5@page_fault:

; 207  : 	else if (id)

	cmp	DWORD PTR id$[rsp], 0
	je	SHORT $LN3@page_fault

; 208  : 		printf("bit: id\n");

	lea	rcx, OFFSET FLAT:$SG3086
	call	printf
$LN3@page_fault:
$LN4@page_fault:
$LN6@page_fault:
$LN8@page_fault:
$LN10@page_fault:

; 209  : 
; 210  : 	printf("RIP -> %x \n", frame->rip);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+16]
	lea	rcx, OFFSET FLAT:$SG3087
	call	printf

; 211  : 	printf("RFLAGS -> %x \n", frame->rflags);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+32]
	lea	rcx, OFFSET FLAT:$SG3088
	call	printf

; 212  : 	printf("RSP -> %x \n", frame->rsp);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+40]
	lea	rcx, OFFSET FLAT:$SG3089
	call	printf

; 213  : 	printf("CS -> %x \n", frame->cs);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+24]
	lea	rcx, OFFSET FLAT:$SG3090
	call	printf

; 214  : 	printf("SS -> %x \n", frame->ss);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+48]
	lea	rcx, OFFSET FLAT:$SG3091
	call	printf

; 215  : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@page_fault:

; 216  : 
; 217  : 	for (;;);

	jmp	SHORT $LN2@page_fault

; 218  : }

	add	rsp, 88					; 00000058H
	ret	0
?page_fault@@YAX_KPEAX@Z ENDP				; page_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
frame$ = 32
v$ = 64
p$ = 72
?general_protection_fault@@YAX_KPEAX@Z PROC		; general_protection_fault

; 163  : void general_protection_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 164  : 	//x64_lock_acquire(&exception_lock);
; 165  : 	x64_cli();

	call	x64_cli

; 166  : 	interrupt_stack_frame *frame = (interrupt_stack_frame*)p;

	mov	rax, QWORD PTR p$[rsp]
	mov	QWORD PTR frame$[rsp], rax

; 167  : 	panic ("Genral Protection Fault\n");

	lea	rcx, OFFSET FLAT:$SG3045
	call	?panic@@YAXPEBDZZ			; panic

; 168  : 	printf("Current CPU id -> %d \n", per_cpu_get_cpu_id());

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	movzx	eax, al
	mov	edx, eax
	lea	rcx, OFFSET FLAT:$SG3046
	call	printf

; 169  : 	printf("Current thread -> %x \n",x86_64_get_current_thread());

	call	?x86_64_get_current_thread@@YAPEAU_thread_@@XZ ; x86_64_get_current_thread
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:$SG3047
	call	printf

; 170  : 	printf ("__PROCESSOR TRACE__\n");

	lea	rcx, OFFSET FLAT:$SG3048
	call	printf

; 171  : 	printf ("RIP -> %x\n",frame->rip);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+16]
	lea	rcx, OFFSET FLAT:$SG3049
	call	printf

; 172  : 	printf ("Stack -> %x\n", frame->rsp);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+40]
	lea	rcx, OFFSET FLAT:$SG3050
	call	printf

; 173  : 	printf ("RFLAGS -> %x\n", frame->rflags);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+32]
	lea	rcx, OFFSET FLAT:$SG3051
	call	printf

; 174  : 	printf ("CS -> %x, SS -> %x\n", frame->cs, frame->ss);

	mov	rax, QWORD PTR frame$[rsp]
	mov	r8, QWORD PTR [rax+48]
	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+24]
	lea	rcx, OFFSET FLAT:$SG3052
	call	printf
$LN2@general_pr:

; 175  : 	//exception_lock = 0;
; 176  : 	for(;;);

	jmp	SHORT $LN2@general_pr

; 177  : }

	add	rsp, 56					; 00000038H
	ret	0
?general_protection_fault@@YAX_KPEAX@Z ENDP		; general_protection_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?stack_fault@@YAX_KPEAX@Z PROC				; stack_fault

; 155  : void stack_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 156  : 	x64_cli();

	call	x64_cli

; 157  : 	panic("\nStack Fault at ");

	lea	rcx, OFFSET FLAT:$SG3035
	call	?panic@@YAXPEBDZZ			; panic
$LN2@stack_faul:

; 158  : 	for (;;);

	jmp	SHORT $LN2@stack_faul

; 159  : }

	add	rsp, 40					; 00000028H
	ret	0
?stack_fault@@YAX_KPEAX@Z ENDP				; stack_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?no_segment_fault@@YAX_KPEAX@Z PROC			; no_segment_fault

; 148  : void no_segment_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 149  : 	x64_cli();

	call	x64_cli

; 150  : 	panic("\nNo Segment Fault");

	lea	rcx, OFFSET FLAT:$SG3027
	call	?panic@@YAXPEBDZZ			; panic
$LN2@no_segment:

; 151  : 	for (;;);

	jmp	SHORT $LN2@no_segment

; 152  : }

	add	rsp, 40					; 00000028H
	ret	0
?no_segment_fault@@YAX_KPEAX@Z ENDP			; no_segment_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?invalid_tss_fault@@YAX_KPEAX@Z PROC			; invalid_tss_fault

; 141  : void invalid_tss_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 142  : 	x64_cli();

	call	x64_cli

; 143  : 	panic("\nInvalid TSS Fault ");

	lea	rcx, OFFSET FLAT:$SG3019
	call	?panic@@YAXPEBDZZ			; panic
$LN2@invalid_ts:

; 144  : 	for (;;);

	jmp	SHORT $LN2@invalid_ts

; 145  : }

	add	rsp, 40					; 00000028H
	ret	0
?invalid_tss_fault@@YAX_KPEAX@Z ENDP			; invalid_tss_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?double_fault_abort@@YAX_KPEAX@Z PROC			; double_fault_abort

; 134  : void double_fault_abort(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 135  : 	x64_cli();

	call	x64_cli

; 136  : 	panic("\nDouble Fault Abort");

	lea	rcx, OFFSET FLAT:$SG3011
	call	?panic@@YAXPEBDZZ			; panic
$LN2@double_fau:

; 137  : 	for (;;);

	jmp	SHORT $LN2@double_fau

; 138  : }

	add	rsp, 40					; 00000028H
	ret	0
?double_fault_abort@@YAX_KPEAX@Z ENDP			; double_fault_abort
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?no_device_fault@@YAX_KPEAX@Z PROC			; no_device_fault

; 125  : void no_device_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 126  : 	//x64_lock_acquire(&exception_lock);
; 127  : 	x64_cli();

	call	x64_cli

; 128  : 	panic("\nNo Device Fault");

	lea	rcx, OFFSET FLAT:$SG3003
	call	?panic@@YAXPEBDZZ			; panic

; 129  : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@no_device_:

; 130  : 	for (;;);

	jmp	SHORT $LN2@no_device_

; 131  : }

	add	rsp, 40					; 00000028H
	ret	0
?no_device_fault@@YAX_KPEAX@Z ENDP			; no_device_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
frame$ = 32
v$ = 64
p$ = 72
?invalid_opcode_fault@@YAX_KPEAX@Z PROC			; invalid_opcode_fault

; 108  : void invalid_opcode_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 109  : 	//x64_lock_acquire(&exception_lock);
; 110  : 	x64_cli();

	call	x64_cli

; 111  : 	interrupt_stack_frame *frame = (interrupt_stack_frame*)p;

	mov	rax, QWORD PTR p$[rsp]
	mov	QWORD PTR frame$[rsp], rax

; 112  : 	panic("Invalid Opcode Fault\n");

	lea	rcx, OFFSET FLAT:$SG2988
	call	?panic@@YAXPEBDZZ			; panic

; 113  : 	printf("CPU ID -> %d \n", per_cpu_get_cpu_id());

	call	?per_cpu_get_cpu_id@@YAEXZ		; per_cpu_get_cpu_id
	movzx	eax, al
	mov	edx, eax
	lea	rcx, OFFSET FLAT:$SG2989
	call	printf

; 114  : 	printf("__PROCESSOR TRACE__\n");

	lea	rcx, OFFSET FLAT:$SG2990
	call	printf

; 115  : 	printf("RIP -> %x\n", frame->rip);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+16]
	lea	rcx, OFFSET FLAT:$SG2991
	call	printf

; 116  : 	printf("Stack -> %x\n", frame->rsp);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+40]
	lea	rcx, OFFSET FLAT:$SG2992
	call	printf

; 117  : 	printf("RFLAGS -> %x\n", frame->rflags);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+32]
	lea	rcx, OFFSET FLAT:$SG2993
	call	printf

; 118  : 	printf("CS -> %x\n", frame->cs);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+24]
	lea	rcx, OFFSET FLAT:$SG2994
	call	printf

; 119  : 	printf("SS -> %x\n", frame->ss);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+48]
	lea	rcx, OFFSET FLAT:$SG2995
	call	printf

; 120  : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@invalid_op:

; 121  : 	for (;;);

	jmp	SHORT $LN2@invalid_op

; 122  : }

	add	rsp, 56					; 00000038H
	ret	0
?invalid_opcode_fault@@YAX_KPEAX@Z ENDP			; invalid_opcode_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?bounds_check_fault@@YAX_KPEAX@Z PROC			; bounds_check_fault

; 99   : void bounds_check_fault(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 100  : 	//x64_lock_acquire(&exception_lock);
; 101  : 	x64_cli();

	call	x64_cli

; 102  : 	panic("\nBound Check Fault");

	lea	rcx, OFFSET FLAT:$SG2978
	call	?panic@@YAXPEBDZZ			; panic

; 103  : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@bounds_che:

; 104  : 	for (;;);

	jmp	SHORT $LN2@bounds_che

; 105  : }

	add	rsp, 40					; 00000028H
	ret	0
?bounds_check_fault@@YAX_KPEAX@Z ENDP			; bounds_check_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
v$ = 48
p$ = 56
?overflow_trap@@YAX_KPEAX@Z PROC			; overflow_trap

; 90   : void overflow_trap(size_t v, void* p){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 91   : 	//x64_lock_acquire(&exception_lock);
; 92   : 	x64_cli();

	call	x64_cli

; 93   : 	panic("\nOverflow Trap");

	lea	rcx, OFFSET FLAT:$SG2970
	call	?panic@@YAXPEBDZZ			; panic

; 94   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@overflow_t:

; 95   : 	for (;;);

	jmp	SHORT $LN2@overflow_t

; 96   : }

	add	rsp, 40					; 00000028H
	ret	0
?overflow_trap@@YAX_KPEAX@Z ENDP			; overflow_trap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
vector$ = 48
param$ = 56
?breakpoint_trap@@YAX_KPEAX@Z PROC			; breakpoint_trap

; 81   : void breakpoint_trap(size_t vector, void* param){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 82   : 	//x64_lock_acquire(&exception_lock);
; 83   : 	x64_cli();

	call	x64_cli

; 84   : 	panic("\nBreakpoint Trap");

	lea	rcx, OFFSET FLAT:$SG2962
	call	?panic@@YAXPEBDZZ			; panic

; 85   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@breakpoint:

; 86   : 	for (;;);

	jmp	SHORT $LN2@breakpoint

; 87   : }

	add	rsp, 40					; 00000028H
	ret	0
?breakpoint_trap@@YAX_KPEAX@Z ENDP			; breakpoint_trap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
vector$ = 48
param$ = 56
?nmi_trap@@YAX_KPEAX@Z PROC				; nmi_trap

; 71   : void nmi_trap(size_t vector, void* param){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 72   : 	//x64_lock_acquire(&exception_lock);
; 73   : 	x64_cli();

	call	x64_cli

; 74   : 	panic("\nNMI [Non-Muskable-Interrupt] Trap");

	lea	rcx, OFFSET FLAT:$SG2954
	call	?panic@@YAXPEBDZZ			; panic

; 75   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@nmi_trap:

; 76   : 	for (;;);

	jmp	SHORT $LN2@nmi_trap

; 77   : 
; 78   : }

	add	rsp, 40					; 00000028H
	ret	0
?nmi_trap@@YAX_KPEAX@Z ENDP				; nmi_trap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
frame$ = 32
vector$ = 64
param$ = 72
?single_step_trap@@YAX_KPEAX@Z PROC			; single_step_trap

; 62   : void single_step_trap(size_t vector, void* param) {

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 63   : 	//x64_lock_acquire(&exception_lock);
; 64   : 	x64_cli();

	call	x64_cli

; 65   : 	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;

	mov	rax, QWORD PTR param$[rsp]
	mov	QWORD PTR frame$[rsp], rax

; 66   : 	panic("\nSingle Step Trap");

	lea	rcx, OFFSET FLAT:$SG2946
	call	?panic@@YAXPEBDZZ			; panic

; 67   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@single_ste:

; 68   : 	for (;;);

	jmp	SHORT $LN2@single_ste

; 69   : }

	add	rsp, 56					; 00000038H
	ret	0
?single_step_trap@@YAX_KPEAX@Z ENDP			; single_step_trap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
frame$ = 32
vector$ = 64
param$ = 72
?divide_by_zero_fault@@YAX_KPEAX@Z PROC			; divide_by_zero_fault

; 48   : void divide_by_zero_fault(size_t vector, void* param) {

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 49   : 	//x64_lock_acquire(&exception_lock);
; 50   : 	x64_cli();

	call	x64_cli

; 51   : 	interrupt_stack_frame *frame = (interrupt_stack_frame*)param;

	mov	rax, QWORD PTR param$[rsp]
	mov	QWORD PTR frame$[rsp], rax

; 52   : 	panic("\nDivide by 0");

	lea	rcx, OFFSET FLAT:$SG2932
	call	?panic@@YAXPEBDZZ			; panic

; 53   : 
; 54   : 	printf("__PROCESSOR_DATA__\n");

	lea	rcx, OFFSET FLAT:$SG2933
	call	printf

; 55   : 	printf("RIP -> %x\n", frame->rip);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+16]
	lea	rcx, OFFSET FLAT:$SG2934
	call	printf

; 56   : 	printf("RSP -> %x\n", frame->rsp);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+40]
	lea	rcx, OFFSET FLAT:$SG2935
	call	printf

; 57   : 	printf("RFLAGS -> %x\n", frame->rflags);

	mov	rax, QWORD PTR frame$[rsp]
	mov	rdx, QWORD PTR [rax+32]
	lea	rcx, OFFSET FLAT:$SG2936
	call	printf

; 58   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0
$LN2@divide_by_:

; 59   : 	for (;;);

	jmp	SHORT $LN2@divide_by_

; 60   : }

	add	rsp, 56					; 00000038H
	ret	0
?divide_by_zero_fault@@YAX_KPEAX@Z ENDP			; divide_by_zero_fault
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
msg$ = 48
?panic@@YAXPEBDZZ PROC					; panic

; 38   : void panic(const char* msg, ...) {

$LN3:
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 40					; 00000028H

; 39   : 	//x64_lock_acquire(&exception_lock);
; 40   : 	printf("***ARCH x86_64 : Exception Occured ***\n");

	lea	rcx, OFFSET FLAT:$SG2922
	call	printf

; 41   : 	printf("[aurora]: We are sorry to say that, a processor invalid exception has occured\n");

	lea	rcx, OFFSET FLAT:$SG2923
	call	printf

; 42   : 	printf("[aurora]: please inform it to the master of the kernel\n");

	lea	rcx, OFFSET FLAT:$SG2924
	call	printf

; 43   : 	printf("[aurora]: Below is the code of exception\n");

	lea	rcx, OFFSET FLAT:$SG2925
	call	printf

; 44   : 	exception_lock = 0;

	mov	QWORD PTR exception_lock, 0

; 45   : 	printf(msg);

	mov	rcx, QWORD PTR msg$[rsp]
	call	printf

; 46   : }

	add	rsp, 40					; 00000028H
	ret	0
?panic@@YAXPEBDZZ ENDP					; panic
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_exception.cpp
_TEXT	SEGMENT
?x86_64_exception_init@@YAXXZ PROC			; x86_64_exception_init

; 252  : void x86_64_exception_init() {

$LN3:
	sub	rsp, 40					; 00000028H

; 253  : 	setvect(0, divide_by_zero_fault);

	lea	rdx, OFFSET FLAT:?divide_by_zero_fault@@YAX_KPEAX@Z ; divide_by_zero_fault
	xor	ecx, ecx
	call	setvect

; 254  : 	setvect(1, single_step_trap);

	lea	rdx, OFFSET FLAT:?single_step_trap@@YAX_KPEAX@Z ; single_step_trap
	mov	ecx, 1
	call	setvect

; 255  : 	setvect(2, nmi_trap);

	lea	rdx, OFFSET FLAT:?nmi_trap@@YAX_KPEAX@Z	; nmi_trap
	mov	ecx, 2
	call	setvect

; 256  : 	setvect(3, breakpoint_trap);

	lea	rdx, OFFSET FLAT:?breakpoint_trap@@YAX_KPEAX@Z ; breakpoint_trap
	mov	ecx, 3
	call	setvect

; 257  : 	setvect(4, overflow_trap);

	lea	rdx, OFFSET FLAT:?overflow_trap@@YAX_KPEAX@Z ; overflow_trap
	mov	ecx, 4
	call	setvect

; 258  : 	setvect(5, bounds_check_fault);

	lea	rdx, OFFSET FLAT:?bounds_check_fault@@YAX_KPEAX@Z ; bounds_check_fault
	mov	ecx, 5
	call	setvect

; 259  : 	setvect(6, invalid_opcode_fault);

	lea	rdx, OFFSET FLAT:?invalid_opcode_fault@@YAX_KPEAX@Z ; invalid_opcode_fault
	mov	ecx, 6
	call	setvect

; 260  : 	setvect(7, no_device_fault);

	lea	rdx, OFFSET FLAT:?no_device_fault@@YAX_KPEAX@Z ; no_device_fault
	mov	ecx, 7
	call	setvect

; 261  : 	setvect(8, double_fault_abort);

	lea	rdx, OFFSET FLAT:?double_fault_abort@@YAX_KPEAX@Z ; double_fault_abort
	mov	ecx, 8
	call	setvect

; 262  : 	setvect(10, invalid_tss_fault);

	lea	rdx, OFFSET FLAT:?invalid_tss_fault@@YAX_KPEAX@Z ; invalid_tss_fault
	mov	ecx, 10
	call	setvect

; 263  : 	setvect(11, no_segment_fault);

	lea	rdx, OFFSET FLAT:?no_segment_fault@@YAX_KPEAX@Z ; no_segment_fault
	mov	ecx, 11
	call	setvect

; 264  : 	setvect(12, stack_fault);

	lea	rdx, OFFSET FLAT:?stack_fault@@YAX_KPEAX@Z ; stack_fault
	mov	ecx, 12
	call	setvect

; 265  : 	setvect(13, general_protection_fault);

	lea	rdx, OFFSET FLAT:?general_protection_fault@@YAX_KPEAX@Z ; general_protection_fault
	mov	ecx, 13
	call	setvect

; 266  : 	setvect(14, page_fault);

	lea	rdx, OFFSET FLAT:?page_fault@@YAX_KPEAX@Z ; page_fault
	mov	ecx, 14
	call	setvect

; 267  : 	setvect(16, fpu_fault);

	lea	rdx, OFFSET FLAT:?fpu_fault@@YAX_KPEAX@Z ; fpu_fault
	mov	ecx, 16
	call	setvect

; 268  : 	setvect(17, alignment_check_fault);

	lea	rdx, OFFSET FLAT:?alignment_check_fault@@YAX_KPEAX@Z ; alignment_check_fault
	mov	ecx, 17
	call	setvect

; 269  : 	setvect(18, machine_check_abort);

	lea	rdx, OFFSET FLAT:?machine_check_abort@@YAX_KPEAX@Z ; machine_check_abort
	mov	ecx, 18
	call	setvect

; 270  : 	setvect(19, simd_fpu_fault);

	lea	rdx, OFFSET FLAT:?simd_fpu_fault@@YAX_KPEAX@Z ; simd_fpu_fault
	mov	ecx, 19
	call	setvect

; 271  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_exception_init@@YAXXZ ENDP			; x86_64_exception_init
_TEXT	ENDS
END
