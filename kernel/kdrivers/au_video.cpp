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

#include <kdrivers\au_video.h>
#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_pmmngr.h>
#include <auinfo.h>


au_fb_t fb_;

/*
 * au_fb_initialize -- initialize the framebuffer
 */
int au_fb_initialize() {
	uint32_t* phys_fb = au_get_boot_info()->fb_addr;

	for (size_t i = 0; i < au_get_boot_info()->fb_size / 4096; i++)
		x86_64_map_page((uint64_t)phys_fb + i * 4096, FRAMEBUFFER_ADDRESS + i * 4096, 0);

	fb_.framebuffer = (uint32_t*)FRAMEBUFFER_ADDRESS;
	fb_.pixels_per_scanline = au_get_boot_info()->pixels_per_line;
	fb_.x_resolution = au_get_boot_info()->x_res;
	fb_.y_resolution = au_get_boot_info()->y_res;
	return 0;
}

/*
 * au_video_get_fb -- return the framebuffer address
 */
uint32_t* au_video_get_fb() {
	return fb_.framebuffer;
}

/*
 * au_video_get_pixels_per_line -- return the screen pixels
 * per line information
 */
uint16_t au_video_get_pixels_per_line() {
	return fb_.pixels_per_scanline;
}

/*
 * au_video_get_x_res -- return screen width
 */
uint32_t au_video_get_x_res() {
	return fb_.x_resolution;
}

/*
 * au_video_get_y_res -- return screen height
 */
uint32_t au_video_get_y_res() {
	return fb_.y_resolution;
}