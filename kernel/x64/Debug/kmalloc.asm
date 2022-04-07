; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?first_block@@3PEAU_meta_data_@@EA		; first_block
PUBLIC	?last_block@@3PEAU_meta_data_@@EA		; last_block
_BSS	SEGMENT
?first_block@@3PEAU_meta_data_@@EA DQ 01H DUP (?)	; first_block
?last_block@@3PEAU_meta_data_@@EA DQ 01H DUP (?)	; last_block
_BSS	ENDS
PUBLIC	?au_request_page@@YAPEAXH@Z			; au_request_page
PUBLIC	?au_free_page@@YAXPEAXH@Z			; au_free_page
PUBLIC	?kmalloc@@YAPEAX_K@Z				; kmalloc
PUBLIC	?kfree@@YAXPEAX@Z				; kfree
PUBLIC	?krealloc@@YAPEAXPEAX_K@Z			; krealloc
PUBLIC	?kcalloc@@YAPEAX_K0@Z				; kcalloc
PUBLIC	?au_split_block@@YAXPEAU_meta_data_@@_K@Z	; au_split_block
PUBLIC	?au_expand_kmalloc@@YAX_K@Z			; au_expand_kmalloc
EXTRN	?x86_64_map_page@@YA_N_K0E@Z:PROC		; x86_64_map_page
EXTRN	?x86_64_get_free_page@@YAPEA_K_N@Z:PROC		; x86_64_get_free_page
EXTRN	?x86_64_paging_free@@YA_N_K@Z:PROC		; x86_64_paging_free
EXTRN	?x86_64_pmmngr_alloc@@YAPEAXXZ:PROC		; x86_64_pmmngr_alloc
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
EXTRN	memcpy:PROC
pdata	SEGMENT
$pdata$?au_request_page@@YAPEAXH@Z DD imagerel $LN6
	DD	imagerel $LN6+112
	DD	imagerel $unwind$?au_request_page@@YAPEAXH@Z
$pdata$?au_free_page@@YAXPEAXH@Z DD imagerel $LN6
	DD	imagerel $LN6+79
	DD	imagerel $unwind$?au_free_page@@YAXPEAXH@Z
$pdata$?kmalloc@@YAPEAX_K@Z DD imagerel $LN10
	DD	imagerel $LN10+358
	DD	imagerel $unwind$?kmalloc@@YAPEAX_K@Z
$pdata$?kfree@@YAXPEAX@Z DD imagerel $LN6
	DD	imagerel $LN6+229
	DD	imagerel $unwind$?kfree@@YAXPEAX@Z
$pdata$?krealloc@@YAPEAXPEAX_K@Z DD imagerel $LN4
	DD	imagerel $LN4+77
	DD	imagerel $unwind$?krealloc@@YAPEAXPEAX_K@Z
$pdata$?kcalloc@@YAPEAX_K0@Z DD imagerel $LN4
	DD	imagerel $LN4+80
	DD	imagerel $unwind$?kcalloc@@YAPEAX_K0@Z
$pdata$?au_split_block@@YAXPEAU_meta_data_@@_K@Z DD imagerel $LN4
	DD	imagerel $LN4+207
	DD	imagerel $unwind$?au_split_block@@YAXPEAU_meta_data_@@_K@Z
$pdata$?au_expand_kmalloc@@YAX_K@Z DD imagerel $LN5
	DD	imagerel $LN5+312
	DD	imagerel $unwind$?au_expand_kmalloc@@YAX_K@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?au_request_page@@YAPEAXH@Z DD 010801H
	DD	08208H
$unwind$?au_free_page@@YAXPEAXH@Z DD 010d01H
	DD	0620dH
$unwind$?kmalloc@@YAPEAX_K@Z DD 010901H
	DD	0a209H
$unwind$?kfree@@YAXPEAX@Z DD 010901H
	DD	02209H
$unwind$?krealloc@@YAPEAXPEAX_K@Z DD 010e01H
	DD	0620eH
$unwind$?kcalloc@@YAPEAX_K0@Z DD 010e01H
	DD	0620eH
$unwind$?au_split_block@@YAXPEAU_meta_data_@@_K@Z DD 010e01H
	DD	0220eH
$unwind$?au_expand_kmalloc@@YAX_K@Z DD 010901H
	DD	08209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
meta$ = 32
req_pages$ = 40
desc_addr$ = 48
page$ = 56
req_size$ = 80
?au_expand_kmalloc@@YAX_K@Z PROC			; au_expand_kmalloc

; 62   : void au_expand_kmalloc(size_t req_size) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 63   : 	size_t req_pages = 1;

	mov	QWORD PTR req_pages$[rsp], 1

; 64   : 	if (req_size >= 4096)

	cmp	QWORD PTR req_size$[rsp], 4096		; 00001000H
	jb	SHORT $LN2@au_expand_

; 65   : 		req_pages = (req_size + sizeof(meta_data_t)) / 4096 + 1;

	mov	rax, QWORD PTR req_size$[rsp]
	add	rax, 48					; 00000030H
	xor	edx, edx
	mov	ecx, 4096				; 00001000H
	div	rcx
	inc	rax
	mov	QWORD PTR req_pages$[rsp], rax
$LN2@au_expand_:

; 66   : 
; 67   : 	void* page = au_request_page(req_pages);

	mov	ecx, DWORD PTR req_pages$[rsp]
	call	?au_request_page@@YAPEAXH@Z		; au_request_page
	mov	QWORD PTR page$[rsp], rax

; 68   : 	uint8_t* desc_addr = (uint8_t*)page;

	mov	rax, QWORD PTR page$[rsp]
	mov	QWORD PTR desc_addr$[rsp], rax

; 69   : 	/* setup the first meta data block */
; 70   : 	meta_data_t *meta = (meta_data_t*)desc_addr;

	mov	rax, QWORD PTR desc_addr$[rsp]
	mov	QWORD PTR meta$[rsp], rax

; 71   : 	meta->free = true;

	mov	rax, QWORD PTR meta$[rsp]
	mov	BYTE PTR [rax+16], 1

; 72   : 	meta->next = NULL;

	mov	rax, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rax+32], 0

; 73   : 	meta->prev = NULL;

	mov	rax, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rax+40], 0

; 74   : 	meta->magic = MAGIC_FREE;

	mov	rax, QWORD PTR meta$[rsp]
	mov	DWORD PTR [rax], 369500162		; 16062002H

; 75   : 	meta->eob_mark = (desc_addr + 4095);

	mov	rax, QWORD PTR desc_addr$[rsp]
	add	rax, 4095				; 00000fffH
	mov	rcx, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rcx+24], rax

; 76   : 
; 77   : 	/* meta->size holds only the usable area size for user */
; 78   : 	meta->size = req_pages * 4096 - sizeof(meta_data_t);

	imul	rax, QWORD PTR req_pages$[rsp], 4096	; 00001000H
	sub	rax, 48					; 00000030H
	mov	rcx, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rcx+8], rax

; 79   : 	last_block->next = meta;

	mov	rax, QWORD PTR ?last_block@@3PEAU_meta_data_@@EA ; last_block
	mov	rcx, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rax+32], rcx

; 80   : 	meta->prev = last_block;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR ?last_block@@3PEAU_meta_data_@@EA ; last_block
	mov	QWORD PTR [rax+40], rcx

; 81   : 	last_block = meta;

	mov	rax, QWORD PTR meta$[rsp]
	mov	QWORD PTR ?last_block@@3PEAU_meta_data_@@EA, rax ; last_block

; 82   : 
; 83   : 
; 84   : 	/* now check if we can merge the last block and this
; 85   : 	* into one
; 86   : 	*/
; 87   : 	if (meta->prev->free) {

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN1@au_expand_

; 88   : 		meta->prev->size += meta->size;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	rax, QWORD PTR [rax+8]
	mov	rcx, QWORD PTR meta$[rsp]
	add	rax, QWORD PTR [rcx+8]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+40]
	mov	QWORD PTR [rcx+8], rax

; 89   : 		meta->prev->next = NULL;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	QWORD PTR [rax+32], 0

; 90   : 		last_block = meta->prev;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	QWORD PTR ?last_block@@3PEAU_meta_data_@@EA, rax ; last_block
$LN1@au_expand_:

; 91   : 	}
; 92   : 	
; 93   : }

	add	rsp, 72					; 00000048H
	ret	0
?au_expand_kmalloc@@YAX_K@Z ENDP			; au_expand_kmalloc
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
new_block$ = 0
meta_block_a$ = 8
meta_block$ = 32
req_size$ = 40
?au_split_block@@YAXPEAU_meta_data_@@_K@Z PROC		; au_split_block

; 45   : void au_split_block(meta_data_t* meta_block, size_t req_size) {

$LN4:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 46   : 	uint8_t* meta_block_a = (uint8_t*)meta_block;	

	mov	rax, QWORD PTR meta_block$[rsp]
	mov	QWORD PTR meta_block_a$[rsp], rax

; 47   : 	meta_data_t* new_block = (meta_data_t*)(meta_block_a + sizeof(meta_data_t) + req_size);

	mov	rax, QWORD PTR meta_block_a$[rsp]
	mov	rcx, QWORD PTR req_size$[rsp]
	lea	rax, QWORD PTR [rax+rcx+48]
	mov	QWORD PTR new_block$[rsp], rax

; 48   : 	new_block->free = true;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	BYTE PTR [rax+16], 1

; 49   : 	new_block->eob_mark = meta_block->eob_mark;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	rcx, QWORD PTR meta_block$[rsp]
	mov	rcx, QWORD PTR [rcx+24]
	mov	QWORD PTR [rax+24], rcx

; 50   : 	new_block->magic = MAGIC_FREE;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	DWORD PTR [rax], 369500162		; 16062002H

; 51   : 	new_block->prev = meta_block;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	rcx, QWORD PTR meta_block$[rsp]
	mov	QWORD PTR [rax+40], rcx

; 52   : 	new_block->next = meta_block->next;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	rcx, QWORD PTR meta_block$[rsp]
	mov	rcx, QWORD PTR [rcx+32]
	mov	QWORD PTR [rax+32], rcx

; 53   : 	new_block->size = meta_block->size - req_size - sizeof(meta_data_t);

	mov	rax, QWORD PTR meta_block$[rsp]
	mov	rcx, QWORD PTR req_size$[rsp]
	mov	rax, QWORD PTR [rax+8]
	sub	rax, rcx
	sub	rax, 48					; 00000030H
	mov	rcx, QWORD PTR new_block$[rsp]
	mov	QWORD PTR [rcx+8], rax

; 54   : 	if (new_block->size < 0)

	mov	rax, QWORD PTR new_block$[rsp]
	cmp	QWORD PTR [rax+8], 0
	jae	SHORT $LN1@au_split_b

; 55   : 		new_block->size = 0;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	QWORD PTR [rax+8], 0
$LN1@au_split_b:

; 56   : 	meta_block->size = req_size + sizeof(meta_data_t);

	mov	rax, QWORD PTR req_size$[rsp]
	add	rax, 48					; 00000030H
	mov	rcx, QWORD PTR meta_block$[rsp]
	mov	QWORD PTR [rcx+8], rax

; 57   : 	meta_block->next = new_block;

	mov	rax, QWORD PTR meta_block$[rsp]
	mov	rcx, QWORD PTR new_block$[rsp]
	mov	QWORD PTR [rax+32], rcx

; 58   : 	last_block = new_block;

	mov	rax, QWORD PTR new_block$[rsp]
	mov	QWORD PTR ?last_block@@3PEAU_meta_data_@@EA, rax ; last_block

; 59   : }

	add	rsp, 24
	ret	0
?au_split_block@@YAXPEAU_meta_data_@@_K@Z ENDP		; au_split_block
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
ptr$ = 32
total$ = 40
n_item$ = 64
size$ = 72
?kcalloc@@YAPEAX_K0@Z PROC				; kcalloc

; 189  : void* kcalloc(size_t n_item, size_t size) {

$LN4:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 190  : 	size_t total = n_item * size;

	mov	rax, QWORD PTR n_item$[rsp]
	imul	rax, QWORD PTR size$[rsp]
	mov	QWORD PTR total$[rsp], rax

; 191  : 
; 192  : 	void* ptr = kmalloc(total);

	mov	rcx, QWORD PTR total$[rsp]
	call	?kmalloc@@YAPEAX_K@Z			; kmalloc
	mov	QWORD PTR ptr$[rsp], rax

; 193  : 	if (ptr)

	cmp	QWORD PTR ptr$[rsp], 0
	je	SHORT $LN1@kcalloc

; 194  : 		memset(ptr, 0, total);

	mov	r8d, DWORD PTR total$[rsp]
	xor	edx, edx
	mov	rcx, QWORD PTR ptr$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset
$LN1@kcalloc:

; 195  : 	return ptr;

	mov	rax, QWORD PTR ptr$[rsp]

; 196  : }

	add	rsp, 56					; 00000038H
	ret	0
?kcalloc@@YAPEAX_K0@Z ENDP				; kcalloc
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
result$ = 32
ptr$ = 64
new_size$ = 72
?krealloc@@YAPEAXPEAX_K@Z PROC				; krealloc

; 171  : void* krealloc(void* ptr, size_t new_size) {

$LN4:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 172  : 	void* result = kmalloc(new_size);

	mov	rcx, QWORD PTR new_size$[rsp]
	call	?kmalloc@@YAPEAX_K@Z			; kmalloc
	mov	QWORD PTR result$[rsp], rax

; 173  : 	if (ptr) {

	cmp	QWORD PTR ptr$[rsp], 0
	je	SHORT $LN1@krealloc

; 174  : 		/* here we can check the size difference
; 175  : 		 * of new_size and old size from internal
; 176  : 		 * data structure of kmalloc */
; 177  : 		memcpy(result, ptr, new_size);

	mov	r8d, DWORD PTR new_size$[rsp]
	mov	rdx, QWORD PTR ptr$[rsp]
	mov	rcx, QWORD PTR result$[rsp]
	call	memcpy
$LN1@krealloc:

; 178  : 	}
; 179  : 
; 180  : 	kfree(ptr);

	mov	rcx, QWORD PTR ptr$[rsp]
	call	?kfree@@YAXPEAX@Z			; kfree

; 181  : 	return result;

	mov	rax, QWORD PTR result$[rsp]

; 182  : }

	add	rsp, 56					; 00000038H
	ret	0
?krealloc@@YAPEAXPEAX_K@Z ENDP				; krealloc
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
meta$ = 0
actual_addr$ = 8
ptr$ = 32
?kfree@@YAXPEAX@Z PROC					; kfree

; 144  : void kfree(void* ptr) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 145  : 	uint8_t* actual_addr = (uint8_t*)ptr - sizeof(meta_data_t);

	mov	rax, QWORD PTR ptr$[rsp]
	sub	rax, 48					; 00000030H
	mov	QWORD PTR actual_addr$[rsp], rax

; 146  : 	meta_data_t *meta = (meta_data_t*)actual_addr;

	mov	rax, QWORD PTR actual_addr$[rsp]
	mov	QWORD PTR meta$[rsp], rax

; 147  : 	meta->free = true;

	mov	rax, QWORD PTR meta$[rsp]
	mov	BYTE PTR [rax+16], 1

; 148  : 
; 149  : 	/* merge it with 3 near blocks if they are free*/
; 150  : 
; 151  : 	if (meta->next && meta->next->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+32], 0
	je	SHORT $LN3@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN3@kfree

; 152  : 		meta->size += meta->next->size;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+8]
	add	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rcx+8], rax
$LN3@kfree:

; 153  : 	}
; 154  : 
; 155  : 	if (meta->prev && meta->prev->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+40], 0
	je	SHORT $LN2@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN2@kfree

; 156  : 		meta->prev->size += meta->size;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	rax, QWORD PTR [rax+8]
	mov	rcx, QWORD PTR meta$[rsp]
	add	rax, QWORD PTR [rcx+8]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+40]
	mov	QWORD PTR [rcx+8], rax

; 157  : 		meta->prev->next = meta->next;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+32]
	mov	QWORD PTR [rax+32], rcx
$LN2@kfree:

; 158  : 	}
; 159  : 
; 160  : 	if (meta->next && meta->next->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+32], 0
	je	SHORT $LN1@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN1@kfree

; 161  : 		meta->next->prev = meta->prev;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+40]
	mov	QWORD PTR [rax+40], rcx
$LN1@kfree:

; 162  : 	}
; 163  : 
; 164  : }

	add	rsp, 24
	ret	0
?kfree@@YAXPEAX@Z ENDP					; kfree
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
meta$1 = 32
meta$2 = 40
desc_addr$3 = 48
page$4 = 56
ptr$ = 64
size$ = 96
?kmalloc@@YAPEAX_K@Z PROC				; kmalloc

; 98   : void* kmalloc(size_t size) {

$LN10:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 88					; 00000058H

; 99   : 	if (first_block == NULL) {

	cmp	QWORD PTR ?first_block@@3PEAU_meta_data_@@EA, 0 ; first_block
	jne	$LN7@kmalloc

; 100  : 		void* page = au_request_page(1);

	mov	ecx, 1
	call	?au_request_page@@YAPEAXH@Z		; au_request_page
	mov	QWORD PTR page$4[rsp], rax

; 101  : 		/* setup the first meta data block */
; 102  : 		uint8_t* desc_addr = (uint8_t*)page;

	mov	rax, QWORD PTR page$4[rsp]
	mov	QWORD PTR desc_addr$3[rsp], rax

; 103  : 		meta_data_t *meta = (meta_data_t*)desc_addr;

	mov	rax, QWORD PTR desc_addr$3[rsp]
	mov	QWORD PTR meta$2[rsp], rax

; 104  : 		meta->free = true;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	BYTE PTR [rax+16], 1

; 105  : 		meta->next = NULL;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+32], 0

; 106  : 		meta->prev = NULL;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+40], 0

; 107  : 		meta->magic = MAGIC_FREE;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	DWORD PTR [rax], 369500162		; 16062002H

; 108  : 		meta->eob_mark = (desc_addr + 4095);

	mov	rax, QWORD PTR desc_addr$3[rsp]
	add	rax, 4095				; 00000fffH
	mov	rcx, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rcx+24], rax

; 109  : 		/* meta->size holds only the usable area size for user */
; 110  : 		meta->size = 4096 - sizeof(meta_data_t); 

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+8], 4048			; 00000fd0H

; 111  : 		first_block = meta;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR ?first_block@@3PEAU_meta_data_@@EA, rax ; first_block

; 112  : 		last_block = meta;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR ?last_block@@3PEAU_meta_data_@@EA, rax ; last_block
$LN7@kmalloc:

; 113  : 	}
; 114  : 
; 115  : 	
; 116  : 	void* ptr = 0;

	mov	QWORD PTR ptr$[rsp], 0

; 117  : 	for (meta_data_t *meta = first_block; meta != NULL; meta = meta->next) {

	mov	rax, QWORD PTR ?first_block@@3PEAU_meta_data_@@EA ; first_block
	mov	QWORD PTR meta$1[rsp], rax
	jmp	SHORT $LN6@kmalloc
$LN5@kmalloc:
	mov	rax, QWORD PTR meta$1[rsp]
	mov	rax, QWORD PTR [rax+32]
	mov	QWORD PTR meta$1[rsp], rax
$LN6@kmalloc:
	cmp	QWORD PTR meta$1[rsp], 0
	je	SHORT $LN4@kmalloc

; 118  : 		if (meta->free) {

	mov	rax, QWORD PTR meta$1[rsp]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN3@kmalloc

; 119  : 
; 120  : 			if (meta->size > size) {

	mov	rax, QWORD PTR meta$1[rsp]
	mov	rcx, QWORD PTR size$[rsp]
	cmp	QWORD PTR [rax+8], rcx
	jbe	SHORT $LN2@kmalloc

; 121  : 				au_split_block(meta, size);

	mov	rdx, QWORD PTR size$[rsp]
	mov	rcx, QWORD PTR meta$1[rsp]
	call	?au_split_block@@YAXPEAU_meta_data_@@_K@Z ; au_split_block

; 122  : 				meta->free = false;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	BYTE PTR [rax+16], 0

; 123  : 				meta->magic = MAGIC_USED;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	DWORD PTR [rax], 303112194		; 12112002H

; 124  : 				return ((uint8_t*)meta + sizeof(meta_data_t));

	mov	rax, QWORD PTR meta$1[rsp]
	add	rax, 48					; 00000030H
	jmp	SHORT $LN8@kmalloc
$LN2@kmalloc:

; 125  : 			}
; 126  : 
; 127  : 			if (meta->size == size) {

	mov	rax, QWORD PTR meta$1[rsp]
	mov	rcx, QWORD PTR size$[rsp]
	cmp	QWORD PTR [rax+8], rcx
	jne	SHORT $LN1@kmalloc

; 128  : 				meta->free = false;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	BYTE PTR [rax+16], 0

; 129  : 				meta->magic = MAGIC_USED;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	DWORD PTR [rax], 303112194		; 12112002H

; 130  : 				return ((uint8_t*)meta + sizeof(meta_data_t));

	mov	rax, QWORD PTR meta$1[rsp]
	add	rax, 48					; 00000030H
	jmp	SHORT $LN8@kmalloc
$LN1@kmalloc:
$LN3@kmalloc:

; 131  : 			}
; 132  : 		}
; 133  : 	}

	jmp	$LN5@kmalloc
$LN4@kmalloc:

; 134  : 
; 135  : 	au_expand_kmalloc(size);

	mov	rcx, QWORD PTR size$[rsp]
	call	?au_expand_kmalloc@@YAX_K@Z		; au_expand_kmalloc

; 136  : 	return kmalloc(size);

	mov	rcx, QWORD PTR size$[rsp]
	call	?kmalloc@@YAPEAX_K@Z			; kmalloc
$LN8@kmalloc:

; 137  : }

	add	rsp, 88					; 00000058H
	ret	0
?kmalloc@@YAPEAX_K@Z ENDP				; kmalloc
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
i$1 = 32
ptr$ = 64
pages$ = 72
?au_free_page@@YAXPEAXH@Z PROC				; au_free_page

; 215  : void au_free_page(void* ptr, int pages) {

$LN6:
	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 216  : 	for (int i = 0; i < pages; i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@au_free_pa
$LN2@au_free_pa:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@au_free_pa:
	mov	eax, DWORD PTR pages$[rsp]
	cmp	DWORD PTR i$1[rsp], eax
	jge	SHORT $LN1@au_free_pa

; 217  : 		x86_64_paging_free((uint64_t)ptr + i * 4096);

	imul	eax, DWORD PTR i$1[rsp], 4096		; 00001000H
	cdqe
	mov	rcx, QWORD PTR ptr$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, rax
	call	?x86_64_paging_free@@YA_N_K@Z		; x86_64_paging_free
	jmp	SHORT $LN2@au_free_pa
$LN1@au_free_pa:

; 218  : }

	add	rsp, 56					; 00000038H
	ret	0
?au_free_page@@YAXPEAXH@Z ENDP				; au_free_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
i$1 = 32
page$ = 40
tv72 = 48
pages$ = 80
?au_request_page@@YAPEAXH@Z PROC			; au_request_page

; 201  : void* au_request_page(int pages) {

$LN6:
	mov	DWORD PTR [rsp+8], ecx
	sub	rsp, 72					; 00000048H

; 202  : 	void* page = x86_64_get_free_page(false);

	xor	ecx, ecx
	call	?x86_64_get_free_page@@YAPEA_K_N@Z	; x86_64_get_free_page
	mov	QWORD PTR page$[rsp], rax

; 203  : 	for (int i = 0; i < pages; i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@au_request
$LN2@au_request:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@au_request:
	mov	eax, DWORD PTR pages$[rsp]
	cmp	DWORD PTR i$1[rsp], eax
	jge	SHORT $LN1@au_request

; 204  : 		x86_64_map_page((uint64_t)x86_64_pmmngr_alloc(), (uint64_t)page + i * 4096, 0);

	imul	eax, DWORD PTR i$1[rsp], 4096		; 00001000H
	cdqe
	mov	rcx, QWORD PTR page$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR tv72[rsp], rax
	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	xor	r8d, r8d
	mov	rcx, QWORD PTR tv72[rsp]
	mov	rdx, rcx
	mov	rcx, rax
	call	?x86_64_map_page@@YA_N_K0E@Z		; x86_64_map_page
	jmp	SHORT $LN2@au_request
$LN1@au_request:

; 205  : 
; 206  : 	return page;

	mov	rax, QWORD PTR page$[rsp]

; 207  : }

	add	rsp, 72					; 00000048H
	ret	0
?au_request_page@@YAPEAXH@Z ENDP			; au_request_page
_TEXT	ENDS
END
