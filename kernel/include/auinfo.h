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

#ifndef __AUINFO_H__
#define __AUINFO_H__

#include "stdint.h"

#pragma pack(push,1)
/*
* aurora_info_t -- aurora boot informations
*/
typedef struct _AURORA_INFO_ {
	void* mem_map;
	uint64_t mem_desc_size;
	uint64_t mem_map_size;
	void* phys_stack_allocated;
	size_t resvd_mem_count;
	uint32_t* fb_addr;
	size_t fb_size;
	uint32_t x_res;
	uint32_t y_res;
	uint16_t pixels_per_line;
	void*  acpi_table_pointer;
	size_t kernel_size;
	void* apcode;
	void(*auprint)(const char* text, ...);
}aurora_info_t;

#pragma pack(pop)

/*
 * au_get_boot_info -- returns the boot informations
 * structure
 */
extern aurora_info_t * au_get_boot_info();

#endif