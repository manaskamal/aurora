; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG2792	DB	'/dev', 00H
	ORG $+3
$SG2795	DB	'/dev', 00H
CONST	ENDS
PUBLIC	?devfs_initialize@@YAXXZ			; devfs_initialize
PUBLIC	?devfs_deinitialize@@YAXXZ			; devfs_deinitialize
EXTRN	?memset@@YAXPEAXEI@Z:PROC			; memset
EXTRN	vfs_mknode:PROC
EXTRN	vfs_mkdir:PROC
EXTRN	vfs_remove_file:PROC
EXTRN	kmalloc:PROC
pdata	SEGMENT
$pdata$?devfs_initialize@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+95
	DD	imagerel $unwind$?devfs_initialize@@YAXXZ
$pdata$?devfs_deinitialize@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+21
	DD	imagerel $unwind$?devfs_deinitialize@@YAXXZ
pdata	ENDS
xdata	SEGMENT
$unwind$?devfs_initialize@@YAXXZ DD 010401H
	DD	06204H
$unwind$?devfs_deinitialize@@YAXXZ DD 010401H
	DD	04204H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\devfs.cpp
_TEXT	SEGMENT
?devfs_deinitialize@@YAXXZ PROC				; devfs_deinitialize

; 51   : void devfs_deinitialize() {

$LN3:
	sub	rsp, 40					; 00000028H

; 52   : 	vfs_remove_file("/dev");

	lea	rcx, OFFSET FLAT:$SG2795
	call	vfs_remove_file

; 53   : }

	add	rsp, 40					; 00000028H
	ret	0
?devfs_deinitialize@@YAXXZ ENDP				; devfs_deinitialize
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\devfs.cpp
_TEXT	SEGMENT
dev$ = 32
dev_node$ = 40
?devfs_initialize@@YAXXZ PROC				; devfs_initialize

; 38   : void devfs_initialize() {

$LN3:
	sub	rsp, 56					; 00000038H

; 39   : 	vfs_file_t *dev = (vfs_file_t*)kmalloc(sizeof(vfs_file_t));

	mov	ecx, 104				; 00000068H
	call	kmalloc
	mov	QWORD PTR dev$[rsp], rax

; 40   : 	memset(dev, 0, sizeof(vfs_file_t));

	mov	r8d, 104				; 00000068H
	xor	edx, edx
	mov	rcx, QWORD PTR dev$[rsp]
	call	?memset@@YAXPEAXEI@Z			; memset

; 41   : 	dev->flags = FS_FLAG_DIR;

	mov	rax, QWORD PTR dev$[rsp]
	mov	BYTE PTR [rax+48], 1

; 42   : 	dev->size = 0;

	mov	rax, QWORD PTR dev$[rsp]
	mov	DWORD PTR [rax+32], 0

; 43   : 
; 44   : 	vfs_node_t *dev_node = vfs_mknode();

	call	vfs_mknode
	mov	QWORD PTR dev_node$[rsp], rax

; 45   : 	vfs_mkdir("/dev", dev, dev_node);

	mov	r8, QWORD PTR dev_node$[rsp]
	mov	rdx, QWORD PTR dev$[rsp]
	lea	rcx, OFFSET FLAT:$SG2792
	call	vfs_mkdir

; 46   : }

	add	rsp, 56					; 00000038H
	ret	0
?devfs_initialize@@YAXXZ ENDP				; devfs_initialize
_TEXT	ENDS
END
