; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?x86_64_paging_init@@YAHXZ			; x86_64_paging_init
PUBLIC	?early_map_page@@YA_N_K0E@Z			; early_map_page
PUBLIC	?x86_64_phys_to_virt@@YA_K_K@Z			; x86_64_phys_to_virt
PUBLIC	?x86_64_virt_to_phys@@YA_K_K@Z			; x86_64_virt_to_phys
PUBLIC	?x86_64_map_page@@YA_N_K0E@Z			; x86_64_map_page
PUBLIC	?x86_64_get_free_page@@YAPEA_K_N@Z		; x86_64_get_free_page
PUBLIC	?x86_64_check_free@@YA_N_K@Z			; x86_64_check_free
PUBLIC	?pml4_index@@YA_K_K@Z				; pml4_index
PUBLIC	?pdp_index@@YA_K_K@Z				; pdp_index
PUBLIC	?pd_index@@YA_K_K@Z				; pd_index
PUBLIC	?pt_index@@YA_K_K@Z				; pt_index
PUBLIC	?p_index@@YA_K_K@Z				; p_index
EXTRN	?x86_64_pmmngr_alloc@@YAPEAXXZ:PROC		; x86_64_pmmngr_alloc
EXTRN	?x86_64_pmmngr_free@@YAXPEAX@Z:PROC		; x86_64_pmmngr_free
EXTRN	?x86_64_pmmngr_set_high@@YAX_N@Z:PROC		; x86_64_pmmngr_set_high
EXTRN	?x86_64_pmmngr_is_high_mem@@YA_NXZ:PROC		; x86_64_pmmngr_is_high_mem
EXTRN	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ:PROC	; x86_64_pmmngr_high_mem_bitmap
EXTRN	x64_mfence:PROC
EXTRN	x64_read_cr3:PROC
EXTRN	x64_write_cr3:PROC
EXTRN	flush_tlb:PROC
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
pdata	SEGMENT
$pdata$?x86_64_paging_init@@YAHXZ DD imagerel $LN15
	DD	imagerel $LN15+1052
	DD	imagerel $unwind$?x86_64_paging_init@@YAHXZ
$pdata$?early_map_page@@YA_N_K0E@Z DD imagerel $LN6
	DD	imagerel $LN6+562
	DD	imagerel $unwind$?early_map_page@@YA_N_K0E@Z
$pdata$?x86_64_phys_to_virt@@YA_K_K@Z DD imagerel $LN5
	DD	imagerel $LN5+56
	DD	imagerel $unwind$?x86_64_phys_to_virt@@YA_K_K@Z
$pdata$?x86_64_virt_to_phys@@YA_K_K@Z DD imagerel $LN5
	DD	imagerel $LN5+53
	DD	imagerel $unwind$?x86_64_virt_to_phys@@YA_K_K@Z
$pdata$?x86_64_map_page@@YA_N_K0E@Z DD imagerel $LN8
	DD	imagerel $LN8+690
	DD	imagerel $unwind$?x86_64_map_page@@YA_N_K0E@Z
$pdata$?x86_64_get_free_page@@YAPEA_K_N@Z DD imagerel $LN10
	DD	imagerel $LN10+347
	DD	imagerel $unwind$?x86_64_get_free_page@@YAPEA_K_N@Z
$pdata$?x86_64_check_free@@YA_N_K@Z DD imagerel $LN7
	DD	imagerel $LN7+273
	DD	imagerel $unwind$?x86_64_check_free@@YA_N_K@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_paging_init@@YAHXZ DD 020701H
	DD	0190107H
$unwind$?early_map_page@@YA_N_K0E@Z DD 021601H
	DD	0110116H
$unwind$?x86_64_phys_to_virt@@YA_K_K@Z DD 010901H
	DD	04209H
$unwind$?x86_64_virt_to_phys@@YA_K_K@Z DD 010901H
	DD	04209H
$unwind$?x86_64_map_page@@YA_N_K0E@Z DD 011301H
	DD	0e213H
$unwind$?x86_64_get_free_page@@YAPEA_K_N@Z DD 010801H
	DD	0a208H
$unwind$?x86_64_check_free@@YA_N_K@Z DD 010901H
	DD	08209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?p_index@@YA_K_K@Z PROC					; p_index

; 60   : size_t p_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 61   : 	return (addr & 0x7ff);

	mov	rax, QWORD PTR addr$[rsp]
	and	rax, 2047				; 000007ffH

; 62   : }

	ret	0
?p_index@@YA_K_K@Z ENDP					; p_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pt_index@@YA_K_K@Z PROC				; pt_index

; 56   : size_t pt_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 57   : 	return (addr >> 12) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH

; 58   : }

	ret	0
?pt_index@@YA_K_K@Z ENDP				; pt_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pd_index@@YA_K_K@Z PROC				; pd_index

; 52   : size_t pd_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 53   : 	return (addr >> 21) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH

; 54   : }

	ret	0
?pd_index@@YA_K_K@Z ENDP				; pd_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pdp_index@@YA_K_K@Z PROC				; pdp_index

; 48   : size_t pdp_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 49   : 	return (addr >> 30) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH

; 50   : }

	ret	0
?pdp_index@@YA_K_K@Z ENDP				; pdp_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pml4_index@@YA_K_K@Z PROC				; pml4_index

; 44   : size_t  pml4_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 45   : 	return (addr >> 39) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH

; 46   : }

	ret	0
?pml4_index@@YA_K_K@Z ENDP				; pml4_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
pml4$ = 32
pdpt$ = 40
pd$ = 48
pt$ = 56
start$ = 80
?x86_64_check_free@@YA_N_K@Z PROC			; x86_64_check_free

; 294  : bool x86_64_check_free(uint64_t start) {

$LN7:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 295  : 
; 296  : 	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	QWORD PTR pml4$[rsp], rax

; 297  : 
; 298  : 	if (!(pml4[pml4_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_che

; 299  : 		return true;

	mov	al, 1
	jmp	$LN5@x86_64_che
$LN4@x86_64_che:

; 300  : 
; 301  : 	uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pdpt$[rsp], rax

; 302  : 	if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_che

; 303  : 		return true;

	mov	al, 1
	jmp	$LN5@x86_64_che
$LN3@x86_64_che:

; 304  : 
; 305  : 	uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pd$[rsp], rax

; 306  : 	if (!(pd[pd_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_che

; 307  : 		return true;

	mov	al, 1
	jmp	SHORT $LN5@x86_64_che
$LN2@x86_64_che:

; 308  : 
; 309  : 	uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pt$[rsp], rax

; 310  : 
; 311  : 	if (!(pt[pt_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@x86_64_che

; 312  : 		return true;

	mov	al, 1
	jmp	SHORT $LN5@x86_64_che
$LN1@x86_64_che:

; 313  : 
; 314  : 	return false;

	xor	al, al
$LN5@x86_64_che:

; 315  : }

	add	rsp, 72					; 00000048H
	ret	0
?x86_64_check_free@@YA_N_K@Z ENDP			; x86_64_check_free
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
start$ = 32
pml4$ = 40
pdpt$1 = 48
pd$2 = 56
pt$3 = 64
page$ = 72
user$ = 96
?x86_64_get_free_page@@YAPEA_K_N@Z PROC			; x86_64_get_free_page

; 259  : uint64_t* x86_64_get_free_page(bool user) {

$LN10:
	mov	BYTE PTR [rsp+8], cl
	sub	rsp, 88					; 00000058H

; 260  : 	uint64_t* page = 0;

	mov	QWORD PTR page$[rsp], 0

; 261  : 	uint64_t start = PAGE_SEARCH_KERNEL;

	mov	rax, -35184372088832			; ffffe00000000000H
	mov	QWORD PTR start$[rsp], rax

; 262  : 	if (user)

	movzx	eax, BYTE PTR user$[rsp]
	test	eax, eax
	je	SHORT $LN7@x86_64_get

; 263  : 		start = PAGE_SEARCH_USER;

	mov	QWORD PTR start$[rsp], 0
$LN7@x86_64_get:

; 264  : 
; 265  : 	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	QWORD PTR pml4$[rsp], rax
$LN6@x86_64_get:

; 266  : 	
; 267  : 	/* Walk through every page tables */
; 268  : 	for (;;) {
; 269  : 		if (!(pml4[pml4_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_get

; 270  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	$LN8@x86_64_get
$LN4@x86_64_get:

; 271  : 
; 272  : 		uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pdpt$1[rsp], rax

; 273  : 		if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$1[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_get

; 274  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	$LN8@x86_64_get
$LN3@x86_64_get:

; 275  : 
; 276  : 		uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$1[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pd$2[rsp], rax

; 277  : 		if (!(pd[pd_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$2[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_get

; 278  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	SHORT $LN8@x86_64_get
$LN2@x86_64_get:

; 279  : 
; 280  : 		uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$2[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pt$3[rsp], rax

; 281  : 
; 282  : 		if (!(pt[pt_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$3[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@x86_64_get

; 283  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	SHORT $LN8@x86_64_get
$LN1@x86_64_get:

; 284  : 		
; 285  : 		start += 4096;

	mov	rax, QWORD PTR start$[rsp]
	add	rax, 4096				; 00001000H
	mov	QWORD PTR start$[rsp], rax

; 286  : 	}

	jmp	$LN6@x86_64_get

; 287  : 	return 0;

	xor	eax, eax
$LN8@x86_64_get:

; 288  : }

	add	rsp, 88					; 00000058H
	ret	0
?x86_64_get_free_page@@YAPEA_K_N@Z ENDP			; x86_64_get_free_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
i2$ = 32
i4$ = 36
i3$ = 40
i1$ = 44
flags$ = 48
page$1 = 56
pml3$ = 64
page$2 = 72
page$3 = 80
pml2$ = 88
pml4i$ = 96
pml1$ = 104
phys$ = 128
virt$ = 136
attrib$ = 144
?x86_64_map_page@@YA_N_K0E@Z PROC			; x86_64_map_page

; 202  : bool x86_64_map_page(uint64_t phys, uint64_t virt, uint8_t attrib) {

$LN8:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 203  : 
; 204  : 	if (!x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN5@x86_64_map

; 205  : 		return early_map_page(phys, virt, attrib);

	movzx	r8d, BYTE PTR attrib$[rsp]
	mov	rdx, QWORD PTR virt$[rsp]
	mov	rcx, QWORD PTR phys$[rsp]
	call	?early_map_page@@YA_N_K0E@Z		; early_map_page
	jmp	$LN6@x86_64_map
$LN5@x86_64_map:

; 206  : 
; 207  : 	size_t flags = PAGING_PRESENT | PAGING_WRITABLE | attrib;

	movzx	eax, BYTE PTR attrib$[rsp]
	or	eax, 3
	cdqe
	mov	QWORD PTR flags$[rsp], rax

; 208  : 
; 209  : 	const long i4 = (virt >> 39) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i4$[rsp], eax

; 210  : 	const long i3 = (virt >> 30) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i3$[rsp], eax

; 211  : 	const long i2 = (virt >> 21) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i2$[rsp], eax

; 212  : 	const long i1 = (virt >> 12) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i1$[rsp], eax

; 213  : 
; 214  : 	uint64_t *pml4i = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	QWORD PTR pml4i$[rsp], rax

; 215  : 
; 216  : 	if (!(pml4i[i4] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_map

; 217  : 		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$1[rsp], rax

; 218  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$1[rsp]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 219  : 		pml4i[i4] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$1[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i4$[rsp]
	mov	rdx, QWORD PTR pml4i$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 220  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$1[rsp]
	call	flush_tlb

; 221  : 		x64_mfence();

	call	x64_mfence
$LN4@x86_64_map:

; 222  : 	}
; 223  : 
; 224  : 	uint64_t* pml3 = (uint64_t*)(x86_64_phys_to_virt(pml4i[i4]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml3$[rsp], rax

; 225  : 	if (!(pml3[i3] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_map

; 226  : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$3[rsp], rax

; 227  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$3[rsp]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 228  : 		pml3[i3] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$3[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i3$[rsp]
	mov	rdx, QWORD PTR pml3$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 229  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$3[rsp]
	call	flush_tlb

; 230  : 		x64_mfence();

	call	x64_mfence
$LN3@x86_64_map:

; 231  : 	}
; 232  : 
; 233  : 	uint64_t* pml2 = (uint64_t*)(x86_64_phys_to_virt(pml3[i3]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml2$[rsp], rax

; 234  : 	if (!(pml2[i2] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_map

; 235  : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$2[rsp], rax

; 236  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$2[rsp]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 237  : 		pml2[i2] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$2[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i2$[rsp]
	mov	rdx, QWORD PTR pml2$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 238  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$2[rsp]
	call	flush_tlb

; 239  : 		x64_mfence();

	call	x64_mfence
$LN2@x86_64_map:

; 240  : 	}
; 241  : 
; 242  : 	uint64_t* pml1 = (uint64_t*)(x86_64_phys_to_virt(pml2[i2]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	?x86_64_phys_to_virt@@YA_K_K@Z		; x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml1$[rsp], rax

; 243  : 	if (pml1[i1] & PAGING_PRESENT) {

	movsxd	rax, DWORD PTR i1$[rsp]
	mov	rcx, QWORD PTR pml1$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	je	SHORT $LN1@x86_64_map

; 244  : 		x86_64_pmmngr_free((void*)phys);

	mov	rcx, QWORD PTR phys$[rsp]
	call	?x86_64_pmmngr_free@@YAXPEAX@Z		; x86_64_pmmngr_free

; 245  : 		return false;

	xor	al, al
	jmp	SHORT $LN6@x86_64_map
$LN1@x86_64_map:

; 246  : 	}
; 247  : 
; 248  : 	pml1[i1] = phys | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR phys$[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i1$[rsp]
	mov	rdx, QWORD PTR pml1$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 249  : 	flush_tlb((void*)virt);

	mov	rcx, QWORD PTR virt$[rsp]
	call	flush_tlb

; 250  : 	x64_mfence();

	call	x64_mfence

; 251  : 	return true;

	mov	al, 1
$LN6@x86_64_map:

; 252  : }

	add	rsp, 120				; 00000078H
	ret	0
?x86_64_map_page@@YA_N_K0E@Z ENDP			; x86_64_map_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
phys_addr$ = 48
?x86_64_virt_to_phys@@YA_K_K@Z PROC			; x86_64_virt_to_phys

; 189  : uint64_t x86_64_virt_to_phys(uint64_t phys_addr) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 190  : 	if (x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_vir

; 191  : 		return (phys_addr - PHYSICAL_MEMORY_BASE);

	mov	rax, 140737488355328			; 0000800000000000H
	mov	rcx, QWORD PTR phys_addr$[rsp]
	add	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN3@x86_64_vir

; 192  : 	else

	jmp	SHORT $LN1@x86_64_vir
$LN2@x86_64_vir:

; 193  : 		return 0;

	xor	eax, eax
$LN1@x86_64_vir:
$LN3@x86_64_vir:

; 194  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_virt_to_phys@@YA_K_K@Z ENDP			; x86_64_virt_to_phys
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
phys_addr$ = 48
?x86_64_phys_to_virt@@YA_K_K@Z PROC			; x86_64_phys_to_virt

; 178  : uint64_t x86_64_phys_to_virt(uint64_t phys_addr) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 179  : 	if (x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_phy

; 180  : 		return (PHYSICAL_MEMORY_BASE + phys_addr);

	mov	rax, 140737488355328			; 0000800000000000H
	mov	rcx, QWORD PTR phys_addr$[rsp]
	sub	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN3@x86_64_phy

; 181  : 	else

	jmp	SHORT $LN1@x86_64_phy
$LN2@x86_64_phy:

; 182  : 		return phys_addr;

	mov	rax, QWORD PTR phys_addr$[rsp]
$LN1@x86_64_phy:
$LN3@x86_64_phy:

; 183  : }

	add	rsp, 40					; 00000028H
	ret	0
?x86_64_phys_to_virt@@YA_K_K@Z ENDP			; x86_64_phys_to_virt
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
i3$ = 32
i2$ = 36
i4$ = 40
flags$ = 48
page$1 = 56
pml3$ = 64
i1$ = 72
page$2 = 80
page$3 = 88
pml2$ = 96
pml4i$ = 104
pml1$ = 112
physical_address$ = 144
virtual_address$ = 152
attrib$ = 160
?early_map_page@@YA_N_K0E@Z PROC			; early_map_page

; 71   : bool early_map_page(uint64_t physical_address, uint64_t virtual_address, uint8_t attrib){

$LN6:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 136				; 00000088H

; 72   : 	size_t flags = PAGING_WRITABLE | PAGING_PRESENT | attrib;

	movzx	eax, BYTE PTR attrib$[rsp]
	or	eax, 3
	cdqe
	mov	QWORD PTR flags$[rsp], rax

; 73   : 
; 74   : 	const long i4 = (virtual_address >> 39) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i4$[rsp], eax

; 75   : 	const long i3 = (virtual_address >> 30) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i3$[rsp], eax

; 76   : 	const long i2 = (virtual_address >> 21) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i2$[rsp], eax

; 77   : 	const long i1 = (virtual_address >> 12) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i1$[rsp], eax

; 78   : 
; 79   : 	uint64_t *pml4i = (uint64_t*)x64_read_cr3();

	call	x64_read_cr3
	mov	QWORD PTR pml4i$[rsp], rax

; 80   : 	if (!(pml4i[i4] & PAGING_PRESENT)){

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@early_map_

; 81   : 
; 82   : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$1[rsp], rax

; 83   : 		pml4i[i4] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$1[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i4$[rsp]
	mov	rdx, QWORD PTR pml4i$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 84   : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$1[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 85   : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$1[rsp]
	call	flush_tlb

; 86   : 		x64_mfence();

	call	x64_mfence
$LN3@early_map_:

; 87   : 	}
; 88   : 	uint64_t* pml3 = (uint64_t*)(pml4i[i4] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml3$[rsp], rax

; 89   : 
; 90   : 	if (!(pml3[i3] & PAGING_PRESENT))

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@early_map_

; 91   : 	{
; 92   : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$3[rsp], rax

; 93   : 		pml3[i3] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$3[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i3$[rsp]
	mov	rdx, QWORD PTR pml3$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 94   : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$3[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 95   : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$3[rsp]
	call	flush_tlb

; 96   : 		x64_mfence();

	call	x64_mfence
$LN2@early_map_:

; 97   : 	}
; 98   : 
; 99   : 	uint64_t* pml2 = (uint64_t*)(pml3[i3] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml2$[rsp], rax

; 100  : 
; 101  : 	if (!(pml2[i2] & PAGING_PRESENT)){

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@early_map_

; 102  : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR page$2[rsp], rax

; 103  : 		pml2[i2] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$2[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i2$[rsp]
	mov	rdx, QWORD PTR pml2$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 104  : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$2[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 105  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$2[rsp]
	call	flush_tlb

; 106  : 		x64_mfence();

	call	x64_mfence
$LN1@early_map_:

; 107  : 	}
; 108  : 
; 109  : 	uint64_t* pml1 = (uint64_t*)(pml2[i2] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml1$[rsp], rax

; 110  : 
; 111  : 	pml1[i1] = physical_address | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR physical_address$[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i1$[rsp]
	mov	rdx, QWORD PTR pml1$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 112  : 	flush_tlb((void*)virtual_address);

	mov	rcx, QWORD PTR virtual_address$[rsp]
	call	flush_tlb

; 113  : 	x64_mfence();

	call	x64_mfence

; 114  : 	return true;

	mov	al, 1

; 115  : }

	add	rsp, 136				; 00000088H
	ret	0
?early_map_page@@YA_N_K0E@Z ENDP			; early_map_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
i$1 = 32
pd$ = 40
pdpt$ = 48
i$2 = 56
new_cr3$ = 64
i$3 = 72
old_cr3$ = 80
tv149 = 88
tv193 = 96
tv138 = 104
tv204 = 112
tv160 = 120
tv215 = 128
tv182 = 136
tv226 = 144
tv171 = 152
tv238 = 160
tv128 = 168
pd2$ = 176
?x86_64_paging_init@@YAHXZ PROC				; x86_64_paging_init

; 121  : int x86_64_paging_init() {

$LN15:
	sub	rsp, 200				; 000000c8H

; 122  : 
; 123  : 	uint64_t* old_cr3 = (uint64_t*)x64_read_cr3();

	call	x64_read_cr3
	mov	QWORD PTR old_cr3$[rsp], rax

; 124  : 	uint64_t* new_cr3 = (uint64_t*)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR new_cr3$[rsp], rax

; 125  : 	memset(new_cr3, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR new_cr3$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 126  : 
; 127  : 	/* copy entire address space to new address space */
; 128  : 	for (int i = 0; i < 512; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN12@x86_64_pag
$LN11@x86_64_pag:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN12@x86_64_pag:
	cmp	DWORD PTR i$1[rsp], 512			; 00000200H
	jge	SHORT $LN10@x86_64_pag

; 129  : 		if (i == 511)

	cmp	DWORD PTR i$1[rsp], 511			; 000001ffH
	jne	SHORT $LN9@x86_64_pag

; 130  : 			continue;

	jmp	SHORT $LN11@x86_64_pag
$LN9@x86_64_pag:

; 131  : 
; 132  : 		if ((old_cr3[i] & 0x1))

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR old_cr3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	je	SHORT $LN8@x86_64_pag

; 133  : 			new_cr3[i] = old_cr3[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR new_cr3$[rsp]
	mov	r8, QWORD PTR old_cr3$[rsp]
	mov	rax, QWORD PTR [r8+rax*8]
	mov	QWORD PTR [rdx+rcx*8], rax

; 134  : 		else

	jmp	SHORT $LN7@x86_64_pag
$LN8@x86_64_pag:

; 135  : 			new_cr3[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR new_cr3$[rsp]
	mov	QWORD PTR [rcx+rax*8], 0
$LN7@x86_64_pag:

; 136  : 	}

	jmp	SHORT $LN11@x86_64_pag
$LN10@x86_64_pag:

; 137  : 
; 138  : 	x64_write_cr3((size_t)new_cr3);

	mov	rcx, QWORD PTR new_cr3$[rsp]
	call	x64_write_cr3

; 139  : 
; 140  : 	/* Here! map 16 GiB of Physical Memory to Virtual Memory */
; 141  : 
; 142  : 	uint64_t* pdpt = (uint64_t*)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR pdpt$[rsp], rax

; 143  : 	uint64_t* pd = (uint64_t*)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR pd$[rsp], rax

; 144  : 	uint64_t* pd2 = (uint64_t*)x86_64_pmmngr_alloc();

	call	?x86_64_pmmngr_alloc@@YAPEAXXZ		; x86_64_pmmngr_alloc
	mov	QWORD PTR pd2$[rsp], rax

; 145  : 
; 146  : 	new_cr3[pml4_index(PHYSICAL_MEMORY_BASE)] = (uintptr_t)pdpt | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, DWORD PTR pdpt$[rsp]
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv128[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR new_cr3$[rsp]
	mov	rdx, QWORD PTR tv128[rsp]
	mov	QWORD PTR [rcx+rax*8], rdx

; 147  : 
; 148  : 	/* Point the pdpt entry to 8GiB PD */
; 149  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE)] = (uintptr_t)&pd[0] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 0
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv138[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv138[rsp]
	mov	QWORD PTR [rcx+rax*8], rdx

; 150  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 1] = (uintptr_t)&pd[512] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 512				; 00000200H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv149[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv149[rsp]
	mov	QWORD PTR [rcx+rax*8+8], rdx

; 151  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 2] = (uintptr_t)&pd[1024] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 1024				; 00000400H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv160[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv160[rsp]
	mov	QWORD PTR [rcx+rax*8+16], rdx

; 152  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 3] = (uintptr_t)&pd[1536] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 1536				; 00000600H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv171[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv171[rsp]
	mov	QWORD PTR [rcx+rax*8+24], rdx

; 153  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 4] = (uintptr_t)&pd[2048] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 2048				; 00000800H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv182[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv182[rsp]
	mov	QWORD PTR [rcx+rax*8+32], rdx

; 154  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 5] = (uintptr_t)&pd[2560] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 2560				; 00000a00H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv193[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv193[rsp]
	mov	QWORD PTR [rcx+rax*8+40], rdx

; 155  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 6] = (uintptr_t)&pd[3072] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 3072				; 00000c00H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv204[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv204[rsp]
	mov	QWORD PTR [rcx+rax*8+48], rdx

; 156  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 7] = (uintptr_t)&pd[3584] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 3584				; 00000e00H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv215[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv215[rsp]
	mov	QWORD PTR [rcx+rax*8+56], rdx

; 157  : 	pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + 8] = (uintptr_t)&pd[4096] | PAGING_PRESENT | PAGING_WRITABLE;

	mov	eax, 8
	imul	rax, rax, 4096				; 00001000H
	mov	rcx, QWORD PTR pd$[rsp]
	add	rcx, rax
	mov	rax, rcx
	or	eax, 1
	or	eax, 2
	mov	eax, eax
	mov	QWORD PTR tv226[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv226[rsp]
	mov	QWORD PTR [rcx+rax*8+64], rdx

; 158  : 
; 159  : 	/* First 8 GiB mapped , 2MB pages*/
; 160  : 	for (size_t i = 0; i <= 4096; i++) {

	mov	QWORD PTR i$3[rsp], 0
	jmp	SHORT $LN6@x86_64_pag
$LN5@x86_64_pag:
	mov	rax, QWORD PTR i$3[rsp]
	inc	rax
	mov	QWORD PTR i$3[rsp], rax
$LN6@x86_64_pag:
	cmp	QWORD PTR i$3[rsp], 4096		; 00001000H
	ja	SHORT $LN4@x86_64_pag

; 161  : 		pd[pd_index(PHYSICAL_MEMORY_BASE) + i] = i * 512 * 4096 | 0x80 | PAGING_PRESENT | PAGING_WRITABLE;

	imul	rax, QWORD PTR i$3[rsp], 512		; 00000200H
	imul	rax, rax, 4096				; 00001000H
	bts	rax, 7
	or	rax, 1
	or	rax, 2
	mov	QWORD PTR tv238[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pd_index@@YA_K_K@Z			; pd_index
	add	rax, QWORD PTR i$3[rsp]
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rdx, QWORD PTR tv238[rsp]
	mov	QWORD PTR [rcx+rax*8], rdx

; 162  : 	}

	jmp	SHORT $LN5@x86_64_pag
$LN4@x86_64_pag:

; 163  : 
; 164  : 
; 165  : 	for (int i = 0; i < 256; i++)

	mov	DWORD PTR i$2[rsp], 0
	jmp	SHORT $LN3@x86_64_pag
$LN2@x86_64_pag:
	mov	eax, DWORD PTR i$2[rsp]
	inc	eax
	mov	DWORD PTR i$2[rsp], eax
$LN3@x86_64_pag:
	cmp	DWORD PTR i$2[rsp], 256			; 00000100H
	jge	SHORT $LN1@x86_64_pag

; 166  : 		new_cr3[i] = 0;

	movsxd	rax, DWORD PTR i$2[rsp]
	mov	rcx, QWORD PTR new_cr3$[rsp]
	mov	QWORD PTR [rcx+rax*8], 0
	jmp	SHORT $LN2@x86_64_pag
$LN1@x86_64_pag:

; 167  : 
; 168  : 	/* from here we are fully boot free*/
; 169  : 	x86_64_pmmngr_set_high(true);

	mov	cl, 1
	call	?x86_64_pmmngr_set_high@@YAX_N@Z	; x86_64_pmmngr_set_high

; 170  : 	x86_64_pmmngr_high_mem_bitmap();

	call	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ	; x86_64_pmmngr_high_mem_bitmap

; 171  : 	return 0;

	xor	eax, eax

; 172  : }

	add	rsp, 200				; 000000c8H
	ret	0
?x86_64_paging_init@@YAHXZ ENDP				; x86_64_paging_init
_TEXT	ENDS
END
