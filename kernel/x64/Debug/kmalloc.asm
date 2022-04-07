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
PUBLIC	kmalloc
PUBLIC	kfree
PUBLIC	krealloc
PUBLIC	kcalloc
PUBLIC	?au_split_block@@YAXPEAU_meta_data_@@_K@Z	; au_split_block
PUBLIC	?au_expand_kmalloc@@YAX_K@Z			; au_expand_kmalloc
EXTRN	x86_64_map_page:PROC
EXTRN	x86_64_get_free_page:PROC
EXTRN	x86_64_paging_free:PROC
EXTRN	x86_64_pmmngr_alloc:PROC
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
EXTRN	memcpy:PROC
pdata	SEGMENT
$pdata$?au_request_page@@YAPEAXH@Z DD imagerel $LN6
	DD	imagerel $LN6+112
	DD	imagerel $unwind$?au_request_page@@YAPEAXH@Z
$pdata$?au_free_page@@YAXPEAXH@Z DD imagerel $LN6
	DD	imagerel $LN6+79
	DD	imagerel $unwind$?au_free_page@@YAXPEAXH@Z
$pdata$kmalloc DD imagerel $LN10
	DD	imagerel $LN10+349
	DD	imagerel $unwind$kmalloc
$pdata$kfree DD	imagerel $LN6
	DD	imagerel $LN6+229
	DD	imagerel $unwind$kfree
$pdata$krealloc DD imagerel $LN4
	DD	imagerel $LN4+77
	DD	imagerel $unwind$krealloc
$pdata$kcalloc DD imagerel $LN4
	DD	imagerel $LN4+80
	DD	imagerel $unwind$kcalloc
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
$unwind$kmalloc DD 010901H
	DD	08209H
$unwind$kfree DD 010901H
	DD	02209H
$unwind$krealloc DD 010e01H
	DD	0620eH
$unwind$kcalloc DD 010e01H
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
kcalloc	PROC

; 191  : void* kcalloc(size_t n_item, size_t size) {

$LN4:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 192  : 	size_t total = n_item * size;

	mov	rax, QWORD PTR n_item$[rsp]
	imul	rax, QWORD PTR size$[rsp]
	mov	QWORD PTR total$[rsp], rax

; 193  : 
; 194  : 	void* ptr = kmalloc(total);

	mov	rcx, QWORD PTR total$[rsp]
	call	kmalloc
	mov	QWORD PTR ptr$[rsp], rax

; 195  : 	if (ptr)

	cmp	QWORD PTR ptr$[rsp], 0
	je	SHORT $LN1@kcalloc

; 196  : 		memset(ptr, 0, total);

	mov	r8d, DWORD PTR total$[rsp]
	xor	edx, edx
	mov	rcx, QWORD PTR ptr$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset
$LN1@kcalloc:

; 197  : 	return ptr;

	mov	rax, QWORD PTR ptr$[rsp]

; 198  : }

	add	rsp, 56					; 00000038H
	ret	0
kcalloc	ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
result$ = 32
ptr$ = 64
new_size$ = 72
krealloc PROC

; 173  : void* krealloc(void* ptr, size_t new_size) {

$LN4:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 174  : 	void* result = kmalloc(new_size);

	mov	rcx, QWORD PTR new_size$[rsp]
	call	kmalloc
	mov	QWORD PTR result$[rsp], rax

; 175  : 	if (ptr) {

	cmp	QWORD PTR ptr$[rsp], 0
	je	SHORT $LN1@krealloc

; 176  : 		/* here we can check the size difference
; 177  : 		 * of new_size and old size from internal
; 178  : 		 * data structure of kmalloc */
; 179  : 		memcpy(result, ptr, new_size);

	mov	r8d, DWORD PTR new_size$[rsp]
	mov	rdx, QWORD PTR ptr$[rsp]
	mov	rcx, QWORD PTR result$[rsp]
	call	memcpy
$LN1@krealloc:

; 180  : 	}
; 181  : 
; 182  : 	kfree(ptr);

	mov	rcx, QWORD PTR ptr$[rsp]
	call	kfree

; 183  : 	return result;

	mov	rax, QWORD PTR result$[rsp]

; 184  : }

	add	rsp, 56					; 00000038H
	ret	0
krealloc ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
meta$ = 0
actual_addr$ = 8
ptr$ = 32
kfree	PROC

; 146  : void kfree(void* ptr) {

$LN6:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 24

; 147  : 	uint8_t* actual_addr = (uint8_t*)ptr - sizeof(meta_data_t);

	mov	rax, QWORD PTR ptr$[rsp]
	sub	rax, 48					; 00000030H
	mov	QWORD PTR actual_addr$[rsp], rax

; 148  : 	meta_data_t *meta = (meta_data_t*)actual_addr;

	mov	rax, QWORD PTR actual_addr$[rsp]
	mov	QWORD PTR meta$[rsp], rax

; 149  : 	meta->free = true;

	mov	rax, QWORD PTR meta$[rsp]
	mov	BYTE PTR [rax+16], 1

; 150  : 
; 151  : 	/* merge it with 3 near blocks if they are free*/
; 152  : 
; 153  : 	if (meta->next && meta->next->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+32], 0
	je	SHORT $LN3@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN3@kfree

; 154  : 		meta->size += meta->next->size;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+8]
	add	rcx, QWORD PTR [rax+8]
	mov	rax, rcx
	mov	rcx, QWORD PTR meta$[rsp]
	mov	QWORD PTR [rcx+8], rax
$LN3@kfree:

; 155  : 	}
; 156  : 
; 157  : 	if (meta->prev && meta->prev->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+40], 0
	je	SHORT $LN2@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN2@kfree

; 158  : 		meta->prev->size += meta->size;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	rax, QWORD PTR [rax+8]
	mov	rcx, QWORD PTR meta$[rsp]
	add	rax, QWORD PTR [rcx+8]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+40]
	mov	QWORD PTR [rcx+8], rax

; 159  : 		meta->prev->next = meta->next;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+40]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+32]
	mov	QWORD PTR [rax+32], rcx
$LN2@kfree:

; 160  : 	}
; 161  : 
; 162  : 	if (meta->next && meta->next->free) {

	mov	rax, QWORD PTR meta$[rsp]
	cmp	QWORD PTR [rax+32], 0
	je	SHORT $LN1@kfree
	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN1@kfree

; 163  : 		meta->next->prev = meta->prev;

	mov	rax, QWORD PTR meta$[rsp]
	mov	rax, QWORD PTR [rax+32]
	mov	rcx, QWORD PTR meta$[rsp]
	mov	rcx, QWORD PTR [rcx+40]
	mov	QWORD PTR [rax+40], rcx
$LN1@kfree:

; 164  : 	}
; 165  : 
; 166  : }

	add	rsp, 24
	ret	0
kfree	ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
meta$1 = 32
meta$2 = 40
desc_addr$3 = 48
page$4 = 56
size$ = 80
kmalloc	PROC

; 98   : void* kmalloc(size_t size) {

$LN10:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 99   : 
; 100  : 	/* kmalloc is not initialized, so initialize it*/
; 101  : 	if (first_block == NULL) {

	cmp	QWORD PTR ?first_block@@3PEAU_meta_data_@@EA, 0 ; first_block
	jne	$LN7@kmalloc

; 102  : 		void* page = au_request_page(1);

	mov	ecx, 1
	call	?au_request_page@@YAPEAXH@Z		; au_request_page
	mov	QWORD PTR page$4[rsp], rax

; 103  : 		/* setup the first meta data block */
; 104  : 		uint8_t* desc_addr = (uint8_t*)page;

	mov	rax, QWORD PTR page$4[rsp]
	mov	QWORD PTR desc_addr$3[rsp], rax

; 105  : 		meta_data_t *meta = (meta_data_t*)desc_addr;

	mov	rax, QWORD PTR desc_addr$3[rsp]
	mov	QWORD PTR meta$2[rsp], rax

; 106  : 		meta->free = true;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	BYTE PTR [rax+16], 1

; 107  : 		meta->next = NULL;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+32], 0

; 108  : 		meta->prev = NULL;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+40], 0

; 109  : 		meta->magic = MAGIC_FREE;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	DWORD PTR [rax], 369500162		; 16062002H

; 110  : 		meta->eob_mark = (desc_addr + 4095);

	mov	rax, QWORD PTR desc_addr$3[rsp]
	add	rax, 4095				; 00000fffH
	mov	rcx, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rcx+24], rax

; 111  : 		/* meta->size holds only the usable area size for user */
; 112  : 		meta->size = 4096 - sizeof(meta_data_t); 

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR [rax+8], 4048			; 00000fd0H

; 113  : 		first_block = meta;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR ?first_block@@3PEAU_meta_data_@@EA, rax ; first_block

; 114  : 		last_block = meta;

	mov	rax, QWORD PTR meta$2[rsp]
	mov	QWORD PTR ?last_block@@3PEAU_meta_data_@@EA, rax ; last_block
$LN7@kmalloc:

; 115  : 	}
; 116  : 
; 117  : 	
; 118  : 	/* now search begins */
; 119  : 	for (meta_data_t *meta = first_block; meta != NULL; meta = meta->next) {

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

; 120  : 		if (meta->free) {

	mov	rax, QWORD PTR meta$1[rsp]
	movzx	eax, BYTE PTR [rax+16]
	test	eax, eax
	je	SHORT $LN3@kmalloc

; 121  : 
; 122  : 			if (meta->size > size) {

	mov	rax, QWORD PTR meta$1[rsp]
	mov	rcx, QWORD PTR size$[rsp]
	cmp	QWORD PTR [rax+8], rcx
	jbe	SHORT $LN2@kmalloc

; 123  : 				au_split_block(meta, size);

	mov	rdx, QWORD PTR size$[rsp]
	mov	rcx, QWORD PTR meta$1[rsp]
	call	?au_split_block@@YAXPEAU_meta_data_@@_K@Z ; au_split_block

; 124  : 				meta->free = false;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	BYTE PTR [rax+16], 0

; 125  : 				meta->magic = MAGIC_USED;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	DWORD PTR [rax], 303112194		; 12112002H

; 126  : 				return ((uint8_t*)meta + sizeof(meta_data_t));

	mov	rax, QWORD PTR meta$1[rsp]
	add	rax, 48					; 00000030H
	jmp	SHORT $LN8@kmalloc
$LN2@kmalloc:

; 127  : 			}
; 128  : 
; 129  : 			if (meta->size == size) {

	mov	rax, QWORD PTR meta$1[rsp]
	mov	rcx, QWORD PTR size$[rsp]
	cmp	QWORD PTR [rax+8], rcx
	jne	SHORT $LN1@kmalloc

; 130  : 				meta->free = false;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	BYTE PTR [rax+16], 0

; 131  : 				meta->magic = MAGIC_USED;

	mov	rax, QWORD PTR meta$1[rsp]
	mov	DWORD PTR [rax], 303112194		; 12112002H

; 132  : 				return ((uint8_t*)meta + sizeof(meta_data_t));

	mov	rax, QWORD PTR meta$1[rsp]
	add	rax, 48					; 00000030H
	jmp	SHORT $LN8@kmalloc
$LN1@kmalloc:
$LN3@kmalloc:

; 133  : 			}
; 134  : 		}
; 135  : 	}

	jmp	$LN5@kmalloc
$LN4@kmalloc:

; 136  : 
; 137  : 	au_expand_kmalloc(size);

	mov	rcx, QWORD PTR size$[rsp]
	call	?au_expand_kmalloc@@YAX_K@Z		; au_expand_kmalloc

; 138  : 	return kmalloc(size);

	mov	rcx, QWORD PTR size$[rsp]
	call	kmalloc
$LN8@kmalloc:

; 139  : }

	add	rsp, 72					; 00000048H
	ret	0
kmalloc	ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\mm\kmalloc.cpp
_TEXT	SEGMENT
i$1 = 32
ptr$ = 64
pages$ = 72
?au_free_page@@YAXPEAXH@Z PROC				; au_free_page

; 217  : void au_free_page(void* ptr, int pages) {

$LN6:
	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H

; 218  : 	for (int i = 0; i < pages; i++)

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

; 219  : 		x86_64_paging_free((uint64_t)ptr + i * 4096);

	imul	eax, DWORD PTR i$1[rsp], 4096		; 00001000H
	cdqe
	mov	rcx, QWORD PTR ptr$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	rcx, rax
	call	x86_64_paging_free
	jmp	SHORT $LN2@au_free_pa
$LN1@au_free_pa:

; 220  : }

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

; 203  : void* au_request_page(int pages) {

$LN6:
	mov	DWORD PTR [rsp+8], ecx
	sub	rsp, 72					; 00000048H

; 204  : 	void* page = x86_64_get_free_page(false);

	xor	ecx, ecx
	call	x86_64_get_free_page
	mov	QWORD PTR page$[rsp], rax

; 205  : 	for (int i = 0; i < pages; i++)

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

; 206  : 		x86_64_map_page((uint64_t)x86_64_pmmngr_alloc(), (uint64_t)page + i * 4096, 0);

	imul	eax, DWORD PTR i$1[rsp], 4096		; 00001000H
	cdqe
	mov	rcx, QWORD PTR page$[rsp]
	add	rcx, rax
	mov	rax, rcx
	mov	QWORD PTR tv72[rsp], rax
	call	x86_64_pmmngr_alloc
	xor	r8d, r8d
	mov	rcx, QWORD PTR tv72[rsp]
	mov	rdx, rcx
	mov	rcx, rax
	call	x86_64_map_page
	jmp	SHORT $LN2@au_request
$LN1@au_request:

; 207  : 
; 208  : 	return page;

	mov	rax, QWORD PTR page$[rsp]

; 209  : }

	add	rsp, 72					; 00000048H
	ret	0
?au_request_page@@YAPEAXH@Z ENDP			; au_request_page
_TEXT	ENDS
END
