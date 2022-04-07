; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?boot_cr3@@3PEA_KEA				; boot_cr3
_BSS	SEGMENT
?boot_cr3@@3PEA_KEA DQ 01H DUP (?)			; boot_cr3
_BSS	ENDS
PUBLIC	?x86_64_paging_init@@YAHXZ			; x86_64_paging_init
PUBLIC	?early_map_page@@YA_N_K0E@Z			; early_map_page
PUBLIC	x86_64_phys_to_virt
PUBLIC	x86_64_virt_to_phys
PUBLIC	x86_64_map_page
PUBLIC	x86_64_get_free_page
PUBLIC	x86_64_check_free
PUBLIC	x86_64_get_boot_pml
PUBLIC	?x86_64_boot_free@@YAXXZ			; x86_64_boot_free
PUBLIC	x86_64_paging_free
PUBLIC	?pml4_index@@YA_K_K@Z				; pml4_index
PUBLIC	?pdp_index@@YA_K_K@Z				; pdp_index
PUBLIC	?pd_index@@YA_K_K@Z				; pd_index
PUBLIC	?pt_index@@YA_K_K@Z				; pt_index
PUBLIC	?p_index@@YA_K_K@Z				; p_index
EXTRN	x86_64_pmmngr_alloc:PROC
EXTRN	x86_64_pmmngr_free:PROC
EXTRN	?x86_64_pmmngr_set_high@@YAX_N@Z:PROC		; x86_64_pmmngr_set_high
EXTRN	?x86_64_pmmngr_is_high_mem@@YA_NXZ:PROC		; x86_64_pmmngr_is_high_mem
EXTRN	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ:PROC	; x86_64_pmmngr_high_mem_bitmap
EXTRN	x64_mfence:PROC
EXTRN	x64_read_cr3:PROC
EXTRN	x64_write_cr3:PROC
EXTRN	flush_tlb:PROC
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
pdata	SEGMENT
$pdata$?x86_64_paging_init@@YAHXZ DD imagerel $LN12
	DD	imagerel $LN12+457
	DD	imagerel $unwind$?x86_64_paging_init@@YAHXZ
$pdata$?early_map_page@@YA_N_K0E@Z DD imagerel $LN6
	DD	imagerel $LN6+562
	DD	imagerel $unwind$?early_map_page@@YA_N_K0E@Z
$pdata$x86_64_phys_to_virt DD imagerel $LN5
	DD	imagerel $LN5+56
	DD	imagerel $unwind$x86_64_phys_to_virt
$pdata$x86_64_virt_to_phys DD imagerel $LN5
	DD	imagerel $LN5+56
	DD	imagerel $unwind$x86_64_virt_to_phys
$pdata$x86_64_map_page DD imagerel $LN8
	DD	imagerel $LN8+690
	DD	imagerel $unwind$x86_64_map_page
$pdata$x86_64_get_free_page DD imagerel $LN10
	DD	imagerel $LN10+347
	DD	imagerel $unwind$x86_64_get_free_page
$pdata$x86_64_check_free DD imagerel $LN7
	DD	imagerel $LN7+273
	DD	imagerel $unwind$x86_64_check_free
$pdata$?x86_64_boot_free@@YAXXZ DD imagerel $LN6
	DD	imagerel $LN6+69
	DD	imagerel $unwind$?x86_64_boot_free@@YAXXZ
$pdata$x86_64_paging_free DD imagerel $LN7
	DD	imagerel $LN7+339
	DD	imagerel $unwind$x86_64_paging_free
pdata	ENDS
xdata	SEGMENT
$unwind$?x86_64_paging_init@@YAHXZ DD 010401H
	DD	0c204H
$unwind$?early_map_page@@YA_N_K0E@Z DD 021601H
	DD	0110116H
$unwind$x86_64_phys_to_virt DD 010901H
	DD	04209H
$unwind$x86_64_virt_to_phys DD 010901H
	DD	04209H
$unwind$x86_64_map_page DD 011301H
	DD	0e213H
$unwind$x86_64_get_free_page DD 010801H
	DD	0a208H
$unwind$x86_64_check_free DD 010901H
	DD	08209H
$unwind$?x86_64_boot_free@@YAXXZ DD 010401H
	DD	06204H
$unwind$x86_64_paging_free DD 010901H
	DD	0a209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?p_index@@YA_K_K@Z PROC					; p_index

; 61   : size_t p_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 62   : 	return (addr & 0x7ff);

	mov	rax, QWORD PTR addr$[rsp]
	and	rax, 2047				; 000007ffH

; 63   : }

	ret	0
?p_index@@YA_K_K@Z ENDP					; p_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pt_index@@YA_K_K@Z PROC				; pt_index

; 57   : size_t pt_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 58   : 	return (addr >> 12) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH

; 59   : }

	ret	0
?pt_index@@YA_K_K@Z ENDP				; pt_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pd_index@@YA_K_K@Z PROC				; pd_index

; 53   : size_t pd_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 54   : 	return (addr >> 21) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH

; 55   : }

	ret	0
?pd_index@@YA_K_K@Z ENDP				; pd_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pdp_index@@YA_K_K@Z PROC				; pdp_index

; 49   : size_t pdp_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 50   : 	return (addr >> 30) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH

; 51   : }

	ret	0
?pdp_index@@YA_K_K@Z ENDP				; pdp_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
addr$ = 8
?pml4_index@@YA_K_K@Z PROC				; pml4_index

; 45   : size_t  pml4_index(uint64_t addr){

	mov	QWORD PTR [rsp+8], rcx

; 46   : 	return (addr >> 39) & 0x1ff;

	mov	rax, QWORD PTR addr$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH

; 47   : }

	ret	0
?pml4_index@@YA_K_K@Z ENDP				; pml4_index
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
pt$ = 32
pml4$ = 40
pdpt$ = 48
pd$ = 56
page$ = 64
start$ = 96
x86_64_paging_free PROC

; 324  : bool x86_64_paging_free(uint64_t start) {

$LN7:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 88					; 00000058H

; 325  : 
; 326  : 	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	QWORD PTR pml4$[rsp], rax

; 327  : 
; 328  : 	if (!(pml4[pml4_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_pag

; 329  : 		return false;

	xor	al, al
	jmp	$LN5@x86_64_pag
$LN4@x86_64_pag:

; 330  : 
; 331  : 	uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pdpt$[rsp], rax

; 332  : 	if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_pag

; 333  : 		return false;

	xor	al, al
	jmp	$LN5@x86_64_pag
$LN3@x86_64_pag:

; 334  : 
; 335  : 	uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pd$[rsp], rax

; 336  : 	if (!(pd[pd_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_pag

; 337  : 		return false;

	xor	al, al
	jmp	$LN5@x86_64_pag
$LN2@x86_64_pag:

; 338  : 
; 339  : 	uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pt$[rsp], rax

; 340  : 
; 341  : 	if (!(pt[pt_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@x86_64_pag

; 342  : 		return false;

	xor	al, al
	jmp	SHORT $LN5@x86_64_pag
$LN1@x86_64_pag:

; 343  : 
; 344  : 	uint64_t *page = (uint64_t*)(pt[pt_index(start)] & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR page$[rsp], rax

; 345  : 	x86_64_pmmngr_free(page);

	mov	rcx, QWORD PTR page$[rsp]
	call	x86_64_pmmngr_free

; 346  : 
; 347  : 	pt[pt_index(start)] = 0;

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$[rsp]
	mov	QWORD PTR [rcx+rax*8], 0

; 348  : 
; 349  : 
; 350  : 	return false;

	xor	al, al
$LN5@x86_64_pag:

; 351  : }

	add	rsp, 88					; 00000058H
	ret	0
x86_64_paging_free ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
i$1 = 32
cr3$ = 40
?x86_64_boot_free@@YAXXZ PROC				; x86_64_boot_free

; 170  : void x86_64_boot_free() {

$LN6:
	sub	rsp, 56					; 00000038H

; 171  : 	uint64_t *cr3 = (uint64_t*)x64_read_cr3();

	call	x64_read_cr3
	mov	QWORD PTR cr3$[rsp], rax

; 172  : 	for (int i = 0; i < 256; i++)

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@x86_64_boo
$LN2@x86_64_boo:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN3@x86_64_boo:
	cmp	DWORD PTR i$1[rsp], 256			; 00000100H
	jge	SHORT $LN1@x86_64_boo

; 173  : 		cr3[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR cr3$[rsp]
	mov	QWORD PTR [rcx+rax*8], 0
	jmp	SHORT $LN2@x86_64_boo
$LN1@x86_64_boo:

; 174  : }

	add	rsp, 56					; 00000038H
	ret	0
?x86_64_boot_free@@YAXXZ ENDP				; x86_64_boot_free
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
x86_64_get_boot_pml PROC

; 357  : 	return boot_cr3;

	mov	rax, QWORD PTR ?boot_cr3@@3PEA_KEA	; boot_cr3

; 358  : }

	ret	0
x86_64_get_boot_pml ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
pml4$ = 32
pdpt$ = 40
pd$ = 48
pt$ = 56
start$ = 80
x86_64_check_free PROC

; 296  : bool x86_64_check_free(uint64_t start) {

$LN7:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 72					; 00000048H

; 297  : 
; 298  : 	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	QWORD PTR pml4$[rsp], rax

; 299  : 
; 300  : 	if (!(pml4[pml4_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_che

; 301  : 		return true;

	mov	al, 1
	jmp	$LN5@x86_64_che
$LN4@x86_64_che:

; 302  : 
; 303  : 	uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pdpt$[rsp], rax

; 304  : 	if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_che

; 305  : 		return true;

	mov	al, 1
	jmp	$LN5@x86_64_che
$LN3@x86_64_che:

; 306  : 
; 307  : 	uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pd$[rsp], rax

; 308  : 	if (!(pd[pd_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_che

; 309  : 		return true;

	mov	al, 1
	jmp	SHORT $LN5@x86_64_che
$LN2@x86_64_che:

; 310  : 
; 311  : 	uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pt$[rsp], rax

; 312  : 
; 313  : 	if (!(pt[pt_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@x86_64_che

; 314  : 		return true;

	mov	al, 1
	jmp	SHORT $LN5@x86_64_che
$LN1@x86_64_che:

; 315  : 
; 316  : 	return false;

	xor	al, al
$LN5@x86_64_che:

; 317  : }

	add	rsp, 72					; 00000048H
	ret	0
x86_64_check_free ENDP
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
x86_64_get_free_page PROC

; 261  : uint64_t* x86_64_get_free_page(bool user) {

$LN10:
	mov	BYTE PTR [rsp+8], cl
	sub	rsp, 88					; 00000058H

; 262  : 	uint64_t* page = 0;

	mov	QWORD PTR page$[rsp], 0

; 263  : 	uint64_t start = PAGE_SEARCH_KERNEL;

	mov	rax, -35184372088832			; ffffe00000000000H
	mov	QWORD PTR start$[rsp], rax

; 264  : 	if (user)

	movzx	eax, BYTE PTR user$[rsp]
	test	eax, eax
	je	SHORT $LN7@x86_64_get

; 265  : 		start = PAGE_SEARCH_USER;

	mov	QWORD PTR start$[rsp], 0
$LN7@x86_64_get:

; 266  : 
; 267  : 	uint64_t *pml4 = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	QWORD PTR pml4$[rsp], rax
$LN6@x86_64_get:

; 268  : 	
; 269  : 	/* Walk through every page tables */
; 270  : 	for (;;) {
; 271  : 		if (!(pml4[pml4_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_get

; 272  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	$LN8@x86_64_get
$LN4@x86_64_get:

; 273  : 
; 274  : 		uint64_t *pdpt = (uint64_t*)(x86_64_phys_to_virt(pml4[pml4_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR pml4$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pdpt$1[rsp], rax

; 275  : 		if (!(pdpt[pdp_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$1[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_get

; 276  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	$LN8@x86_64_get
$LN3@x86_64_get:

; 277  : 
; 278  : 		uint64_t *pd = (uint64_t*)(x86_64_phys_to_virt(pdpt[pdp_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	mov	rcx, QWORD PTR pdpt$1[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pd$2[rsp], rax

; 279  : 		if (!(pd[pd_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$2[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_get

; 280  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	SHORT $LN8@x86_64_get
$LN2@x86_64_get:

; 281  : 
; 282  : 		uint64_t *pt = (uint64_t*)(x86_64_phys_to_virt(pd[pd_index(start)]) & ~(4096 - 1));

	mov	rcx, QWORD PTR start$[rsp]
	call	?pd_index@@YA_K_K@Z			; pd_index
	mov	rcx, QWORD PTR pd$2[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pt$3[rsp], rax

; 283  : 
; 284  : 		if (!(pt[pt_index(start)] & PAGING_PRESENT))

	mov	rcx, QWORD PTR start$[rsp]
	call	?pt_index@@YA_K_K@Z			; pt_index
	mov	rcx, QWORD PTR pt$3[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@x86_64_get

; 285  : 			return (uint64_t*)start;

	mov	rax, QWORD PTR start$[rsp]
	jmp	SHORT $LN8@x86_64_get
$LN1@x86_64_get:

; 286  : 		
; 287  : 		start += 4096;

	mov	rax, QWORD PTR start$[rsp]
	add	rax, 4096				; 00001000H
	mov	QWORD PTR start$[rsp], rax

; 288  : 	}

	jmp	$LN6@x86_64_get

; 289  : 	return 0;

	xor	eax, eax
$LN8@x86_64_get:

; 290  : }

	add	rsp, 88					; 00000058H
	ret	0
x86_64_get_free_page ENDP
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
x86_64_map_page PROC

; 204  : bool x86_64_map_page(uint64_t phys, uint64_t virt, uint8_t attrib) {

$LN8:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 205  : 
; 206  : 	if (!x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	jne	SHORT $LN5@x86_64_map

; 207  : 		return early_map_page(phys, virt, attrib);

	movzx	r8d, BYTE PTR attrib$[rsp]
	mov	rdx, QWORD PTR virt$[rsp]
	mov	rcx, QWORD PTR phys$[rsp]
	call	?early_map_page@@YA_N_K0E@Z		; early_map_page
	jmp	$LN6@x86_64_map
$LN5@x86_64_map:

; 208  : 
; 209  : 	size_t flags = PAGING_PRESENT | PAGING_WRITABLE | attrib;

	movzx	eax, BYTE PTR attrib$[rsp]
	or	eax, 3
	cdqe
	mov	QWORD PTR flags$[rsp], rax

; 210  : 
; 211  : 	const long i4 = (virt >> 39) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i4$[rsp], eax

; 212  : 	const long i3 = (virt >> 30) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i3$[rsp], eax

; 213  : 	const long i2 = (virt >> 21) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i2$[rsp], eax

; 214  : 	const long i1 = (virt >> 12) & 0x1FF;

	mov	rax, QWORD PTR virt$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i1$[rsp], eax

; 215  : 
; 216  : 	uint64_t *pml4i = (uint64_t*)x86_64_phys_to_virt(x64_read_cr3());

	call	x64_read_cr3
	mov	rcx, rax
	call	x86_64_phys_to_virt
	mov	QWORD PTR pml4i$[rsp], rax

; 217  : 
; 218  : 	if (!(pml4i[i4] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN4@x86_64_map

; 219  : 		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$1[rsp], rax

; 220  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$1[rsp]
	call	x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 221  : 		pml4i[i4] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$1[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i4$[rsp]
	mov	rdx, QWORD PTR pml4i$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 222  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$1[rsp]
	call	flush_tlb

; 223  : 		x64_mfence();

	call	x64_mfence
$LN4@x86_64_map:

; 224  : 	}
; 225  : 	
; 226  : 	uint64_t* pml3 = (uint64_t*)(x86_64_phys_to_virt(pml4i[i4]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml3$[rsp], rax

; 227  : 	if (!(pml3[i3] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@x86_64_map

; 228  : 		uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$3[rsp], rax

; 229  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$3[rsp]
	call	x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 230  : 		pml3[i3] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$3[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i3$[rsp]
	mov	rdx, QWORD PTR pml3$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 231  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$3[rsp]
	call	flush_tlb

; 232  : 		x64_mfence();

	call	x64_mfence
$LN3@x86_64_map:

; 233  : 	}
; 234  : 	
; 235  : 	uint64_t* pml2 = (uint64_t*)(x86_64_phys_to_virt(pml3[i3]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml2$[rsp], rax

; 236  : 	if (!(pml2[i2] & PAGING_PRESENT)) {

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@x86_64_map

; 237  : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$2[rsp], rax

; 238  : 		memset((void*)x86_64_phys_to_virt(page), 0, 4096);

	mov	rcx, QWORD PTR page$2[rsp]
	call	x86_64_phys_to_virt
	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, rax
	call	?memset@@YAXPEAXEI@Z			; memset

; 239  : 		pml2[i2] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$2[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i2$[rsp]
	mov	rdx, QWORD PTR pml2$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 240  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$2[rsp]
	call	flush_tlb

; 241  : 		x64_mfence();

	call	x64_mfence
$LN2@x86_64_map:

; 242  : 	}
; 243  : 
; 244  : 	uint64_t* pml1 = (uint64_t*)(x86_64_phys_to_virt(pml2[i2]) & ~(4096 - 1));

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rcx, QWORD PTR [rcx+rax*8]
	call	x86_64_phys_to_virt
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml1$[rsp], rax

; 245  : 	if (pml1[i1] & PAGING_PRESENT) {

	movsxd	rax, DWORD PTR i1$[rsp]
	mov	rcx, QWORD PTR pml1$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	je	SHORT $LN1@x86_64_map

; 246  : 		x86_64_pmmngr_free((void*)phys);

	mov	rcx, QWORD PTR phys$[rsp]
	call	x86_64_pmmngr_free

; 247  : 		return false;

	xor	al, al
	jmp	SHORT $LN6@x86_64_map
$LN1@x86_64_map:

; 248  : 	}
; 249  : 
; 250  : 	pml1[i1] = phys | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR phys$[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i1$[rsp]
	mov	rdx, QWORD PTR pml1$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 251  : 	flush_tlb((void*)virt);

	mov	rcx, QWORD PTR virt$[rsp]
	call	flush_tlb

; 252  : 	x64_mfence();

	call	x64_mfence

; 253  : 	return true;

	mov	al, 1
$LN6@x86_64_map:

; 254  : }

	add	rsp, 120				; 00000078H
	ret	0
x86_64_map_page ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
phys_addr$ = 48
x86_64_virt_to_phys PROC

; 191  : uint64_t x86_64_virt_to_phys(uint64_t phys_addr) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 192  : 	if (x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_vir

; 193  : 		return (phys_addr - PHYSICAL_MEMORY_BASE);

	mov	rax, 140737488355328			; 0000800000000000H
	mov	rcx, QWORD PTR phys_addr$[rsp]
	add	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN3@x86_64_vir

; 194  : 	else

	jmp	SHORT $LN1@x86_64_vir
$LN2@x86_64_vir:

; 195  : 		return phys_addr;

	mov	rax, QWORD PTR phys_addr$[rsp]
$LN1@x86_64_vir:
$LN3@x86_64_vir:

; 196  : }

	add	rsp, 40					; 00000028H
	ret	0
x86_64_virt_to_phys ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
phys_addr$ = 48
x86_64_phys_to_virt PROC

; 180  : uint64_t x86_64_phys_to_virt(uint64_t phys_addr) {

$LN5:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 181  : 	if (x86_64_pmmngr_is_high_mem())

	call	?x86_64_pmmngr_is_high_mem@@YA_NXZ	; x86_64_pmmngr_is_high_mem
	movzx	eax, al
	test	eax, eax
	je	SHORT $LN2@x86_64_phy

; 182  : 		return (PHYSICAL_MEMORY_BASE + phys_addr);

	mov	rax, 140737488355328			; 0000800000000000H
	mov	rcx, QWORD PTR phys_addr$[rsp]
	sub	rcx, rax
	mov	rax, rcx
	jmp	SHORT $LN3@x86_64_phy

; 183  : 	else

	jmp	SHORT $LN1@x86_64_phy
$LN2@x86_64_phy:

; 184  : 		return phys_addr;

	mov	rax, QWORD PTR phys_addr$[rsp]
$LN1@x86_64_phy:
$LN3@x86_64_phy:

; 185  : }

	add	rsp, 40					; 00000028H
	ret	0
x86_64_phys_to_virt ENDP
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

; 72   : bool early_map_page(uint64_t physical_address, uint64_t virtual_address, uint8_t attrib){

$LN6:
	mov	BYTE PTR [rsp+24], r8b
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 136				; 00000088H

; 73   : 	size_t flags = PAGING_WRITABLE | PAGING_PRESENT | attrib;

	movzx	eax, BYTE PTR attrib$[rsp]
	or	eax, 3
	cdqe
	mov	QWORD PTR flags$[rsp], rax

; 74   : 
; 75   : 	const long i4 = (virtual_address >> 39) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 39					; 00000027H
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i4$[rsp], eax

; 76   : 	const long i3 = (virtual_address >> 30) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 30
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i3$[rsp], eax

; 77   : 	const long i2 = (virtual_address >> 21) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 21
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i2$[rsp], eax

; 78   : 	const long i1 = (virtual_address >> 12) & 0x1FF;

	mov	rax, QWORD PTR virtual_address$[rsp]
	shr	rax, 12
	and	rax, 511				; 000001ffH
	mov	DWORD PTR i1$[rsp], eax

; 79   : 
; 80   : 	uint64_t *pml4i = (uint64_t*)x64_read_cr3();

	call	x64_read_cr3
	mov	QWORD PTR pml4i$[rsp], rax

; 81   : 	if (!(pml4i[i4] & PAGING_PRESENT)){

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN3@early_map_

; 82   : 
; 83   : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$1[rsp], rax

; 84   : 		pml4i[i4] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$1[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i4$[rsp]
	mov	rdx, QWORD PTR pml4i$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 85   : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$1[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 86   : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$1[rsp]
	call	flush_tlb

; 87   : 		x64_mfence();

	call	x64_mfence
$LN3@early_map_:

; 88   : 	}
; 89   : 	uint64_t* pml3 = (uint64_t*)(pml4i[i4] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i4$[rsp]
	mov	rcx, QWORD PTR pml4i$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml3$[rsp], rax

; 90   : 
; 91   : 	if (!(pml3[i3] & PAGING_PRESENT))

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN2@early_map_

; 92   : 	{
; 93   : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$3[rsp], rax

; 94   : 		pml3[i3] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$3[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i3$[rsp]
	mov	rdx, QWORD PTR pml3$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 95   : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$3[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 96   : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$3[rsp]
	call	flush_tlb

; 97   : 		x64_mfence();

	call	x64_mfence
$LN2@early_map_:

; 98   : 	}
; 99   : 
; 100  : 	uint64_t* pml2 = (uint64_t*)(pml3[i3] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i3$[rsp]
	mov	rcx, QWORD PTR pml3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml2$[rsp], rax

; 101  : 
; 102  : 	if (!(pml2[i2] & PAGING_PRESENT)){

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	jne	SHORT $LN1@early_map_

; 103  : 		const uint64_t page = (uint64_t)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR page$2[rsp], rax

; 104  : 		pml2[i2] = page | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR page$2[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i2$[rsp]
	mov	rdx, QWORD PTR pml2$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 105  : 		memset((void*)page, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR page$2[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 106  : 		flush_tlb((void*)page);

	mov	rcx, QWORD PTR page$2[rsp]
	call	flush_tlb

; 107  : 		x64_mfence();

	call	x64_mfence
$LN1@early_map_:

; 108  : 	}
; 109  : 
; 110  : 	uint64_t* pml1 = (uint64_t*)(pml2[i2] & ~(4096 - 1));

	movsxd	rax, DWORD PTR i2$[rsp]
	mov	rcx, QWORD PTR pml2$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, -4096				; fffffffffffff000H
	mov	QWORD PTR pml1$[rsp], rax

; 111  : 
; 112  : 	pml1[i1] = physical_address | flags;

	mov	rax, QWORD PTR flags$[rsp]
	mov	rcx, QWORD PTR physical_address$[rsp]
	or	rcx, rax
	mov	rax, rcx
	movsxd	rcx, DWORD PTR i1$[rsp]
	mov	rdx, QWORD PTR pml1$[rsp]
	mov	QWORD PTR [rdx+rcx*8], rax

; 113  : 	flush_tlb((void*)virtual_address);

	mov	rcx, QWORD PTR virtual_address$[rsp]
	call	flush_tlb

; 114  : 	x64_mfence();

	call	x64_mfence

; 115  : 	return true;

	mov	al, 1

; 116  : }

	add	rsp, 136				; 00000088H
	ret	0
?early_map_page@@YA_N_K0E@Z ENDP			; early_map_page
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_paging.cpp
_TEXT	SEGMENT
i$1 = 32
new_cr3$ = 40
i$2 = 48
old_cr3$ = 56
pdpt$ = 64
tv95 = 72
tv140 = 80
tv145 = 88
?x86_64_paging_init@@YAHXZ PROC				; x86_64_paging_init

; 122  : int x86_64_paging_init() {

$LN12:
	sub	rsp, 104				; 00000068H

; 123  : 
; 124  : 	uint64_t* old_cr3 = (uint64_t*)x64_read_cr3();

	call	x64_read_cr3
	mov	QWORD PTR old_cr3$[rsp], rax

; 125  : 	boot_cr3 = old_cr3;

	mov	rax, QWORD PTR old_cr3$[rsp]
	mov	QWORD PTR ?boot_cr3@@3PEA_KEA, rax	; boot_cr3

; 126  : 	uint64_t* new_cr3 = (uint64_t*)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR new_cr3$[rsp], rax

; 127  : 	memset(new_cr3, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR new_cr3$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 128  : 
; 129  : 	/* copy entire address space to new address space */
; 130  : 	for (int i = 0; i < 512; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN9@x86_64_pag
$LN8@x86_64_pag:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN9@x86_64_pag:
	cmp	DWORD PTR i$1[rsp], 512			; 00000200H
	jge	SHORT $LN7@x86_64_pag

; 131  : 		if (i == 511)

	cmp	DWORD PTR i$1[rsp], 511			; 000001ffH
	jne	SHORT $LN6@x86_64_pag

; 132  : 			continue;

	jmp	SHORT $LN8@x86_64_pag
$LN6@x86_64_pag:

; 133  : 
; 134  : 		if ((old_cr3[i] & 0x1))

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR old_cr3$[rsp]
	mov	rax, QWORD PTR [rcx+rax*8]
	and	rax, 1
	test	rax, rax
	je	SHORT $LN5@x86_64_pag

; 135  : 			new_cr3[i] = old_cr3[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR new_cr3$[rsp]
	mov	r8, QWORD PTR old_cr3$[rsp]
	mov	rax, QWORD PTR [r8+rax*8]
	mov	QWORD PTR [rdx+rcx*8], rax

; 136  : 		else

	jmp	SHORT $LN4@x86_64_pag
$LN5@x86_64_pag:

; 137  : 			new_cr3[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR new_cr3$[rsp]
	mov	QWORD PTR [rcx+rax*8], 0
$LN4@x86_64_pag:

; 138  : 	}

	jmp	SHORT $LN8@x86_64_pag
$LN7@x86_64_pag:

; 139  : 
; 140  : 	/* Here! map 16 GiB of Physical Memory to Virtual Memory */
; 141  : 
; 142  : 	uint64_t* pdpt = (uint64_t*)x86_64_pmmngr_alloc();

	call	x86_64_pmmngr_alloc
	mov	QWORD PTR pdpt$[rsp], rax

; 143  : 	memset(pdpt, 0, 4096);

	mov	r8d, 4096				; 00001000H
	xor	edx, edx
	mov	rcx, QWORD PTR pdpt$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 144  : 
; 145  : 
; 146  : 	new_cr3[pml4_index(PHYSICAL_MEMORY_BASE)] = (uint64_t)pdpt | PAGING_PRESENT | PAGING_WRITABLE;

	mov	rax, QWORD PTR pdpt$[rsp]
	or	rax, 1
	or	rax, 2
	mov	QWORD PTR tv95[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR new_cr3$[rsp]
	mov	rdx, QWORD PTR tv95[rsp]
	mov	QWORD PTR [rcx+rax*8], rdx

; 147  : 
; 148  : 	/* Map entire 512 GiB of Physical Memory using 1GiB pages */
; 149  : 	for (size_t i = 0; i < 512; i++)

	mov	QWORD PTR i$2[rsp], 0
	jmp	SHORT $LN3@x86_64_pag
$LN2@x86_64_pag:
	mov	rax, QWORD PTR i$2[rsp]
	inc	rax
	mov	QWORD PTR i$2[rsp], rax
$LN3@x86_64_pag:
	cmp	QWORD PTR i$2[rsp], 512			; 00000200H
	jae	SHORT $LN1@x86_64_pag

; 150  : 		pdpt[pdp_index(PHYSICAL_MEMORY_BASE) + i] = i * 512 * 512 * 4096 | 0x80 | PAGING_PRESENT | PAGING_WRITABLE;

	imul	rax, QWORD PTR i$2[rsp], 512		; 00000200H
	imul	rax, rax, 512				; 00000200H
	imul	rax, rax, 4096				; 00001000H
	bts	rax, 7
	or	rax, 1
	or	rax, 2
	mov	QWORD PTR tv140[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pdp_index@@YA_K_K@Z			; pdp_index
	add	rax, QWORD PTR i$2[rsp]
	mov	rcx, QWORD PTR pdpt$[rsp]
	mov	rdx, QWORD PTR tv140[rsp]
	mov	QWORD PTR [rcx+rax*8], rdx
	jmp	SHORT $LN2@x86_64_pag
$LN1@x86_64_pag:

; 151  : 	
; 152  : 
; 153  : 	/* Copy the mappings to boot page tables */
; 154  : 	boot_cr3[pml4_index(PHYSICAL_MEMORY_BASE)] = new_cr3[pml4_index(PHYSICAL_MEMORY_BASE)];

	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	QWORD PTR tv145[rsp], rax
	mov	rcx, -140737488355328			; ffff800000000000H
	call	?pml4_index@@YA_K_K@Z			; pml4_index
	mov	rcx, QWORD PTR ?boot_cr3@@3PEA_KEA	; boot_cr3
	mov	rdx, QWORD PTR new_cr3$[rsp]
	mov	r8, QWORD PTR tv145[rsp]
	mov	rdx, QWORD PTR [rdx+r8*8]
	mov	QWORD PTR [rcx+rax*8], rdx

; 155  : 
; 156  : 	boot_cr3 = new_cr3;

	mov	rax, QWORD PTR new_cr3$[rsp]
	mov	QWORD PTR ?boot_cr3@@3PEA_KEA, rax	; boot_cr3

; 157  : 
; 158  : 	x64_write_cr3((size_t)new_cr3);

	mov	rcx, QWORD PTR new_cr3$[rsp]
	call	x64_write_cr3

; 159  : 
; 160  : 	/* from here, every physical page = higher half virtual page */
; 161  : 	x86_64_pmmngr_set_high(true);

	mov	cl, 1
	call	?x86_64_pmmngr_set_high@@YAX_N@Z	; x86_64_pmmngr_set_high

; 162  : 	x86_64_pmmngr_high_mem_bitmap();

	call	?x86_64_pmmngr_high_mem_bitmap@@YAXXZ	; x86_64_pmmngr_high_mem_bitmap

; 163  : 
; 164  : 	return 0;

	xor	eax, eax

; 165  : }

	add	rsp, 104				; 00000068H
	ret	0
?x86_64_paging_init@@YAHXZ ENDP				; x86_64_paging_init
_TEXT	ENDS
END
