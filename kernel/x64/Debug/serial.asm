; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_BSS	SEGMENT
_serial_initialized_ DB 01H DUP (?)
	ALIGN	8

serial_lock DQ	01H DUP (?)
_BSS	ENDS
CONST	SEGMENT
$SG2975	DB	'.', 00H
CONST	ENDS
PUBLIC	?au_initialize_serial@@YAHXZ			; au_initialize_serial
PUBLIC	?_au_debug_print_@@YAXPEADZZ			; _au_debug_print_
PUBLIC	?is_transmit_empty@@YAHXZ			; is_transmit_empty
PUBLIC	?write_serial@@YAXD@Z				; write_serial
PUBLIC	?debug_serial@@YAXPEAD@Z			; debug_serial
PUBLIC	?is_serial_initialized@@YA_NXZ			; is_serial_initialized
EXTRN	?strlen@@YA_KPEBD@Z:PROC			; strlen
EXTRN	x64_inportb:PROC
EXTRN	x64_outportb:PROC
EXTRN	x64_lock_acquire:PROC
EXTRN	x86_64_phys_to_virt:PROC
EXTRN	?sztoa@@YAPEAD_KPEADH@Z:PROC			; sztoa
pdata	SEGMENT
$pdata$?au_initialize_serial@@YAHXZ DD imagerel $LN3
	DD	imagerel $LN3+158
	DD	imagerel $unwind$?au_initialize_serial@@YAHXZ
$pdata$?_au_debug_print_@@YAXPEADZZ DD imagerel $LN25
	DD	imagerel $LN25+826
	DD	imagerel $unwind$?_au_debug_print_@@YAXPEADZZ
$pdata$?is_transmit_empty@@YAHXZ DD imagerel $LN3
	DD	imagerel $LN3+33
	DD	imagerel $unwind$?is_transmit_empty@@YAHXZ
$pdata$?write_serial@@YAXD@Z DD imagerel $LN5
	DD	imagerel $LN5+47
	DD	imagerel $unwind$?write_serial@@YAXD@Z
$pdata$?debug_serial@@YAXPEAD@Z DD imagerel $LN6
	DD	imagerel $LN6+85
	DD	imagerel $unwind$?debug_serial@@YAXPEAD@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?au_initialize_serial@@YAHXZ DD 010401H
	DD	04204H
$unwind$?_au_debug_print_@@YAXPEADZZ DD 021b01H
	DD	023011bH
$unwind$?is_transmit_empty@@YAHXZ DD 010401H
	DD	04204H
$unwind$?write_serial@@YAXD@Z DD 010801H
	DD	04208H
$unwind$?debug_serial@@YAXPEAD@Z DD 010901H
	DD	06209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
?is_serial_initialized@@YA_NXZ PROC			; is_serial_initialized

; 159  : 	return _serial_initialized_;

	movzx	eax, BYTE PTR _serial_initialized_

; 160  : }

	ret	0
?is_serial_initialized@@YA_NXZ ENDP			; is_serial_initialized
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
i$1 = 32
tv65 = 40
string$ = 64
?debug_serial@@YAXPEAD@Z PROC				; debug_serial

; 66   : void debug_serial(char* string) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 67   : 	for (int i = 0; i < strlen(string); i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@debug_seri
$LN2@debug_seri:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@debug_seri:
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	QWORD PTR tv65[rsp], rax
	mov	rcx, QWORD PTR string$[rsp]
	call	?strlen@@YA_KPEBD@Z			; strlen
	mov	rcx, QWORD PTR tv65[rsp]
	cmp	rcx, rax
	jae	SHORT $LN1@debug_seri

; 68   : 		write_serial(string[i]);

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR string$[rsp]
	movzx	ecx, BYTE PTR [rcx+rax]
	call	?write_serial@@YAXD@Z			; write_serial
	jmp	SHORT $LN2@debug_seri
$LN1@debug_seri:

; 69   : }

	add	rsp, 56					; 00000038H
	ret	0
?debug_serial@@YAXPEAD@Z ENDP				; debug_serial
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
a$ = 48
?write_serial@@YAXD@Z PROC				; write_serial

; 61   : void write_serial(char a) {

$LN5:
	mov	BYTE PTR [rsp+8], cl
	sub	rsp, 40					; 00000028H
$LN2@write_seri:

; 62   : 	while (is_transmit_empty() == 0);

	call	?is_transmit_empty@@YAHXZ		; is_transmit_empty
	test	eax, eax
	jne	SHORT $LN1@write_seri
	jmp	SHORT $LN2@write_seri
$LN1@write_seri:

; 63   : 	x64_outportb(x86_64_phys_to_virt(PORT), a);

	mov	ecx, 1016				; 000003f8H
	call	x86_64_phys_to_virt
	movzx	edx, BYTE PTR a$[rsp]
	movzx	ecx, ax
	call	x64_outportb

; 64   : }

	add	rsp, 40					; 00000028H
	ret	0
?write_serial@@YAXD@Z ENDP				; write_serial
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
?is_transmit_empty@@YAHXZ PROC				; is_transmit_empty

; 57   : int is_transmit_empty() {

$LN3:
	sub	rsp, 40					; 00000028H

; 58   : 	return x64_inportb(x86_64_phys_to_virt(PORT + 5)) & 0x20;

	mov	ecx, 1021				; 000003fdH
	call	x86_64_phys_to_virt
	movzx	ecx, ax
	call	x64_inportb
	movzx	eax, al
	and	eax, 32					; 00000020H

; 59   : }

	add	rsp, 40					; 00000028H
	ret	0
?is_transmit_empty@@YAHXZ ENDP				; is_transmit_empty
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
c$1 = 32
args$ = 40
buf$2 = 48
buf$3 = 52
i$4 = 56
i$5 = 64
width$6 = 72
x$7 = 80
x$8 = 88
len$9 = 96
buffer$10 = 112
buffer$11 = 192
format$ = 288
?_au_debug_print_@@YAXPEADZZ PROC			; _au_debug_print_

; 71   : void _au_debug_print_(char* format, ...) {

$LN25:
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 280				; 00000118H

; 72   : 	x64_lock_acquire(&serial_lock);

	lea	rcx, OFFSET FLAT:serial_lock
	call	x64_lock_acquire

; 73   : 
; 74   : 	_va_list_ args;
; 75   : 	va_start(args, format);

	lea	rax, QWORD PTR format$[rsp+8]
	mov	QWORD PTR args$[rsp], rax
$LN22@au_debug_p:

; 76   : 
; 77   : 	while (*format)

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	test	eax, eax
	je	$LN21@au_debug_p

; 78   : 	{
; 79   : 		if (*format == '%')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 37					; 00000025H
	jne	$LN20@au_debug_p

; 80   : 		{
; 81   : 			++format;

	mov	rax, QWORD PTR format$[rsp]
	inc	rax
	mov	QWORD PTR format$[rsp], rax

; 82   : 			if (*format == 'd')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 100				; 00000064H
	jne	$LN19@au_debug_p

; 83   : 			{
; 84   : 				size_t width = 0;

	mov	QWORD PTR width$6[rsp], 0

; 85   : 				if (format[1] == '.')

	mov	eax, 1
	imul	rax, rax, 1
	mov	rcx, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 46					; 0000002eH
	jne	$LN18@au_debug_p

; 86   : 				{
; 87   : 					for (size_t i = 2; format[i] >= '0' && format[i] <= '9'; ++i)

	mov	QWORD PTR i$5[rsp], 2
	jmp	SHORT $LN17@au_debug_p
$LN16@au_debug_p:
	mov	rax, QWORD PTR i$5[rsp]
	inc	rax
	mov	QWORD PTR i$5[rsp], rax
$LN17@au_debug_p:
	mov	rax, QWORD PTR i$5[rsp]
	mov	rcx, QWORD PTR format$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 48					; 00000030H
	jl	SHORT $LN15@au_debug_p
	mov	rax, QWORD PTR i$5[rsp]
	mov	rcx, QWORD PTR format$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 57					; 00000039H
	jg	SHORT $LN15@au_debug_p

; 88   : 					{
; 89   : 						width *= 10;

	imul	rax, QWORD PTR width$6[rsp], 10
	mov	QWORD PTR width$6[rsp], rax

; 90   : 						width += format[i] - '0';

	mov	rax, QWORD PTR i$5[rsp]
	mov	rcx, QWORD PTR format$[rsp]
	add	rcx, rax
	mov	rax, rcx
	movsx	eax, BYTE PTR [rax]
	sub	eax, 48					; 00000030H
	cdqe
	mov	rcx, QWORD PTR width$6[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR width$6[rsp], rax

; 91   : 					}

	jmp	SHORT $LN16@au_debug_p
$LN15@au_debug_p:
$LN18@au_debug_p:

; 92   : 				}
; 93   : 				size_t i = va_arg(args, size_t);

	mov	rax, QWORD PTR args$[rsp]
	add	rax, 8
	mov	QWORD PTR args$[rsp], rax
	mov	rax, QWORD PTR args$[rsp]
	mov	rax, QWORD PTR [rax-8]
	mov	QWORD PTR i$4[rsp], rax

; 94   : 				char buffer[sizeof(size_t)* 8 + 1];
; 95   : 				//	size_t len
; 96   : 				if (i < 0) {

	cmp	QWORD PTR i$4[rsp], 0
	jae	SHORT $LN14@au_debug_p

; 97   : 					i = +i;

	mov	rax, QWORD PTR i$4[rsp]
	mov	QWORD PTR i$4[rsp], rax

; 98   : 					sztoa(i, buffer, 10);

	mov	r8d, 10
	lea	rdx, QWORD PTR buffer$10[rsp]
	mov	rcx, QWORD PTR i$4[rsp]
	call	?sztoa@@YAPEAD_KPEADH@Z			; sztoa

; 99   : 				}
; 100  : 				else {

	jmp	SHORT $LN13@au_debug_p
$LN14@au_debug_p:

; 101  : 					sztoa(i, buffer, 10);

	mov	r8d, 10
	lea	rdx, QWORD PTR buffer$10[rsp]
	mov	rcx, QWORD PTR i$4[rsp]
	call	?sztoa@@YAPEAD_KPEADH@Z			; sztoa

; 102  : 					size_t len = strlen(buffer);

	lea	rcx, QWORD PTR buffer$10[rsp]
	call	?strlen@@YA_KPEBD@Z			; strlen
	mov	QWORD PTR len$9[rsp], rax
$LN13@au_debug_p:

; 103  : 				}
; 104  : 				/*	while (len++ < width)
; 105  : 				puts("0");*/
; 106  : 				debug_serial(buffer);

	lea	rcx, QWORD PTR buffer$10[rsp]
	call	?debug_serial@@YAXPEAD@Z		; debug_serial
	jmp	$LN12@au_debug_p
$LN19@au_debug_p:

; 107  : 			}
; 108  : 			else if (*format == 'c')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 99					; 00000063H
	jne	SHORT $LN11@au_debug_p

; 109  : 			{
; 110  : 				char c = va_arg(args, char);

	mov	rax, QWORD PTR args$[rsp]
	add	rax, 4
	mov	QWORD PTR args$[rsp], rax
	mov	rax, QWORD PTR args$[rsp]
	movzx	eax, BYTE PTR [rax-4]
	mov	BYTE PTR c$1[rsp], al

; 111  : 				//char buffer[sizeof(size_t) * 8 + 1];
; 112  : 				//sztoa(c, buffer, 10);
; 113  : 				//puts(buffer);
; 114  : 				write_serial(c);

	movzx	ecx, BYTE PTR c$1[rsp]
	call	?write_serial@@YAXD@Z			; write_serial
	jmp	$LN10@au_debug_p
$LN11@au_debug_p:

; 115  : 			}
; 116  : 			else if (*format == 'x')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 120				; 00000078H
	jne	SHORT $LN9@au_debug_p

; 117  : 			{
; 118  : 				size_t x = va_arg(args, size_t);

	mov	rax, QWORD PTR args$[rsp]
	add	rax, 8
	mov	QWORD PTR args$[rsp], rax
	mov	rax, QWORD PTR args$[rsp]
	mov	rax, QWORD PTR [rax-8]
	mov	QWORD PTR x$8[rsp], rax

; 119  : 				char buffer[sizeof(size_t)* 8 + 1];
; 120  : 				sztoa(x, buffer, 16);

	mov	r8d, 16
	lea	rdx, QWORD PTR buffer$11[rsp]
	mov	rcx, QWORD PTR x$8[rsp]
	call	?sztoa@@YAPEAD_KPEADH@Z			; sztoa

; 121  : 				//puts("0x");
; 122  : 				debug_serial(buffer);

	lea	rcx, QWORD PTR buffer$11[rsp]
	call	?debug_serial@@YAXPEAD@Z		; debug_serial
	jmp	$LN8@au_debug_p
$LN9@au_debug_p:

; 123  : 			}
; 124  : 			else if (*format == 's')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 115				; 00000073H
	jne	SHORT $LN7@au_debug_p

; 125  : 			{
; 126  : 				char* x = va_arg(args, char*);

	mov	rax, QWORD PTR args$[rsp]
	add	rax, 8
	mov	QWORD PTR args$[rsp], rax
	mov	rax, QWORD PTR args$[rsp]
	mov	rax, QWORD PTR [rax-8]
	mov	QWORD PTR x$7[rsp], rax

; 127  : 				debug_serial(x);

	mov	rcx, QWORD PTR x$7[rsp]
	call	?debug_serial@@YAXPEAD@Z		; debug_serial
	jmp	SHORT $LN6@au_debug_p
$LN7@au_debug_p:

; 128  : 			}
; 129  : 			else if (*format == 'f')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 102				; 00000066H
	jne	SHORT $LN5@au_debug_p
	jmp	SHORT $LN4@au_debug_p
$LN5@au_debug_p:

; 130  : 			{
; 131  : 				/*double x = va_arg(args, double);
; 132  : 				debug_serial(ftoa(x, 2));*/
; 133  : 			}
; 134  : 			else if (*format == '%')

	mov	rax, QWORD PTR format$[rsp]
	movsx	eax, BYTE PTR [rax]
	cmp	eax, 37					; 00000025H
	jne	SHORT $LN3@au_debug_p

; 135  : 			{
; 136  : 				debug_serial(".");

	lea	rcx, OFFSET FLAT:$SG2975
	call	?debug_serial@@YAXPEAD@Z		; debug_serial

; 137  : 			}
; 138  : 			else

	jmp	SHORT $LN2@au_debug_p
$LN3@au_debug_p:

; 139  : 			{
; 140  : 				char buf[3];
; 141  : 				buf[0] = '%'; buf[1] = *format; buf[2] = '\0';

	mov	eax, 1
	imul	rax, rax, 0
	mov	BYTE PTR buf$3[rsp+rax], 37		; 00000025H
	mov	eax, 1
	imul	rax, rax, 1
	mov	rcx, QWORD PTR format$[rsp]
	movzx	ecx, BYTE PTR [rcx]
	mov	BYTE PTR buf$3[rsp+rax], cl
	mov	eax, 1
	imul	rax, rax, 2
	mov	BYTE PTR buf$3[rsp+rax], 0

; 142  : 				debug_serial(buf);

	lea	rcx, QWORD PTR buf$3[rsp]
	call	?debug_serial@@YAXPEAD@Z		; debug_serial
$LN2@au_debug_p:
$LN4@au_debug_p:
$LN6@au_debug_p:
$LN8@au_debug_p:
$LN10@au_debug_p:
$LN12@au_debug_p:

; 143  : 			}
; 144  : 		}
; 145  : 		else

	jmp	SHORT $LN1@au_debug_p
$LN20@au_debug_p:

; 146  : 		{
; 147  : 			char buf[2];
; 148  : 			buf[0] = *format; buf[1] = '\0';

	mov	eax, 1
	imul	rax, rax, 0
	mov	rcx, QWORD PTR format$[rsp]
	movzx	ecx, BYTE PTR [rcx]
	mov	BYTE PTR buf$2[rsp+rax], cl
	mov	eax, 1
	imul	rax, rax, 1
	mov	BYTE PTR buf$2[rsp+rax], 0

; 149  : 			debug_serial(buf);

	lea	rcx, QWORD PTR buf$2[rsp]
	call	?debug_serial@@YAXPEAD@Z		; debug_serial
$LN1@au_debug_p:

; 150  : 		}
; 151  : 		++format;

	mov	rax, QWORD PTR format$[rsp]
	inc	rax
	mov	QWORD PTR format$[rsp], rax

; 152  : 	}

	jmp	$LN22@au_debug_p
$LN21@au_debug_p:

; 153  : 	va_end(args);
; 154  : 
; 155  : 	serial_lock = 0;

	mov	QWORD PTR serial_lock, 0

; 156  : }

	add	rsp, 280				; 00000118H
	ret	0
?_au_debug_print_@@YAXPEADZZ ENDP			; _au_debug_print_
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\serial.cpp
_TEXT	SEGMENT
?au_initialize_serial@@YAHXZ PROC			; au_initialize_serial

; 45   : int au_initialize_serial() {

$LN3:
	sub	rsp, 40					; 00000028H

; 46   : 	x64_outportb(x86_64_phys_to_virt(PORT + 1), 0x00);

	mov	ecx, 1017				; 000003f9H
	call	x86_64_phys_to_virt
	xor	edx, edx
	movzx	ecx, ax
	call	x64_outportb

; 47   : 	x64_outportb(x86_64_phys_to_virt(PORT + 3), 0x80);

	mov	ecx, 1019				; 000003fbH
	call	x86_64_phys_to_virt
	mov	dl, 128					; 00000080H
	movzx	ecx, ax
	call	x64_outportb

; 48   : 	x64_outportb(x86_64_phys_to_virt(PORT + 0), 0x03);

	mov	ecx, 1016				; 000003f8H
	call	x86_64_phys_to_virt
	mov	dl, 3
	movzx	ecx, ax
	call	x64_outportb

; 49   : 	x64_outportb(x86_64_phys_to_virt(PORT + 1), 0x00);

	mov	ecx, 1017				; 000003f9H
	call	x86_64_phys_to_virt
	xor	edx, edx
	movzx	ecx, ax
	call	x64_outportb

; 50   : 	x64_outportb(x86_64_phys_to_virt(PORT + 3), 0x03);

	mov	ecx, 1019				; 000003fbH
	call	x86_64_phys_to_virt
	mov	dl, 3
	movzx	ecx, ax
	call	x64_outportb

; 51   : 	x64_outportb(x86_64_phys_to_virt(PORT + 2), 0xC7);

	mov	ecx, 1018				; 000003faH
	call	x86_64_phys_to_virt
	mov	dl, 199					; 000000c7H
	movzx	ecx, ax
	call	x64_outportb

; 52   : 	x64_outportb(x86_64_phys_to_virt(PORT + 4), 0x0B);

	mov	ecx, 1020				; 000003fcH
	call	x86_64_phys_to_virt
	mov	dl, 11
	movzx	ecx, ax
	call	x64_outportb

; 53   : 	_serial_initialized_ = true;

	mov	BYTE PTR _serial_initialized_, 1

; 54   : 	return 0;

	xor	eax, eax

; 55   : }

	add	rsp, 40					; 00000028H
	ret	0
?au_initialize_serial@@YAHXZ ENDP			; au_initialize_serial
_TEXT	ENDS
END
