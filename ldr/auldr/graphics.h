/* 
 * Copyright (C) Manas Kamal Choudhury 2022
 * graphics -- graphics manager
 */

#ifndef __GRAPHICS_H__
#define __GRAPHICS_H__

/*
* au_draw_pixel -- draws a pixel on the screen
* @param x -- x coord
* @param y -- y coord
* @param color -- 32 bit color
*/
extern void au_draw_pixel(unsigned int x, unsigned int y, unsigned int color);

/*
* au_puts -- draws strings to screen
* @param str -- strings to draw
*/
extern void au_puts(const char* str);

/*
* au_putc -- draws a single character to the screen
* @param str -- single character
*/
extern void au_putc(char str);

#endif