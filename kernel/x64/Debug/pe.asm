; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?au_get_proc_address@@YAPEAXPEAXPEBD@Z		; au_get_proc_address
PUBLIC	?au_link_dll@@YAXPEAX0@Z			; au_link_dll
PUBLIC	??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z ; raw_offset<_IMAGE_NT_HEADERS_PE32PLUS * __ptr64,_IMAGE_DOS_HEADER_ * __ptr64>
PUBLIC	??$raw_offset@PEAU_IMAGE_EXPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_EXPORT_DIRECTORY@@PEAXH@Z ; raw_offset<_IMAGE_EXPORT_DIRECTORY * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z		; raw_offset<unsigned int * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEAGPEAX@@YAPEAGPEAXH@Z		; raw_offset<unsigned short * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEADPEAX@@YAPEADPEAXH@Z		; raw_offset<char * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEAXPEAX@@YAPEAXPEAXH@Z		; raw_offset<void * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEAU_IMAGE_IMPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_IMPORT_DIRECTORY@@PEAXH@Z ; raw_offset<_IMAGE_IMPORT_DIRECTORY * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEBDPEAX@@YAPEBDPEAXH@Z		; raw_offset<char const * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEA_KPEAX@@YAPEA_KPEAXH@Z		; raw_offset<unsigned __int64 * __ptr64,void * __ptr64>
PUBLIC	??$raw_offset@PEAU_IMAGE_IMPORT_HINT_TABLE@@PEAX@@YAPEAU_IMAGE_IMPORT_HINT_TABLE@@PEAXH@Z ; raw_offset<_IMAGE_IMPORT_HINT_TABLE * __ptr64,void * __ptr64>
EXTRN	?strcmp@@YAHPEBD0@Z:PROC			; strcmp
pdata	SEGMENT
$pdata$?au_get_proc_address@@YAPEAXPEAXPEBD@Z DD imagerel $LN10
	DD	imagerel $LN10+386
	DD	imagerel $unwind$?au_get_proc_address@@YAPEAXPEAXPEBD@Z
$pdata$?au_link_dll@@YAXPEAX0@Z DD imagerel $LN11
	DD	imagerel $LN11+374
	DD	imagerel $unwind$?au_link_dll@@YAXPEAX0@Z
pdata	ENDS
xdata	SEGMENT
$unwind$?au_get_proc_address@@YAPEAXPEAXPEBD@Z DD 010e01H
	DD	0e20eH
$unwind$?au_link_dll@@YAXPEAX0@Z DD 010e01H
	DD	0e20eH
xdata	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAU_IMAGE_IMPORT_HINT_TABLE@@PEAX@@YAPEAU_IMAGE_IMPORT_HINT_TABLE@@PEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAU_IMAGE_IMPORT_HINT_TABLE@@PEAX@@YAPEAU_IMAGE_IMPORT_HINT_TABLE@@PEAXH@Z PROC ; raw_offset<_IMAGE_IMPORT_HINT_TABLE * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAU_IMAGE_IMPORT_HINT_TABLE@@PEAX@@YAPEAU_IMAGE_IMPORT_HINT_TABLE@@PEAXH@Z ENDP ; raw_offset<_IMAGE_IMPORT_HINT_TABLE * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEA_KPEAX@@YAPEA_KPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEA_KPEAX@@YAPEA_KPEAXH@Z PROC		; raw_offset<unsigned __int64 * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEA_KPEAX@@YAPEA_KPEAXH@Z ENDP		; raw_offset<unsigned __int64 * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEBDPEAX@@YAPEBDPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEBDPEAX@@YAPEBDPEAXH@Z PROC		; raw_offset<char const * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEBDPEAX@@YAPEBDPEAXH@Z ENDP		; raw_offset<char const * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAU_IMAGE_IMPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_IMPORT_DIRECTORY@@PEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAU_IMAGE_IMPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_IMPORT_DIRECTORY@@PEAXH@Z PROC ; raw_offset<_IMAGE_IMPORT_DIRECTORY * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAU_IMAGE_IMPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_IMPORT_DIRECTORY@@PEAXH@Z ENDP ; raw_offset<_IMAGE_IMPORT_DIRECTORY * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAXPEAX@@YAPEAXPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAXPEAX@@YAPEAXPEAXH@Z PROC		; raw_offset<void * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAXPEAX@@YAPEAXPEAXH@Z ENDP		; raw_offset<void * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEADPEAX@@YAPEADPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEADPEAX@@YAPEADPEAXH@Z PROC		; raw_offset<char * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEADPEAX@@YAPEADPEAXH@Z ENDP		; raw_offset<char * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAGPEAX@@YAPEAGPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAGPEAX@@YAPEAGPEAXH@Z PROC		; raw_offset<unsigned short * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAGPEAX@@YAPEAGPEAXH@Z ENDP		; raw_offset<unsigned short * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z PROC		; raw_offset<unsigned int * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z ENDP		; raw_offset<unsigned int * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAU_IMAGE_EXPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_EXPORT_DIRECTORY@@PEAXH@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAU_IMAGE_EXPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_EXPORT_DIRECTORY@@PEAXH@Z PROC ; raw_offset<_IMAGE_EXPORT_DIRECTORY * __ptr64,void * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAU_IMAGE_EXPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_EXPORT_DIRECTORY@@PEAXH@Z ENDP ; raw_offset<_IMAGE_EXPORT_DIRECTORY * __ptr64,void * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\include\stdint.h
;	COMDAT ??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z
_TEXT	SEGMENT
p1$ = 8
offset$ = 16
??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z PROC ; raw_offset<_IMAGE_NT_HEADERS_PE32PLUS * __ptr64,_IMAGE_DOS_HEADER_ * __ptr64>, COMDAT

; 203  : 	{

	mov	DWORD PTR [rsp+16], edx
	mov	QWORD PTR [rsp+8], rcx

; 204  : 		return (T)((size_t)p1 + offset);

	movsxd	rax, DWORD PTR offset$[rsp]
	mov	rcx, QWORD PTR p1$[rsp]
	add	rcx, rax
	mov	rax, rcx

; 205  : 	};

	ret	0
??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z ENDP ; raw_offset<_IMAGE_NT_HEADERS_PE32PLUS * __ptr64,_IMAGE_DOS_HEADER_ * __ptr64>
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\pe.cpp
_TEXT	SEGMENT
iat$1 = 32
n$2 = 40
datadir$ = 48
importdir$ = 56
dos_header$ = 64
nt_headers$ = 72
fname$3 = 80
procaddr$4 = 88
hint$5 = 96
func$6 = 104
image$ = 128
exporter$ = 136
?au_link_dll@@YAXPEAX0@Z PROC				; au_link_dll

; 70   : void au_link_dll(void* image, void *exporter) {

$LN11:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 71   : 	PIMAGE_DOS_HEADER dos_header = (PIMAGE_DOS_HEADER)image;

	mov	rax, QWORD PTR image$[rsp]
	mov	QWORD PTR dos_header$[rsp], rax

; 72   : 	PIMAGE_NT_HEADERS nt_headers = raw_offset<PIMAGE_NT_HEADERS>(dos_header, dos_header->e_lfanew);

	mov	rax, QWORD PTR dos_header$[rsp]
	movzx	eax, WORD PTR [rax+60]
	mov	edx, eax
	mov	rcx, QWORD PTR dos_header$[rsp]
	call	??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z ; raw_offset<_IMAGE_NT_HEADERS_PE32PLUS * __ptr64,_IMAGE_DOS_HEADER_ * __ptr64>
	mov	QWORD PTR nt_headers$[rsp], rax

; 73   : 	if (IMAGE_DATA_DIRECTORY_IMPORT + 1 > nt_headers->OptionalHeader.NumberOfRvaAndSizes)

	mov	rax, QWORD PTR nt_headers$[rsp]
	cmp	DWORD PTR [rax+132], 2
	jae	SHORT $LN8@au_link_dl

; 74   : 		return;

	jmp	$LN9@au_link_dl
$LN8@au_link_dl:

; 75   : 	IMAGE_DATA_DIRECTORY& datadir = nt_headers->OptionalHeader.DataDirectory[IMAGE_DATA_DIRECTORY_IMPORT];

	mov	eax, 8
	imul	rax, rax, 1
	mov	rcx, QWORD PTR nt_headers$[rsp]
	lea	rax, QWORD PTR [rcx+rax+136]
	mov	QWORD PTR datadir$[rsp], rax

; 76   : 	if (datadir.VirtualAddress == 0 || datadir.Size == 0) {

	mov	rax, QWORD PTR datadir$[rsp]
	cmp	DWORD PTR [rax], 0
	je	SHORT $LN6@au_link_dl
	mov	rax, QWORD PTR datadir$[rsp]
	cmp	DWORD PTR [rax+4], 0
	jne	SHORT $LN7@au_link_dl
$LN6@au_link_dl:

; 77   : 		return;

	jmp	$LN9@au_link_dl
$LN7@au_link_dl:

; 78   : 	}
; 79   : 	PIMAGE_IMPORT_DIRECTORY importdir = raw_offset<PIMAGE_IMPORT_DIRECTORY>(image, datadir.VirtualAddress);

	mov	rax, QWORD PTR datadir$[rsp]
	mov	edx, DWORD PTR [rax]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAU_IMAGE_IMPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_IMPORT_DIRECTORY@@PEAXH@Z ; raw_offset<_IMAGE_IMPORT_DIRECTORY * __ptr64,void * __ptr64>
	mov	QWORD PTR importdir$[rsp], rax

; 80   : 	for (size_t n = 0; importdir[n].ThunkTableRva; ++n) {

	mov	QWORD PTR n$2[rsp], 0
	jmp	SHORT $LN5@au_link_dl
$LN4@au_link_dl:
	mov	rax, QWORD PTR n$2[rsp]
	inc	rax
	mov	QWORD PTR n$2[rsp], rax
$LN5@au_link_dl:
	imul	rax, QWORD PTR n$2[rsp], 20
	mov	rcx, QWORD PTR importdir$[rsp]
	cmp	DWORD PTR [rcx+rax+16], 0
	je	$LN3@au_link_dl

; 81   : 		const char* func = raw_offset<const char*>(image, importdir[n].NameRva);

	imul	rax, QWORD PTR n$2[rsp], 20
	mov	rcx, QWORD PTR importdir$[rsp]
	mov	edx, DWORD PTR [rcx+rax+12]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEBDPEAX@@YAPEBDPEAXH@Z	; raw_offset<char const * __ptr64,void * __ptr64>
	mov	QWORD PTR func$6[rsp], rax

; 82   : 		PIMAGE_IMPORT_LOOKUP_TABLE_PE32P iat = raw_offset<PIMAGE_IMPORT_LOOKUP_TABLE_PE32P>(image, importdir[n].ThunkTableRva);

	imul	rax, QWORD PTR n$2[rsp], 20
	mov	rcx, QWORD PTR importdir$[rsp]
	mov	edx, DWORD PTR [rcx+rax+16]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEA_KPEAX@@YAPEA_KPEAXH@Z	; raw_offset<unsigned __int64 * __ptr64,void * __ptr64>
	mov	QWORD PTR iat$1[rsp], rax
$LN2@au_link_dl:

; 83   : 		while (*iat) {

	mov	rax, QWORD PTR iat$1[rsp]
	cmp	QWORD PTR [rax], 0
	je	SHORT $LN1@au_link_dl

; 84   : 			PIMAGE_IMPORT_HINT_TABLE hint = raw_offset<PIMAGE_IMPORT_HINT_TABLE>(image, *iat);

	mov	rax, QWORD PTR iat$1[rsp]
	mov	edx, DWORD PTR [rax]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAU_IMAGE_IMPORT_HINT_TABLE@@PEAX@@YAPEAU_IMAGE_IMPORT_HINT_TABLE@@PEAXH@Z ; raw_offset<_IMAGE_IMPORT_HINT_TABLE * __ptr64,void * __ptr64>
	mov	QWORD PTR hint$5[rsp], rax

; 85   : 			const char* fname = hint->name;

	mov	rax, QWORD PTR hint$5[rsp]
	add	rax, 2
	mov	QWORD PTR fname$3[rsp], rax

; 86   : 			void* procaddr = au_get_proc_address((void*)exporter, fname);

	mov	rdx, QWORD PTR fname$3[rsp]
	mov	rcx, QWORD PTR exporter$[rsp]
	call	?au_get_proc_address@@YAPEAXPEAXPEBD@Z	; au_get_proc_address
	mov	QWORD PTR procaddr$4[rsp], rax

; 87   : 			*iat = (uint64_t)procaddr;

	mov	rax, QWORD PTR iat$1[rsp]
	mov	rcx, QWORD PTR procaddr$4[rsp]
	mov	QWORD PTR [rax], rcx

; 88   : 			++iat;

	mov	rax, QWORD PTR iat$1[rsp]
	add	rax, 8
	mov	QWORD PTR iat$1[rsp], rax

; 89   : 		}

	jmp	SHORT $LN2@au_link_dl
$LN1@au_link_dl:

; 90   : 	}

	jmp	$LN4@au_link_dl
$LN3@au_link_dl:
$LN9@au_link_dl:

; 91   : }

	add	rsp, 120				; 00000078H
	ret	0
?au_link_dll@@YAXPEAX0@Z ENDP				; au_link_dll
_TEXT	ENDS
; Function compile flags: /Odtpy
; File e:\aurora kernel\kernel\pe.cpp
_TEXT	SEGMENT
i$1 = 32
ordinal$2 = 36
export_dir$ = 40
FunctionAddress$3 = 48
data_dir$ = 56
dos$ = 64
nt$ = 72
function_name$4 = 80
FunctionOrdinalAddressArray$ = 88
FunctionNameAddressArray$ = 96
FunctionAddressArray$ = 104
image$ = 128
procname$ = 136
?au_get_proc_address@@YAPEAXPEAXPEBD@Z PROC		; au_get_proc_address

; 40   : void* au_get_proc_address(void* image, const char* procname) {

$LN10:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 120				; 00000078H

; 41   : 	PIMAGE_DOS_HEADER dos = (PIMAGE_DOS_HEADER)image;

	mov	rax, QWORD PTR image$[rsp]
	mov	QWORD PTR dos$[rsp], rax

; 42   : 	PIMAGE_NT_HEADERS nt = raw_offset<PIMAGE_NT_HEADERS>(dos, dos->e_lfanew);

	mov	rax, QWORD PTR dos$[rsp]
	movzx	eax, WORD PTR [rax+60]
	mov	edx, eax
	mov	rcx, QWORD PTR dos$[rsp]
	call	??$raw_offset@PEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@@@YAPEAU_IMAGE_NT_HEADERS_PE32PLUS@@PEAU_IMAGE_DOS_HEADER_@@H@Z ; raw_offset<_IMAGE_NT_HEADERS_PE32PLUS * __ptr64,_IMAGE_DOS_HEADER_ * __ptr64>
	mov	QWORD PTR nt$[rsp], rax

; 43   : 	if (IMAGE_DATA_DIRECTORY_EXPORT + 1 > nt->OptionalHeader.NumberOfRvaAndSizes)

	mov	rax, QWORD PTR nt$[rsp]
	cmp	DWORD PTR [rax+132], 1
	jae	SHORT $LN7@au_get_pro

; 44   : 		return NULL;

	xor	eax, eax
	jmp	$LN8@au_get_pro
$LN7@au_get_pro:

; 45   : 	IMAGE_DATA_DIRECTORY& data_dir = nt->OptionalHeader.DataDirectory[IMAGE_DATA_DIRECTORY_EXPORT];

	mov	eax, 8
	imul	rax, rax, 0
	mov	rcx, QWORD PTR nt$[rsp]
	lea	rax, QWORD PTR [rcx+rax+136]
	mov	QWORD PTR data_dir$[rsp], rax

; 46   : 	if (data_dir.VirtualAddress == 0 || data_dir.Size == 0)

	mov	rax, QWORD PTR data_dir$[rsp]
	cmp	DWORD PTR [rax], 0
	je	SHORT $LN5@au_get_pro
	mov	rax, QWORD PTR data_dir$[rsp]
	cmp	DWORD PTR [rax+4], 0
	jne	SHORT $LN6@au_get_pro
$LN5@au_get_pro:

; 47   : 		return NULL;

	xor	eax, eax
	jmp	$LN8@au_get_pro
$LN6@au_get_pro:

; 48   : 	PIMAGE_EXPORT_DIRECTORY export_dir = raw_offset<PIMAGE_EXPORT_DIRECTORY>(image, data_dir.VirtualAddress);

	mov	rax, QWORD PTR data_dir$[rsp]
	mov	edx, DWORD PTR [rax]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAU_IMAGE_EXPORT_DIRECTORY@@PEAX@@YAPEAU_IMAGE_EXPORT_DIRECTORY@@PEAXH@Z ; raw_offset<_IMAGE_EXPORT_DIRECTORY * __ptr64,void * __ptr64>
	mov	QWORD PTR export_dir$[rsp], rax

; 49   : 	uint32_t* FunctionNameAddressArray = raw_offset<uint32_t*>(image, export_dir->AddressOfNames);

	mov	rax, QWORD PTR export_dir$[rsp]
	mov	edx, DWORD PTR [rax+32]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z	; raw_offset<unsigned int * __ptr64,void * __ptr64>
	mov	QWORD PTR FunctionNameAddressArray$[rsp], rax

; 50   : 	uint16_t* FunctionOrdinalAddressArray = raw_offset<uint16_t*>(image, export_dir->AddressOfNameOrdinal);

	mov	rax, QWORD PTR export_dir$[rsp]
	mov	edx, DWORD PTR [rax+36]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAGPEAX@@YAPEAGPEAXH@Z	; raw_offset<unsigned short * __ptr64,void * __ptr64>
	mov	QWORD PTR FunctionOrdinalAddressArray$[rsp], rax

; 51   : 	uint32_t* FunctionAddressArray = raw_offset<uint32_t*>(image, export_dir->AddressOfFunctions);

	mov	rax, QWORD PTR export_dir$[rsp]
	mov	edx, DWORD PTR [rax+28]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAIPEAX@@YAPEAIPEAXH@Z	; raw_offset<unsigned int * __ptr64,void * __ptr64>
	mov	QWORD PTR FunctionAddressArray$[rsp], rax

; 52   : 
; 53   : 	for (int i = 0; i < export_dir->NumberOfNames; i++) {

	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN4@au_get_pro
$LN3@au_get_pro:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax
	mov	DWORD PTR i$1[rsp], eax
$LN4@au_get_pro:
	mov	rax, QWORD PTR export_dir$[rsp]
	mov	eax, DWORD PTR [rax+24]
	cmp	DWORD PTR i$1[rsp], eax
	jae	SHORT $LN2@au_get_pro

; 54   : 		char *function_name = raw_offset<char*>(image, FunctionNameAddressArray[i]);

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR FunctionNameAddressArray$[rsp]
	mov	edx, DWORD PTR [rcx+rax*4]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEADPEAX@@YAPEADPEAXH@Z	; raw_offset<char * __ptr64,void * __ptr64>
	mov	QWORD PTR function_name$4[rsp], rax

; 55   : 		if (strcmp(function_name, procname) == 0) {

	mov	rdx, QWORD PTR procname$[rsp]
	mov	rcx, QWORD PTR function_name$4[rsp]
	call	?strcmp@@YAHPEBD0@Z			; strcmp
	test	eax, eax
	jne	SHORT $LN1@au_get_pro

; 56   : 			uint16_t ordinal = FunctionOrdinalAddressArray[i];

	movsxd	rax, DWORD PTR i$1[rsp]
	mov	rcx, QWORD PTR FunctionOrdinalAddressArray$[rsp]
	movzx	eax, WORD PTR [rcx+rax*2]
	mov	WORD PTR ordinal$2[rsp], ax

; 57   : 			uint32_t FunctionAddress = FunctionAddressArray[ordinal];

	movzx	eax, WORD PTR ordinal$2[rsp]
	mov	rcx, QWORD PTR FunctionAddressArray$[rsp]
	mov	eax, DWORD PTR [rcx+rax*4]
	mov	DWORD PTR FunctionAddress$3[rsp], eax

; 58   : 			return raw_offset<void*>(image, FunctionAddress);

	mov	edx, DWORD PTR FunctionAddress$3[rsp]
	mov	rcx, QWORD PTR image$[rsp]
	call	??$raw_offset@PEAXPEAX@@YAPEAXPEAXH@Z	; raw_offset<void * __ptr64,void * __ptr64>
	jmp	SHORT $LN8@au_get_pro
$LN1@au_get_pro:

; 59   : 		}
; 60   : 	}

	jmp	$LN3@au_get_pro
$LN2@au_get_pro:

; 61   : 
; 62   : 	return nullptr;

	xor	eax, eax
$LN8@au_get_pro:

; 63   : }

	add	rsp, 120				; 00000078H
	ret	0
?au_get_proc_address@@YAPEAXPEAXPEBD@Z ENDP		; au_get_proc_address
_TEXT	ENDS
END
