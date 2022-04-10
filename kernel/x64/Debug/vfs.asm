; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?root_dir@@3PEAU_vfs_node_@@EA			; root_dir
_BSS	SEGMENT
?root_dir@@3PEAU_vfs_node_@@EA DQ 01H DUP (?)		; root_dir
_BSS	ENDS
CONST	SEGMENT
$SG2827	DB	'Already mounted -> %s', 0aH, 00H
	ORG $+1
$SG2904	DB	'File -> %s ', 0aH, 00H
CONST	ENDS
PUBLIC	?vfs_initialize@@YAXXZ				; vfs_initialize
PUBLIC	vfs_mount
PUBLIC	vfs_mknode
PUBLIC	vfs_mkdir
PUBLIC	?vfs_lsdir@@YAXPEAD@Z				; vfs_lsdir
PUBLIC	vfs_get_file
PUBLIC	vfs_remove_file
EXTRN	?strcmp@@YAHPEBD0@Z:PROC			; strcmp
EXTRN	?strcpy@@YAPEADPEADPEBD@Z:PROC			; strcpy
EXTRN	?strlen@@YA_KPEBD@Z:PROC			; strlen
EXTRN	?strchr@@YAPEADPEADH@Z:PROC			; strchr
EXTRN	initialize_list:PROC
EXTRN	list_add:PROC
EXTRN	list_remove:PROC
EXTRN	list_get_at:PROC
EXTRN	kmalloc:PROC
EXTRN	kfree:PROC
EXTRN	printf:PROC
pdata	SEGMENT
$pdata$?vfs_initialize@@YAXXZ DD imagerel $LN3
	DD	imagerel $LN3+62
	DD	imagerel $unwind$?vfs_initialize@@YAXXZ
$pdata$vfs_mount DD imagerel $LN23
	DD	imagerel $LN23+609
	DD	imagerel $unwind$vfs_mount
$pdata$vfs_mknode DD imagerel $LN3
	DD	imagerel $LN3+55
	DD	imagerel $unwind$vfs_mknode
$pdata$vfs_mkdir DD imagerel $LN20
	DD	imagerel $LN20+504
	DD	imagerel $unwind$vfs_mkdir
$pdata$?vfs_lsdir@@YAXPEAD@Z DD imagerel $LN22
	DD	imagerel $LN22+519
	DD	imagerel $unwind$?vfs_lsdir@@YAXPEAD@Z
$pdata$vfs_get_file DD imagerel $LN18
	DD	imagerel $LN18+396
	DD	imagerel $unwind$vfs_get_file
$pdata$vfs_remove_file DD imagerel $LN24
	DD	imagerel $LN24+584
	DD	imagerel $unwind$vfs_remove_file
pdata	ENDS
xdata	SEGMENT
$unwind$?vfs_initialize@@YAXXZ DD 010401H
	DD	06204H
$unwind$vfs_mount DD 011301H
	DD	0e213H
$unwind$vfs_mknode DD 010401H
	DD	06204H
$unwind$vfs_mkdir DD 011301H
	DD	0c213H
$unwind$?vfs_lsdir@@YAXPEAD@Z DD 010901H
	DD	0e209H
$unwind$vfs_get_file DD 010901H
	DD	0c209H
$unwind$vfs_remove_file DD 010901H
	DD	0e209H
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
i$1 = 32
j$2 = 36
next$ = 40
ent$ = 48
i$3 = 56
k$ = 60
file_$4 = 64
entry_found$ = 72
parent_node$ = 80
file_$5 = 88
pathname$ = 96
path$ = 128
vfs_remove_file PROC

; 283  : void vfs_remove_file(char* path) {

$LN24:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 284  : 	char* next = strchr(path, '/');

	mov	edx, 47					; 0000002fH
	mov	rcx, QWORD PTR path$[rsp]
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 285  : 	if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN21@vfs_remove

; 286  : 		next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN21@vfs_remove:

; 287  : 
; 288  : 	vfs_node_t *ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax

; 289  : 	vfs_node_t *parent_node = 0;

	mov	QWORD PTR parent_node$[rsp], 0

; 290  : 	vfs_file_t *entry_found = 0;

	mov	QWORD PTR entry_found$[rsp], 0

; 291  : 	char pathname[16];
; 292  : 	int k = 0;

	mov	DWORD PTR k$[rsp], 0
$LN20@vfs_remove:

; 293  : 	while (next) {

	cmp	QWORD PTR next$[rsp], 0
	je	$LN19@vfs_remove

; 294  : 		int i = 0;

	mov	DWORD PTR i$1[rsp], 0

; 295  : 		for (i = 0; i < 16; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN18@vfs_remove
$LN17@vfs_remove:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN18@vfs_remove:
	cmp	DWORD PTR i$1[rsp], 16
	jge	SHORT $LN16@vfs_remove

; 296  : 			if (next[i] == '/' || next[i] == '\0')

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	je	SHORT $LN14@vfs_remove
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	test	eax, eax
	jne	SHORT $LN15@vfs_remove
$LN14@vfs_remove:

; 297  : 				break;

	jmp	SHORT $LN16@vfs_remove
$LN15@vfs_remove:

; 298  : 			pathname[i] = next[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR next$[rsp]
	movzx	eax, BYTE PTR [rdx+rax]
	mov	BYTE PTR pathname$[rsp+rcx], al

; 299  : 		}

	jmp	SHORT $LN17@vfs_remove
$LN16@vfs_remove:

; 300  : 		pathname[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	BYTE PTR pathname$[rsp+rax], 0

; 301  : 
; 302  : 		if (ent == NULL)

	cmp	QWORD PTR ent$[rsp], 0
	jne	SHORT $LN13@vfs_remove

; 303  : 			ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax
$LN13@vfs_remove:

; 304  : 
; 305  : 		for (int j = 0; j < ent->childs->pointer; j++) {

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN12@vfs_remove
$LN11@vfs_remove:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN12@vfs_remove:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR j$2[rsp], eax
	jae	SHORT $LN10@vfs_remove

; 306  : 			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR file_$4[rsp], rax

; 307  : 			if (strcmp(file_->filename, pathname) == 0) {

	mov	rax, QWORD PTR file_$4[rsp]
	lea	rdx, QWORD PTR pathname$[rsp]
	mov	rcx, rax
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN9@vfs_remove

; 308  : 				/* check for again '/', if exist than this is a
; 309  : 				* directory for the user, file name exist in next
; 310  : 				* part */
; 311  : 
; 312  : 				//! store the parent node
; 313  : 				parent_node = ent;

	mov	rax, QWORD PTR ent$[rsp]
	mov	QWORD PTR parent_node$[rsp], rax

; 314  : 
; 315  : 				/* directory removal is done in another part of the
; 316  : 				 * code, because removing a directory needs to remove
; 317  : 				 * all the entries inside the directory
; 318  : 				 */
; 319  : 				if (file_->flags == FS_FLAG_DIR) {

	mov	rax, QWORD PTR file_$4[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN8@vfs_remove

; 320  : 					ent = (vfs_node_t*)file_->device;

	mov	rax, QWORD PTR file_$4[rsp]
	mov	rax, QWORD PTR [rax+56]
	mov	QWORD PTR ent$[rsp], rax

; 321  : 					k = j;

	mov	eax, DWORD PTR j$2[rsp]
	mov	DWORD PTR k$[rsp], eax

; 322  : 				}
; 323  : 				else {

	jmp	SHORT $LN7@vfs_remove
$LN8@vfs_remove:

; 324  : 					/* it's not a directory, so remove it from the parent
; 325  : 					 * it's a normal file
; 326  : 					 */
; 327  : 					list_remove(ent->childs, j);

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_remove
$LN7@vfs_remove:

; 328  : 				}
; 329  : 				entry_found = file_;

	mov	rax, QWORD PTR file_$4[rsp]
	mov	QWORD PTR entry_found$[rsp], rax
$LN9@vfs_remove:

; 330  : 			}
; 331  : 		}

	jmp	$LN11@vfs_remove
$LN10@vfs_remove:

; 332  : 
; 333  : 		next = strchr(next + 1, '/');

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	edx, 47					; 0000002fH
	mov	rcx, rax
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 334  : 		if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN6@vfs_remove

; 335  : 			next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN6@vfs_remove:

; 336  : 	}

	jmp	$LN20@vfs_remove
$LN19@vfs_remove:

; 337  : 
; 338  : 	/* here, handle the directory removal part */
; 339  : 	if (ent) {

	cmp	QWORD PTR ent$[rsp], 0
	je	SHORT $LN5@vfs_remove

; 340  : 		if (entry_found->flags == FS_FLAG_DIR) {

	mov	rax, QWORD PTR entry_found$[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN4@vfs_remove

; 341  : 			for (int i = 0; i < ent->childs->pointer; i++) {

	mov	DWORD PTR i$3[rsp], 0
	jmp	SHORT $LN3@vfs_remove
$LN2@vfs_remove:
	mov	eax, DWORD PTR i$3[rsp]
	inc	eax
	mov	DWORD PTR i$3[rsp], eax
$LN3@vfs_remove:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR i$3[rsp], eax
	jae	SHORT $LN1@vfs_remove

; 342  : 				vfs_file_t * file_ = (vfs_file_t*)list_remove(ent->childs, i);

	mov	edx, DWORD PTR i$3[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_remove
	mov	QWORD PTR file_$5[rsp], rax

; 343  : 				kfree(file_);

	mov	rcx, QWORD PTR file_$5[rsp]
	call	kfree

; 344  : 			}

	jmp	SHORT $LN2@vfs_remove
$LN1@vfs_remove:

; 345  : 			kfree(ent);

	mov	rcx, QWORD PTR ent$[rsp]
	call	kfree

; 346  : 
; 347  : 			list_remove(parent_node->childs, k);

	mov	edx, DWORD PTR k$[rsp]
	mov	rax, QWORD PTR parent_node$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_remove
$LN4@vfs_remove:

; 348  : 			
; 349  : 		}
; 350  : 
; 351  : 		/* it was not a directory, so directly remove it*/
; 352  : 		kfree(entry_found);

	mov	rcx, QWORD PTR entry_found$[rsp]
	call	kfree
$LN5@vfs_remove:

; 353  : 	}
; 354  : }

	add	rsp, 120				; 00000078H
	ret	0
vfs_remove_file ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
i$1 = 32
j$2 = 36
next$ = 40
ent$ = 48
file_$3 = 56
entry_found$ = 64
pathname$ = 72
path$ = 112
vfs_get_file PROC

; 239  : vfs_file_t * vfs_get_file(char* path) {

$LN18:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 104				; 00000068H

; 240  : 	char* next = strchr(path, '/');

	mov	edx, 47					; 0000002fH
	mov	rcx, QWORD PTR path$[rsp]
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 241  : 	if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN15@vfs_get_fi

; 242  : 		next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN15@vfs_get_fi:

; 243  : 
; 244  : 	vfs_node_t *ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax

; 245  : 	vfs_file_t *entry_found = 0;

	mov	QWORD PTR entry_found$[rsp], 0
$LN14@vfs_get_fi:

; 246  : 	char pathname[16];
; 247  : 	while (next) {

	cmp	QWORD PTR next$[rsp], 0
	je	$LN13@vfs_get_fi

; 248  : 		int i = 0;

	mov	DWORD PTR i$1[rsp], 0

; 249  : 		for (i = 0; i < 16; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN12@vfs_get_fi
$LN11@vfs_get_fi:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN12@vfs_get_fi:
	cmp	DWORD PTR i$1[rsp], 16
	jge	SHORT $LN10@vfs_get_fi

; 250  : 			if (next[i] == '/' || next[i] == '\0')

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	je	SHORT $LN8@vfs_get_fi
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	test	eax, eax
	jne	SHORT $LN9@vfs_get_fi
$LN8@vfs_get_fi:

; 251  : 				break;

	jmp	SHORT $LN10@vfs_get_fi
$LN9@vfs_get_fi:

; 252  : 			pathname[i] = next[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR next$[rsp]
	movzx	eax, BYTE PTR [rdx+rax]
	mov	BYTE PTR pathname$[rsp+rcx], al

; 253  : 		}

	jmp	SHORT $LN11@vfs_get_fi
$LN10@vfs_get_fi:

; 254  : 		pathname[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	BYTE PTR pathname$[rsp+rax], 0

; 255  : 
; 256  : 		if (ent == NULL)

	cmp	QWORD PTR ent$[rsp], 0
	jne	SHORT $LN7@vfs_get_fi

; 257  : 			ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax
$LN7@vfs_get_fi:

; 258  : 
; 259  : 		for (int j = 0; j < ent->childs->pointer; j++) {

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN6@vfs_get_fi
$LN5@vfs_get_fi:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN6@vfs_get_fi:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR j$2[rsp], eax
	jae	SHORT $LN4@vfs_get_fi

; 260  : 			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR file_$3[rsp], rax

; 261  : 			if (strcmp(file_->filename, pathname) == 0) {

	mov	rax, QWORD PTR file_$3[rsp]
	lea	rdx, QWORD PTR pathname$[rsp]
	mov	rcx, rax
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN3@vfs_get_fi

; 262  : 				/* check for again '/', if exist than this is a 
; 263  : 				 * directory for the user, file name exist in next
; 264  : 				 * part */
; 265  : 				if (file_->flags == FS_FLAG_DIR)

	mov	rax, QWORD PTR file_$3[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN2@vfs_get_fi

; 266  : 					ent = (vfs_node_t*)file_->device;

	mov	rax, QWORD PTR file_$3[rsp]
	mov	rax, QWORD PTR [rax+56]
	mov	QWORD PTR ent$[rsp], rax
$LN2@vfs_get_fi:

; 267  : 				entry_found = file_;

	mov	rax, QWORD PTR file_$3[rsp]
	mov	QWORD PTR entry_found$[rsp], rax
$LN3@vfs_get_fi:

; 268  : 			}
; 269  : 		}

	jmp	SHORT $LN5@vfs_get_fi
$LN4@vfs_get_fi:

; 270  : 
; 271  : 		next = strchr(next + 1, '/');

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	edx, 47					; 0000002fH
	mov	rcx, rax
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 272  : 		if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN1@vfs_get_fi

; 273  : 			next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN1@vfs_get_fi:

; 274  : 	}

	jmp	$LN14@vfs_get_fi
$LN13@vfs_get_fi:

; 275  : 
; 276  : 	return entry_found;

	mov	rax, QWORD PTR entry_found$[rsp]

; 277  : }

	add	rsp, 104				; 00000068H
	ret	0
vfs_get_file ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
i$1 = 32
found$ = 36
next$ = 40
j$2 = 48
i$3 = 52
ent$ = 56
file_$4 = 64
f$5 = 72
entry_found$ = 80
pathname$6 = 88
path$ = 128
?vfs_lsdir@@YAXPEAD@Z PROC				; vfs_lsdir

; 186  : void vfs_lsdir(char* path) {

$LN22:
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 187  : 	char* next = strchr(path, '/');

	mov	edx, 47					; 0000002fH
	mov	rcx, QWORD PTR path$[rsp]
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 188  : 	if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN19@vfs_lsdir

; 189  : 		next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN19@vfs_lsdir:

; 190  : 
; 191  : 	bool found = false;

	mov	BYTE PTR found$[rsp], 0

; 192  : 	vfs_node_t *ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax

; 193  : 	vfs_file_t *entry_found = 0;

	mov	QWORD PTR entry_found$[rsp], 0

; 194  : 
; 195  : 	if (path[0] == '/' && strlen(path) == 2)

	mov	eax, 1
	imul	rax, rax, 0
	mov	rcx, QWORD PTR path$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	jne	SHORT $LN18@vfs_lsdir
	mov	rcx, QWORD PTR path$[rsp]
	call	?strlen@@YA_KPEBD@Z			; strlen
	cmp	rax, 2
	jne	SHORT $LN18@vfs_lsdir

; 196  : 		found = true;

	mov	BYTE PTR found$[rsp], 1
$LN18@vfs_lsdir:
$LN17@vfs_lsdir:

; 197  : 
; 198  : 
; 199  : 	while (next) {

	cmp	QWORD PTR next$[rsp], 0
	je	$LN16@vfs_lsdir

; 200  : 		int i = 0;

	mov	DWORD PTR i$1[rsp], 0

; 201  : 	    char pathname[16];
; 202  : 		for (i = 0; i < 16; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN15@vfs_lsdir
$LN14@vfs_lsdir:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN15@vfs_lsdir:
	cmp	DWORD PTR i$1[rsp], 16
	jge	SHORT $LN13@vfs_lsdir

; 203  : 			if (next[i] == '/' || next[i] == '\0')

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	je	SHORT $LN11@vfs_lsdir
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	test	eax, eax
	jne	SHORT $LN12@vfs_lsdir
$LN11@vfs_lsdir:

; 204  : 				break;

	jmp	SHORT $LN13@vfs_lsdir
$LN12@vfs_lsdir:

; 205  : 			pathname[i] = next[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR next$[rsp]
	movzx	eax, BYTE PTR [rdx+rax]
	mov	BYTE PTR pathname$6[rsp+rcx], al

; 206  : 		}

	jmp	SHORT $LN14@vfs_lsdir
$LN13@vfs_lsdir:

; 207  : 		pathname[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	BYTE PTR pathname$6[rsp+rax], 0

; 208  : 
; 209  : 		for (int j = 0; j < ent->childs->pointer; j++) {

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN10@vfs_lsdir
$LN9@vfs_lsdir:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN10@vfs_lsdir:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR j$2[rsp], eax
	jae	SHORT $LN8@vfs_lsdir

; 210  : 			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR file_$4[rsp], rax

; 211  : 			entry_found = file_;

	mov	rax, QWORD PTR file_$4[rsp]
	mov	QWORD PTR entry_found$[rsp], rax

; 212  : 			if (strcmp(file_->filename, pathname) == 0) {

	mov	rax, QWORD PTR file_$4[rsp]
	lea	rdx, QWORD PTR pathname$6[rsp]
	mov	rcx, rax
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN7@vfs_lsdir

; 213  : 				if (file_->flags == FS_FLAG_DIR)

	mov	rax, QWORD PTR file_$4[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN6@vfs_lsdir

; 214  : 					ent = (vfs_node_t *)file_->device;

	mov	rax, QWORD PTR file_$4[rsp]
	mov	rax, QWORD PTR [rax+56]
	mov	QWORD PTR ent$[rsp], rax
$LN6@vfs_lsdir:
$LN7@vfs_lsdir:

; 215  : 			}
; 216  : 		}

	jmp	SHORT $LN9@vfs_lsdir
$LN8@vfs_lsdir:

; 217  : 
; 218  : 		next = strchr(next + 1, '/');

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	edx, 47					; 0000002fH
	mov	rcx, rax
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 219  : 		if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN5@vfs_lsdir

; 220  : 			next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN5@vfs_lsdir:

; 221  : 	}

	jmp	$LN17@vfs_lsdir
$LN16@vfs_lsdir:

; 222  : 
; 223  : 	if (ent) {

	cmp	QWORD PTR ent$[rsp], 0
	je	SHORT $LN4@vfs_lsdir

; 224  : 		/* if this entry is a directory, recursively
; 225  : 		* call the node and check it */
; 226  : 		for (int i = 0; i < ent->childs->pointer; i++) {

	mov	DWORD PTR i$3[rsp], 0
	jmp	SHORT $LN3@vfs_lsdir
$LN2@vfs_lsdir:
	mov	eax, DWORD PTR i$3[rsp]
	inc	eax
	mov	DWORD PTR i$3[rsp], eax
$LN3@vfs_lsdir:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR i$3[rsp], eax
	jae	SHORT $LN1@vfs_lsdir

; 227  : 			vfs_file_t *f = (vfs_file_t*)list_get_at(ent->childs, i);

	mov	edx, DWORD PTR i$3[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR f$5[rsp], rax

; 228  : 			printf("File -> %s \n", f->filename);

	mov	rax, QWORD PTR f$5[rsp]
	mov	rdx, rax
	lea	rcx, OFFSET FLAT:$SG2904
	call	printf

; 229  : 		}

	jmp	SHORT $LN2@vfs_lsdir
$LN1@vfs_lsdir:
$LN4@vfs_lsdir:

; 230  : 		return;
; 231  : 	}
; 232  : }

	add	rsp, 120				; 00000078H
	ret	0
?vfs_lsdir@@YAXPEAD@Z ENDP				; vfs_lsdir
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
found$ = 32
i$1 = 36
j$2 = 40
next$ = 48
ent$ = 56
file_$3 = 64
entry_found$ = 72
pathname$ = 80
path$ = 112
dir$ = 120
dir_node$ = 128
vfs_mkdir PROC

; 131  : void vfs_mkdir(char *path, vfs_file_t *dir, vfs_node_t *dir_node) {

$LN20:
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 104				; 00000068H

; 132  : 	dir->device = dir_node;

	mov	rax, QWORD PTR dir$[rsp]
	mov	rcx, QWORD PTR dir_node$[rsp]
	mov	QWORD PTR [rax+56], rcx

; 133  : 	bool found = false;

	mov	BYTE PTR found$[rsp], 0

; 134  : 	char* next = strchr(path, '/');

	mov	edx, 47					; 0000002fH
	mov	rcx, QWORD PTR path$[rsp]
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 135  : 	if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN17@vfs_mkdir

; 136  : 		next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN17@vfs_mkdir:

; 137  : 
; 138  : 	vfs_node_t *ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax

; 139  : 	vfs_file_t *entry_found = 0;

	mov	QWORD PTR entry_found$[rsp], 0
$LN16@vfs_mkdir:

; 140  : 	char pathname[16];
; 141  : 	while (next) {

	cmp	QWORD PTR next$[rsp], 0
	je	$LN15@vfs_mkdir

; 142  : 		int i = 0;

	mov	DWORD PTR i$1[rsp], 0

; 143  : 		
; 144  : 		for (i = 0; i < 16; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN14@vfs_mkdir
$LN13@vfs_mkdir:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN14@vfs_mkdir:
	cmp	DWORD PTR i$1[rsp], 16
	jge	SHORT $LN12@vfs_mkdir

; 145  : 			if (next[i] == '/' || next[i] == '\0')

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	je	SHORT $LN10@vfs_mkdir
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	test	eax, eax
	jne	SHORT $LN11@vfs_mkdir
$LN10@vfs_mkdir:

; 146  : 				break;

	jmp	SHORT $LN12@vfs_mkdir
$LN11@vfs_mkdir:

; 147  : 			pathname[i] = next[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR next$[rsp]
	movzx	eax, BYTE PTR [rdx+rax]
	mov	BYTE PTR pathname$[rsp+rcx], al

; 148  : 		}

	jmp	SHORT $LN13@vfs_mkdir
$LN12@vfs_mkdir:

; 149  : 		pathname[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	BYTE PTR pathname$[rsp+rax], 0

; 150  : 
; 151  : 		if (ent == NULL)

	cmp	QWORD PTR ent$[rsp], 0
	jne	SHORT $LN9@vfs_mkdir

; 152  : 			ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax
$LN9@vfs_mkdir:

; 153  : 
; 154  : 		for (int j = 0; j < ent->childs->pointer; j++) {

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN8@vfs_mkdir
$LN7@vfs_mkdir:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN8@vfs_mkdir:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR j$2[rsp], eax
	jae	SHORT $LN6@vfs_mkdir

; 155  : 			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR file_$3[rsp], rax

; 156  : 			
; 157  : 			if (strcmp(file_->filename, pathname) == 0) {

	mov	rax, QWORD PTR file_$3[rsp]
	lea	rdx, QWORD PTR pathname$[rsp]
	mov	rcx, rax
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN5@vfs_mkdir

; 158  : 				if (file_->flags == FS_FLAG_DIR)

	mov	rax, QWORD PTR file_$3[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN4@vfs_mkdir

; 159  : 					ent = (vfs_node_t *)file_->device;

	mov	rax, QWORD PTR file_$3[rsp]
	mov	rax, QWORD PTR [rax+56]
	mov	QWORD PTR ent$[rsp], rax
$LN4@vfs_mkdir:

; 160  : 				found = true;

	mov	BYTE PTR found$[rsp], 1

; 161  : 				//break;
; 162  : 				entry_found = file_;

	mov	rax, QWORD PTR file_$3[rsp]
	mov	QWORD PTR entry_found$[rsp], rax
$LN5@vfs_mkdir:

; 163  : 			}
; 164  : 		}

	jmp	SHORT $LN7@vfs_mkdir
$LN6@vfs_mkdir:

; 165  : 
; 166  : 		next = strchr(next + 1, '/');

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	edx, 47					; 0000002fH
	mov	rcx, rax
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 167  : 		if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN3@vfs_mkdir

; 168  : 			next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN3@vfs_mkdir:

; 169  : 	}

	jmp	$LN16@vfs_mkdir
$LN15@vfs_mkdir:

; 170  : 
; 171  : 	strcpy(dir->filename, pathname);

	mov	rax, QWORD PTR dir$[rsp]
	lea	rdx, QWORD PTR pathname$[rsp]
	mov	rcx, rax
	call	?strcpy@@YAPEADPEADPEBD@Z		; strcpy

; 172  : 	if (found) {

	movzx	eax, BYTE PTR found$[rsp]
	test	eax, eax
	je	SHORT $LN2@vfs_mkdir

; 173  : 		/* if this entry is a directory, recursively
; 174  : 		* call the node and check it */
; 175  : 		list_add(ent->childs, dir);

	mov	rdx, QWORD PTR dir$[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_add

; 176  : 		return;

	jmp	SHORT $LN18@vfs_mkdir
$LN2@vfs_mkdir:

; 177  : 	}
; 178  : 	if (!found) {

	movzx	eax, BYTE PTR found$[rsp]
	test	eax, eax
	jne	SHORT $LN1@vfs_mkdir

; 179  : 		list_add(ent->childs, dir);

	mov	rdx, QWORD PTR dir$[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_add
$LN1@vfs_mkdir:
$LN18@vfs_mkdir:

; 180  : 		return;
; 181  : 	}
; 182  : 
; 183  : }

	add	rsp, 104				; 00000068H
	ret	0
vfs_mkdir ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
node$ = 32
vfs_mknode PROC

; 118  : vfs_node_t * vfs_mknode() {

$LN3:
	sub	rsp, 56					; 00000038H

; 119  : 	vfs_node_t *node = (vfs_node_t*)kmalloc(sizeof(vfs_node_t));

	mov	ecx, 16
	call	kmalloc
	mov	QWORD PTR node$[rsp], rax

; 120  : 	node->root = 0;

	mov	rax, QWORD PTR node$[rsp]
	mov	QWORD PTR [rax], 0

; 121  : 	node->childs = initialize_list();

	call	initialize_list
	mov	rcx, QWORD PTR node$[rsp]
	mov	QWORD PTR [rcx+8], rax

; 122  : 	return node;

	mov	rax, QWORD PTR node$[rsp]

; 123  : }

	add	rsp, 56					; 00000038H
	ret	0
vfs_mknode ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
found$ = 32
i$1 = 36
next$ = 40
j$2 = 48
ent$ = 56
entry_found$ = 64
entry$3 = 72
file_$4 = 80
pathname$5 = 88
path$ = 128
file$ = 136
node$ = 144
vfs_mount PROC

; 54   : void vfs_mount(char* path, vfs_file_t *file, vfs_node_t* node) {

$LN23:
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 55   : 	if (path[0] == '/' && strlen(path) == 2) {

	mov	eax, 1
	imul	rax, rax, 0
	mov	rcx, QWORD PTR path$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	jne	SHORT $LN20@vfs_mount
	mov	rcx, QWORD PTR path$[rsp]
	call	?strlen@@YA_KPEBD@Z			; strlen
	cmp	rax, 2
	jne	SHORT $LN20@vfs_mount

; 56   : 		vfs_node_t *entry = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR entry$3[rsp], rax

; 57   : 		if (entry->root) {

	mov	rax, QWORD PTR entry$3[rsp]
	cmp	QWORD PTR [rax], 0
	je	SHORT $LN19@vfs_mount

; 58   : 			return;

	jmp	$LN21@vfs_mount
$LN19@vfs_mount:

; 59   : 		}
; 60   : 		entry->root = file;

	mov	rax, QWORD PTR entry$3[rsp]
	mov	rcx, QWORD PTR file$[rsp]
	mov	QWORD PTR [rax], rcx

; 61   : 		return;

	jmp	$LN21@vfs_mount
$LN20@vfs_mount:

; 62   : 	}
; 63   : 
; 64   : 	bool found = false;

	mov	BYTE PTR found$[rsp], 0

; 65   : 
; 66   : 	char* next = strchr(path, '/');

	mov	edx, 47					; 0000002fH
	mov	rcx, QWORD PTR path$[rsp]
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 67   : 	if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN18@vfs_mount

; 68   : 		next++;

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN18@vfs_mount:

; 69   : 
; 70   : 	vfs_node_t *ent = node;

	mov	rax, QWORD PTR node$[rsp]
	mov	QWORD PTR ent$[rsp], rax

; 71   : 	vfs_file_t *entry_found = 0;

	mov	QWORD PTR entry_found$[rsp], 0
$LN17@vfs_mount:

; 72   : 	while (next) {

	cmp	QWORD PTR next$[rsp], 0
	je	$LN16@vfs_mount

; 73   : 		int i = 0; 

	mov	DWORD PTR i$1[rsp], 0

; 74   : 		char pathname[16];
; 75   : 		for (i = 0; i < 16; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN15@vfs_mount
$LN14@vfs_mount:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN15@vfs_mount:
	cmp	DWORD PTR i$1[rsp], 16
	jge	SHORT $LN13@vfs_mount

; 76   : 			if (next[i] == '/' || next[i] == '\0')

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	cmp	eax, 47					; 0000002fH
	je	SHORT $LN11@vfs_mount
	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR next$[rsp]
	movsx	eax, BYTE PTR [rcx+rax]
	test	eax, eax
	jne	SHORT $LN12@vfs_mount
$LN11@vfs_mount:

; 77   : 				break;

	jmp	SHORT $LN13@vfs_mount
$LN12@vfs_mount:

; 78   : 			pathname[i] = next[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	movsxd	rcx, DWORD PTR i$1[rsp]
	mov	rdx, QWORD PTR next$[rsp]
	movzx	eax, BYTE PTR [rdx+rax]
	mov	BYTE PTR pathname$5[rsp+rcx], al

; 79   : 		}

	jmp	SHORT $LN14@vfs_mount
$LN13@vfs_mount:

; 80   : 		pathname[i] = 0;

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	BYTE PTR pathname$5[rsp+rax], 0

; 81   : 
; 82   : 		if (ent == NULL)

	cmp	QWORD PTR ent$[rsp], 0
	jne	SHORT $LN10@vfs_mount

; 83   : 			ent = root_dir;

	mov	rax, QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA ; root_dir
	mov	QWORD PTR ent$[rsp], rax
$LN10@vfs_mount:

; 84   : 
; 85   : 		for (int j = 0; j < ent->childs->pointer; j++) {

	mov	DWORD PTR j$2[rsp], 0
	jmp	SHORT $LN9@vfs_mount
$LN8@vfs_mount:
	mov	eax, DWORD PTR j$2[rsp]
	inc	eax
	mov	DWORD PTR j$2[rsp], eax
$LN9@vfs_mount:
	mov	rax, QWORD PTR ent$[rsp]
	mov	rax, QWORD PTR [rax+8]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR j$2[rsp], eax
	jae	SHORT $LN7@vfs_mount

; 86   : 			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);	

	mov	edx, DWORD PTR j$2[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_get_at
	mov	QWORD PTR file_$4[rsp], rax

; 87   : 			entry_found = file_;

	mov	rax, QWORD PTR file_$4[rsp]
	mov	QWORD PTR entry_found$[rsp], rax

; 88   : 			if (strcmp(file_->filename, pathname) == 0) {

	mov	rax, QWORD PTR file_$4[rsp]
	lea	rdx, QWORD PTR pathname$5[rsp]
	mov	rcx, rax
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN6@vfs_mount

; 89   : 				found = true;

	mov	BYTE PTR found$[rsp], 1

; 90   : 				break;

	jmp	SHORT $LN7@vfs_mount
$LN6@vfs_mount:

; 91   : 			}
; 92   : 		}

	jmp	SHORT $LN8@vfs_mount
$LN7@vfs_mount:

; 93   : 
; 94   : 		next = strchr(next + 1, '/');

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	edx, 47					; 0000002fH
	mov	rcx, rax
	call	?strchr@@YAPEADPEADH@Z			; strchr
	mov	QWORD PTR next$[rsp], rax

; 95   : 		if (next)

	cmp	QWORD PTR next$[rsp], 0
	je	SHORT $LN5@vfs_mount

; 96   : 			next++;	

	mov	rax, QWORD PTR next$[rsp]
	inc	rax
	mov	QWORD PTR next$[rsp], rax
$LN5@vfs_mount:

; 97   : 	}

	jmp	$LN17@vfs_mount
$LN16@vfs_mount:

; 98   : 
; 99   : 	if (found) {

	movzx	eax, BYTE PTR found$[rsp]
	test	eax, eax
	je	SHORT $LN4@vfs_mount

; 100  : 		/* if this entry is a directory, recursively
; 101  : 		 * call the node and check it */
; 102  : 		if (entry_found->flags == FS_FLAG_DIR) {

	mov	rax, QWORD PTR entry_found$[rsp]
	movzx	eax, BYTE PTR [rax+48]
	cmp	eax, 1
	jne	SHORT $LN3@vfs_mount

; 103  : 			ent = (vfs_node_t*)entry_found->device;

	mov	rax, QWORD PTR entry_found$[rsp]
	mov	rax, QWORD PTR [rax+56]
	mov	QWORD PTR ent$[rsp], rax

; 104  : 			vfs_mount(path, file, ent);

	mov	r8, QWORD PTR ent$[rsp]
	mov	rdx, QWORD PTR file$[rsp]
	mov	rcx, QWORD PTR path$[rsp]
	call	vfs_mount
$LN3@vfs_mount:

; 105  : 		}
; 106  : 		printf("Already mounted -> %s\n", path);

	mov	rdx, QWORD PTR path$[rsp]
	lea	rcx, OFFSET FLAT:$SG2827
	call	printf

; 107  : 		return;

	jmp	SHORT $LN21@vfs_mount
$LN4@vfs_mount:

; 108  : 	}
; 109  : 	if (!found) {

	movzx	eax, BYTE PTR found$[rsp]
	test	eax, eax
	jne	SHORT $LN2@vfs_mount

; 110  : 		if (entry_found) {

	cmp	QWORD PTR entry_found$[rsp], 0
	je	SHORT $LN1@vfs_mount

; 111  : 			return;

	jmp	SHORT $LN21@vfs_mount
$LN1@vfs_mount:

; 112  : 		}
; 113  : 		list_add(ent->childs, file);

	mov	rdx, QWORD PTR file$[rsp]
	mov	rax, QWORD PTR ent$[rsp]
	mov	rcx, QWORD PTR [rax+8]
	call	list_add
$LN2@vfs_mount:
$LN21@vfs_mount:

; 114  : 	}
; 115  : }

	add	rsp, 120				; 00000078H
	ret	0
vfs_mount ENDP
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\fs\vfs.cpp
_TEXT	SEGMENT
root$ = 32
?vfs_initialize@@YAXXZ PROC				; vfs_initialize

; 41   : void vfs_initialize() {

$LN3:
	sub	rsp, 56					; 00000038H

; 42   : 	vfs_node_t *root = (vfs_node_t*)kmalloc(sizeof(vfs_node_t));

	mov	ecx, 16
	call	kmalloc
	mov	QWORD PTR root$[rsp], rax

; 43   : 	root->root = 0;

	mov	rax, QWORD PTR root$[rsp]
	mov	QWORD PTR [rax], 0

; 44   : 	root->childs = initialize_list();

	call	initialize_list
	mov	rcx, QWORD PTR root$[rsp]
	mov	QWORD PTR [rcx+8], rax

; 45   : 	root_dir = root;

	mov	rax, QWORD PTR root$[rsp]
	mov	QWORD PTR ?root_dir@@3PEAU_vfs_node_@@EA, rax ; root_dir

; 46   : }

	add	rsp, 56					; 00000038H
	ret	0
?vfs_initialize@@YAXXZ ENDP				; vfs_initialize
_TEXT	ENDS
END
