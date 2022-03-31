/*
 * Copyright (C) Manas Kamal Choudhury 2022
 * 
 * graphics -- graphics management
 *
 */

#include "graphics.h"
#include "aulib.h"
#include "font.h"


size_t xpos = 0;
size_t ypos = 0;
uint32_t background = 0x00000000;
uint32_t foreground = 0xFFFFFFFF;


/*
 * au_draw_pixel -- draws a pixel on the screen
 * @param x -- x coord
 * @param y -- y coord
 * @param color -- 32 bit color
 */
void au_draw_pixel(unsigned int x, unsigned int y, unsigned int color) {
	uint32_t *fb = (uint32_t*)aulib_get_fb_address();
	fb[x + y * aulib_get_x_resolution()] = color;
}


/*
 * au_puts -- draws strings to screen
 * @param str -- strings to draw
 */
void au_puts(const char* str) {
	uint32_t* framebuffer = aulib_get_fb_address();
	size_t h_res = aulib_get_x_resolution();
	size_t v_res = aulib_get_y_resolution();
	while (*str){

		if (*str > 0xFF){
			//unicode
		}
		else if (*str == '\n'){
			++ypos;
			xpos = 0;
		}
		else if (*str == '\r'){
		}
		else if (*str == '\b'){
			if (xpos > 0)
				--xpos;
		}
		else {

			//Yahoooo! Draw the character
			const bx_fontcharbitmap_t entry = bx_vgafont[*str];
			for (size_t y = 0; y < 16; ++y)
			{

				for (size_t x = 0; x < 8; ++x)
				{

					if (entry.data[y] & (1 << x))
					{
						au_draw_pixel(x + xpos * 9, y + ypos * 16, foreground);
					}
					else {
						au_draw_pixel(x + xpos * 9, y + ypos * 16, background);
					}
				}
				au_draw_pixel(8 + xpos * 9, y + ypos * 16, background);
			}
			++xpos;
			if (xpos > h_res / 9)
			{
				xpos = 0;
				++ypos;
			}
		}

		++str;
	}


	/* Scroll */

	if (ypos + 1> v_res / 16)
	{
		for (int i = 16; i < v_res * h_res; i++)
			framebuffer[i] = framebuffer[i + h_res*16];
		ypos--;
	}
}

/*
 * au_putc -- draws a single character to the screen
 * @param str -- single character
 */
void au_putc(char str){
	uint32_t* framebuffer = aulib_get_fb_address();
	size_t h_res = aulib_get_x_resolution();
	size_t v_res = aulib_get_y_resolution();

	if (xpos > v_res / 9) {
		xpos = 0;
		ypos++;
	}
	//draw it

	for (size_t y = 0; y < 16; ++y){
		for (size_t x = 0; x < 8; ++x){
			const bx_fontcharbitmap_t& entry = bx_vgafont[str];
			if (entry.data[y] & (1 << x)){
				au_draw_pixel(x + xpos * 9, y + ypos * 16, foreground);
			}
			else{
				au_draw_pixel(x + xpos * 9, y + ypos * 16, background);
			}
		}
		au_draw_pixel(8 + xpos * 9, y + ypos * 16, background);
	}

	xpos++;

	uint32_t *lfb = (uint32_t*)framebuffer;
	if (ypos + 1> h_res / 16)
	{
		for (int i = 16; i < h_res * v_res; i++)
			lfb[i] = lfb[i + v_res * 16];
		ypos--;
	}

}