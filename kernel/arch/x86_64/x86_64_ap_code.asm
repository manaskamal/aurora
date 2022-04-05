;;=======================================================
;;  Copyright (C) Manas Kamal Choudhury 2022
;;
;;  /PROJECT - Aurora Kernel
;;  /AUTHOR  - Manas Kamal Choudhury
;;
;;
;;=======================================================

[section .text]
[bits 16]
[org 0x9000]
_entry:
     cli
	 cld
     jmp 0:ap_boot
	 nop

align 8
pml4_address: dq 0
stack_address: dq 0
kentry: dq 0
kstack: dq 0

gdt_address:
     dq 0
	 dq 0x0020980000000000
	 dq 0x0000920000000000
	 dq 0x00cf98000000ffff
	 dq 0x00cf92000000ffff
end_of_gdt:
gdt_toc:
     dw end_of_gdt - gdt_address - 1
	 dd gdt_address

ap_boot:
     cli

     mov ax, word [stack_address]
	 mov ss, ax
	 mov sp, 0xFFFF

	 lgdt [gdt_toc]

	 mov eax, cr0
	 or eax, 1
	 mov cr0, eax

	 jmp 0x18:ap_32
[bits 32]
ap_32:
     cli
     mov ax, 0x20
	 mov ds, ax
	 mov es, ax
	 mov fs, ax
	 mov gs, ax
	 mov ss, ax

	 ; Enable PAE paging 
	 mov eax, cr4
	 or eax, 1 << 5
	 mov cr4, eax
	 

	 ; enable long mode (bit 8 of EFER) and NXE bit (bit 11)
	 mov ecx, 0xC0000080
	 rdmsr
	 or eax, 1<<8
	 or eax, 1<<11
	 wrmsr

	 mov eax, dword [pml4_address]
	 mov cr3, eax


	 ; enable paging
	 mov eax, cr0
	 or eax, 1<<31
	 or eax, 1<<16
	 mov cr0, eax

	 ;reload the GDT
	 lgdt [gdt_toc]


	 jmp 0x08:ap_64
[bits 64]
ap_64:
     cli
     mov ax, 0x10
	 mov ds, ax
	 mov es, ax
	 mov fs, ax
	 mov gs, ax
	 mov ss, ax


	 mov rax, qword [pml4_address]
	 mov cr3, rax


	 ; move the stack address to higher half
	 ; because at some point, the lower half
	 ; will get cleared

	 mov rax, qword  [kstack]
	 add rax, 4095
	 sub rax, 0x20
	 mov rsp, rax

	 ;mov rcx, [cpu_id]
	 mov r9, qword [kentry]
	 jmp r9