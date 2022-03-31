/*
 * type.cpp -- type conversion
 */

#include "stdint.h"


int to_upper(int c) {
	if ((c >= 'a') && (c <= 'z'))
		return (c - ('a' - 'A'));
	return c;
}

int to_lower(int c){
	if ((c >= 'A') && (c <= 'Z'))
		return (c + ('a' - 'A'));
	return c;
}

int is_digit(int c) {
	return ((c >= '0') && (c <= '9'));
}