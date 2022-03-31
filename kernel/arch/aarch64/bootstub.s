/*  Copyright (C) Manas Kamal Choudhury 2022  
 *
 *  bootstub.s -- aarch64 kernel loader
 */

 .global _start
 _start:
      ldr x30, =stack_top   /*STACK_TOP from linker.ld */
	  mov sp, x30
	  bl  kmain
	  b .
