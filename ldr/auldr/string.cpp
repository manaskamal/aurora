/*
 * Copyright (C) Manas Kamal Choudhury 2022
 * 
 * @project - auldr
 */

#include "string.h"
#include "stdint.h"

/*
 * memset -- set a memory region with some specific
 * value
 * @param targ -- target memory
 * @param val -- value to set
 * @param len -- length of the memory
 */
void memset(void *targ, uint8_t val, uint32_t len){
	uint8_t *t = (uint8_t*)targ;
	while (len--)
		*t++ = val;
}

/*
 * memcpy -- copies a source memory to a destination memory
 * @param targ -- destination memory
 * @param src -- source memory
 * @param len -- length of the memory
 */
void memcpy(void *targ, void *src, uint32_t len) {
	uint8_t *t = (uint8_t *)targ;
	uint8_t *s = (uint8_t *)src;
	if (len > 0) {
		// check to see if target is in the range of src and if so, do a memmove() instead
		if ((t > s) && (t < (s + len))){
			t += (len - 1);
			s += (len - 1);
			while (len--)
				*t-- = *s++;
		}
		else {
			while (len--)
				*t++ = *s++;
		}
	}
}

wchar_t *wstrchr(wchar_t *s, int c) {
	while (*s) {
		if (*s == c)
			return s;
		s++;
	}

	return 0;
}

int wstrlen(wchar_t *s) {
	int i = 0;
	while (*s)
		i++, s++;
	return i;
}

uint32_t wstrsize(wchar_t *s) {
	return (wstrlen(s) + 1) * sizeof(unsigned short);
}


size_t strlen(const char* str){
	size_t len = 0;
	while (str[len++]);
	return len;
}
