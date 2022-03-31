;;  Copyright (C) Manas Kamal Choudhury 2022
;; 
;;  lowlevel.asm -- lowlevel stuffs
;; 
;;  /PROJECT - auldr v1.0
;;  /AUTHOR  - Manas Kamal Choudhury
;;
;;----------------------------------------------

BITS 64

section .text

global au_read_cr3
au_read_cr3:
   mov rax, cr3
   ret

global au_write_cr3
au_write_cr3:
   mov cr3, rcx
   ret

global au_mfence
au_mfence:
   mfence
   ret

global au_flush_tlb
au_flush_tlb:
   invlpg [rcx]
   ret

global au_cache_flush
au_cache_flush:
   wbinvd
   ret

global au_write_cr0
au_write_cr0:
   mov cr0, rcx
   ret

global au_read_cr0
au_read_cr0:
   mov rax, cr0
   ret

global au_cli
au_cli:
    cli
	ret

global au_sti
au_sti:
    sti
	ret

global au_call_kernel
au_call_kernel:
   add r8, r9
   sub r8, 0x28
   mov rsp,r8
   push rbp
   mov rbp, rsp
   sub rsp, 32
   call rdx
   jmp $
   ret
