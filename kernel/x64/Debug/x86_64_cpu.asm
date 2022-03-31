; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?idtr@@3U_idtr@@A				; idtr
_BSS	SEGMENT
?idtr@@3U_idtr@@A DB 0aH DUP (?)			; idtr
_BSS	ENDS
CONST	SEGMENT
$SG2846	DB	'[aurora]: Default interrupt++', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_cpu_initialize@@YAXXZ			; x86_64_cpu_initialize
PUBLIC	?setvect@@YAX_KP6AX0PEAX@Z@Z			; setvect
PUBLIC	load_default_sregs
PUBLIC	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z		; set_gdt_entry
PUBLIC	?save_sregs@@YAXXZ				; save_sregs
PUBLIC	?x86_64_gdt_initialize@@YAXXZ			; x86_64_gdt_initialize
PUBLIC	interrupt_dispatcher
PUBLIC	?default_irq@@YAX_KPEAX@Z			; default_irq
PUBLIC	?x86_64_idt_initialize@@YAXXZ			; x86_64_idt_initialize
EXTRN	x64_cli:PROC
EXTRN	x64_sti:PROC
EXTRN	x64_lgdt:PROC
EXTRN	x64_sgdt:PROC
EXTRN	?printf@@YAXPEBDZZ:PROC				; printf
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
	DD	imagerel $LN3+34
	DD	imagerel $unwind$?x86_64_cpu_initialize@@YAXXZ
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
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_cpu_initialize@@YAXXZ DD 010401H
	DD	04204H
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
xdata	ENDS
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

; 163  : void x86_64_idt_initialize() {

$LN12:
	sub	rsp, 1288				; 00000508H

; 164  : 
; 165  : 
; 166  : 	void* m_ist[4];
; 167  : 	uint32_t tss[28];
; 168  : 	for (int i = 0; i < 28; i++) tss[i] = 0xffffffff;

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

; 169  : 	for (int i = 0; i < 1; i++)

	mov	DWORD PTR i$2[rsp], 0
	jmp	SHORT $LN6@x86_64_idt
$LN5@x86_64_idt:
	mov	eax, DWORD PTR i$2[rsp]
	inc	eax
	mov	DWORD PTR i$2[rsp], eax
$LN6@x86_64_idt:
	cmp	DWORD PTR i$2[rsp], 1
	jge	SHORT $LN4@x86_64_idt

; 170  : 	{
; 171  : 		uint8_t bos[1024];
; 172  : 		m_ist[i] = bos + 1024;

	lea	rax, QWORD PTR bos$4[rsp+1024]
	movsxd	rcx, DWORD PTR i$2[rsp]
	mov	QWORD PTR m_ist$[rsp+rcx*8], rax

; 173  : 		tss[9 + i * 2] = reinterpret_cast<uint64_t>(m_ist[i]) & 0xffffffff;

	movsxd	rax, DWORD PTR i$2[rsp]
	mov	ecx, -1					; ffffffffH
	mov	rax, QWORD PTR m_ist$[rsp+rax*8]
	and	rax, rcx
	mov	ecx, DWORD PTR i$2[rsp]
	lea	ecx, DWORD PTR [rcx+rcx+9]
	movsxd	rcx, ecx
	mov	DWORD PTR tss$[rsp+rcx*4], eax

; 174  : 		tss[9 + i * 2 + 1] = reinterpret_cast<uint64_t>(m_ist[i]) >> 32;

	movsxd	rax, DWORD PTR i$2[rsp]
	mov	rax, QWORD PTR m_ist$[rsp+rax*8]
	shr	rax, 32					; 00000020H
	mov	ecx, DWORD PTR i$2[rsp]
	lea	ecx, DWORD PTR [rcx+rcx+10]
	movsxd	rcx, ecx
	mov	DWORD PTR tss$[rsp+rcx*4], eax

; 175  : 	}

	jmp	SHORT $LN5@x86_64_idt
$LN4@x86_64_idt:

; 176  : 	gdtr curr_gdt;
; 177  : 	x64_sgdt(&curr_gdt);

	lea	rcx, QWORD PTR curr_gdt$[rsp]
	call	x64_sgdt

; 178  : 	gdt_entry* thegdt = the_gdtr.gdtaddr; //curr_gdt.gdtaddr;

	mov	rax, QWORD PTR the_gdtr+2
	mov	QWORD PTR thegdt$[rsp], rax

; 179  : 	set_gdt_entry(thegdt[GDT_ENTRY_TSS], reinterpret_cast<uint64_t>(tss)& UINT32_MAX, sizeof(tss), GDT_ACCESS_PRESENT | 0x9, 0);

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

; 180  : 	*(uint64_t*)&thegdt[GDT_ENTRY_TSS + 1] = (reinterpret_cast<uint64_t>(tss) >> 32);

	lea	rax, QWORD PTR tss$[rsp]
	shr	rax, 32					; 00000020H
	mov	ecx, 8
	imul	rcx, rcx, 8
	mov	rdx, QWORD PTR thegdt$[rsp]
	mov	QWORD PTR [rdx+rcx], rax

; 181  : 	x64_ltr(SEGVAL(GDT_ENTRY_TSS, 0));

	mov	cx, 56					; 00000038H
	call	x64_ltr

; 182  : 
; 183  : 
; 184  : 	//IDTR *idtr = (IDTR*)0xFFFFD80000000000;
; 185  : 	idtr.idtaddr = the_idt;

	lea	rax, OFFSET FLAT:the_idt
	mov	QWORD PTR ?idtr@@3U_idtr@@A+2, rax

; 186  : 	idtr.length = 256 * sizeof(IDT)-1;

	mov	eax, 4095				; 00000fffH
	mov	WORD PTR ?idtr@@3U_idtr@@A, ax

; 187  : 	x64_lidt(&idtr);

	lea	rcx, OFFSET FLAT:?idtr@@3U_idtr@@A	; idtr
	call	x64_lidt

; 188  : 	for (int n = 0; n < 256; n++)

	mov	DWORD PTR n$1[rsp], 0
	jmp	SHORT $LN3@x86_64_idt
$LN2@x86_64_idt:
	mov	eax, DWORD PTR n$1[rsp]
	inc	eax
	mov	DWORD PTR n$1[rsp], eax
$LN3@x86_64_idt:
	cmp	DWORD PTR n$1[rsp], 256			; 00000100H
	jge	$LN1@x86_64_idt

; 189  : 	{
; 190  : 		the_idt[n].ist = 0;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	BYTE PTR [rcx+rax+4], 0

; 191  : 		the_idt[n].selector = SEGVAL(GDT_ENTRY_KERNEL_CODE, 0);

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	edx, 8
	mov	WORD PTR [rcx+rax+2], dx

; 192  : 		the_idt[n].zero = 0;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	DWORD PTR [rcx+rax+12], 0

; 193  : 		the_idt[n].type_attr = GDT_ACCESS_PRESENT | 0xE;

	movsxd	rax, DWORD PTR n$1[rsp]
	imul	rax, rax, 16
	lea	rcx, OFFSET FLAT:the_idt
	mov	BYTE PTR [rcx+rax+5], 142		; 0000008eH

; 194  : 		register_irq(&the_idt[n], default_irq_handlers[n]);

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

; 195  : 	}

	jmp	$LN2@x86_64_idt
$LN1@x86_64_idt:

; 196  : 
; 197  : }

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

; 156  : void default_irq(size_t vect, void* param){

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 157  : 	x64_cli();

	call	x64_cli

; 158  : 	printf("[aurora]: Default interrupt++\n");

	lea	rcx, OFFSET FLAT:$SG2846
	call	?printf@@YAXPEBDZZ			; printf
$LN2@default_ir:

; 159  : 	for (;;);

	jmp	SHORT $LN2@default_ir

; 160  : }

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

; 148  : {

$LN3:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 149  : 	interrupts_handlers[num](num, frame);

	lea	rax, OFFSET FLAT:interrupts_handlers
	mov	rdx, QWORD PTR frame$[rsp]
	mov	rcx, QWORD PTR num$[rsp]
	mov	r8, QWORD PTR num$[rsp]
	call	QWORD PTR [rax+r8*8]

; 150  : 	return;
; 151  : }

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

; 135  : {

	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 136  : 	size_t faddr = (size_t)function;

	mov	rax, QWORD PTR function$[rsp]
	mov	QWORD PTR faddr$[rsp], rax

; 137  : 	entry->offset_1 = faddr & UINT16_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx], ax

; 138  : 	entry->offset_2 = (faddr >> 16) & UINT16_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	shr	rax, 16
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx+6], ax

; 139  : 	entry->offset_3 = (faddr >> 32) & UINT32_MAX;

	mov	rax, QWORD PTR faddr$[rsp]
	shr	rax, 32					; 00000020H
	mov	ecx, -1					; ffffffffH
	and	rax, rcx
	mov	rcx, QWORD PTR entry$[rsp]
	mov	DWORD PTR [rcx+8], eax

; 140  : }

	add	rsp, 24
	ret	0
?register_irq@@YAXPEAU_idt@@PEAX@Z ENDP			; register_irq
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
?x86_64_gdt_initialize@@YAXXZ PROC			; x86_64_gdt_initialize

; 116  : {

$LN3:
	sub	rsp, 40					; 00000028H

; 117  : 	x64_sgdt(&old_gdtr);

	lea	rcx, OFFSET FLAT:old_gdtr
	call	x64_sgdt

; 118  : 	save_sregs();

	call	?save_sregs@@YAXXZ			; save_sregs

; 119  : 	fill_gdt(gdt);

	lea	rcx, OFFSET FLAT:gdt
	call	?fill_gdt@@YAXPEAU_gdt@@@Z		; fill_gdt

; 120  : 	the_gdtr.gdtaddr = gdt;

	lea	rax, OFFSET FLAT:gdt
	mov	QWORD PTR the_gdtr+2, rax

; 121  : 	the_gdtr.size = GDT_ENTRIES * sizeof(gdt_entry)-1;

	mov	eax, 71					; 00000047H
	mov	WORD PTR the_gdtr, ax

; 122  : 	x64_lgdt(&the_gdtr);

	lea	rcx, OFFSET FLAT:the_gdtr
	call	x64_lgdt

; 123  : 	load_default_sregs();

	call	load_default_sregs

; 124  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_gdt_initialize@@YAXXZ ENDP			; x86_64_gdt_initialize
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
reg$1 = 32
?save_sregs@@YAXXZ PROC					; save_sregs

; 98   : {

$LN6:
	sub	rsp, 56					; 00000038H

; 99   : 	for (uint_fast8_t reg = 0; reg < 8; ++reg)

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

; 100  : 		oldsregs[reg] = x64_get_segment_register(reg);

	movzx	eax, BYTE PTR reg$1[rsp]
	mov	ecx, eax
	call	x64_get_segment_register
	movzx	ecx, BYTE PTR reg$1[rsp]
	lea	rdx, OFFSET FLAT:oldsregs
	mov	WORD PTR [rdx+rcx*2], ax
	jmp	SHORT $LN2@save_sregs
$LN1@save_sregs:

; 101  : }

	add	rsp, 56					; 00000038H
	ret	0
?save_sregs@@YAXXZ ENDP					; save_sregs
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
thegdt$ = 64
?fill_gdt@@YAXPEAU_gdt@@@Z PROC				; fill_gdt

; 81   : {

	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 82   : 	set_gdt_entry(thegdt[GDT_ENTRY_NULL], 0, 0, 0, 0);    //0x00

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

; 83   : 	//Kernel Code segment: STAR.SYSCALL_CS
; 84   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);  //0x08

	mov	eax, 8
	imul	rax, rax, 1
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 2
	mov	dl, 10
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 85   : 	//Kernel Data segment
; 86   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_DATA], GDT_ACCESS_PRIVL(0) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x10

	mov	eax, 8
	imul	rax, rax, 2
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 2
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 87   : 	//User Code segment (32 bit): STAR.SYSRET_CS
; 88   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x18

	mov	eax, 8
	imul	rax, rax, 3
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 89   : 	//User Data segment
; 90   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_DATA], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW, GDT_FLAG_32BT);    //0x20

	mov	eax, 8
	imul	rax, rax, 4
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 98					; 00000062H
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 91   : 	//User Code segment (64 bit)
; 92   : 	set_gdt_entry(thegdt[GDT_ENTRY_USER_CODE], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_64BT);   //0x28  | 3 -- 0x2B

	mov	eax, 8
	imul	rax, rax, 5
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 2
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 93   : 	//Kernel Code segment (32 bit)
; 94   : 	set_gdt_entry(thegdt[GDT_ENTRY_KERNEL_CODE32], GDT_ACCESS_PRIVL(3) | GDT_ACCESS_RW | GDT_ACCESS_EX, GDT_FLAG_32BT);  //0x30

	mov	eax, 8
	imul	rax, rax, 6
	mov	rcx, QWORD PTR thegdt$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	r8b, 4
	mov	dl, 106					; 0000006aH
	mov	rcx, rax
	call	?set_gdt_entry@@YAXAEAU_gdt@@EE@Z	; set_gdt_entry

; 95   : }

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

; 74   : {

	mov	BYTE PTR [rsp+24], r8b
	mov	BYTE PTR [rsp+16], dl
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 75   : 	access |= GDT_ACCESS_PRESENT | GDT_ACCESS_TYPE;

	movzx	eax, BYTE PTR access$[rsp]
	or	eax, 144				; 00000090H
	mov	BYTE PTR access$[rsp], al

; 76   : 	flags |= GDT_FLAG_GRAN;

	movzx	eax, BYTE PTR flags$[rsp]
	or	eax, 8
	mov	BYTE PTR flags$[rsp], al

; 77   : 	set_gdt_entry(entry, 0, SIZE_MAX, access, flags);

	movzx	eax, BYTE PTR flags$[rsp]
	mov	BYTE PTR [rsp+32], al
	movzx	r9d, BYTE PTR access$[rsp]
	mov	r8d, -1					; ffffffffH
	xor	edx, edx
	mov	rcx, QWORD PTR entry$[rsp]
	call	?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z	; set_gdt_entry

; 78   : }

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

; 64   : {

	mov	BYTE PTR [rsp+32], r9b
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx

; 65   : 	entry.base_low = base & 0xFFFF;

	mov	rax, QWORD PTR base$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx+2], ax

; 66   : 	entry.base_mid = (base >> 16) & 0xFF;

	mov	rax, QWORD PTR base$[rsp]
	shr	rax, 16
	and	rax, 255				; 000000ffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+4], al

; 67   : 	entry.base_high = (base >> 24) & 0xFF;

	mov	rax, QWORD PTR base$[rsp]
	shr	rax, 24
	and	rax, 255				; 000000ffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+7], al

; 68   : 	entry.limit_low = limit & 0xFFFF;

	mov	rax, QWORD PTR limit$[rsp]
	and	rax, 65535				; 0000ffffH
	mov	rcx, QWORD PTR entry$[rsp]
	mov	WORD PTR [rcx], ax

; 69   : 	entry.access = access;

	mov	rax, QWORD PTR entry$[rsp]
	movzx	ecx, BYTE PTR access$[rsp]
	mov	BYTE PTR [rax+5], cl

; 70   : 	entry.flags_limit = (flags << 4) | ((limit >> 16) & 0xF);

	movzx	eax, BYTE PTR flags$[rsp]
	shl	eax, 4
	cdqe
	mov	rcx, QWORD PTR limit$[rsp]
	shr	rcx, 16
	and	rcx, 15
	or	rax, rcx
	mov	rcx, QWORD PTR entry$[rsp]
	mov	BYTE PTR [rcx+6], al

; 71   : }

	ret	0
?set_gdt_entry@@YAXAEAU_gdt@@_K1EE@Z ENDP		; set_gdt_entry
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
load_default_sregs PROC

; 104  : {

$LN3:
	sub	rsp, 40					; 00000028H

; 105  : 	x64_set_segment_register(SREG_CS, SEGVAL(GDT_ENTRY_KERNEL_CODE, 0));

	mov	dx, 8
	xor	ecx, ecx
	call	x64_set_segment_register

; 106  : 	x64_set_segment_register(SREG_DS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 1
	call	x64_set_segment_register

; 107  : 	x64_set_segment_register(SREG_ES, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 2
	call	x64_set_segment_register

; 108  : 	x64_set_segment_register(SREG_SS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 5
	call	x64_set_segment_register

; 109  : 	//Per CPU data
; 110  : 	x64_set_segment_register(SREG_FS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 3
	call	x64_set_segment_register

; 111  : 	x64_set_segment_register(SREG_GS, SEGVAL(GDT_ENTRY_KERNEL_DATA, 0));

	mov	dx, 16
	mov	ecx, 4
	call	x64_set_segment_register

; 112  : }

	add	rsp, 40					; 00000028H
	ret	0
load_default_sregs ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
vector$ = 8
function$ = 16
?setvect@@YAX_KP6AX0PEAX@Z@Z PROC			; setvect

; 143  : {

	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx

; 144  : 	interrupts_handlers[vector] = function;

	lea	rax, OFFSET FLAT:interrupts_handlers
	mov	rcx, QWORD PTR vector$[rsp]
	mov	rdx, QWORD PTR function$[rsp]
	mov	QWORD PTR [rax+rcx*8], rdx

; 145  : };

	ret	0
?setvect@@YAX_KP6AX0PEAX@Z@Z ENDP			; setvect
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_cpu.cpp
_TEXT	SEGMENT
?x86_64_cpu_initialize@@YAXXZ PROC			; x86_64_cpu_initialize

; 203  : void x86_64_cpu_initialize() {

$LN3:
	sub	rsp, 40					; 00000028H

; 204  : 	x64_cli();

	call	x64_cli

; 205  : 	x86_64_gdt_initialize();

	call	?x86_64_gdt_initialize@@YAXXZ		; x86_64_gdt_initialize

; 206  : 	x86_64_idt_initialize();

	call	?x86_64_idt_initialize@@YAXXZ		; x86_64_idt_initialize

; 207  : 	x86_64_exception_init();

	call	?x86_64_exception_init@@YAXXZ		; x86_64_exception_init

; 208  : 	x64_sti();

	call	x64_sti

; 209  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_cpu_initialize@@YAXXZ ENDP			; x86_64_cpu_initialize
_TEXT	ENDS
END
