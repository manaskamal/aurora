/*
 * Copyright (C) Manas Kamal Choudhury 2022
 */

#include "aulib.h"
#include <Uefi.h>
#include "stdint.h"
#include "print.h"
#include <Protocol\SimpleFileSystem.h>
#include <Protocol\LoadedImage.h>
#include <Protocol\GraphicsOutput.h>
#include <Guid\FileInfo.h>

EFI_HANDLE image_handle;
EFI_SYSTEM_TABLE *system_table = nullptr;
EFI_BOOT_SERVICES *boot_service = nullptr;
EFI_RUNTIME_SERVICES *runtime_service = nullptr;
uint32_t* framebuffer_address = nullptr;
uint32_t x_res = 0;
uint32_t y_res = 0;
size_t   fb_size = 0;
uint32_t pixels_per_line = 0;
uint64_t recent_file_size = 0;
/*
 * aulib_initialize -- initializes the uefi aulib library
 * @param image_handle -- pointer to the image handle
 * @param system_table -- pointer to the uefi system table
 */
int aulib_initialize(EFI_HANDLE image_handle_, EFI_SYSTEM_TABLE *system_table_) {
	system_table = system_table_;
	boot_service = system_table_->BootServices;
	runtime_service = system_table_->RuntimeServices;
	image_handle = image_handle_;
	return 0;
}

/*
 * aulib_initialize_console -- initializes the console 
 */
int aulib_initialize_console() {
	system_table->ConOut->ClearScreen(system_table->ConOut);
	system_table->ConOut->SetAttribute(system_table->ConOut, 0x00 | 0x0F);
	return 0;
}

/*
 * aulib_set_text_attrib -- set text colors
 * @param f -- foreground color
 * @param b -- background color
 */
void aulib_set_text_attrib(int f, int b) {
	system_table->ConOut->SetAttribute(system_table->ConOut, f | b);
}

/*
 * aulib_get_system_table -- returns the installed system table
 */
EFI_SYSTEM_TABLE * aulib_get_system_table() {
	return system_table;
}

/*
 * aulib_allocate -- allocates memory 
 * @param memsize -- memory size in bytes to be allocated
 */
void* aulib_allocate(const uint64_t memsize) {
	void* buffer;
	return (boot_service->AllocatePool(EfiLoaderData, memsize, &buffer) < 0) ? NULL : buffer;
}

/*
 * aulib_free -- make a memory block available
 * @param memory -- memory to mark free
 */
void aulib_free(void* memory) {
	boot_service->FreePool(memory);
}


/*
 * aulib_load_file -- loads and read a file
 * @param filename -- file path and name to load and read
 */
uint8_t* aulib_load_file(wchar_t* filename) {
	EFI_STATUS status;

	EFI_GUID loaded_image_protocol = EFI_LOADED_IMAGE_PROTOCOL_GUID;
	EFI_GUID sfs_protocol = EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID;
	EFI_GUID generic_file_info = EFI_FILE_INFO_ID;
	EFI_LOADED_IMAGE *loaded_image;
	EFI_SIMPLE_FILE_SYSTEM_PROTOCOL * bootfs;

	status = boot_service->HandleProtocol(image_handle, &loaded_image_protocol, (void**)&loaded_image);
	status = boot_service->HandleProtocol(loaded_image->DeviceHandle, &sfs_protocol, (void**)&bootfs);

	EFI_FILE_PROTOCOL *rootdir;
	status = bootfs->OpenVolume(bootfs, &rootdir);
	if (status != EFI_SUCCESS) {
		printf(L"[auldr]: unable to open boot volume \r\n");
		return 0;
	}

	EFI_FILE_PROTOCOL *file;
	status = rootdir->Open(rootdir, &file, (CHAR16*)filename, EFI_FILE_MODE_READ, 0);
	if (status == EFI_NOT_FOUND) {
		printf(L"[auldr]: file not found \r\n");
		return 0;
	}

	uint64_t file_info_size;
	EFI_FILE_INFO *file_info;

	unsigned char buffer[250];
	file->GetInfo(file, &generic_file_info, &file_info_size, (void**)&buffer);
	status = boot_service->AllocatePool(EfiLoaderData, file_info_size, (void**)&file_info);
	if (status != EFI_SUCCESS) {
		printf(L"[auldr]: failed to allocate memory for file information! \r\n");
		return 0;
	}

	file_info = (EFI_FILE_INFO*)buffer;
	uint64_t read_size = file_info->FileSize;
	recent_file_size = read_size;
	uint8_t* data_buffer = (uint8_t*)aulib_allocate(read_size);

	status = file->Read(file, &read_size, data_buffer);

	if (status != EFI_SUCCESS) {
		printf(L"[auldr]: failed to read file \r\n");
		return 0;
	}

	return data_buffer;	
}

/*
 * aulib_get_recent_file_size -- returnes recently opened
 * file size
 */
uint64_t aulib_get_recent_file_size() {
	return recent_file_size;
}

/*
 * aulib_query_gop -- queries the graphics protocol for specific
 * screen resolution, if it's not found, UEFI returns a default
 * graphics resolution mode
 * @param width -- width of the screen in pixels
 * @param height -- height of the screen in pixels
 */
uint64_t aulib_query_gop(uint32_t width, uint32_t height) {

	EFI_GUID gopguid = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
	EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = nullptr;
	EFI_STATUS status;
	status = boot_service->LocateProtocol(&gopguid, NULL, (void**)&gop);
	if (status != EFI_SUCCESS) {
		printf(L"[aulib]: failed to locate graphics output protocol");
		return 0;
	}

	auto mode = gop->Mode;
	for (int i = 0; i < mode->MaxMode; i++) {
		UINTN size_of_info;
		EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *info;
		gop->QueryMode(gop, i, &size_of_info, &info);
		if (info->HorizontalResolution == width && info->VerticalResolution == height)
			return i;
	}
}

/*
 * aulib_set_graphics_mode -- set a graphics mode
 * @param mode -- desired graphics mode number
 */
int aulib_set_graphics_mode(uint64_t mode) {
	EFI_STATUS status;
	EFI_GUID gopguid = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
	EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = nullptr;
	status = boot_service->LocateProtocol(&gopguid, NULL, (void**)&gop);
	if (status != EFI_SUCCESS) {
		printf(L"[auldr]:graphics not found \r\n");
		return 1;
	}
	
	/* clear out the serial terminal */
	system_table->ConOut->SetAttribute(system_table->ConOut, EFI_BACKGROUND_BLUE | EFI_WHITE);
	system_table->ConOut->SetCursorPosition(system_table->ConOut, 0, 0);

	status = gop->SetMode(gop, mode);
	EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *info = gop->Mode->Info;
	//! clear the screen
	EFI_GRAPHICS_OUTPUT_BLT_PIXEL pixel;
	pixel.Blue = 0;
	pixel.Green = 0;
	pixel.Red = 0;

	gop->Blt(gop, &pixel, EfiBltVideoFill, 0, 0, 0, 0, info->HorizontalResolution, info->VerticalResolution, 0);
	framebuffer_address = (uint32_t*)gop->Mode->FrameBufferBase;
	fb_size = gop->Mode->FrameBufferSize;
	x_res = gop->Mode->Info->HorizontalResolution;
	y_res = gop->Mode->Info->VerticalResolution;
	pixels_per_line = gop->Mode->Info->PixelsPerScanLine;
	return 0;
}

/*
 * aulib_get_fb_address -- returns the framebuffer
 * address
 */
uint32_t* aulib_get_fb_address() {
	return framebuffer_address;
}

/*
 * aulib_get_x_resolution -- returns the current screen
 * width
 */
uint32_t aulib_get_x_resolution() {
	return x_res;
}

/*
 * aulib_get_y_resolution -- returns the current screen
 * height
 */
uint32_t aulib_get_y_resolution() {
	return y_res;
}


/*
 * aulib_get_pixels_per_line -- returns current pixels/scanline
 */
uint32_t aulib_get_pixels_per_line() {
	return pixels_per_line;
}

/*
 * aulib_get_fb_size -- returns the current fb size
 */
size_t aulib_get_fb_size() {
	return fb_size;
}


#define ACPI_20_TABLE_GUID  {0x8868e871, 0xe4f1, 0x11d3, 0xbc, 0x22, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81}

bool guid_match(EFI_GUID guid1, EFI_GUID guid2) {
	bool first_part_good = (guid1.Data1 == guid2.Data1 && guid1.Data2 == guid2.Data2 &&
		guid1.Data3 == guid2.Data3);

	if (!first_part_good) return false;

	for (int i = 0; i < 8; ++i) {
		if (guid1.Data4[i] != guid2.Data4[i]) return false;
	}

	return true;
}

/*
 * aulib_get_acpi_pointer -- returns the acpi table pointer
 */
void* aulib_get_acpi_pointer() {
	EFI_CONFIGURATION_TABLE *config_table = system_table->ConfigurationTable;
	void* xsdp_address = NULL;
	EFI_GUID acpi_guid = ACPI_20_TABLE_GUID;
	for (unsigned i = 0; i < system_table->NumberOfTableEntries; i++) {
		if (guid_match(acpi_guid, config_table[i].VendorGuid)) {
			xsdp_address = config_table[i].VendorTable;
			return xsdp_address;
		}
	}
}

/*
 * aulib_copy_mem -- copies memory
 */
void aulib_copy_mem(void* dst, void* src, size_t length){
	uint8_t* dstp = (uint8_t*)dst;
	uint8_t* srcp = (uint8_t*)src;
	while (length--)
		*dstp++ = *srcp++;
}