;; ----   Copyright (C) Manas Kamal Choudhury 2022
;;
;; x86_64_lowlevel.asm -- low level stuffs for x86_64 architecture
;;
;; /PROJECT - Aurora
;; /AUTHOR  - Manas Kamal Choudhury
;;
;; -----------------------------------------------------------------------

section .text
[BITS 64]

global x64_inportb
x64_inportb:
    mov dx, cx
	in  al, dx
	ret

global x64_inportw
x64_inportw:
    mov dx, cx
	in  ax, dx
	ret

global x64_inportd
x64_inportd:
    mov dx, cx
	in  eax, dx
	ret


global x64_outportb
x64_outportb:
    mov al, dl
	mov dx, cx
	out dx, al
	ret

global x64_outportw
x64_outportw:
    mov ax, dx
	mov dx, cx
	out dx, ax
	ret

global x64_outportd
x64_outportd:
    mov eax, edx
	mov dx, cx
	out dx, eax
	ret


;--------------------------------
; M S R  F U n C t I o N s
;--------------------------------
global x64_read_msr
x64_read_msr:
    rdmsr
	shl rdx, 32
	or rax, rdx
	ret


global x64_write_msr
x64_write_msr:
     mov rax, rdx
	 shr rdx, 32
	 wrmsr
	 ret


;;=======================================================
;; GS/FS Structures
;;=======================================================

global x64_read_gs_b
x64_read_gs_b:
     xor rax,rax
     mov al, [gs:rcx]
	 ret

global x64_read_gs_w
x64_read_gs_w:
     xor rax, rax
	 mov ax, [gs:rcx]
	 ret

global x64_read_gs_d
x64_read_gs_d:
     xor rax, rax
	 mov eax, [gs:rcx]
	 ret

global x64_read_gs_q
x64_read_gs_q:
	 mov rax, [gs:rcx]
	 ret

global x64_write_gs_b
x64_write_gs_b:
     mov [gs:rcx], dl
	 ret

global x64_write_gs_w
x64_write_gs_w:
     mov [gs:rcx], dx
	 ret

global x64_write_gs_d
x64_write_gs_d:
     mov [gs:rcx], edx
	 ret

global x64_write_gs_q
x64_write_gs_q:
     mov [gs:rcx], rdx
	 ret

;---------------------------------------------------------
; Control Register functions
;---------------------------------------------------------

global x64_read_cr0
x64_read_cr0:
     mov rax, cr0
	 ret

global x64_write_cr0
x64_write_cr0:
     mov cr0, rcx
	 ret

global x64_read_cr2
x64_read_cr2:
      mov rax, cr2
	  ret

global x64_read_cr3
x64_read_cr3:
      mov rax, cr3
	  ret

global x64_read_cr4
x64_read_cr4:
      mov rax, cr4
	  ret

global x64_write_cr3
x64_write_cr3:
      mov cr3, rcx
	  ret

global x64_write_cr4
x64_write_cr4:
      mov cr4, rcx
	  ret

;----------------------------------------------------------
; Segments functions
;----------------------------------------------------------
global x64_get_segment_register
x64_get_segment_register:
and rcx, 0x7
mov rdx, .jmp_tab
add rdx, rcx
add rdx, rcx
jmp rdx
.jmp_tab:
jmp short .cs
jmp short .ds
jmp short .es
jmp short .fs
jmp short .gs
jmp short .ss
jmp short .invalid
jmp short .invalid
.cs:
mov ax, cs
ret
.ds:
mov ax, ds
ret
.es:
mov ax, es
ret
.fs:
mov ax, fs
ret
.gs:
mov ax, gs
ret
.ss:
mov ax, ss
ret
.invalid:
xor ax, ax
ret


global x64_set_segment_register
x64_set_segment_register:
and rcx, 0x7
mov r8, .jmp_tab
add r8, rcx
add r8, rcx
jmp r8
.jmp_tab:
jmp short .cs
jmp short .ds
jmp short .es
jmp short .fs
jmp short .gs
jmp short .ss
jmp short .invalid
jmp short .invalid
.cs:
;mov cs, dx	//that's too easy, isn't it?
pop rax
push rdx
push rax
db 0x48		;REX.W
retf
.ds:
mov ds, dx
ret
.es:
mov es, dx
ret
.fs:
mov fs, dx
ret
.gs:
mov gs, dx
ret
.ss:
mov ss, dx
ret
.invalid:
xor ax, ax
ret


;--------------------------------------------------
; Interrupt flags
;--------------------------------------------------
global x64_cli
x64_cli:
     cli
	 ret

global x64_sti
x64_sti:
     sti
	 ret

global x64_idt_test
x64_idt_test:
     int 14
	 ret


;=====================================================
;  GDT & IDT
;=====================================================
global x64_sgdt
x64_sgdt:
    sgdt [rcx]
	ret

global x64_lgdt
x64_lgdt:
    lgdt [rcx]
	ret

global x64_sidt
x64_sidt:
    sidt [rcx]
	ret

global x64_lidt
x64_lidt:
    lidt [rcx]
	ret


;======================================================
;; TSS
;;=====================================================
global x64_ltr
x64_ltr:
     ltr cx
	 ret

;;=======================================================
; MFENCE
;;=======================================================
global x64_mfence
x64_mfence:
     mfence
	 ret

;=========================================================
; CPUID
;=========================================================
global x64_cpuid
x64_cpuid:
    push rbp
	mov  rbp, rsp
	push rbx
	mov  rax, rcx
	mov  r10, rdx
	mov  rcx, [rbp+56]
	cpuid
	mov  [r10], rax
	mov  [r8], rbx
	mov  [r9], rcx
	mov   r11, [rbp+48]
	mov  [r11], rdx
	pop  rbx
	pop  rbp
	ret


;=====================================
; TLB FLUSH
;=====================================
global flush_tlb
flush_tlb:
       invlpg [rcx]
	   ret

global cache_flush
cache_flush:
       wbinvd
	   ret


global x64_hlt
x64_hlt:
     hlt
	 ret

global x64_pause
x64_pause:
     pause
	 ret

;======================================
; SSE & AVX
;======================================
global x64_activate_sse
x64_activate_sse:
      mov rax, cr0
	  and ax, 0xFFFB
	  or  ax, 0x2
	  mov cr0,rax
	  mov rax,cr4
	  or  ax, 3 << 9
	  mov cr4, rax
	  ret

global x64_activate_avx
x64_activate_avx:
      push rax
	  push rcx
	  push rdx

      xor rcx, rcx
	  xgetbv
	  or  eax, 7
	  xsetbv

	  pop rdx
	  pop rcx
	  pop rax
	  ret

;==========================================================
;   FXSAVE - FXRSTOR 
;==========================================================
global x64_fxsave
x64_fxsave:
      and cl, 0xF0
	  add rcx, 0x10
      fxsave [rcx]
	  ret

global x64_fxrstor
x64_fxrstor:
      and cl, 0xF0
	  add rcx, 0x10
      fxrstor [rcx]
	  ret

global x64_read_xcr0
x64_read_xcr0:
      xor rcx, rcx
	  xgetbv
	  shl rdx, 32
	  or rax, rdx
	  ret

global x64_write_xcr0
x64_write_xcr0:
      mov rax, rcx
	  mov rdx, rcx
	  xor rcx, rcx
	  shr rdx, 32
	  xsetbv
	  ret

global x64_stack_switch
x64_stack_switch:
	  mov rsp, rcx
	  ret

global x64_get_stack
x64_get_stack:
	 mov rax, rsp
	 ret

;======================================
; LOCKING
;======================================
global x64_lock_acquire
x64_lock_acquire:  
.trylock:
     mov rax, 1
     lock xchg qword [rcx],rax
	 cmp rax, 0
	 je .escape
     pause
	 jmp .trylock
.escape:
     ret

global x64_lock_release
x64_lock_release:
	 mov qword [rcx], 0
	 ret



