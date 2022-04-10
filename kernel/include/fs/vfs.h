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

#ifndef __VFS_H__
#define __VFS_H__

#include <stdint.h>
#include <string.h>
#include <utils\list.h>

#define FS_FLAG_DIR  0x1 //Directory file
#define FS_FLAG_GEN  0x2 //Normal file
#define FS_FLAG_INVALID 0x3 //Invalid file

#define FS_STATUS_FOUND  0x4

struct _vfs_file_;

typedef _vfs_file_(*open_callback) (_vfs_file_ *file, char* path);
typedef void(*read_callback) (_vfs_file_ *file, uint64_t* buffer, uint32_t length);
typedef void(*read_block_callback) (_vfs_file_ *file, uint64_t* buffer);
typedef void(*write_callback) (_vfs_file_ *file, uint8_t* buffer, uint32_t length);
typedef int(*ioquery_callback) (_vfs_file_ *file, uint32_t code, void* arg);

/* 
 * the vfs file structure: every
 * device drivers, file, directory contains
 * the vfs file structure
 */
typedef struct _vfs_file_ {
	char filename[32];
	uint32_t size;
	uint8_t  eof;
	uint32_t pos; //position in bytes
	uint32_t current; //current cluster/inode
	uint8_t flags;
	uint8_t status;
	void*   device;
	open_callback open;
	read_callback read;
	read_block_callback read_blk;
	write_callback write;
	ioquery_callback ioquery;
}vfs_file_t;

/* a vfs_node is a volatile directory
 * that get stored in memory rather than
 * secondary storage
 */
typedef struct _vfs_node_ {
	vfs_file_t *root;
	list_t *childs;
}vfs_node_t;

/*
 * @example-- to create a empty directory 
 * vfs_file_t *file = (vfs_file_t*)kmalloc(sizeof(vfs_file_t));
 * file->flags = FS_FLAG_DIR;
 * vfs_node_t *node = vfs_mknode();
 * vfs_mkdir("/dirname", file, node);
 *
 * node is required because, every vfs_file with flag FS_FLAG_DIR
 * requires another link to a node, containing the list entries
 * of all the file and sub directories, that's why we link the file
 * structure with the node
 *
 * @example -- to remove a directory/file
 * vfs_remove_file("/dirname/filename");
 * if you also want to remove 'dirname'...
 * vfs_remove_file("/dirname");
 *
 * @example -- to mount or to create a file
 * vfs_file_t *file = (vfs_file_t*)kmalloc(sizeof(vfs_file_t));
 * file->flags = FS_FLAG_GEN;
 * vfs_mount("/yourdirname/filename", file);
 * @note -- you cannot mount it to '/' root dir because already
 * root file system needs that space
 */

/*
* vfs_initialize -- initialize the vfs root directory
*/
extern void vfs_initialize();

/*
* vfs_mount -- mounts a file or device to vfs directory
* @param path -- vfs path to be used
* @param file -- file pointer
*/
AU_EXTERN AU_EXPORT void vfs_mount(char* path, vfs_file_t *file, vfs_node_t *node);

/* vfs_mknode -- create a node for directories*/
AU_EXTERN AU_EXPORT vfs_node_t * vfs_mknode();
/*
* vfs_mkdir -- create a virtual directory for files
* @param path -- directory path
* @param dir -- dir file
* @param dir_node -- directory node
*/
AU_EXTERN AU_EXPORT void vfs_mkdir(char *path, vfs_file_t *dir, vfs_node_t *dir_node);

extern void vfs_lsdir(char* path);

/*
* vfs_get_file -- finds a file in the directory tree
* structure
* @param path -- path to search
*/
AU_EXTERN AU_EXPORT vfs_file_t * vfs_get_file(char* path);

/*
* vfs_remove_file -- removes a file or directory
* @param path -- dir/file path to remove
*/
AU_EXTERN AU_EXPORT void vfs_remove_file(char* path);
#endif