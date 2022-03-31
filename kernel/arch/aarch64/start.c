/*
 *  Copyright (C) Manas Kamal Choudhury 2022
 *
 *  start.c -- prepares the environment for the
 *  kernel
 */

#include <stdint.h>

volatile uint8_t* uart = (uint8_t*)0x09000000;

void putchar(char c) {
	*uart = c;
}

void print(const char* s) {
	while (*s != '\0') {
		putchar(*s);
		s++;
	}
}

void kmain(void) {
	print("Aurora for AARCH64 \r\n");
	print("Welcome to Mobile World \r\n");
	for (;;);
}