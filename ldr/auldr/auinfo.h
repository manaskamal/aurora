/*
 * Copyright (C) Manas Kamal Choudhury 2022
 *
 * auinfo.h -- Aurora Boot Informations
 * 
 * /PROJECT - auldr
 * /AUTHOR  - Manas Kamal Choudhury
 *
 */

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
	void*  apcode;
	void(*auprint)(const char* text, ...);
}aurora_info_t;

#pragma pack(pop)

#endif