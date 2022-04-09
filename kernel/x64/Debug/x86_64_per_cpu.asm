; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?per_cpu_set_cpu_id@@YAXE@Z			; per_cpu_set_cpu_id
PUBLIC	?per_cpu_set_c_thread@@YAXPEAX@Z		; per_cpu_set_c_thread
PUBLIC	?per_cpu_get_cpu_id@@YAEXZ			; per_cpu_get_cpu_id
PUBLIC	?per_cpu_get_c_thread@@YAPEAXXZ			; per_cpu_get_c_thread
EXTRN	x64_read_gs_b:PROC
EXTRN	x64_read_gs_q:PROC
EXTRN	x64_write_gs_b:PROC
EXTRN	x64_write_gs_q:PROC
pdata	SEGMENT
$pdata$?per_cpu_set_cpu_id@@YAXE@Z DD imagerel $LN3
	DD	imagerel $LN3+25
	DD	imagerel $unwind$?per_cpu_set_cpu_id@@YAXE@Z
$pdata$?per_cpu_set_c_thread@@YAXPEAX@Z DD imagerel $LN3
	DD	imagerel $LN3+29
	DD	imagerel $unwind$?per_cpu_set_c_thread@@YAXPEAX@Z
$pdata$?per_cpu_get_cpu_id@@YAEXZ DD imagerel $LN3
	DD	imagerel $LN3+16
	DD	imagerel $unwind$?per_cpu_get_cpu_id@@YAEXZ
$pdata$?per_cpu_get_c_thread@@YAPEAXXZ DD imagerel $LN3
	DD	imagerel $LN3+19
	DD	imagerel $unwind$?per_cpu_get_c_thread@@YAPEAXXZ
pdata	ENDS
xdata	SEGMENT
$unwind$?per_cpu_set_cpu_id@@YAXE@Z DD 010801H
	DD	04208H
$unwind$?per_cpu_set_c_thread@@YAXPEAX@Z DD 010901H
	DD	04209H
$unwind$?per_cpu_get_cpu_id@@YAEXZ DD 010401H
	DD	04204H
$unwind$?per_cpu_get_c_thread@@YAPEAXXZ DD 010401H
	DD	04204H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_per_cpu.cpp
_TEXT	SEGMENT
?per_cpu_get_c_thread@@YAPEAXXZ PROC			; per_cpu_get_c_thread

; 62   : void* per_cpu_get_c_thread() {

$LN3:
	sub	rsp, 40					; 00000028H

; 63   : 	return (void*)x64_read_gs_q(1);

	mov	ecx, 1
	call	x64_read_gs_q

; 64   : }

	add	rsp, 40					; 00000028H
	ret	0
?per_cpu_get_c_thread@@YAPEAXXZ ENDP			; per_cpu_get_c_thread
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_per_cpu.cpp
_TEXT	SEGMENT
?per_cpu_get_cpu_id@@YAEXZ PROC				; per_cpu_get_cpu_id

; 55   : uint8_t per_cpu_get_cpu_id() {

$LN3:
	sub	rsp, 40					; 00000028H

; 56   : 	return x64_read_gs_b(0);

	xor	ecx, ecx
	call	x64_read_gs_b

; 57   : }

	add	rsp, 40					; 00000028H
	ret	0
?per_cpu_get_cpu_id@@YAEXZ ENDP				; per_cpu_get_cpu_id
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_per_cpu.cpp
_TEXT	SEGMENT
thread$ = 48
?per_cpu_set_c_thread@@YAXPEAX@Z PROC			; per_cpu_set_c_thread

; 47   : void per_cpu_set_c_thread(void* thread) {

$LN3:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 40					; 00000028H

; 48   : 	x64_write_gs_q(1, (uint64_t)thread);

	mov	rdx, QWORD PTR thread$[rsp]
	mov	ecx, 1
	call	x64_write_gs_q

; 49   : }

	add	rsp, 40					; 00000028H
	ret	0
?per_cpu_set_c_thread@@YAXPEAX@Z ENDP			; per_cpu_set_c_thread
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\arch\x86_64\x86_64_per_cpu.cpp
_TEXT	SEGMENT
id$ = 48
?per_cpu_set_cpu_id@@YAXE@Z PROC			; per_cpu_set_cpu_id

; 38   : void per_cpu_set_cpu_id(uint8_t id) {

$LN3:
	mov	BYTE PTR [rsp+8], cl
	sub	rsp, 40					; 00000028H

; 39   : 	x64_write_gs_b(0, id);

	movzx	edx, BYTE PTR id$[rsp]
	xor	ecx, ecx
	call	x64_write_gs_b

; 40   : }

	add	rsp, 40					; 00000028H
	ret	0
?per_cpu_set_cpu_id@@YAXE@Z ENDP			; per_cpu_set_cpu_id
_TEXT	ENDS
END
