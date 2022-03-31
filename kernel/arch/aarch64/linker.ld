/*  Copyright (C) Manas Kamal Choudhury 2022 */

ENTRY(_start)
SECTIONS {
     . = 0x40000000;
	 .startup . : { arch/aarch64/bootstub.o(.text) }
	 .text : {*(.text)}
	 .data : {*(.data)}
	 .bss : {*(.bass COMMON)}
	 . = ALIGN(8);
	 . += 0x1000;
	 stack_top = .;
}