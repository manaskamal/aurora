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

#ifndef __AU_VIDEO_H__
#define __AU_VIDEO_H__

#include <stdint.h>

/* au_fb_t -- framebuffer structure */
typedef struct _au_fb_ {
	uint32_t x_resolution;
	uint32_t y_resolution;
	uint16_t pixels_per_scanline;
	uint32_t* framebuffer;
}au_fb_t;


/*
* au_fb_initialize -- initialize the framebuffer
*/
extern int au_fb_initialize();

/*
* au_video_get_fb -- return the framebuffer address
*/
extern uint32_t* au_video_get_fb();
/*
* au_video_get_pixels_per_line -- return the screen pixels
* per line information
*/
extern uint16_t au_video_get_pixels_per_line();

/*
* au_video_get_x_res -- return screen width
*/
extern uint32_t au_video_get_x_res();

/*
* au_video_get_y_res -- return screen height
*/
extern uint32_t au_video_get_y_res();
#endif