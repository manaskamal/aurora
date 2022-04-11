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
#include <arch\x86_64\x86_64_apic.h>
#include <arch\x86_64\x86_64_ioapic.h>
#include <arch\x86_64\x86_64_per_cpu.h>
#include <arch\x86_64\x86_64_scheduler.h>
#include <string.h>

#include <kdrivers\au_video.h>
#include <kdrivers\serial.h>
#include <kdrivers\au_acpi.h>

#include <mm\kmalloc.h>
#include <fs\vfs.h>
#include <fs\devfs.h>



aurora_info_t info;

aurora_info_t * au_get_boot_info() {
	return &info;
}



extern "C" int _fltused = 1;
static uint64_t thr_lock = 0;

void thread_test() {
	x64_lock_acquire(&thr_lock);
	printf("Thread test %d\n", per_cpu_get_cpu_id());
	if (thr_lock == 1)
		thr_lock = 0;
	for (;;) {
		x64_cli();
		x64_lock_acquire(&thr_lock);
		if (per_cpu_get_cpu_id() != 0)
			printf("Thr tst in cpu %d\n", per_cpu_get_cpu_id());
		if (per_cpu_get_cpu_id() == 0)
			printf("Thr tst in bsp\n");

		for (int i = 0; i < 100000; i++)
			;
		x64_sti();
		if (thr_lock == 1)
			thr_lock = 0;
		
	}
}

/* initialize the bsp from here!*/
int _kmain(aurora_info_t *bootinfo) {
	x64_cli();

	bootinfo->auprint("Aurora Kernel \n");
	memcpy(&info, bootinfo, sizeof(aurora_info_t));

	int au_status = 0;


	x86_64_pmmngr_init(bootinfo);
	x86_64_cpu_initialize(true);

	/* initialize early drivers*/
	au_status = au_fb_initialize();
	au_status = x86_64_paging_init();
	au_status = x86_64_kmalloc_initialize();
	au_status = au_initialize_serial();
	au_status = x86_64_initialize_apic(true);
	au_status = au_initialize_acpi();
	
	x86_64_setup_cpu_data(0);

	/* initialize the kernel subsystems */
	vfs_initialize();
	devfs_initialize();


	//x86_64_boot_free();
    x86_64_initialize_scheduler();
#ifdef SMP
	/* initialize all the AP's*/
	initialize_cpu(au_acpi_get_num_core());
#endif

	printf("Aurora kernel started \n");

	/* Start Scheduler, and notify all cpu's 
	 * that scheduler has started and they can
	 * start their jobs
	 */
	thread_t *thr = x86_64_create_kthread(thread_test, (uint64_t)x86_64_phys_to_virt((size_t)x86_64_pmmngr_alloc()),
		x64_read_cr3());
	x86_64_sched_enable(true);
	x86_64_sched_start();
	for (;;);
	return 0;
}