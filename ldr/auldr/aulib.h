/**
 * Copyright (C) Manas Kamal Choudhury 2022
 */

#ifndef __AU_LIB_H__
#define __AU_LIB_H__

#include <Uefi.h>
#include "stdint.h"


/*
* aulib_initialize -- initializes the uefi aulib library
* @param image_handle -- pointer to the image handle
* @param system_table -- pointer to the uefi system table
*/
extern int aulib_initialize(EFI_HANDLE image_handle, EFI_SYSTEM_TABLE *system_table);

/*
* aulib_initialize_console -- initializes the console
*/
extern int aulib_initialize_console();

/*
* aulib_set_text_attrib -- set text colors
* @param f -- foreground color
* @param b -- background color
*/
extern void aulib_set_text_attrib(int f, int b);

/*
* aulib_get_system_table -- returns the installed system table
*/
extern EFI_SYSTEM_TABLE * aulib_get_system_table();

/*
* aulib_allocate -- allocates memory
* @param memsize -- memory size in bytes to be allocated
*/
extern void* aulib_allocate(const uint64_t memsize);

/*
* aulib_load_file -- loads and read a file
* @param filename -- file path and name to load and read
*/
extern uint8_t* aulib_load_file(wchar_t* filename);

/*
* aulib_query_gop -- queries the graphics protocol for specific
* screen resolution, if it's not found, UEFI returns a default
* graphics resolution mode
* @param width -- width of the screen in pixels
* @param height -- height of the screen in pixels
*/
extern uint64_t aulib_query_gop(uint32_t width, uint32_t height);

/*
* aulib_set_graphics_mode -- set a graphics mode
* @param mode -- desired graphics mode number
*/
extern int aulib_set_graphics_mode(uint64_t mode);

/*
* aulib_get_fb_address -- returns the framebuffer
* address
*/
extern uint32_t* aulib_get_fb_address();

/*
* aulib_get_x_resolution -- returns the current screen
* width
*/
extern uint32_t aulib_get_x_resolution();

/*
* aulib_get_y_resolution -- returns the current screen
* height
*/
extern uint32_t aulib_get_y_resolution();

/*
* aulib_get_fb_size -- returns the current fb size
*/
extern size_t aulib_get_fb_size();

/*
* aulib_get_pixels_per_line -- returns current pixels/scanline
*/
extern uint32_t aulib_get_pixels_per_line();

/*
* aulib_free -- make a memory block available
* @param memory -- memory to mark free
*/
extern void aulib_free(void* memory);

/*
* aulib_get_acpi_pointer -- returns the acpi table pointer
*/
extern void* aulib_get_acpi_pointer();

/*
* aulib_get_recent_file_size -- returnes recently opened
* file size
*/
extern uint64_t aulib_get_recent_file_size();

/*
* aulib_copy_mem -- copies memory
*/
extern void aulib_copy_mem(void* dst, void* src, size_t length);
#endif