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

#ifndef __STRING_H__
#define __STRING_H__

#include <stdint.h>

//!=====================================================
//! S T R I N G   G L O B A L   F U N C T I O N S
//!=====================================================
extern int strcmp(const char* str1, const char* str2);
extern char *strcpy(char *s1, const char *s2);
extern size_t strlen(const char* str);
extern int strncmp(const char* s1, const char *s2, size_t n);
extern char *strncpy(char *destString, const char* sourceString, size_t maxLength);
extern char* strchr(char* str, int character);

//!=====================================================
//! M E M O R Y  G L O B A L   F U N C T I O N S
//!=====================================================
extern void memset(void *targ, uint8_t val, uint32_t len);
extern "C" void  memcpy(void *targ, void *src, uint32_t len);
extern  int memcmp(const void *first, const void *second, size_t length);
extern void* memmove(void*, const void*, size_t);

#endif