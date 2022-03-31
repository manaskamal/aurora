; -- Copyright (C) Manas Kamal Choudhury 2022
; 


section .text
[BITS 64]

global memcpy
memcpy:
     mov rax, rcx
	 push rsi
	 push rdi
	 mov rdi,rcx
	 mov rsi,rdx
	 mov rcx,r8
	 rep movsb
	 pop rdi
	 pop rsi
	 ret