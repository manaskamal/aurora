; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG2552	DB	'0123456789ABCDEF', 00H
CONST	ENDS
_DATA	SEGMENT
chars	DQ	FLAT:$SG2552
_DATA	ENDS
PUBLIC	?sztoa@@YAPEAD_KPEADH@Z				; sztoa
pdata	SEGMENT
$pdata$?sztoa@@YAPEAD_KPEADH@Z DD imagerel $LN11
	DD	imagerel $LN11+275
	DD	imagerel $unwind$?sztoa@@YAPEAD_KPEADH@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?sztoa@@YAPEAD_KPEADH@Z DD 011301H
	DD	04213H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\stdlib.cpp
_TEXT	SEGMENT
tmp$1 = 0
i$ = 4
z$2 = 8
tv67 = 16
tv74 = 24
value$ = 48
str$ = 56
base$ = 64
?sztoa@@YAPEAD_KPEADH@Z PROC				; sztoa

; 35   : {

$LN11:
	mov	DWORD PTR [rsp+24], r8d
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 36   : 	if (base < 2 || base > 16)

	cmp	DWORD PTR base$[rsp], 2
	jl	SHORT $LN7@sztoa
	cmp	DWORD PTR base$[rsp], 16
	jle	SHORT $LN8@sztoa
$LN7@sztoa:

; 37   : 		return nullptr;

	xor	eax, eax
	jmp	$LN9@sztoa
$LN8@sztoa:

; 38   : 	unsigned int i = 0;

	mov	DWORD PTR i$[rsp], 0
$LN6@sztoa:

; 39   : 	do
; 40   : 	{
; 41   : 		str[++i] = chars[value%base];

	mov	eax, DWORD PTR i$[rsp]
	inc	eax
	mov	DWORD PTR i$[rsp], eax
	mov	eax, DWORD PTR i$[rsp]
	mov	QWORD PTR tv67[rsp], rax
	movsxd	rcx, DWORD PTR base$[rsp]
	xor	edx, edx
	mov	rax, QWORD PTR value$[rsp]
	div	rcx
	mov	rax, rdx
	mov	rcx, QWORD PTR str$[rsp]
	mov	rdx, QWORD PTR chars
	movzx	eax, BYTE PTR [rdx+rax]
	mov	rdx, QWORD PTR tv67[rsp]
	mov	BYTE PTR [rcx+rdx], al

; 42   : 		value /= base;

	movsxd	rax, DWORD PTR base$[rsp]
	mov	QWORD PTR tv74[rsp], rax
	xor	edx, edx
	mov	rax, QWORD PTR value$[rsp]
	mov	rcx, QWORD PTR tv74[rsp]
	div	rcx
	mov	QWORD PTR value$[rsp], rax

; 43   : 	} while (value != 0);

	cmp	QWORD PTR value$[rsp], 0
	jne	SHORT $LN6@sztoa

; 44   : 	str[0] = '\0';

	mov	eax, 1
	imul	rax, rax, 0
	mov	rcx, QWORD PTR str$[rsp]
	mov	BYTE PTR [rcx+rax], 0

; 45   : 	for (unsigned int z = 0; z < i; ++z, --i)

	mov	DWORD PTR z$2[rsp], 0
	jmp	SHORT $LN3@sztoa
$LN2@sztoa:
	mov	eax, DWORD PTR z$2[rsp]
	inc	eax
	mov	DWORD PTR z$2[rsp], eax
	mov	eax, DWORD PTR i$[rsp]
	dec	eax
	mov	DWORD PTR i$[rsp], eax
$LN3@sztoa:
	mov	eax, DWORD PTR i$[rsp]
	cmp	DWORD PTR z$2[rsp], eax
	jae	SHORT $LN1@sztoa

; 46   : 	{
; 47   : 		char tmp = str[z];

	mov	eax, DWORD PTR z$2[rsp]
	mov	rcx, QWORD PTR str$[rsp]
	movzx	eax, BYTE PTR [rcx+rax]
	mov	BYTE PTR tmp$1[rsp], al

; 48   : 		str[z] = str[i];

	mov	eax, DWORD PTR i$[rsp]
	mov	ecx, DWORD PTR z$2[rsp]
	mov	rdx, QWORD PTR str$[rsp]
	mov	r8, QWORD PTR str$[rsp]
	movzx	eax, BYTE PTR [r8+rax]
	mov	BYTE PTR [rdx+rcx], al

; 49   : 		str[i] = tmp;

	mov	eax, DWORD PTR i$[rsp]
	mov	rcx, QWORD PTR str$[rsp]
	movzx	edx, BYTE PTR tmp$1[rsp]
	mov	BYTE PTR [rcx+rax], dl

; 50   : 	}

	jmp	SHORT $LN2@sztoa
$LN1@sztoa:

; 51   : 	return str;

	mov	rax, QWORD PTR str$[rsp]
$LN9@sztoa:

; 52   : }

	add	rsp, 40					; 00000028H
	ret	0
?sztoa@@YAPEAD_KPEADH@Z ENDP				; sztoa
_TEXT	ENDS
END