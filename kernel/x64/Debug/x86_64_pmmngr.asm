; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?ram_bitmap@@3VBitmap@@A			; ram_bitmap
_BSS	SEGMENT
free_memory DQ	01H DUP (?)
reserved_memory DQ 01H DUP (?)
used_memory DQ	01H DUP (?)
ram_bitmap_index DQ 01H DUP (?)
total_ram DQ	01H DUP (?)
ram_bitmap_size DQ 01H DUP (?)
higher_half_mapped DB 01H DUP (?)
	ALIGN	4

?ram_bitmap@@3VBitmap@@A DB 010H DUP (?)		; ram_bitmap
_BSS	ENDS
CONST	SEGMENT
$SG2802	DB	'B', 00H
	ORG $+2
$SG2804	DB	'KB', 00H
	ORG $+1
$SG2806	DB	'MB', 00H
	ORG $+5
$SG2807	DB	'[aurora]: usable memory -> %x length -> %d %s', 0aH, 00H
	ORG $+1
$SG2808	DB	'[aurora]: total memory -> %d GB ', 0aH, 00H
	ORG $+6
$SG2810	DB	'[aurora]: bitmap initialized %d bytes', 0aH, 00H
	ORG $+1
$SG2830	DB	'[aurora]: x86_64 pmmngr initialized', 0aH, 00H
	ORG $+3
$SG2842	DB	'RAM Bitmap -> %x ', 0dH, 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z	; x86_64_pmmngr_init
PUBLIC	?x86_64_pmmngr_alloc@@YAPEAXXZ			; x86_64_pmmngr_alloc
PUBLIC	?x86_64_pmmngr_free@@YAXPEAX@Z			; x86_64_pmmngr_free
PUBLIC	?x86_64_pmmngr_get_total_mem@@YA_KXZ		; x86_64_pmmngr_get_total_mem
PUBLIC	?x86_64_pmmngr_set_high@@YAX_N@Z		; x86_64_pmmngr_set_high
PUBLIC	?x86_64_pmmngr_get_bitmap_size@@YA_KXZ		; x86_64_pmmngr_get_bitmap_size
PUBLIC	?x86_64_pmmngr_is_high_mem@@YA_NXZ		; x86_64_pmmngr_is_high_mem
PUBLIC	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ		; x86_64_pmmngr_high_mem_bitmap
PUBLIC	??ABitmap@@QEAA_N_K@Z				; Bitmap::operator[]
PUBLIC	?set@Bitmap@@QEAA_N_K_N@Z			; Bitmap::set
PUBLIC	?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z		; x86_64_pmmngr_init_bitmap
PUBLIC	?x86_64_pmmngr_lock_page@@YAXPEAX@Z		; x86_64_pmmngr_lock_page
PUBLIC	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z		; x86_64_pmmngr_lock_pages
PUBLIC	?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z	; x86_64_pmmngr_unreserve_page
EXTRN	?x86_64_phys_to_virt@@YA_K_K@Z:PROC		; x86_64_phys_to_virt
EXTRN	?_au_debug_print_@@YAXPEADZZ:PROC		; _au_debug_print_
pdata	SEGMENT
$pdata$?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z DD imagerel $LN15
	DD	imagerel $LN15+831
	DD	imagerel $unwind$?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z
$pdata$?x86_64_pmmngr_alloc@@YAPEAXXZ DD imagerel $LN7
	DD	imagerel $LN7+128
	DD	imagerel $unwind$?x86_64_pmmngr_alloc@@YAPEAXXZ
$pdata$?x86_64_pmmngr_free@@YAXPEAX@Z DD imagerel $LN6
	DD	imagerel $LN6+147
	DD	imagerel $unwind$?x86_64_pmmngr_free@@YAXPEAX@Z
$pdata$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+47
	DD	imagerel $unwind$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$??ABitmap@@QEAA_N_K@Z DD imagerel $LN5
	DD	imagerel $LN5+144
	DD	imagerel $unwind$??ABitmap@@QEAA_N_K@Z
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$?set@Bitmap@@QEAA_N_K_N@Z DD imagerel $LN5
	DD	imagerel $LN5+213
	DD	imagerel $unwind$?set@Bitmap@@QEAA_N_K_N@Z
pdata	ENDS
pdata	SEGMENT
$pdata$?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z DD imagerel $LN6
	DD	imagerel $LN6+88
	DD	imagerel $unwind$?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z
$pdata$?x86_64_pmmngr_lock_page@@YAXPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+122
	DD	imagerel $unwind$?x86_64_pmmngr_lock_page@@YAXPEAX@Z
$pdata$?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z DD imagerel $LN6
	DD	imagerel $LN6+85
	DD	imagerel $unwind$?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z
$pdata$?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z DD imagerel $LN6
	DD	imagerel $LN6+147
	DD	imagerel $unwind$?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z
pdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$?set@Bitmap@@QEAA_N_K_N@Z DD 011301H
	DD	02213H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$??ABitmap@@QEAA_N_K@Z DD 010e01H
	DD	0220eH
xdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z DD 020c01H
	DD	011010cH
$unwind$?x86_64_pmmngr_alloc@@YAPEAXXZ DD 010401H
	DD	04204H
$unwind$?x86_64_pmmngr_free@@YAXPEAX@Z DD 010901H
	DD	06209H
$unwind$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ DD 010401H
	DD	04204H
$unwind$?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z DD 010e01H
	DD	0220eH
$unwind$?x86_64_pmmngr_lock_page@@YAXPEAX@Z DD 010901H
	DD	06209H
$unwind$?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z DD 010e01H
	DD	0620eH
$unwind$?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z DD 010901H
	DD	06209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
index$ = 32
address$ = 64
?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z PROC		; x86_64_pmmngr_unreserve_page

; 107  : void x86_64_pmmngr_unreserve_page(void* address) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 108  : 	uint64_t index = (uint64_t)address / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR address$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 109  : 	if (ram_bitmap[index] == false) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN3@x86_64_pmm
	jmp	SHORT $LN4@x86_64_pmm
$LN3@x86_64_pmm:

; 110  : 	if (ram_bitmap.set(index, false)) {

	xor	r8d, r8d
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_pmm

; 111  : 		free_memory++;

	mov	rax, QWORD PTR free_memory
	inc	rax
	mov	QWORD PTR free_memory, rax

; 112  : 		reserved_memory--;

	mov	rax, QWORD PTR reserved_memory
	dec	rax
	mov	QWORD PTR reserved_memory, rax

; 113  : 		if (ram_bitmap_index > index) ram_bitmap_index = index;

	mov	rax, QWORD PTR index$[rsp]
	cmp	QWORD PTR ram_bitmap_index, rax
	jbe	SHORT $LN1@x86_64_pmm
	mov	rax, QWORD PTR index$[rsp]
	mov	QWORD PTR ram_bitmap_index, rax
$LN1@x86_64_pmm:
$LN2@x86_64_pmm:
$LN4@x86_64_pmm:

; 114  : 	}
; 115  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z ENDP		; x86_64_pmmngr_unreserve_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
i$1 = 32
address$ = 64
size$ = 72
?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z PROC		; x86_64_pmmngr_lock_pages

; 102  : void x86_64_pmmngr_lock_pages(void* address, size_t size) {

$LN6:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 103  : 	for (size_t i = 0; i < size; i++)

	mov	QWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:
	mov	rax, QWORD PTR i$1[rsp]
	inc	rax
	mov	QWORD PTR i$1[rsp], rax
$LN3@x86_64_pmm:
	mov	rax, QWORD PTR size$[rsp]
	cmp	QWORD PTR i$1[rsp], rax
	jae	SHORT $LN1@x86_64_pmm

; 104  : 		x86_64_pmmngr_lock_page((void*)((size_t)address + i * 4096));

	imul	rax, QWORD PTR i$1[rsp], 4096		; 00001000H
	mov	rcx, QWORD PTR address$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, rax
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page
	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 105  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z ENDP		; x86_64_pmmngr_lock_pages
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
index$ = 32
address$ = 64
?x86_64_pmmngr_lock_page@@YAXPEAX@Z PROC		; x86_64_pmmngr_lock_page

; 93   : void x86_64_pmmngr_lock_page(void* address) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 94   : 	uint64_t index = (uint64_t)address / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR address$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 95   : 	if (ram_bitmap[index] == true) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	cmp	eax, 1
	jne	SHORT $LN2@x86_64_pmm
	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:

; 96   : 	if (ram_bitmap.set(index, true)) {

	mov	r8b, 1
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN1@x86_64_pmm

; 97   : 		free_memory--;

	mov	rax, QWORD PTR free_memory
	dec	rax
	mov	QWORD PTR free_memory, rax

; 98   : 		reserved_memory++;

	mov	rax, QWORD PTR reserved_memory
	inc	rax
	mov	QWORD PTR reserved_memory, rax
$LN1@x86_64_pmm:
$LN3@x86_64_pmm:

; 99   : 	}
; 100  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_lock_page@@YAXPEAX@Z ENDP		; x86_64_pmmngr_lock_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
i$1 = 0
bitmap_size$ = 32
buffer$ = 40
?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z PROC		; x86_64_pmmngr_init_bitmap

; 84   : void x86_64_pmmngr_init_bitmap(size_t bitmap_size, void* buffer) {

$LN6:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 85   : 	ram_bitmap.size = bitmap_size;

	mov	rax, QWORD PTR bitmap_size$[rsp]
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A, rax

; 86   : 	ram_bitmap.buffer = (uint8_t*)buffer;

	mov	rax, QWORD PTR buffer$[rsp]
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A+8, rax

; 87   : 
; 88   : 	for (int i = 0; i < bitmap_size; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@x86_64_pmm:
	movsxd	rax, DWORD PTR i$1[rsp]
	cmp	rax, QWORD PTR bitmap_size$[rsp]
	jae	SHORT $LN1@x86_64_pmm

; 89   : 		*(uint8_t*)(ram_bitmap.buffer + i) = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	mov	BYTE PTR [rcx+rax], 0

; 90   : 	}

	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 91   : }

	add	rsp, 24
	ret	0
?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z ENDP		; x86_64_pmmngr_init_bitmap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
;	COMDAT ?set@Bitmap@@QEAA_N_K_N@Z
_TEXT	SEGMENT
bit_indexer$ = 0
bit_index$ = 1
tv145 = 4
byte_index$ = 8
this$ = 32
index$ = 40
value$ = 48
?set@Bitmap@@QEAA_N_K_N@Z PROC				; Bitmap::set, COMDAT

; 62   : 	bool set(uint64_t index, bool value) {

$LN5:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 63   : 		if (index > size * 8) return false;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax]
	shl	rax, 3
	cmp	QWORD PTR index$[rsp], rax
	jbe	SHORT $LN2@set
	xor	al, al
	jmp	$LN3@set
$LN2@set:

; 64   : 
; 65   : 		uint64_t byte_index = index / 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	QWORD PTR byte_index$[rsp], rax

; 66   : 		uint8_t bit_index = index % 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	rax, rdx
	mov	BYTE PTR bit_index$[rsp], al

; 67   : 		uint8_t bit_indexer = 0x80 >> bit_index;

	movzx	eax, BYTE PTR bit_index$[rsp]
	mov	ecx, 128				; 00000080H
	mov	DWORD PTR tv145[rsp], ecx
	movzx	ecx, al
	mov	eax, DWORD PTR tv145[rsp]
	sar	eax, cl
	mov	BYTE PTR bit_indexer$[rsp], al

; 68   : 
; 69   : 		buffer[byte_index] &= ~bit_indexer;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax+8]
	movzx	ecx, BYTE PTR bit_indexer$[rsp]
	not	ecx
	mov	rdx, QWORD PTR byte_index$[rsp]
	movzx	eax, BYTE PTR [rax+rdx]
	and	eax, ecx
	mov	rcx, QWORD PTR this$[rsp]
	mov	rcx, QWORD PTR [rcx+8]
	mov	rdx, QWORD PTR byte_index$[rsp]
	mov	BYTE PTR [rcx+rdx], al

; 70   : 		if (value)

	movzx	eax, BYTE PTR value$[rsp]
	test	eax, eax
	je	SHORT $LN1@set

; 71   : 			buffer[byte_index] |= bit_indexer;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax+8]
	movzx	ecx, BYTE PTR bit_indexer$[rsp]
	mov	rdx, QWORD PTR byte_index$[rsp]
	movzx	eax, BYTE PTR [rax+rdx]
	or	eax, ecx
	mov	rcx, QWORD PTR this$[rsp]
	mov	rcx, QWORD PTR [rcx+8]
	mov	rdx, QWORD PTR byte_index$[rsp]
	mov	BYTE PTR [rcx+rdx], al
$LN1@set:

; 72   : 
; 73   : 		return true;

	mov	al, 1
$LN3@set:

; 74   : 	}

	add	rsp, 24
	ret	0
?set@Bitmap@@QEAA_N_K_N@Z ENDP				; Bitmap::set
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
;	COMDAT ??ABitmap@@QEAA_N_K@Z
_TEXT	SEGMENT
bit_index$ = 0
bit_indexer$ = 1
tv94 = 4
byte_index$ = 8
this$ = 32
index$ = 40
??ABitmap@@QEAA_N_K@Z PROC				; Bitmap::operator[], COMDAT

; 51   : 	bool operator[](uint64_t index) {

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 52   : 		if (index > size * 8) return false;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax]
	shl	rax, 3
	cmp	QWORD PTR index$[rsp], rax
	jbe	SHORT $LN2@operator
	xor	al, al
	jmp	SHORT $LN3@operator
$LN2@operator:

; 53   : 		uint64_t byte_index = index / 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	QWORD PTR byte_index$[rsp], rax

; 54   : 		uint8_t  bit_index = index % 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	rax, rdx
	mov	BYTE PTR bit_index$[rsp], al

; 55   : 		uint8_t  bit_indexer = 0x80 >> bit_index;

	movzx	eax, BYTE PTR bit_index$[rsp]
	mov	ecx, 128				; 00000080H
	mov	DWORD PTR tv94[rsp], ecx
	movzx	ecx, al
	mov	eax, DWORD PTR tv94[rsp]
	sar	eax, cl
	mov	BYTE PTR bit_indexer$[rsp], al

; 56   : 
; 57   : 		if ((buffer[byte_index] & bit_indexer) > 0)

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	rcx, QWORD PTR byte_index$[rsp]
	movzx	eax, BYTE PTR [rax+rcx]
	movzx	ecx, BYTE PTR bit_indexer$[rsp]
	and	eax, ecx
	test	eax, eax
	jle	SHORT $LN1@operator

; 58   : 			return true;

	mov	al, 1
	jmp	SHORT $LN3@operator
$LN1@operator:

; 59   : 		return false;

	xor	al, al
$LN3@operator:

; 60   : 	}

	add	rsp, 24
	ret	0
??ABitmap@@QEAA_N_K@Z ENDP				; Bitmap::operator[]
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_high_mem_bitmap@@YAXXZ PROC		; x86_64_pmmngr_high_mem_bitmap

; 240  : void x86_64_pmmngr_high_mem_bitmap() {

$LN3:
	sub	rsp, 40					; 00000028H

; 241  : 	ram_bitmap.buffer = (uint8_t*)x86_64_phys_to_virt((uint64_t)ram_bitmap.buffer);

	mov	rcx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A+8, rax

; 242  : 	_au_debug_print_("RAM Bitmap -> %x \r\n", ram_bitmap.buffer);

	mov	rdx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	lea	rcx, OFFSET FLAT:$SG2842
	call	?_au_debug_print_@@YAXPEADZZ		; _au_debug_print_

; 243  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_pmmngr_high_mem_bitmap@@YAXXZ ENDP		; x86_64_pmmngr_high_mem_bitmap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_is_high_mem@@YA_NXZ PROC			; x86_64_pmmngr_is_high_mem

; 249  : 	return higher_half_mapped;

	movzx	eax, BYTE PTR higher_half_mapped

; 250  : }

	ret	0
?x86_64_pmmngr_is_high_mem@@YA_NXZ ENDP			; x86_64_pmmngr_is_high_mem
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_get_bitmap_size@@YA_KXZ PROC		; x86_64_pmmngr_get_bitmap_size

; 228  : 	return ram_bitmap_size;

	mov	rax, QWORD PTR ram_bitmap_size

; 229  : }

	ret	0
?x86_64_pmmngr_get_bitmap_size@@YA_KXZ ENDP		; x86_64_pmmngr_get_bitmap_size
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
value$ = 8
?x86_64_pmmngr_set_high@@YAX_N@Z PROC			; x86_64_pmmngr_set_high

; 236  : void x86_64_pmmngr_set_high(bool value) {

	mov	BYTE PTR [rsp+8], cl

; 237  : 	higher_half_mapped = value;

	movzx	eax, BYTE PTR value$[rsp]
	mov	BYTE PTR higher_half_mapped, al

; 238  : }

	ret	0
?x86_64_pmmngr_set_high@@YAX_N@Z ENDP			; x86_64_pmmngr_set_high
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_get_total_mem@@YA_KXZ PROC		; x86_64_pmmngr_get_total_mem

; 220  : 	return total_ram;

	mov	rax, QWORD PTR total_ram

; 221  : }

	ret	0
?x86_64_pmmngr_get_total_mem@@YA_KXZ ENDP		; x86_64_pmmngr_get_total_mem
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
index$ = 32
addr$ = 64
?x86_64_pmmngr_free@@YAXPEAX@Z PROC			; x86_64_pmmngr_free

; 138  : void x86_64_pmmngr_free(void* addr) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 139  : 	uint64_t index = (uint64_t)addr / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR addr$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 140  : 	if (ram_bitmap[index] == false) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN3@x86_64_pmm
	jmp	SHORT $LN4@x86_64_pmm
$LN3@x86_64_pmm:

; 141  : 	if (ram_bitmap.set(index, false)) {

	xor	r8d, r8d
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_pmm

; 142  : 		free_memory++;

	mov	rax, QWORD PTR free_memory
	inc	rax
	mov	QWORD PTR free_memory, rax

; 143  : 		used_memory--;

	mov	rax, QWORD PTR used_memory
	dec	rax
	mov	QWORD PTR used_memory, rax

; 144  : 		if (ram_bitmap_index > index) {

	mov	rax, QWORD PTR index$[rsp]
	cmp	QWORD PTR ram_bitmap_index, rax
	jbe	SHORT $LN1@x86_64_pmm

; 145  : 			ram_bitmap_index = index;

	mov	rax, QWORD PTR index$[rsp]
	mov	QWORD PTR ram_bitmap_index, rax
$LN1@x86_64_pmm:
$LN2@x86_64_pmm:
$LN4@x86_64_pmm:

; 146  : 		}
; 147  : 	}
; 148  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_free@@YAXPEAX@Z ENDP			; x86_64_pmmngr_free
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_alloc@@YAPEAXXZ PROC			; x86_64_pmmngr_alloc

; 124  : void* x86_64_pmmngr_alloc() {

$LN7:
	sub	rsp, 40					; 00000028H

; 125  : 	for (; ram_bitmap_index < ram_bitmap.size * 8; ram_bitmap_index++) {

	jmp	SHORT $LN4@x86_64_pmm
$LN3@x86_64_pmm:
	mov	rax, QWORD PTR ram_bitmap_index
	inc	rax
	mov	QWORD PTR ram_bitmap_index, rax
$LN4@x86_64_pmm:
	mov	rax, QWORD PTR ?ram_bitmap@@3VBitmap@@A
	shl	rax, 3
	cmp	QWORD PTR ram_bitmap_index, rax
	jae	SHORT $LN2@x86_64_pmm

; 126  : 		if (ram_bitmap[ram_bitmap_index] == true) continue;

	mov	rdx, QWORD PTR ram_bitmap_index
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	cmp	eax, 1
	jne	SHORT $LN1@x86_64_pmm
	jmp	SHORT $LN3@x86_64_pmm
$LN1@x86_64_pmm:

; 127  : 		x86_64_pmmngr_lock_page((void*)(ram_bitmap_index * 4096));

	imul	rax, QWORD PTR ram_bitmap_index, 4096	; 00001000H
	mov	rcx, rax
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 128  : 		used_memory++;

	mov	rax, QWORD PTR used_memory
	inc	rax
	mov	QWORD PTR used_memory, rax

; 129  : 		return (void*)(ram_bitmap_index * 4096);

	imul	rax, QWORD PTR ram_bitmap_index, 4096	; 00001000H
	jmp	SHORT $LN5@x86_64_pmm

; 130  : 	}

	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:
$LN5@x86_64_pmm:

; 131  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_pmmngr_alloc@@YAPEAXXZ ENDP			; x86_64_pmmngr_alloc
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
allocated_count$ = 32
efi_mem$1 = 40
i$2 = 48
i$3 = 56
efi_mem$4 = 64
unit$5 = 72
bitmap_area$ = 80
allocated_stack$ = 88
bitmap_size$ = 96
size_in_mb_kb$6 = 104
memmap_entries$ = 112
address$7 = 120
info$ = 144
?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z PROC	; x86_64_pmmngr_init

; 155  : void x86_64_pmmngr_init(aurora_info_t *info) {

$LN15:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 136				; 00000088H

; 156  : 	free_memory = 0;

	mov	QWORD PTR free_memory, 0

; 157  : 	ram_bitmap_size = 0;

	mov	QWORD PTR ram_bitmap_size, 0

; 158  : 	total_ram = 0;

	mov	QWORD PTR total_ram, 0

; 159  : 	ram_bitmap_index = 0;

	mov	QWORD PTR ram_bitmap_index, 0

; 160  : 
; 161  : 	uint64_t memmap_entries = info->mem_map_size / info->mem_desc_size;

	xor	edx, edx
	mov	rax, QWORD PTR info$[rsp]
	mov	rax, QWORD PTR [rax+16]
	mov	rcx, QWORD PTR info$[rsp]
	div	QWORD PTR [rcx+8]
	mov	QWORD PTR memmap_entries$[rsp], rax

; 162  : 	void* bitmap_area = 0;

	mov	QWORD PTR bitmap_area$[rsp], 0

; 163  : 
; 164  : 	/* Scan a suitable area for the bitmap */
; 165  : 	for (size_t i = 0; i < memmap_entries; i++) {

	mov	QWORD PTR i$2[rsp], 0
	jmp	SHORT $LN12@x86_64_pmm
$LN11@x86_64_pmm:
	mov	rax, QWORD PTR i$2[rsp]
	inc	rax
	mov	QWORD PTR i$2[rsp], rax
$LN12@x86_64_pmm:
	mov	rax, QWORD PTR memmap_entries$[rsp]
	cmp	QWORD PTR i$2[rsp], rax
	jae	$LN10@x86_64_pmm

; 166  : 		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);

	mov	rax, QWORD PTR info$[rsp]
	mov	rcx, QWORD PTR i$2[rsp]
	imul	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR info$[rsp]
	add	rax, QWORD PTR [rcx]
	mov	QWORD PTR efi_mem$1[rsp], rax

; 167  : 		total_ram += efi_mem->num_pages * 4096;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	mov	rcx, QWORD PTR total_ram
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR total_ram, rax

; 168  : 		if (efi_mem->type == 7) {

	mov	rax, QWORD PTR efi_mem$1[rsp]
	cmp	DWORD PTR [rax], 7
	jne	$LN9@x86_64_pmm

; 169  : 			bitmap_area = (void*)efi_mem->phys_start;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR bitmap_area$[rsp], rax

; 170  : 			uint64_t size_in_mb_kb = 0;

	mov	QWORD PTR size_in_mb_kb$6[rsp], 0

; 171  : 			char* unit = "B";

	lea	rax, OFFSET FLAT:$SG2802
	mov	QWORD PTR unit$5[rsp], rax

; 172  : 			if ((efi_mem->num_pages * 4096 / 1024 / 1024) == 0) {

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	test	rax, rax
	jne	SHORT $LN8@x86_64_pmm

; 173  : 				size_in_mb_kb = efi_mem->num_pages * 4096 / 1024;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	mov	QWORD PTR size_in_mb_kb$6[rsp], rax

; 174  : 				unit = "KB";

	lea	rax, OFFSET FLAT:$SG2804
	mov	QWORD PTR unit$5[rsp], rax

; 175  : 			}
; 176  : 			else {

	jmp	SHORT $LN7@x86_64_pmm
$LN8@x86_64_pmm:

; 177  : 				size_in_mb_kb = (efi_mem->num_pages * 4096 / 1024 / 1024);

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	mov	QWORD PTR size_in_mb_kb$6[rsp], rax

; 178  : 				unit = "MB";

	lea	rax, OFFSET FLAT:$SG2806
	mov	QWORD PTR unit$5[rsp], rax
$LN7@x86_64_pmm:

; 179  : 			}
; 180  : 			info->auprint("[aurora]: usable memory -> %x length -> %d %s\n", efi_mem->phys_start, size_in_mb_kb, unit);

	mov	r9, QWORD PTR unit$5[rsp]
	mov	r8, QWORD PTR size_in_mb_kb$6[rsp]
	mov	rax, QWORD PTR efi_mem$1[rsp]
	mov	rdx, QWORD PTR [rax+8]
	lea	rcx, OFFSET FLAT:$SG2807
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+82]
$LN9@x86_64_pmm:

; 181  : 		}
; 182  : 	}

	jmp	$LN11@x86_64_pmm
$LN10@x86_64_pmm:

; 183  : 
; 184  : 	info->auprint("[aurora]: total memory -> %d GB \n", (total_ram/ 1024 / 1024 / 1024));

	xor	edx, edx
	mov	rax, QWORD PTR total_ram
	mov	ecx, 1024				; 00000400H
	div	rcx
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:$SG2808
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+82]

; 185  : 	uint64_t bitmap_size = total_ram / 4096 / 8 + 1;

	xor	edx, edx
	mov	rax, QWORD PTR total_ram
	mov	ecx, 4096				; 00001000H
	div	rcx
	xor	edx, edx
	mov	ecx, 8
	div	rcx
	inc	rax
	mov	QWORD PTR bitmap_size$[rsp], rax

; 186  : 
; 187  : 	x86_64_pmmngr_init_bitmap(bitmap_size, bitmap_area);

	mov	rdx, QWORD PTR bitmap_area$[rsp]
	mov	rcx, QWORD PTR bitmap_size$[rsp]
	call	?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z	; x86_64_pmmngr_init_bitmap

; 188  : 
; 189  : 	info->auprint("[aurora]: bitmap initialized %d bytes\n", bitmap_size);

	mov	rdx, QWORD PTR bitmap_size$[rsp]
	lea	rcx, OFFSET FLAT:$SG2810
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+82]

; 190  : 	x86_64_pmmngr_lock_pages((void*)bitmap_area, bitmap_size);

	mov	rdx, QWORD PTR bitmap_size$[rsp]
	mov	rcx, QWORD PTR bitmap_area$[rsp]
	call	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z	; x86_64_pmmngr_lock_pages

; 191  : 
; 192  : 	/* No lock all pages, that are not for use */
; 193  : 	for (size_t i = 0; i < memmap_entries; i++) {

	mov	QWORD PTR i$3[rsp], 0
	jmp	SHORT $LN6@x86_64_pmm
$LN5@x86_64_pmm:
	mov	rax, QWORD PTR i$3[rsp]
	inc	rax
	mov	QWORD PTR i$3[rsp], rax
$LN6@x86_64_pmm:
	mov	rax, QWORD PTR memmap_entries$[rsp]
	cmp	QWORD PTR i$3[rsp], rax
	jae	SHORT $LN4@x86_64_pmm

; 194  : 		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);

	mov	rax, QWORD PTR info$[rsp]
	mov	rcx, QWORD PTR i$3[rsp]
	imul	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR info$[rsp]
	add	rax, QWORD PTR [rcx]
	mov	QWORD PTR efi_mem$4[rsp], rax

; 195  : 		total_ram += efi_mem->num_pages;

	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	rcx, QWORD PTR total_ram
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR total_ram, rax

; 196  : 		if (efi_mem->type != 7) {

	mov	rax, QWORD PTR efi_mem$4[rsp]
	cmp	DWORD PTR [rax], 7
	je	SHORT $LN3@x86_64_pmm

; 197  : 			x86_64_pmmngr_lock_pages((void*)efi_mem->phys_start, efi_mem->num_pages);

	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rdx, QWORD PTR [rax+24]
	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z	; x86_64_pmmngr_lock_pages
$LN3@x86_64_pmm:

; 198  : 		}
; 199  : 	}

	jmp	SHORT $LN5@x86_64_pmm
$LN4@x86_64_pmm:

; 200  : 
; 201  : 	x86_64_pmmngr_lock_page((void*)0x0);

	xor	ecx, ecx
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 202  : 
; 203  : 	/* also lock the early used physical blocks for 
; 204  : 	 * kernel and kernel stack */
; 205  : 	uint32_t allocated_count = info->resvd_mem_count;

	mov	rax, QWORD PTR info$[rsp]
	mov	eax, DWORD PTR [rax+32]
	mov	DWORD PTR allocated_count$[rsp], eax

; 206  : 	uint64_t* allocated_stack = (uint64_t*)info->phys_stack_allocated;

	mov	rax, QWORD PTR info$[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	QWORD PTR allocated_stack$[rsp], rax
$LN2@x86_64_pmm:

; 207  : 	while (allocated_count) {

	cmp	DWORD PTR allocated_count$[rsp], 0
	je	SHORT $LN1@x86_64_pmm

; 208  : 		uint64_t address = *allocated_stack--;

	mov	rax, QWORD PTR allocated_stack$[rsp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR address$7[rsp], rax
	mov	rax, QWORD PTR allocated_stack$[rsp]
	sub	rax, 8
	mov	QWORD PTR allocated_stack$[rsp], rax

; 209  : 		x86_64_pmmngr_lock_page((void*)address);

	mov	rcx, QWORD PTR address$7[rsp]
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 210  : 		allocated_count--;

	mov	eax, DWORD PTR allocated_count$[rsp]
	dec	eax
	mov	DWORD PTR allocated_count$[rsp], eax

; 211  : 	}

	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 212  : 
; 213  : 	info->auprint("[aurora]: x86_64 pmmngr initialized\n");

	lea	rcx, OFFSET FLAT:$SG2830
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+82]

; 214  : }

	add	rsp, 136				; 00000088H
	ret	0
?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z ENDP	; x86_64_pmmngr_init
_TEXT	ENDS
END
