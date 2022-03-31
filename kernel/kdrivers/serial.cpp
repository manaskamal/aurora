/**
* BSD 2-Clause License
*
* Copyright (c) 2022, Manas Kamal Choudhury
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright notice,
*    this list of conditions and the following disclaimer in the documentation
*    and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
**/

#include <kdrivers\serial.h>
#include <string.h>
#include <va_list.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_pmmngr.h>
#include <stdlib.h>


#define PORT  0x3f8
static bool _serial_initialized_ = false;


int au_initialize_serial() {
	x64_outportb(x86_64_phys_to_virt(PORT + 1), 0x00);
	x64_outportb(x86_64_phys_to_virt(PORT + 3), 0x80);
	x64_outportb(x86_64_phys_to_virt(PORT + 0), 0x03);
	x64_outportb(x86_64_phys_to_virt(PORT + 1), 0x00);
	x64_outportb(x86_64_phys_to_virt(PORT + 3), 0x03);
	x64_outportb(x86_64_phys_to_virt(PORT + 2), 0xC7);
	x64_outportb(x86_64_phys_to_virt(PORT + 4), 0x0B);
	_serial_initialized_ = true;
	return 0;
}

int is_transmit_empty() {
	return x64_inportb(x86_64_phys_to_virt(PORT + 5)) & 0x20;
}

void write_serial(char a) {
	while (is_transmit_empty() == 0);
	x64_outportb(x86_64_phys_to_virt(PORT), a);
}

void debug_serial(char* string) {
	for (int i = 0; i < strlen(string); i++)
		write_serial(string[i]);
}

void _au_debug_print_(char* format, ...) {
	_va_list_ args;
	va_start(args, format);

	while (*format)
	{
		if (*format == '%')
		{
			++format;
			if (*format == 'd')
			{
				size_t width = 0;
				if (format[1] == '.')
				{
					for (size_t i = 2; format[i] >= '0' && format[i] <= '9'; ++i)
					{
						width *= 10;
						width += format[i] - '0';
					}
				}
				size_t i = va_arg(args, size_t);
				char buffer[sizeof(size_t)* 8 + 1];
				//	size_t len
				if (i < 0) {
					i = +i;
					sztoa(i, buffer, 10);
				}
				else {
					sztoa(i, buffer, 10);
					size_t len = strlen(buffer);
				}
				/*	while (len++ < width)
				puts("0");*/
				debug_serial(buffer);
			}
			else if (*format == 'c')
			{
				char c = va_arg(args, char);
				//char buffer[sizeof(size_t) * 8 + 1];
				//sztoa(c, buffer, 10);
				//puts(buffer);
				write_serial(c);
			}
			else if (*format == 'x')
			{
				size_t x = va_arg(args, size_t);
				char buffer[sizeof(size_t)* 8 + 1];
				sztoa(x, buffer, 16);
				//puts("0x");
				debug_serial(buffer);
			}
			else if (*format == 's')
			{
				char* x = va_arg(args, char*);
				debug_serial(x);
			}
			else if (*format == 'f')
			{
				/*double x = va_arg(args, double);
				debug_serial(ftoa(x, 2));*/
			}
			else if (*format == '%')
			{
				debug_serial(".");
			}
			else
			{
				char buf[3];
				buf[0] = '%'; buf[1] = *format; buf[2] = '\0';
				debug_serial(buf);
			}
		}
		else
		{
			char buf[2];
			buf[0] = *format; buf[1] = '\0';
			debug_serial(buf);
		}
		++format;
	}
	va_end(args);
}

bool is_serial_initialized() {
	return _serial_initialized_;
}