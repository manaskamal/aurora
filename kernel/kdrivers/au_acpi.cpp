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

#include <kdrivers\au_acpi.h>
#include <kdrivers\serial.h>
#include <arch\x86_64\x86_64_lowlevel.h>
#include <arch\x86_64\x86_64_paging.h>
#include <arch\x86_64\x86_64_cpu.h>
#include <auinfo.h>
#include <string.h>
#include <_null.h>

aurora_acpi au_acpi;

/*
 * au_initialize_acpi -- initialize basic acpi data structures
 */
int au_initialize_acpi() {
	void* acpi_base = (void*)x86_64_phys_to_virt((uint64_t)au_get_boot_info()->acpi_table_pointer);
	memset(&au_acpi, 0, sizeof(aurora_acpi));

	acpiRsdp *rsdp = (acpiRsdp*)acpi_base;
	acpiRsdt *rsdt = (acpiRsdt*)x86_64_phys_to_virt((uint64_t)rsdp->rsdtAddr);
	acpiXsdt *xsdt = (acpiXsdt*)x86_64_phys_to_virt((uint64_t)rsdp->xsdtAddr);
	char sig[5];

	int entries = (rsdt->header.length - sizeof(rsdt->header)) / 4;
	acpiSysDescHeader *header = NULL;
	
	for (size_t count = 0; count < entries; count++) {
		header = (acpiSysDescHeader*)x86_64_phys_to_virt((uint64_t)rsdt->entry[count]);
		strncpy(sig, header->signature, 4);
		sig[4] = '\0';

		if (!strncmp(sig, ACPI_SIG_FADT, strlen(ACPI_SIG_FADT))) {
			au_acpi.fadt = (acpiFadt*)header;
		}

		else if (!strncmp(sig, ACPI_SIG_APIC, strlen("APIC"))) {
			au_acpi.madt = (acpiMadt*)header;
			
			acpiApicHeader *apic_header = (acpiApicHeader*)au_acpi.madt->entry;
			while (raw_diff(apic_header, au_acpi.madt) < au_acpi.madt->header.length) {
				switch (apic_header->type) {
                    case ACPI_APICTYPE_LAPIC: {
						acpiLocalApic *lapic = (acpiLocalApic*)apic_header;
						_au_debug_print_("\r\n lapid id -> %d,", lapic->lapicId);
						 break;
					}

					case ACPI_APICTYPE_IOAPIC: {
						acpiIoApic *ioapic = (acpiIoApic*)apic_header;
						_au_debug_print_("\r\n IOAPIC id-> %d, address-> %x", ioapic->ioApicId, ioapic->ioApicAddr);
						break;
					}
				}
				apic_header = raw_offset <acpiApicHeader*>(apic_header, apic_header->length);
			}
		}
	}

	return 0;
}