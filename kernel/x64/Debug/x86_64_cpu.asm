; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?idtr@@3U_idtr@@A				; idtr
_BSS	SEGMENT
?idtr@@3U_idtr@@A DB 0aH DUP (?)			; idtr
_BSS	ENDS
CONST	SEGMENT
$SG2959	DB	'[aurora]: Default interrupt++', 0aH, 00H
	ORG $+1
$SG3001	DB	'[aurora]: SSE2 is supported ', 0aH, 00H
	ORG $+2
$SG3004	DB	'[aurora]: SSE3 is supported ', 0aH, 00H
	ORG $+2
$SG3016	DB	'CPU: Vendor -> %s ', 0aH, 00H
	ORG $+4
$SG3030	DB	'CPU: Brand = %s ', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_cpu_initialize@@YAXXZ			; x86_64_cpu_initialize
PUBLIC	x86_64_cpu_print_brand
PUBLIC	setvect
PUBLIC	load_default_sregs
PUBLIC	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z		; set_gdt_entry
PUBLIC	?save_sregs@@YAXXZ				; save_sregs
PUBLIC	?x86_64_gdt_initialize@@YAXXZ			; x86_64_gdt_initialize
PUBLIC	interrupt_dispatcher
PUBLIC	?default_irq@@YAX_KPEAX@Z			; default_irq
PUBLIC	?x86_64_idt_initialize@@YAXXZ			; x86_64_idt_initialize
PUBLIC	?x86_64_cpu_feature_enable@@YAXXZ		; x86_64_cpu_feature_enable
EXTRN	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ:PROC	; au_get_boot_info
EXTRN	x64_cli:PROC
EXTRN	x64_sti:PROC
EXTRN	x64_read_msr:PROC
EXTRN	x64_write_msr:PROC
EXTRN	x64_cpuid:PROC
EXTRN	x64_read_cr4:PROC
EXTRN	x64_write_cr4:PROC
EXTRN	x64_lgdt:PROC
EXTRN	x64_sgdt:PROC
EXTRN	printf:PROC
EXTRN	?x86_64_exception_init@@YAXXZ:PROC		; x86_64_exception_init
EXTRN	x64_get_segment_register:PROC
EXTRN	x64_set_segment_register:PROC
EXTRN	x64_ltr:PROC
EXTRN	x64_lidt:PROC
EXTRN	default_irq_handlers:BYTE
_BSS	SEGMENT
	ALIGN	8

gdt	DQ	09H DUP (?)
the_gdtr DB	0aH DUP (?)
	ALIGN	4

old_gdtr DB	0aH DUP (?)
	ALIGN	4

oldsregs DW	08H DUP (?)
interrupts_handlers DQ 0100H DUP (?)
the_idt	DB	01000H DUP (?)
_BSS	ENDS
pdata	SEGMENT
$pdata$?x86_64_cpu_initialize@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+126
	DD	imagerel $unwind$?x86_64_cpu_initialize@@YAXXZ
$pdata$x86_64_cpu_print_brand DD imagerel $LN3
	DD	imagerel $LN3+514
	DD	imagerel $unwind$x86_64_cpu_print_brand
$pdata$load_default_sregs DD imagerel $LN3
	DD	imagerel $LN3+90
	DD	imagerel $unwind$load_default_sregs
$pdata$?set_gdt_entry@@YAXAEAU_gdt@@EE@Z DD imagerel ?set_gdt_entry@@YAXAEAU_gdt@@EE@Z
	DD	imagerel ?set_gdt_entry@@YAXAEAU_gdt@@EE@Z+82
	DD	imagerel $unwind$?set_gdt_entry@@YAXAEAU_gdt@@EE@Z
$pdata$?fill_gdt@@YAXPEAU_gdt@@@Z DD imagerel ?fill_gdt@@YAXPEAU_gdt@@@Z
	DD	imagerel ?fill_gdt@@YAXPEAU_gdt@@@Z+253
	DD	imagerel $unwind$?fill_gdt@@YAXPEAU_gdt@@@Z
$pdata$?save_sregs@@YAXXZ DD imagerel $LN6
	DD	imagerel $LN6+67
	DD	imagerel $unwind$?save_sregs@@YAXXZ
$pdata$?x86_64_gdt_initialize@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+81
	DD	imagerel $unwind$?x86_64_gdt_initialize@@YAXXZ
$pdata$?register_irq@@YAXPEAU_idt@@PEAX@Z DD imagerel ?register_irq@@YAXPEAU_idt@@PEAX@Z
	DD	imagerel ?register_irq@@YAXPEAU_idt@@PEAX@Z+93
	DD	imagerel $unwind$?register_irq@@YAXPEAU_idt@@PEAX@Z
$pdata$interrupt_dispatcher DD imagerel $LN3
	DD	imagerel $LN3+45
	DD	imagerel $unwind$interrupt_dispatcher
$pdata$?default_irq@@YAX_KPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+38
	DD	imagerel $unwind$?default_irq@@YAX_KPEAX@Z
$pdata$?x86_64_idt_initialize@@YAXXZ DD imagerel $LN12
	DD	imagerel $LN12+519
	DD	imagerel $unwind$?x86_64_idt_initialize@@YAXXZ
$pdata$?x86_64_cpu_feature_enable@@YAXXZ DD imagerel $LN10
	DD	imagerel $LN10+250
	DD	imagerel $unwind$?x86_64_cpu_feature_enable@@YAXXZ
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_cpu_initialize@@YAXXZ DD 010401H
	DD	06204H
$unwind$x86_64_cpu_print_brand DD 020701H
	DD	0150107H
$unwind$load_default_sregs DD 010401H
	DD	04204H
$unwind$?set_gdt_entry@@YAXAEAU_gdt@@EE@Z DD 011201H
	DD	06212H
$unwind$?fill_gdt@@YAXPEAU_gdt@@@Z DD 010901H
	DD	06209H
$unwind$?save_sregs@@YAXXZ DD 010401H
	DD	06204H
$unwind$?x86_64_gdt_initialize@@YAXXZ DD 010401H
	DD	04204H
$unwind$?register_irq@@YAXPEAU_idt@@PEAX@Z DD 010e01H
	DD	0220eH
$unwind$interrupt_dispatcher DD 010e01H
	DD	0420eH
$unwind$?default_irq@@YAX_KPEAX@Z DD 010e01H
	DD	0420eH
$unwind$?x86_64_idt_initialize@@YAXXZ DD 020701H
	DD	0a10107H
$unwind$?x86_64_cpu_feature_enable@@YAXXZ DD 010401H
	DD	0c204H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
cr4$1 = 48
cr4$2 = 56
d$ = 64
c$ = 72
b$ = 80
a$ = 88
?x86_64_cpu_feature_enable@@YAXXZ PROC			; x86_64_cpu_feature_enable

; 201  : void x86_64_cpu_feature_enable() {

$LN10:
	sub	rsp, 104				; 00000068H

; 202  : 
; 203  : 	size_t a, b, c, d;
; 204  : 	x64_cpuid(1, &a, &b, &c, &d);

	mov	QWORD PTR [rsp+40], 0
	lea	rax, QWORD PTR d$[rsp]
	mov	QWORD PTR [rsp+32], rax
	lea	r9, QWORD PTR c$[rsp]
	lea	r8, QWORD PTR b$[rsp]
	lea	rdx, QWORD PTR a$[rsp]
	mov	ecx, 1
	call	x64_cpuid

; 205  : 
; 206  : 	if ((c & (1 << 26)) != 0) {

	mov	rax, QWORD PTR c$[rsp]
	and	rax, 67108864				; 04000000H
	test	rax, rax
	je	SHORT $LN7@x86_64_cpu

; 207  : 		/* Enable XCR0 register */
; 208  : 		uint64_t cr4 = x64_read_cr4();

	call	x64_read_cr4
	mov	QWORD PTR cr4$2[rsp], rax

; 209  : 		cr4 |= (1 << 18);

	mov	rax, QWORD PTR cr4$2[rsp]
	bts	rax, 18
	mov	QWORD PTR cr4$2[rsp], rax

; 210  : 		x64_write_cr4(cr4);

	mov	rcx, QWORD PTR cr4$2[rsp]
	call	x64_write_cr4
$LN7@x86_64_cpu:

; 211  : 	}
; 212  : 
; 213  : 	if ((d & (1 << 25)) != 0){

	mov	rax, QWORD PTR d$[rsp]
	and	rax, 33554432				; 02000000H
	test	rax, rax
	je	SHORT $LN6@x86_64_cpu

; 214  : 		size_t cr4 = x64_read_cr4();

	call	x64_read_cr4
	mov	QWORD PTR cr4$1[rsp], rax

; 215  : 		cr4 |= (1 << 10);

	mov	rax, QWORD PTR cr4$1[rsp]
	bts	rax, 10
	mov	QWORD PTR cr4$1[rsp], rax

; 216  : 
; 217  : 		if ((d & (1 << 24)) != 0) {

	mov	rax, QWORD PTR d$[rsp]
	and	rax, 16777216				; 01000000H
	test	rax, rax
	je	SHORT $LN5@x86_64_cpu

; 218  : 			cr4 |= (1 << 9);

	mov	rax, QWORD PTR cr4$1[rsp]
	bts	rax, 9
	mov	QWORD PTR cr4$1[rsp], rax
$LN5@x86_64_cpu:

; 219  : 		}
; 220  : 
; 221  : 		x64_write_cr4(cr4);

	mov	rcx, QWORD PTR cr4$1[rsp]
	call	x64_write_cr4
	jmp	SHORT $LN4@x86_64_cpu
$LN6@x86_64_cpu:

; 222  : 	}
; 223  : 	else if ((d & (1 << 26)) != 0) {

	mov	rax, QWORD PTR d$[rsp]
	and	rax, 67108864				; 04000000H
	test	rax, rax
	je	SHORT $LN3@x86_64_cpu

; 224  : 		au_get_boot_info()->auprint("[aurora]: SSE2 is supported \n");

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	lea	rcx, OFFSET FLAT:$SG3001
	call	QWORD PTR [rax+90]
	jmp	SHORT $LN2@x86_64_cpu
$LN3@x86_64_cpu:

; 225  : 	}
; 226  : 	else if ((c & (1 << 0)) != 0)

	mov	rax, QWORD PTR c$[rsp]
	and	rax, 1
	test	rax, rax
	je	SHORT $LN1@x86_64_cpu

; 227  : 		au_get_boot_info()->auprint("[aurora]: SSE3 is supported \n");

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	lea	rcx, OFFSET FLAT:$SG3004
	call	QWORD PTR [rax+90]
$LN1@x86_64_cpu:
$LN2@x86_64_cpu:
$LN4@x86_64_cpu:

; 228  : 
; 229  : #ifdef AVX_ENABLED
; 230  : 	if ((c & (1 << 28)) != 0) {
; 231  : 		size_t xcr0 = x64_read_xcr0();
; 232  : 		xcr0 |= 7;
; 233  : 		x64_write_xcr0(xcr0);
; 234  : 	}
; 235  : 	x64_cpuid(0xD, &a, &b, &c, &d);
; 236  : 	if ((a & (7 << 5)) != 0) {
; 237  : 		size_t ax, bx, cx, dx;
; 238  : 		x64_cpuid(0xD, &ax, &bx, &cx, &dx, 0);
; 239  : 		size_t xcr0 = x64_read_xcr0();
; 240  : 		xcr0 |= (ax&(7<<5));
; 241  : 		x64_write_xcr0(xcr0);
; 242  : 	}
; 243  : #endif
; 244  : }

	add	rsp, 104				; 00000068H
	ret	0
?x86_64_cpu_feature_enable@@YAXXZ ENDP			; x86_64_cpu_feature_enable
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
n$1 = 48
i$2 = 52
i$3 = 56
thegdt$ = 64
tv166 = 72
curr_gdt$ = 80
m_ist$ = 96
tss$ = 128
bos$4 = 240
?x86_64_idt_initialize@@YAXXZ PROC			; x86_64_idt_initialize

; 165  : void x86_64_idt_initialize() {

$LN12:
	sub	rsp, 1288				; 00000508H

; 166  : 
; 167  : 
; 168  : 	void* m_ist[4];
; 169  : 	uint32_t tss[28];
; 170  : 	for (int i = 0; i < 28; i++) tss[i] = 0xffffffff;

	mov	DWORD PTR i$3[rsp], 0
	jmp	SHORT $LN9@x86_64_idt
$LN8@x86_64_idt:
	mov	eax, DWORD PTR i$3[rsp]
	inc	eax
	mov	DWORD PTR i$3[rsp], eax
$LN9@x86_64_idt:
	cmp	DWORD PTR i$3[rsp], 28
	jge	SHORT $LN7@x86_64_idt
	movsxd	rax, DWORD PTR i$3[rsp]
	mov	DWORD PTR tss$[rsp+rax*4], -1		; ffffffffH
	jmp	SHORT $LN8@x86_64_idt
$LN7@x86_64_idt:

; 171  : 	for (int i = 0; i < 1; i++)

	mov	DWORD PTR i$2[rsp], 0
	jmp	SHORT $LN6@x86_64_idt
$LN5@x86_64_idt:
	mov	eax, DWORD PTR i$2[rsp]
	inc	eax
	mov	DWORD PTR i$2[rsp], eax
$LN6@x86_64_idt:
	cmp	DWORD PTR i$2[rsp], 1
	jge	SHORT $LN4@x86_64_idt

; 172  : 	{
; 173  : 		uint8_t bos[1024];
; 174  : 		m_ist[i] = bos + 1024;

	lea	rax, QWORD PTR bos$4[rsp+1024]
	movsxd	rcx, DWORD PTR i$2[rsp]
	mov	QWORD PTR m_ist$[rsp+rcx*8], rax

; 175  : 		tss[9 + i * 2] = reinterpret_cast<uint64_t>(m_ist[i]) & 0xffffffff;

	movsxd	rax, DWORD PTR i$2[rsp]
	mov	ecx, -1					; ffffffffH
	mov	rax, QWORD PTR m_ist$[rsp+rax*8]
	and	rax, rcx
	mov	ecx, DWORD PTR i$2[rsp]
	lea	ecx, DWORD PTR [rcx+rcx+9]
	movsxd	rcx, ecx
	mov	DWORD PTR tss$[rsp+rcx*4], eax

; 176  : 		tss[9 + i * 2 + 1] = reinterpret_cast<uint64_t>(m_ist[i]) >> 32;

	movsxd	rax, DWORD PTR i$2[rsp]
	mov	rax, QWORD PTR m_ist$[rsp+rax*8]
	shr	rax, 32					; 00000020H
	mov	ecx, DWORD PTR i$2[rsp]
	lea	ecx, DWORD PTR [rcx+rcx+10]
	movsxd	rcx, ecx
	mov	DWORD PTR tss$[rsp+rcx*4], eax

; 177  : 	}

	jmp	SHORT $LN5@x86_64_idt
$LN4@x86_64_idt:

; 178  : 	gdtr curr_gdt;
; 179  : 	x64_sgdt(&curr_gdt);

	lea	rcx, QWORD PTR curr_gdt$[rsp]
	call	x64_sgdt

; 180  : 	gdt_entry* thegdt = the_gdtr.gdtaddr; //curr_gdt.gdtaddr;

	mov	rax, QWORD PTR the_gdtr+2
	mov	QWORD PTR thegdt$[rsp], rax

; 181  : 	set_gdt_entry(thegdt[GDT_ENTRY_TSS], reinterpret_cast<uint64_t>(tss)& UINT32_MAX, sizeof(tss), GDT_ACCESS_PRESENT | 0x9, 0);

	lea	rax, QWORD PTR tss$[rsp]
	mov	ecx, -1					; ffffffffH
	and	rax, rcx
	mov	ecx, 8
	imul	rcx, rcx, 7
	mov	rdx, QWORD PTR thegdt$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	mov	BYTE PTR [rsp+32], 0
	mov	r9b, 137				; 00000089H
	mov	r8d, 112				; 00000070H
	mov	rdx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z	; set_gdt_entry

; 182  : 	*(uint64_t*)&thegdt[GDT_ENTRY_TSS + 1] = (reinterpret_cast<uint64_t>(tss) >> 32);

	lea	rax, QWORD PTR tss$[rsp]
	shr	rax, 32					; 00000020H
	mov	ecx, 8
	imul	rcx, rcx, 8
	mov	rdx, QWORD PTR thegdt$[rsp]
	mov	QWORD PTR [rdx+rcx], rax

; 183  : 	x64_ltr(SEGVAL(GDT_ENTRY_TSS, 0));

	mov	cx, 56					; 00000038H
	call	x64_ltr

; 184  : 
; 185  : 
; 186  : 	//IDTR *idtr = (IDTR*)0xFFFFD80000000000;
; 187  : 	idtr.idtaddr = the_idt;

	lea	rax, OFFSET FLAT:the_idt
	mov	QWORD PTR ?idtr@@3U_idtr@@A+2, rax

; 188  : 	idtr.length = 256 * sizeof(IDT)-1;

	mov	eax, 4095				; 00000fffH
	mov	WORD PTR ?idtr@@3U_idtr@@A, ax

; 189  : 	x64_lidt(&idtr);

	lea	rcx, OFFSET FLAT:?idtr@@3U_idtr@@A	; idtr
	call	x64_lidt

; 190  : 	for (int n = 0; n < 256; n++)

	mov	DWORD PTR n$1[rsp], 0
	jmp	SHORT $LN3@x86_64_idt
$LN2@x86_64_idt:
	mov	eax, DWORD PTR n$1[rsp]
	inc	eax
	mov	DWORD PTR n$1[rsp], eax
$LN3@x86_64_idt:
	cmp	DWORD PTR n$1[rsp], 256			; 00000100H
	jge	$LN1@x86_64_idt

; 191  : 	{
; 192  : 		the_idt[n].ist = 0;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	BYTE PTR [rcx+rax+4], 0

; 193  : 		the_idt[n].selector = SEGVAL(GDT_ENTRY_KERNEL_CODE, 0);

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	edx, 8
	mov	WORD PTR [rcx+rax+2], dx

; 194  : 		the_idt[n].zero = 0;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	DWORD PTR [rcx+rax+12], 0

; 195  : 		the_idt[n].type_attr = GDT_ACCESS_PRESENT | 0xE;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	BYTE PTR [rcx+rax+5], 142		; 0000008eH

; 196  : 		register_irq(&the_idt[n], default_irq_handlers[n]);

	movsxd	rax, DWORD PTR n$1[rsp]
	lea	rcx, OFFSET FLAT:default_irq_handlers
	movsxd	rdx, DWORD PTR n$1[rsp]
	imul	rdx, rdx, 16
	lea	r8, OFFSET FLAT:the_idt
	add	r8, rdx
	mov	rdx, r8
	mov	QWORD PTR tv166[rsp], rdx
	mov	rdx, QWORD PTR [rcx+rax*8]
	mov	rax, QWORD PTR tv166[rsp]
	mov	rcx, rax
	call	?register_irq@@YAXPEAU_idt@@PEAX@Z	; register_irq

; 197  : 	}

	jmp	$LN2@x86_64_idt
$LN1@x86_64_idt:

; 198  : 
; 199  : }

	add	rsp, 1288				; 00000508H
	ret	0
?x86_64_idt_initialize@@YAXXZ ENDP			; x86_64_idt_initialize
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
vect$ = 48
param$ = 56
?default_irq@@YAX_KPEAX@Z PROC				; default_irq

; 158  : void default_irq(size_t vect, void* param){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 159  : 	x64_cli();

	call	x64_cli

; 160  : 	printf("[aurora]: Default interrupt++\n");

	lea	rcx, OFFSET FLAT:$SG2959
	call	printf
$LN2@default_ir:

; 161  : 	for (;;);

	jmp	SHORT $LN2@default_ir

; 162  : }

	add	rsp, 40					; 00000028H
	ret	0
?default_irq@@YAX_KPEAX@Z ENDP				; default_irq
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
num$ = 48
frame$ = 56
interrupt_dispatcher PROC

; 150  : {

$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 151  : 	interrupts_handlers[num](num, frame);

	lea	rax, OFFSET FLAT:interrupts_handlers
	mov	rdx, QWORD PTR frame$[rsp]
	mov	rcx, QWORD PTR num$[rsp]
	mov	r8, QWORD PTR num$[rsp]
	call	QWORD PTR [rax+r8*8]

; 152  : 	return;
; 153  : }

	add	rsp, 40					; 00000028H
	ret	0
interrupt_dispatcher ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
faddr$ = 0
entry$ = 32
function$ = 40
?register_irq@@YAXPEAU_idt@@PEAX@Z PROC			; register_irq

; 137  : {

	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 138  : 	size_t faddr = (size_t)function;

	mov	rax, QWORD PTR function$[rsp]
	mov	QWORD PTR faddr$[rsp], rax

; 139  : 	entry->offset_1 = faddr & UINT16_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx], ax

; 140  : 	entry->offset_2 = (faddr >> 16) & UINT16_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	shr	rax, 16
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx+6], ax

; 141  : 	entry->offset_3 = (faddr >> 32) & UINT32_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	shr	rax, 32					; 00000020H
	mov	ecx, -1					; ffffffffH
	and	rax, rcx
	mov	rcx, QWORD PTR entry$[rsp]
	mov	DWORD PTR [rcx+8], eax

; 142  : }

	add	rsp, 24
	ret	0
?register_irq@@YAXPEAU_idt@@PEAX@Z ENDP			; register_irq
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
?x86_64_gdt_initialize@@YAXXZ PROC			; x86_64_gdt_initialize

; 118  : {

$LN3:
	sub	rsp, 40					; 00000028H

; 119  : 	x64_sgdt(&old_gdtr);

	lea	rcx, OFFSET FLAT:old_gdtr
	call	x64_sgdt

; 120  : 	save_sregs();

	call	?save_sregs@@YAXXZ			; save_sregs

; 121  : 	fill_gdt(gdt);

	lea	rcx, OFFSET FLAT:gdt
	call	?fill_gdt@@YAXPEAU_gdt@@@Z		; fill_gdt

; 122  : 	the_gdtr.gdtaddr = gdt;

	lea	rax, OFFSET FLAT:gdt
	mov	QWORD PTR the_gdtr+2, rax

; 123  : 	the_gdtr.size = GDT_ENTRIES * sizeof(gdt_entry)-1;

	mov	eax, 71					; 00000047H
	mov	WORD PTR the_gdtr, ax

; 124  : 	x64_lgdt(&the_gdtr);

	lea	rcx, OFFSET FLAT:the_gdtr
	call	x64_lgdt

; 125  : 	load_default_sregs();

	call	load_default_sregs

; 126  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_gdt_initialize@@YAXXZ ENDP			; x86_64_gdt_initialize
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
reg$1 = 32
?save_sregs@@YAXXZ PROC					; save_sregs

; 100  : {

$LN6:
	sub	rsp, 56					; 00000038H

; 101  : 	for (uint_fast8_t reg = 0; reg < 8; ++reg)

	mov	BYTE PTR reg$1[rsp], 0
	jmp	SHORT $LN3@save_sregs
$LN2@save_sregs:
	movzx	eax, BYTE PTR reg$1[rsp]
	inc	al
	mov	BYTE PTR reg$1[rsp], al
$LN3@save_sregs:
	movzx	eax, BYTE PTR reg$1[rsp]
	cmp	eax, 8
	jge	SHORT $LN1@save_sregs

; 102  : 		oldsregs[reg] = x64_get_segment_register(reg);

	movzx	eax, BYTE PTR reg$1[rsp]
	mov	ecx, eax
	call	x64_get_segment_register
	movzx	ecx, BYTE PTR reg$1[rsp]
	lea	rdx, OFFSET FLAT:oldsregs
	mov	WORD PTR [rdx+rcx*2], ax
	jmp	SHORT $LN2@save_sregs
$LN1@save_sregs:

; 103  : }

	add	rsp, 56					; 00000038H
	ret	0
?save_sregs@@YAXXZ ENDP					; save_sregs
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
thegdt$ = 64
?fill_gdt@@YAXPEAU_gdt@@@Z PROC				; fill_gdt

; 83   : {

	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 84   : 	set_gdt_entry(thegdt[GDT_ENTRY_NULL], 0, 0, 0, 0);    //0x00

	mov	eax, 8
	imul	rax, rax, 0
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	BYTE PTR [rsp+32], 0
	xor	r9d, r9d
	xor	r8d, r8d
	xor	edx, edx
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z	; set_gdt_entry

; 85   : 	//Kernel Code segment: STAR.SYSCALL_CS
; 86   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);  //0x08

	mov	eax, 8
	imul	rax, rax, 1
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 2
	mov	dl, 10
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 87   : 	//Kernel Data segment
; 88   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_DATA], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x10

	mov	eax, 8
	imul	rax, rax, 2
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 2
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 89   : 	//User Code segment (32 bit): STAR.SYSRET_CS
; 90   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x18

	mov	eax, 8
	imul	rax, rax, 3
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 91   : 	//User Data segment
; 92   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_DATA], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x20

	mov	eax, 8
	imul	rax, rax, 4
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 98					; 00000062H
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 93   : 	//User Code segment (64 bit)
; 94   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);   //0x28  | 3 -- 0x2B

	mov	eax, 8
	imul	rax, rax, 5
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 2
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 95   : 	//Kernel Code segment (32 bit)
; 96   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x30

	mov	eax, 8
	imul	rax, rax, 6
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 97   : }

	add	rsp, 56					; 00000038H
	ret	0
?fill_gdt@@YAXPEAU_gdt@@@Z ENDP				; fill_gdt
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
entry$ = 64
access$ = 72
flags$ = 80
?set_gdt_entry@@YAXAEAU_gdt@@EE@Z PROC			; set_gdt_entry

; 76   : {

	mov	BYTE PTR [rsp+24], r8b
	mov	BYTE PTR [rsp+16], dl
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 77   : 	access |= GDT_ACCESS_PRESENT | GDT_ACCESS_TYPE;

	movzx	eax, BYTE PTR access$[rsp]
	or	eax, 144				; 00000090H
	mov	BYTE PTR access$[rsp], al

; 78   : 	flags |= GDT_FLAG_GRAN;

	movzx	eax, BYTE PTR flags$[rsp]
	or	eax, 8
	mov	BYTE PTR flags$[rsp], al

; 79   : 	set_gdt_entry(entry, 0, SIZE_MAX, access, flags);

	movzx	eax, BYTE PTR flags$[rsp]
	mov	BYTE PTR [rsp+32], al
	movzx	r9d, BYTE PTR access$[rsp]
	mov	r8d, -1					; ffffffffH
	xor	edx, edx
	mov	rcx, QWORD PTR entry$[rsp]
	call	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z	; set_gdt_entry

; 80   : }

	add	rsp, 56					; 00000038H
	ret	0
?set_gdt_entry@@YAXAEAU_gdt@@EE@Z ENDP			; set_gdt_entry
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
entry$ = 8
base$ = 16
limit$ = 24
access$ = 32
flags$ = 40
?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z PROC		; set_gdt_entry

; 66   : {

	mov	BYTE PTR [rsp+32], r9b
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx

; 67   : 	entry.base_low = base & 0xFFFF;

	mov	rax, QWORD PTR base$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx+2], ax

; 68   : 	entry.base_mid = (base >> 16) & 0xFF;

	mov	rax, QWORD PTR base$[rsp]
	shr	rax, 16
	and	rax, 255				; 000000ffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+4], al

; 69   : 	entry.base_high = (base >> 24) & 0xFF;

	mov	rax, QWORD PTR base$[rsp]
	shr	rax, 24
	and	rax, 255				; 000000ffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+7], al

; 70   : 	entry.limit_low = limit & 0xFFFF;

	mov	rax, QWORD PTR limit$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx], ax

; 71   : 	entry.access = access;

	mov	rax, QWORD PTR entry$[rsp]
	movzx	ecx, BYTE PTR access$[rsp]
	mov	BYTE PTR [rax+5], cl

; 72   : 	entry.flags_limit = (flags << 4) | ((limit >> 16) & 0xF);

	movzx	eax, BYTE PTR flags$[rsp]
	shl	eax, 4
	cdqe
	mov	rcx, QWORD PTR limit$[rsp]
	shr	rcx, 16
	and	rcx, 15
	or	rax, rcx
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+6], al

; 73   : }

	ret	0
?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z ENDP		; set_gdt_entry
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
load_default_sregs PROC

; 106  : {

$LN3:
	sub	rsp, 40					; 00000028H

; 107  : 	x64_set_segment_register(SREG_CS, SEGVAL(GDT_ENTRY_KERNEL_CODE, 0));

	mov	dx, 8
	xor	ecx, ecx
	call	x64_set_segment_register

; 108  : 	x64_set_segment_register(SREG_DS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 1
	call	x64_set_segment_register

; 109  : 	x64_set_segment_register(SREG_ES, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 2
	call	x64_set_segment_register

; 110  : 	x64_set_segment_register(SREG_SS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 5
	call	x64_set_segment_register

; 111  : 	//Per CPU data
; 112  : 	x64_set_segment_register(SREG_FS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 3
	call	x64_set_segment_register

; 113  : 	x64_set_segment_register(SREG_GS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 4
	call	x64_set_segment_register

; 114  : }

	add	rsp, 40					; 00000028H
	ret	0
load_default_sregs ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
vector$ = 8
function$ = 16
setvect	PROC

; 145  : {

	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx

; 146  : 	interrupts_handlers[vector] = function;

	lea	rax, OFFSET FLAT:interrupts_handlers
	mov	rcx, QWORD PTR vector$[rsp]
	mov	rdx, QWORD PTR function$[rsp]
	mov	QWORD PTR [rax+rcx*8], rdx

; 147  : };

	ret	0
setvect	ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
c$ = 48
b$ = 56
d$ = 64
a$ = 72
vendor$ = 80
bandstring$ = 96
maxcpuid$ = 152
x86_64_cpu_print_brand PROC

; 250  : void x86_64_cpu_print_brand() {

$LN3:
	sub	rsp, 168				; 000000a8H

; 251  : 	size_t maxcpuid, a, b, c, d;
; 252  : 	x64_cpuid(0, &maxcpuid, &b, &c, &d);

	mov	QWORD PTR [rsp+40], 0
	lea	rax, QWORD PTR d$[rsp]
	mov	QWORD PTR [rsp+32], rax
	lea	r9, QWORD PTR c$[rsp]
	lea	r8, QWORD PTR b$[rsp]
	lea	rdx, QWORD PTR maxcpuid$[rsp]
	xor	ecx, ecx
	call	x64_cpuid

; 253  : 	char vendor[13];
; 254  : 	*(uint32_t*)&vendor[0] = b;

	mov	eax, 1
	imul	rax, rax, 0
	mov	ecx, DWORD PTR b$[rsp]
	mov	DWORD PTR vendor$[rsp+rax], ecx

; 255  : 	*(uint32_t*)&vendor[4] = d;

	mov	eax, 1
	imul	rax, rax, 4
	mov	ecx, DWORD PTR d$[rsp]
	mov	DWORD PTR vendor$[rsp+rax], ecx

; 256  : 	*(uint32_t*)&vendor[8] = c;

	mov	eax, 1
	imul	rax, rax, 8
	mov	ecx, DWORD PTR c$[rsp]
	mov	DWORD PTR vendor$[rsp+rax], ecx

; 257  : 	vendor[12] = 0;

	mov	eax, 1
	imul	rax, rax, 12
	mov	BYTE PTR vendor$[rsp+rax], 0

; 258  : 	au_get_boot_info()->auprint("CPU: Vendor -> %s \n", vendor);

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	lea	rdx, QWORD PTR vendor$[rsp]
	lea	rcx, OFFSET FLAT:$SG3016
	call	QWORD PTR [rax+90]

; 259  : 
; 260  : 	char bandstring[49];
; 261  : 	x64_cpuid(0x80000002, &a, &b, &c, &d);

	mov	QWORD PTR [rsp+40], 0
	lea	rax, QWORD PTR d$[rsp]
	mov	QWORD PTR [rsp+32], rax
	lea	r9, QWORD PTR c$[rsp]
	lea	r8, QWORD PTR b$[rsp]
	lea	rdx, QWORD PTR a$[rsp]
	mov	ecx, -2147483646			; 80000002H
	call	x64_cpuid

; 262  : 	*(uint32_t*)&bandstring[0] = a;

	mov	eax, 1
	imul	rax, rax, 0
	mov	ecx, DWORD PTR a$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 263  : 	*(uint32_t*)&bandstring[4] = b;

	mov	eax, 1
	imul	rax, rax, 4
	mov	ecx, DWORD PTR b$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 264  : 	*(uint32_t*)&bandstring[8] = c;

	mov	eax, 1
	imul	rax, rax, 8
	mov	ecx, DWORD PTR c$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 265  : 	*(uint32_t*)&bandstring[12] = d;

	mov	eax, 1
	imul	rax, rax, 12
	mov	ecx, DWORD PTR d$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 266  : 	x64_cpuid(0x80000003, &a, &b, &c, &d);

	mov	QWORD PTR [rsp+40], 0
	lea	rax, QWORD PTR d$[rsp]
	mov	QWORD PTR [rsp+32], rax
	lea	r9, QWORD PTR c$[rsp]
	lea	r8, QWORD PTR b$[rsp]
	lea	rdx, QWORD PTR a$[rsp]
	mov	ecx, -2147483645			; 80000003H
	call	x64_cpuid

; 267  : 	*(uint32_t*)&bandstring[16] = a;

	mov	eax, 1
	imul	rax, rax, 16
	mov	ecx, DWORD PTR a$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 268  : 	*(uint32_t*)&bandstring[20] = b;

	mov	eax, 1
	imul	rax, rax, 20
	mov	ecx, DWORD PTR b$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 269  : 	*(uint32_t*)&bandstring[24] = c;

	mov	eax, 1
	imul	rax, rax, 24
	mov	ecx, DWORD PTR c$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 270  : 	*(uint32_t*)&bandstring[28] = d;

	mov	eax, 1
	imul	rax, rax, 28
	mov	ecx, DWORD PTR d$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 271  : 	x64_cpuid(0x80000004, &a, &b, &c, &d);

	mov	QWORD PTR [rsp+40], 0
	lea	rax, QWORD PTR d$[rsp]
	mov	QWORD PTR [rsp+32], rax
	lea	r9, QWORD PTR c$[rsp]
	lea	r8, QWORD PTR b$[rsp]
	lea	rdx, QWORD PTR a$[rsp]
	mov	ecx, -2147483644			; 80000004H
	call	x64_cpuid

; 272  : 	*(uint32_t*)&bandstring[32] = a;

	mov	eax, 1
	imul	rax, rax, 32				; 00000020H
	mov	ecx, DWORD PTR a$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 273  : 	*(uint32_t*)&bandstring[36] = b;

	mov	eax, 1
	imul	rax, rax, 36				; 00000024H
	mov	ecx, DWORD PTR b$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 274  : 	*(uint32_t*)&bandstring[40] = c;

	mov	eax, 1
	imul	rax, rax, 40				; 00000028H
	mov	ecx, DWORD PTR c$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 275  : 	*(uint32_t*)&bandstring[44] = d;

	mov	eax, 1
	imul	rax, rax, 44				; 0000002cH
	mov	ecx, DWORD PTR d$[rsp]
	mov	DWORD PTR bandstring$[rsp+rax], ecx

; 276  : 	bandstring[48] = 0;

	mov	eax, 1
	imul	rax, rax, 48				; 00000030H
	mov	BYTE PTR bandstring$[rsp+rax], 0

; 277  : 	au_get_boot_info()->auprint("CPU: Brand = %s \n", bandstring);

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	lea	rdx, QWORD PTR bandstring$[rsp]
	lea	rcx, OFFSET FLAT:$SG3030
	call	QWORD PTR [rax+90]

; 278  : }

	add	rsp, 168				; 000000a8H
	ret	0
x86_64_cpu_print_brand ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
efer$ = 32
?x86_64_cpu_initialize@@YAXXZ PROC			; x86_64_cpu_initialize

; 282  : void x86_64_cpu_initialize() {

$LN3:
	sub	rsp, 56					; 00000038H

; 283  : 	x64_cli();

	call	x64_cli

; 284  : 
; 285  : 	x86_64_gdt_initialize();

	call	?x86_64_gdt_initialize@@YAXXZ		; x86_64_gdt_initialize

; 286  : 	x86_64_idt_initialize();

	call	?x86_64_idt_initialize@@YAXXZ		; x86_64_idt_initialize

; 287  : 	x86_64_exception_init();

	call	?x86_64_exception_init@@YAXXZ		; x86_64_exception_init

; 288  : 	x86_64_cpu_feature_enable();

	call	?x86_64_cpu_feature_enable@@YAXXZ	; x86_64_cpu_feature_enable

; 289  : 
; 290  : 
; 291  : 	/* Enable SYSCALL extension */
; 292  : 	size_t efer = x64_read_msr(IA32_EFER);

	mov	ecx, -1073741696			; c0000080H
	call	x64_read_msr
	mov	QWORD PTR efer$[rsp], rax

; 293  : 	efer |= (1 << 11);

	mov	rax, QWORD PTR efer$[rsp]
	bts	rax, 11
	mov	QWORD PTR efer$[rsp], rax

; 294  : 	efer |= 1;

	mov	rax, QWORD PTR efer$[rsp]
	or	rax, 1
	mov	QWORD PTR efer$[rsp], rax

; 295  : 	efer |= (1 << 0);

	mov	rax, QWORD PTR efer$[rsp]
	or	rax, 1
	mov	QWORD PTR efer$[rsp], rax

; 296  : 	efer |= 1;

	mov	rax, QWORD PTR efer$[rsp]
	or	rax, 1
	mov	QWORD PTR efer$[rsp], rax

; 297  : 	x64_write_msr(IA32_EFER, efer);

	mov	rdx, QWORD PTR efer$[rsp]
	mov	ecx, -1073741696			; c0000080H
	call	x64_write_msr

; 298  : 	x64_sti();

	call	x64_sti

; 299  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_cpu_initialize@@YAXXZ ENDP			; x86_64_cpu_initialize
_TEXT	ENDS
END
