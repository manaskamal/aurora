/*
 * Copyright (C) Manas Kamal Choudhury 2022
 */

#ifndef __STRING_H__
#define __STRING_H__

#include "stdint.h"

/*
* memset -- set a memory region with some specific
* value
* @param targ -- target memory
* @param val -- value to set
* @param len -- length of the memory
*/
extern "C" void  memset(void *targ, uint8_t val, uint32_t len);

/*
* memcpy -- copies a source memory to a destination memory
* @param targ -- destination memory
* @param src -- source memory
* @param len -- length of the memory
*/
extern void memcpy(void *targ, void *src, uint32_t len);

extern wchar_t *wstrchr(wchar_t *s, int c);
extern int  wstrlen(wchar_t *s);
extern uint32_t wstrsize(wchar_t *s);

extern size_t strlen(const char* str);

#endif