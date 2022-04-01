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

#include <auinfo.h>
#include <arch\x86_64\x86_64_pmmngr.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_exception.h>
#include <arch\x86_64\x86_64_paging.h>
#include <string.h>

#include <kdrivers\au_video.h>
#include <kdrivers\serial.h>
#include <kdrivers\au_acpi.h>


aurora_info_t info;

aurora_info_t * au_get_boot_info() {
	return &info;
}


extern "C" int _fltused = 1;

int _kmain(aurora_info_t *bootinfo) {
	bootinfo->auprint("Aurora Kernel \n");
	memcpy(&info, bootinfo, sizeof(aurora_info_t));

	int au_status = 0;

	

	x86_64_pmmngr_init(bootinfo);
	x86_64_cpu_initialize();

	/* initialize early drivers*/
	au_status = au_fb_initialize();
	au_status = x86_64_paging_init();
	

	au_status = au_initialize_serial();
	au_status = au_initialize_acpi();


	/* just for debug purpose */
	for (int i = 0; i < 100; i++) {
		for (int j = 0; j < 100; j++) {
			au_video_get_fb()[i + j * info.x_res] = 0xffffffff;
		}
	}
	
	for (;;);
	return 0;
}