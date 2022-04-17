;;------------------------------------------------
;; Copyright (C) Manas Kamal Choudhury 2022
;;
;; x86_64_ctx_switch -- context switch code
;;
;; /PROJECT - Aurora Kernel
;; /AUTHOR  - Manas Kamal Choudhury
;;
;;------------------------------------------------

section .text
[BITS 64]


;;-------------------------------------------------------
;; SAVE CONTEXTS
;;-------------------------------------------------------
global x86_64_save_context
x86_64_save_context:
      mov [rcx + 0x30], rbx
	  mov [rcx + 0x48], rsi
	  mov [rcx + 0x50], rdi
	  mov [rcx + 0x58], rbp
	  mov [rcx + 0x80], r12
	  mov [rcx + 0x88], r13
	  mov [rcx + 0x90], r14
	  mov [rcx + 0x98], r15

	  ;; MUST SAVE SSE/AVX/AVX-512 registers 

	  pushfq
	  pop rax
	  mov [rcx + 0x10], rax

	  pop rdx   ; return address
	  mov [rcx + 0x20], rdx
	  mov [rcx + 0x08], rsp

	  xor rax, rax
	  jmp rdx


;;===============================================
;; Execute Thread
;;===============================================

global x86_64_execute_context
x86_64_execute_context:
      mov rbx, [rcx + 0x30]
	  mov rsi, [rcx + 0x48]
	  mov rdi, [rcx + 0x50]
	  mov rbp, [rcx + 0x58]
	  mov r12, [rcx + 0x80]
	  mov r13, [rcx + 0x88]
	  mov r14, [rcx + 0x90]
	  mov r15, [rcx + 0x98]

	  ;mov ds, [rcx + 0xA0]
	  ;mov es, [rcx + 0xA8]
	  ;mov fs, [rcx + 0xB0]
	  ;mov gs, [rcx + 0xB8]
	  ;; Restore SSE/AVX/AVX-512 registers

	  mov r9,1
	  cmp r8, 0
	  cmove r8, r9
	  mov r9, [rcx + 0x10]

	  mov r10, [rcx + 0xC0]
	  mov cr3, r10

	  mov rdx, [rcx + 0x20]
	  push qword [rcx + 0x00]  ;;SS
	  push qword [rcx + 0x08]  ;;RSP
	  push r9                  ;;RFLAGS
	  push qword [rcx + 0x18]  ;;CS
	  push rdx                 ;;RIP
	  iretq