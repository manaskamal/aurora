; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?fb_@@3U_au_fb_@@A				; fb_
_BSS	SEGMENT
?fb_@@3U_au_fb_@@A DB 018H DUP (?)			; fb_
_BSS	ENDS
PUBLIC	?au_fb_initialize@@YAHXZ			; au_fb_initialize
PUBLIC	?au_video_get_fb@@YAPEAIXZ			; au_video_get_fb
PUBLIC	?au_video_get_pixels_per_line@@YAGXZ		; au_video_get_pixels_per_line
PUBLIC	?au_video_get_x_res@@YAIXZ			; au_video_get_x_res
PUBLIC	?au_video_get_y_res@@YAIXZ			; au_video_get_y_res
EXTRN	x86_64_map_page:PROC
EXTRN	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ:PROC	; au_get_boot_info
pdata	SEGMENT
$pdata$?au_fb_initialize@@YAHXZ DD imagerel $LN6
	DD	imagerel $LN6+191
	DD	imagerel $unwind$?au_fb_initialize@@YAHXZ
pdata	ENDS
xdata	SEGMENT
$unwind$?au_fb_initialize@@YAHXZ DD 010401H
	DD	06204H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\au_video.cpp
_TEXT	SEGMENT
?au_video_get_y_res@@YAIXZ PROC				; au_video_get_y_res

; 80   : 	return fb_.y_resolution;

	mov	eax, DWORD PTR ?fb_@@3U_au_fb_@@A+4

; 81   : }

	ret	0
?au_video_get_y_res@@YAIXZ ENDP				; au_video_get_y_res
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\au_video.cpp
_TEXT	SEGMENT
?au_video_get_x_res@@YAIXZ PROC				; au_video_get_x_res

; 73   : 	return fb_.x_resolution;

	mov	eax, DWORD PTR ?fb_@@3U_au_fb_@@A

; 74   : }

	ret	0
?au_video_get_x_res@@YAIXZ ENDP				; au_video_get_x_res
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\au_video.cpp
_TEXT	SEGMENT
?au_video_get_pixels_per_line@@YAGXZ PROC		; au_video_get_pixels_per_line

; 66   : 	return fb_.pixels_per_scanline;

	movzx	eax, WORD PTR ?fb_@@3U_au_fb_@@A+8

; 67   : }

	ret	0
?au_video_get_pixels_per_line@@YAGXZ ENDP		; au_video_get_pixels_per_line
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\au_video.cpp
_TEXT	SEGMENT
?au_video_get_fb@@YAPEAIXZ PROC				; au_video_get_fb

; 58   : 	return fb_.framebuffer;

	mov	rax, QWORD PTR ?fb_@@3U_au_fb_@@A+16

; 59   : }

	ret	0
?au_video_get_fb@@YAPEAIXZ ENDP				; au_video_get_fb
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\kdrivers\au_video.cpp
_TEXT	SEGMENT
i$1 = 32
phys_fb$ = 40
?au_fb_initialize@@YAHXZ PROC				; au_fb_initialize

; 41   : int au_fb_initialize() {

$LN6:
	sub	rsp, 56					; 00000038H

; 42   : 	uint32_t* phys_fb = au_get_boot_info()->fb_addr;

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	rax, QWORD PTR [rax+40]
	mov	QWORD PTR phys_fb$[rsp], rax

; 43   : 
; 44   : 	for (size_t i = 0; i < au_get_boot_info()->fb_size / 4096; i++)

	mov	QWORD PTR i$1[rsp], 0
	jmp	SHORT $LN3@au_fb_init
$LN2@au_fb_init:
	mov	rax, QWORD PTR i$1[rsp]
	inc	rax
	mov	QWORD PTR i$1[rsp], rax
$LN3@au_fb_init:
	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	xor	edx, edx
	mov	rax, QWORD PTR [rax+48]
	mov	ecx, 4096				; 00001000H
	div	rcx
	cmp	QWORD PTR i$1[rsp], rax
	jae	SHORT $LN1@au_fb_init

; 45   : 		x86_64_map_page((uint64_t)phys_fb + i * 4096, FRAMEBUFFER_ADDRESS + i * 4096, 0);

	imul	rax, QWORD PTR i$1[rsp], 4096		; 00001000H
	mov	rcx, 52776558133248			; 0000300000000000H
	sub	rax, rcx
	imul	rcx, QWORD PTR i$1[rsp], 4096		; 00001000H
	mov	rdx, QWORD PTR phys_fb$[rsp]
	add	rdx, rcx
	mov	rcx, rdx
	xor	r8d, r8d
	mov	rdx, rax
	call	x86_64_map_page
	jmp	SHORT $LN2@au_fb_init
$LN1@au_fb_init:

; 46   : 
; 47   : 	fb_.framebuffer = (uint32_t*)FRAMEBUFFER_ADDRESS;

	mov	rax, -52776558133248			; ffffd00000000000H
	mov	QWORD PTR ?fb_@@3U_au_fb_@@A+16, rax

; 48   : 	fb_.pixels_per_scanline = au_get_boot_info()->pixels_per_line;

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	movzx	eax, WORD PTR [rax+64]
	mov	WORD PTR ?fb_@@3U_au_fb_@@A+8, ax

; 49   : 	fb_.x_resolution = au_get_boot_info()->x_res;

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	eax, DWORD PTR [rax+56]
	mov	DWORD PTR ?fb_@@3U_au_fb_@@A, eax

; 50   : 	fb_.y_resolution = au_get_boot_info()->y_res;

	call	?au_get_boot_info@@YAPEAU_AURORA_INFO_@@XZ ; au_get_boot_info
	mov	eax, DWORD PTR [rax+60]
	mov	DWORD PTR ?fb_@@3U_au_fb_@@A+4, eax

; 51   : 	return 0;

	xor	eax, eax

; 52   : }

	add	rsp, 56					; 00000038H
	ret	0
?au_fb_initialize@@YAHXZ ENDP				; au_fb_initialize
_TEXT	ENDS
END
