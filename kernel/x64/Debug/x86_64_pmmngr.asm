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
$SG3004	DB	'B', 00H
	ORG $+2
$SG3006	DB	'KB', 00H
	ORG $+1
$SG3008	DB	'MB', 00H
	ORG $+5
$SG3009	DB	'[aurora]: usable memory -> %x length -> %d %s', 0aH, 00H
	ORG $+1
$SG3010	DB	'[aurora]: total memory -> %d GB ', 0aH, 00H
	ORG $+6
$SG3012	DB	'[aurora]: bitmap initialized %d bytes', 0aH, 00H
	ORG $+1
$SG3035	DB	'[aurora]: x86_64 pmmngr initialized', 0aH, 00H
	ORG $+3
$SG3045	DB	'RAM bitmap buffer -> %x ', 0aH, 00H
	ORG $+6
$SG3048	DB	'after RAM bitmap buffer -> %x ', 0aH, 00H
CONST	ENDS
PUBLIC	?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z	; x86_64_pmmngr_init
PUBLIC	x86_64_pmmngr_alloc
PUBLIC	x86_64_pmmngr_alloc_blocks
PUBLIC	x86_64_pmmngr_free
PUBLIC	x86_64_pmmngr_get_total_mem
PUBLIC	?x86_64_pmmngr_set_high@@YAX_N@Z		; x86_64_pmmngr_set_high
PUBLIC	?x86_64_pmmngr_get_bitmap_size@@YA_KXZ		; x86_64_pmmngr_get_bitmap_size
PUBLIC	?x86_64_pmmngr_is_high_mem@@YA_NXZ		; x86_64_pmmngr_is_high_mem
PUBLIC	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ		; x86_64_pmmngr_high_mem_bitmap
PUBLIC	?x86_64_pmmngr_lock_page@@YAXPEAX@Z		; x86_64_pmmngr_lock_page
PUBLIC	??ABitmap@@QEAA_N_K@Z				; Bitmap::operator[]
PUBLIC	?set@Bitmap@@QEAA_N_K_N@Z			; Bitmap::set
PUBLIC	?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z		; x86_64_pmmngr_init_bitmap
PUBLIC	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z		; x86_64_pmmngr_lock_pages
PUBLIC	?x86_64_pmmngr_unreserve_page@@YAXPEAX@Z	; x86_64_pmmngr_unreserve_page
EXTRN	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ:PROC	; au_get_boot_info
EXTRN	x86_64_phys_to_virt:PROC
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
EXTRN	memcpy:PROC
pdata	SEGMENT
$pdata$?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z DD imagerel $LN16
	DD	imagerel $LN16+931
	DD	imagerel $unwind$?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z
$pdata$x86_64_pmmngr_alloc DD imagerel $LN7
	DD	imagerel $LN7+128
	DD	imagerel $unwind$x86_64_pmmngr_alloc
$pdata$x86_64_pmmngr_alloc_blocks DD imagerel $LN6
	DD	imagerel $LN6+67
	DD	imagerel $unwind$x86_64_pmmngr_alloc_blocks
$pdata$x86_64_pmmngr_free DD imagerel $LN6
	DD	imagerel $LN6+147
	DD	imagerel $unwind$x86_64_pmmngr_free
$pdata$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+72
	DD	imagerel $unwind$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ
$pdata$?x86_64_pmmngr_lock_page@@YAXPEAX@Z DD imagerel $LN5
	DD	imagerel $LN5+142
	DD	imagerel $unwind$?x86_64_pmmngr_lock_page@@YAXPEAX@Z
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
	DD	013010cH
$unwind$x86_64_pmmngr_alloc DD 010401H
	DD	04204H
$unwind$x86_64_pmmngr_alloc_blocks DD 010801H
	DD	06208H
$unwind$x86_64_pmmngr_free DD 010901H
	DD	06209H
$unwind$?x86_64_pmmngr_high_mem_bitmap@@YAXXZ DD 010401H
	DD	04204H
$unwind$?x86_64_pmmngr_lock_page@@YAXPEAX@Z DD 010901H
	DD	06209H
$unwind$?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z DD 010e01H
	DD	0220eH
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

; 110  : void x86_64_pmmngr_unreserve_page(void* address) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 111  : 	uint64_t index = (uint64_t)address / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR address$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 112  : 	if (ram_bitmap[index] == false) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN3@x86_64_pmm
	jmp	SHORT $LN4@x86_64_pmm
$LN3@x86_64_pmm:

; 113  : 	if (ram_bitmap.set(index, false)) {

	xor	r8d, r8d
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_pmm

; 114  : 		free_memory++;

	mov	rax, QWORD PTR free_memory
	inc	rax
	mov	QWORD PTR free_memory, rax

; 115  : 		reserved_memory--;

	mov	rax, QWORD PTR reserved_memory
	dec	rax
	mov	QWORD PTR reserved_memory, rax

; 116  : 		if (ram_bitmap_index > index) ram_bitmap_index = index;

	mov	rax, QWORD PTR index$[rsp]
	cmp	QWORD PTR ram_bitmap_index, rax
	jbe	SHORT $LN1@x86_64_pmm
	mov	rax, QWORD PTR index$[rsp]
	mov	QWORD PTR ram_bitmap_index, rax
$LN1@x86_64_pmm:
$LN2@x86_64_pmm:
$LN4@x86_64_pmm:

; 117  : 	}
; 118  : }

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

; 105  : void x86_64_pmmngr_lock_pages(void* address, size_t size) {

$LN6:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 106  : 	for (size_t i = 0; i < size; i++)

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

; 107  : 		x86_64_pmmngr_lock_page((void*)((size_t)address + i * 4096));

	imul	rax, QWORD PTR i$1[rsp], 4096		; 00001000H
	mov	rcx, QWORD PTR address$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, rax
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page
	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 108  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z ENDP		; x86_64_pmmngr_lock_pages
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
i$1 = 0
bitmap_size$ = 32
buffer$ = 40
?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z PROC		; x86_64_pmmngr_init_bitmap

; 86   : void x86_64_pmmngr_init_bitmap(size_t bitmap_size, void* buffer) {

$LN6:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 87   : 	ram_bitmap.size = bitmap_size;

	mov	rax, QWORD PTR bitmap_size$[rsp]
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A, rax

; 88   : 	ram_bitmap.buffer = (uint8_t*)buffer;

	mov	rax, QWORD PTR buffer$[rsp]
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A+8, rax

; 89   : 
; 90   : 	for (int i = 0; i < bitmap_size; i++) {

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

; 91   : 		*(uint8_t*)(ram_bitmap.buffer + i) = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	mov	BYTE PTR [rcx+rax], 0

; 92   : 	}

	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 93   : }

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

; 63   : 	bool set(uint64_t index, bool value) {

$LN5:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 64   : 		if (index > size * 8) return false;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax]
	shl	rax, 3
	cmp	QWORD PTR index$[rsp], rax
	jbe	SHORT $LN2@set
	xor	al, al
	jmp	$LN3@set
$LN2@set:

; 65   : 
; 66   : 		uint64_t byte_index = index / 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	QWORD PTR byte_index$[rsp], rax

; 67   : 		uint8_t bit_index = index % 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	rax, rdx
	mov	BYTE PTR bit_index$[rsp], al

; 68   : 		uint8_t bit_indexer = 0x80 >> bit_index;

	movzx	eax, BYTE PTR bit_index$[rsp]
	mov	ecx, 128				; 00000080H
	mov	DWORD PTR tv145[rsp], ecx
	movzx	ecx, al
	mov	eax, DWORD PTR tv145[rsp]
	sar	eax, cl
	mov	BYTE PTR bit_indexer$[rsp], al

; 69   : 	
; 70   : 		buffer[byte_index] &= ~bit_indexer;

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

; 71   : 		
; 72   : 		if (value)

	movzx	eax, BYTE PTR value$[rsp]
	test	eax, eax
	je	SHORT $LN1@set

; 73   : 			buffer[byte_index] |= bit_indexer;

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

; 74   : 
; 75   : 		return true;

	mov	al, 1
$LN3@set:

; 76   : 	}

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

; 52   : 	bool operator[](uint64_t index) {

$LN5:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 53   : 		if (index > size * 8) return false;

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax]
	shl	rax, 3
	cmp	QWORD PTR index$[rsp], rax
	jbe	SHORT $LN2@operator
	xor	al, al
	jmp	SHORT $LN3@operator
$LN2@operator:

; 54   : 		uint64_t byte_index = index / 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	QWORD PTR byte_index$[rsp], rax

; 55   : 		uint8_t  bit_index = index % 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	rax, rdx
	mov	BYTE PTR bit_index$[rsp], al

; 56   : 		uint8_t  bit_indexer = 0x80 >> bit_index;

	movzx	eax, BYTE PTR bit_index$[rsp]
	mov	ecx, 128				; 00000080H
	mov	DWORD PTR tv94[rsp], ecx
	movzx	ecx, al
	mov	eax, DWORD PTR tv94[rsp]
	sar	eax, cl
	mov	BYTE PTR bit_indexer$[rsp], al

; 57   : 
; 58   : 		if ((buffer[byte_index] & bit_indexer) > 0)

	mov	rax, QWORD PTR this$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	rcx, QWORD PTR byte_index$[rsp]
	movzx	eax, BYTE PTR [rax+rcx]
	movzx	ecx, BYTE PTR bit_indexer$[rsp]
	and	eax, ecx
	test	eax, eax
	jle	SHORT $LN1@operator

; 59   : 			return true;

	mov	al, 1
	jmp	SHORT $LN3@operator
$LN1@operator:

; 60   : 		return false;

	xor	al, al
$LN3@operator:

; 61   : 	}

	add	rsp, 24
	ret	0
??ABitmap@@QEAA_N_K@Z ENDP				; Bitmap::operator[]
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
index$ = 32
ind$ = 40
address$ = 64
?x86_64_pmmngr_lock_page@@YAXPEAX@Z PROC		; x86_64_pmmngr_lock_page

; 95   : void x86_64_pmmngr_lock_page(void* address) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 96   : 	uint64_t index = (uint64_t)address / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR address$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 97   : 	uint64_t ind = index / 8;

	xor	edx, edx
	mov	rax, QWORD PTR index$[rsp]
	mov	ecx, 8
	div	rcx
	mov	QWORD PTR ind$[rsp], rax

; 98   : 	if (ram_bitmap[index] == true) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	cmp	eax, 1
	jne	SHORT $LN2@x86_64_pmm
	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:

; 99   : 	if (ram_bitmap.set(index, true)) {

	mov	r8b, 1
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN1@x86_64_pmm

; 100  : 		free_memory--;

	mov	rax, QWORD PTR free_memory
	dec	rax
	mov	QWORD PTR free_memory, rax

; 101  : 		reserved_memory++;

	mov	rax, QWORD PTR reserved_memory
	inc	rax
	mov	QWORD PTR reserved_memory, rax
$LN1@x86_64_pmm:
$LN3@x86_64_pmm:

; 102  : 	}
; 103  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_pmmngr_lock_page@@YAXPEAX@Z ENDP		; x86_64_pmmngr_lock_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_high_mem_bitmap@@YAXXZ PROC		; x86_64_pmmngr_high_mem_bitmap

; 263  : void x86_64_pmmngr_high_mem_bitmap() {

$LN3:
	sub	rsp, 40					; 00000028H

; 264  : 	au_get_boot_info()->auprint("RAM bitmap buffer -> %x \n", ram_bitmap.buffer);

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	rdx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	lea	rcx, OFFSET FLAT:$SG3045
	call	QWORD PTR [rax+90]

; 265  : 	ram_bitmap.buffer = (uint8_t*)x86_64_phys_to_virt((uint64_t)ram_bitmap.buffer);

	mov	rcx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	call	x86_64_phys_to_virt
	mov	QWORD PTR ?ram_bitmap@@3VBitmap@@A+8, rax

; 266  : 	au_get_boot_info()->auprint("after RAM bitmap buffer -> %x \n", ram_bitmap.buffer);

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	rdx, QWORD PTR ?ram_bitmap@@3VBitmap@@A+8
	lea	rcx, OFFSET FLAT:$SG3048
	call	QWORD PTR [rax+90]

; 267  : 	//_au_debug_print_("RAM Bitmap -> %x \r\n", ram_bitmap.buffer);
; 268  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_pmmngr_high_mem_bitmap@@YAXXZ ENDP		; x86_64_pmmngr_high_mem_bitmap
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_is_high_mem@@YA_NXZ PROC			; x86_64_pmmngr_is_high_mem

; 274  : 	return higher_half_mapped;

	movzx	eax, BYTE PTR higher_half_mapped

; 275  : }

	ret	0
?x86_64_pmmngr_is_high_mem@@YA_NXZ ENDP			; x86_64_pmmngr_is_high_mem
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
?x86_64_pmmngr_get_bitmap_size@@YA_KXZ PROC		; x86_64_pmmngr_get_bitmap_size

; 251  : 	return ram_bitmap_size;

	mov	rax, QWORD PTR ram_bitmap_size

; 252  : }

	ret	0
?x86_64_pmmngr_get_bitmap_size@@YA_KXZ ENDP		; x86_64_pmmngr_get_bitmap_size
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
value$ = 8
?x86_64_pmmngr_set_high@@YAX_N@Z PROC			; x86_64_pmmngr_set_high

; 259  : void x86_64_pmmngr_set_high(bool value) {

	mov	BYTE PTR [rsp+8], cl

; 260  : 	higher_half_mapped = value;

	movzx	eax, BYTE PTR value$[rsp]
	mov	BYTE PTR higher_half_mapped, al

; 261  : }

	ret	0
?x86_64_pmmngr_set_high@@YAX_N@Z ENDP			; x86_64_pmmngr_set_high
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
x86_64_pmmngr_get_total_mem PROC

; 243  : 	return total_ram;

	mov	rax, QWORD PTR total_ram

; 244  : }

	ret	0
x86_64_pmmngr_get_total_mem ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
index$ = 32
addr$ = 64
x86_64_pmmngr_free PROC

; 154  : void x86_64_pmmngr_free(void* addr) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 155  : 	uint64_t index = (uint64_t)addr / 4096;

	xor	edx, edx
	mov	rax, QWORD PTR addr$[rsp]
	mov	ecx, 4096				; 00001000H
	div	rcx
	mov	QWORD PTR index$[rsp], rax

; 156  : 	if (ram_bitmap[index] == false) return;

	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN3@x86_64_pmm
	jmp	SHORT $LN4@x86_64_pmm
$LN3@x86_64_pmm:

; 157  : 	if (ram_bitmap.set(index, false)) {

	xor	r8d, r8d
	mov	rdx, QWORD PTR index$[rsp]
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	?set@Bitmap@@QEAA_N_K_N@Z		; Bitmap::set
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_pmm

; 158  : 		free_memory++;

	mov	rax, QWORD PTR free_memory
	inc	rax
	mov	QWORD PTR free_memory, rax

; 159  : 		used_memory--;

	mov	rax, QWORD PTR used_memory
	dec	rax
	mov	QWORD PTR used_memory, rax

; 160  : 		if (ram_bitmap_index > index) {

	mov	rax, QWORD PTR index$[rsp]
	cmp	QWORD PTR ram_bitmap_index, rax
	jbe	SHORT $LN1@x86_64_pmm

; 161  : 			ram_bitmap_index = index;

	mov	rax, QWORD PTR index$[rsp]
	mov	QWORD PTR ram_bitmap_index, rax
$LN1@x86_64_pmm:
$LN2@x86_64_pmm:
$LN4@x86_64_pmm:

; 162  : 		}
; 163  : 	}
; 164  : }

	add	rsp, 56					; 00000038H
	ret	0
x86_64_pmmngr_free ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
i$1 = 32
first$ = 40
count$ = 64
x86_64_pmmngr_alloc_blocks PROC

; 140  : void* x86_64_pmmngr_alloc_blocks(int count) {

$LN6:
	mov	DWORD PTR [rsp+8], ecx
	sub	rsp, 56					; 00000038H

; 141  : 	void* first = x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR first$[rsp], rax

; 142  : 	for (int i = 0; i < count - 1; i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@x86_64_pmm:
	mov	eax, DWORD PTR count$[rsp]
	dec	eax
	cmp	DWORD PTR i$1[rsp], eax
	jge	SHORT $LN1@x86_64_pmm

; 143  : 		x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 144  : 
; 145  : 
; 146  : 	return first;

	mov	rax, QWORD PTR first$[rsp]

; 147  : }

	add	rsp, 56					; 00000038H
	ret	0
x86_64_pmmngr_alloc_blocks ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
x86_64_pmmngr_alloc PROC

; 127  : void* x86_64_pmmngr_alloc() {

$LN7:
	sub	rsp, 40					; 00000028H

; 128  : 	for (; ram_bitmap_index < ram_bitmap.size * 8; ram_bitmap_index++) {

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

; 129  : 		if (ram_bitmap[ram_bitmap_index] == true) continue;

	mov	rdx, QWORD PTR ram_bitmap_index
	lea	rcx, OFFSET FLAT:?ram_bitmap@@3VBitmap@@A ; ram_bitmap
	call	??ABitmap@@QEAA_N_K@Z			; Bitmap::operator[]
	movzx	eax, al
	cmp	eax, 1
	jne	SHORT $LN1@x86_64_pmm
	jmp	SHORT $LN3@x86_64_pmm
$LN1@x86_64_pmm:

; 130  : 		x86_64_pmmngr_lock_page((void*)(ram_bitmap_index * 4096));

	imul	rax, QWORD PTR ram_bitmap_index, 4096	; 00001000H
	mov	rcx, rax
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 131  : 		used_memory++;

	mov	rax, QWORD PTR used_memory
	inc	rax
	mov	QWORD PTR used_memory, rax

; 132  : 		return (void*)(ram_bitmap_index * 4096);

	imul	rax, QWORD PTR ram_bitmap_index, 4096	; 00001000H
	jmp	SHORT $LN5@x86_64_pmm

; 133  : 	}

	jmp	SHORT $LN3@x86_64_pmm
$LN2@x86_64_pmm:
$LN5@x86_64_pmm:

; 134  : }

	add	rsp, 40					; 00000028H
	ret	0
x86_64_pmmngr_alloc ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_pmmngr.cpp
_TEXT	SEGMENT
efi_mem$1 = 32
allocated_count$ = 40
i$2 = 48
i$3 = 56
bitmap_area$ = 64
efi_mem$4 = 72
unit$5 = 80
allocated_stack$ = 88
bitmap_size$ = 96
size_in_mb_kb$6 = 104
memmap_entries$ = 112
address$ = 120
address$7 = 128
info$ = 160
?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z PROC	; x86_64_pmmngr_init

; 171  : void x86_64_pmmngr_init(aurora_info_t *info) {

$LN16:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 152				; 00000098H

; 172  : 	free_memory = 0;

	mov	QWORD PTR free_memory, 0

; 173  : 	ram_bitmap_size = 0;

	mov	QWORD PTR ram_bitmap_size, 0

; 174  : 	total_ram = 0;

	mov	QWORD PTR total_ram, 0

; 175  : 	ram_bitmap_index = 0;

	mov	QWORD PTR ram_bitmap_index, 0

; 176  : 
; 177  : 	uint64_t memmap_entries = info->mem_map_size / info->mem_desc_size;

	xor	edx, edx
	mov	rax, QWORD PTR info$[rsp]
	mov	rax, QWORD PTR [rax+16]
	mov	rcx, QWORD PTR info$[rsp]
	div	QWORD PTR [rcx+8]
	mov	QWORD PTR memmap_entries$[rsp], rax

; 178  : 	void* bitmap_area = 0;

	mov	QWORD PTR bitmap_area$[rsp], 0

; 179  : 
; 180  : 	/* Scan a suitable area for the bitmap */
; 181  : 	for (size_t i = 0; i < memmap_entries; i++) {

	mov	QWORD PTR i$2[rsp], 0
	jmp	SHORT $LN13@x86_64_pmm
$LN12@x86_64_pmm:
	mov	rax, QWORD PTR i$2[rsp]
	inc	rax
	mov	QWORD PTR i$2[rsp], rax
$LN13@x86_64_pmm:
	mov	rax, QWORD PTR memmap_entries$[rsp]
	cmp	QWORD PTR i$2[rsp], rax
	jae	$LN11@x86_64_pmm

; 182  : 		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);

	mov	rax, QWORD PTR info$[rsp]
	mov	rcx, QWORD PTR i$2[rsp]
	imul	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR info$[rsp]
	add	rax, QWORD PTR [rcx]
	mov	QWORD PTR efi_mem$1[rsp], rax

; 183  : 		total_ram += efi_mem->num_pages * 4096;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	mov	rcx, QWORD PTR total_ram
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR total_ram, rax

; 184  : 		if (efi_mem->type == 7) {

	mov	rax, QWORD PTR efi_mem$1[rsp]
	cmp	DWORD PTR [rax], 7
	jne	$LN10@x86_64_pmm

; 185  : 			if (((efi_mem->num_pages * 4096) > 0x100000) && bitmap_area == 0) {

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	cmp	rax, 1048576				; 00100000H
	jbe	SHORT $LN9@x86_64_pmm
	cmp	QWORD PTR bitmap_area$[rsp], 0
	jne	SHORT $LN9@x86_64_pmm

; 186  : 				bitmap_area = (void*)efi_mem->phys_start;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR bitmap_area$[rsp], rax
$LN9@x86_64_pmm:

; 187  : 			}
; 188  : 			uint64_t size_in_mb_kb = 0;

	mov	QWORD PTR size_in_mb_kb$6[rsp], 0

; 189  : 			char* unit = "B";

	lea	rax, OFFSET FLAT:$SG3004
	mov	QWORD PTR unit$5[rsp], rax

; 190  : 			if ((efi_mem->num_pages * 4096 / 1024 / 1024) == 0) {

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

; 191  : 				size_in_mb_kb = efi_mem->num_pages * 4096 / 1024;

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	mov	QWORD PTR size_in_mb_kb$6[rsp], rax

; 192  : 				unit = "KB";

	lea	rax, OFFSET FLAT:$SG3006
	mov	QWORD PTR unit$5[rsp], rax

; 193  : 			}
; 194  : 			else {

	jmp	SHORT $LN7@x86_64_pmm
$LN8@x86_64_pmm:

; 195  : 				size_in_mb_kb = (efi_mem->num_pages * 4096 / 1024 / 1024);

	mov	rax, QWORD PTR efi_mem$1[rsp]
	imul	rax, QWORD PTR [rax+24], 4096		; 00001000H
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	xor	edx, edx
	mov	ecx, 1024				; 00000400H
	div	rcx
	mov	QWORD PTR size_in_mb_kb$6[rsp], rax

; 196  : 				unit = "MB";

	lea	rax, OFFSET FLAT:$SG3008
	mov	QWORD PTR unit$5[rsp], rax
$LN7@x86_64_pmm:

; 197  : 			}
; 198  : 			info->auprint("[aurora]: usable memory -> %x length -> %d %s\n", efi_mem->phys_start, size_in_mb_kb, unit);

	mov	r9, QWORD PTR unit$5[rsp]
	mov	r8, QWORD PTR size_in_mb_kb$6[rsp]
	mov	rax, QWORD PTR efi_mem$1[rsp]
	mov	rdx, QWORD PTR [rax+8]
	lea	rcx, OFFSET FLAT:$SG3009
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+90]
$LN10@x86_64_pmm:

; 199  : 		}
; 200  : 	}

	jmp	$LN12@x86_64_pmm
$LN11@x86_64_pmm:

; 201  : 
; 202  : 	info->auprint("[aurora]: total memory -> %d GB \n", (total_ram/ 1024 / 1024 / 1024));

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
	lea	rcx, OFFSET FLAT:$SG3010
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+90]

; 203  : 	uint64_t bitmap_size = total_ram / 4096 / 8 + 1;

	xor	edx, edx
	mov	rax, QWORD PTR total_ram
	mov	ecx, 4096				; 00001000H
	div	rcx
	xor	edx, edx
	mov	ecx, 8
	div	rcx
	inc	rax
	mov	QWORD PTR bitmap_size$[rsp], rax

; 204  : 
; 205  : 	x86_64_pmmngr_init_bitmap(bitmap_size, bitmap_area);

	mov	rdx, QWORD PTR bitmap_area$[rsp]
	mov	rcx, QWORD PTR bitmap_size$[rsp]
	call	?x86_64_pmmngr_init_bitmap@@YAX_KPEAX@Z	; x86_64_pmmngr_init_bitmap

; 206  : 
; 207  : 	info->auprint("[aurora]: bitmap initialized %d bytes\n", bitmap_size);

	mov	rdx, QWORD PTR bitmap_size$[rsp]
	lea	rcx, OFFSET FLAT:$SG3012
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+90]

; 208  : 	x86_64_pmmngr_lock_pages((void*)bitmap_area, bitmap_size);

	mov	rdx, QWORD PTR bitmap_size$[rsp]
	mov	rcx, QWORD PTR bitmap_area$[rsp]
	call	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z	; x86_64_pmmngr_lock_pages

; 209  : 
; 210  : 	/* No lock all pages, that are not for use */
; 211  : 	for (size_t i = 0; i < memmap_entries; i++) {

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

; 212  : 		EFI_MEMORY_DESCRIPTOR *efi_mem = (EFI_MEMORY_DESCRIPTOR*)((uint64_t)info->mem_map + i * info->mem_desc_size);

	mov	rax, QWORD PTR info$[rsp]
	mov	rcx, QWORD PTR i$3[rsp]
	imul	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR info$[rsp]
	add	rax, QWORD PTR [rcx]
	mov	QWORD PTR efi_mem$4[rsp], rax

; 213  : 		total_ram += efi_mem->num_pages;

	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	rcx, QWORD PTR total_ram
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR total_ram, rax

; 214  : 		if (efi_mem->type != 7) {

	mov	rax, QWORD PTR efi_mem$4[rsp]
	cmp	DWORD PTR [rax], 7
	je	SHORT $LN3@x86_64_pmm

; 215  : 			x86_64_pmmngr_lock_pages((void*)efi_mem->phys_start, efi_mem->num_pages);

	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rdx, QWORD PTR [rax+24]
	mov	rax, QWORD PTR efi_mem$4[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	?x86_64_pmmngr_lock_pages@@YAXPEAX_K@Z	; x86_64_pmmngr_lock_pages
$LN3@x86_64_pmm:

; 216  : 		}
; 217  : 	}

	jmp	SHORT $LN5@x86_64_pmm
$LN4@x86_64_pmm:

; 218  : 
; 219  : 	x86_64_pmmngr_lock_page((void*)0x0);

	xor	ecx, ecx
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 220  : 
; 221  : 	/* also lock the early used physical blocks for 
; 222  : 	 * kernel and kernel stack */
; 223  : 	uint32_t allocated_count = info->resvd_mem_count;

	mov	rax, QWORD PTR info$[rsp]
	mov	eax, DWORD PTR [rax+32]
	mov	DWORD PTR allocated_count$[rsp], eax

; 224  : 	uint64_t* allocated_stack = (uint64_t*)info->phys_stack_allocated;

	mov	rax, QWORD PTR info$[rsp]
	mov	rax, QWORD PTR [rax+24]
	mov	QWORD PTR allocated_stack$[rsp], rax
$LN2@x86_64_pmm:

; 225  : 	while (allocated_count) {

	cmp	DWORD PTR allocated_count$[rsp], 0
	je	SHORT $LN1@x86_64_pmm

; 226  : 		uint64_t address = *allocated_stack--;

	mov	rax, QWORD PTR allocated_stack$[rsp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR address$7[rsp], rax
	mov	rax, QWORD PTR allocated_stack$[rsp]
	sub	rax, 8
	mov	QWORD PTR allocated_stack$[rsp], rax

; 227  : 		x86_64_pmmngr_lock_page((void*)address);

	mov	rcx, QWORD PTR address$7[rsp]
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 228  : 		allocated_count--;

	mov	eax, DWORD PTR allocated_count$[rsp]
	dec	eax
	mov	DWORD PTR allocated_count$[rsp], eax

; 229  : 	}

	jmp	SHORT $LN2@x86_64_pmm
$LN1@x86_64_pmm:

; 230  : 
; 231  : 	uint64_t *address = (uint64_t*)0xA000;

	mov	QWORD PTR address$[rsp], 40960		; 0000a000H

; 232  : 	x86_64_pmmngr_lock_page((void*)0xA000);

	mov	ecx, 40960				; 0000a000H
	call	?x86_64_pmmngr_lock_page@@YAXPEAX@Z	; x86_64_pmmngr_lock_page

; 233  : 	memset(address, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR address$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 234  : 	memcpy(address, info->apcode, 4096);

	mov	r8d, 4096				; 00001000H
	mov	rax, QWORD PTR info$[rsp]
	mov	rdx, QWORD PTR [rax+82]
	mov	rcx, QWORD PTR address$[rsp]
	call	memcpy

; 235  : 
; 236  : 	info->auprint("[aurora]: x86_64 pmmngr initialized\n");

	lea	rcx, OFFSET FLAT:$SG3035
	mov	rax, QWORD PTR info$[rsp]
	call	QWORD PTR [rax+90]

; 237  : }

	add	rsp, 152				; 00000098H
	ret	0
?x86_64_pmmngr_init@@YAXPEAU_AURORA_INFO_@@@Z ENDP	; x86_64_pmmngr_init
_TEXT	ENDS
END
