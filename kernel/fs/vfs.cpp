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


#include <fs\vfs.h>
#include <_null.h>
#include <mm\kmalloc.h>
#include <console.h>

vfs_node_t *root_dir = NULL;

/*
 * vfs_initialize -- initialize the vfs root directory
 */
void vfs_initialize() {
	vfs_node_t *root = (vfs_node_t*)kmalloc(sizeof(vfs_node_t));
	root->root = 0;
	root->childs = initialize_list();
	root_dir = root;
}

/*
 * vfs_mount -- mounts a file or device to vfs directory
 * @param path -- vfs path to be used
 * @param file -- file pointer
 * @oaram node -- node entry, 0 for root
 */
void vfs_mount(char* path, vfs_file_t *file, vfs_node_t* node) {
	if (path[0] == '/' && strlen(path) == 2) {
		vfs_node_t *entry = root_dir;
		if (entry->root) {
			return;
		}
		entry->root = file;
		return;
	}

	bool found = false;

	char* next = strchr(path, '/');
	if (next)
		next++;

	vfs_node_t *ent = node;
	vfs_file_t *entry_found = 0;
	while (next) {
		int i = 0; 
		char pathname[16];
		for (i = 0; i < 16; i++) {
			if (next[i] == '/' || next[i] == '\0')
				break;
			pathname[i] = next[i];
		}
		pathname[i] = 0;

		if (ent == NULL)
			ent = root_dir;

		for (int j = 0; j < ent->childs->pointer; j++) {
			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);	
			entry_found = file_;
			if (strcmp(file_->filename, pathname) == 0) {
				found = true;
				break;
			}
		}

		next = strchr(next + 1, '/');
		if (next)
			next++;	
	}

	if (found) {
		/* if this entry is a directory, recursively
		 * call the node and check it */
		if (entry_found->flags == FS_FLAG_DIR) {
			ent = (vfs_node_t*)entry_found->device;
			vfs_mount(path, file, ent);
		}
		printf("Already mounted -> %s\n", path);
		return;
	}
	if (!found) {
		if (entry_found) {
			return;
		}
		list_add(ent->childs, file);
	}
}

/* vfs_mknode -- create a node for directories*/
vfs_node_t * vfs_mknode() {
	vfs_node_t *node = (vfs_node_t*)kmalloc(sizeof(vfs_node_t));
	node->root = 0;
	node->childs = initialize_list();
	return node;
}

/*
 * vfs_mkdir -- create a virtual directory for files
 * @param path -- directory path
 * @param dir -- dir file
 * @param dir_node -- directory node
 */
void vfs_mkdir(char *path, vfs_file_t *dir, vfs_node_t *dir_node) {
	dir->device = dir_node;
	bool found = false;
	char* next = strchr(path, '/');
	if (next)
		next++;

	vfs_node_t *ent = root_dir;
	vfs_file_t *entry_found = 0;
	char pathname[16];
	while (next) {
		int i = 0;
		
		for (i = 0; i < 16; i++) {
			if (next[i] == '/' || next[i] == '\0')
				break;
			pathname[i] = next[i];
		}
		pathname[i] = 0;

		if (ent == NULL)
			ent = root_dir;

		for (int j = 0; j < ent->childs->pointer; j++) {
			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);
			
			if (strcmp(file_->filename, pathname) == 0) {
				if (file_->flags == FS_FLAG_DIR)
					ent = (vfs_node_t *)file_->device;
				found = true;
				//break;
				entry_found = file_;
			}
		}

		next = strchr(next + 1, '/');
		if (next)
			next++;
	}

	strcpy(dir->filename, pathname);
	if (found) {
		/* if this entry is a directory, recursively
		* call the node and check it */
		list_add(ent->childs, dir);
		return;
	}
	if (!found) {
		list_add(ent->childs, dir);
		return;
	}

}


void vfs_lsdir(char* path) {
	char* next = strchr(path, '/');
	if (next)
		next++;

	bool found = false;
	vfs_node_t *ent = root_dir;
	vfs_file_t *entry_found = 0;

	if (path[0] == '/' && strlen(path) == 2)
		found = true;


	while (next) {
		int i = 0;
	    char pathname[16];
		for (i = 0; i < 16; i++) {
			if (next[i] == '/' || next[i] == '\0')
				break;
			pathname[i] = next[i];
		}
		pathname[i] = 0;

		for (int j = 0; j < ent->childs->pointer; j++) {
			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);
			entry_found = file_;
			if (strcmp(file_->filename, pathname) == 0) {
				if (file_->flags == FS_FLAG_DIR)
					ent = (vfs_node_t *)file_->device;
			}
		}

		next = strchr(next + 1, '/');
		if (next)
			next++;
	}

	if (ent) {
		/* if this entry is a directory, recursively
		* call the node and check it */
		for (int i = 0; i < ent->childs->pointer; i++) {
			vfs_file_t *f = (vfs_file_t*)list_get_at(ent->childs, i);
			printf("File -> %s \n", f->filename);
		}
		return;
	}
}

/*
 * vfs_get_file -- finds a file in the directory tree
 * structure
 * @param path -- path to search
 */
vfs_file_t * vfs_get_file(char* path) {
	char* next = strchr(path, '/');
	if (next)
		next++;

	vfs_node_t *ent = root_dir;
	vfs_file_t *entry_found = 0;
	char pathname[16];
	while (next) {
		int i = 0;
		for (i = 0; i < 16; i++) {
			if (next[i] == '/' || next[i] == '\0')
				break;
			pathname[i] = next[i];
		}
		pathname[i] = 0;

		if (ent == NULL)
			ent = root_dir;

		for (int j = 0; j < ent->childs->pointer; j++) {
			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);
			if (strcmp(file_->filename, pathname) == 0) {
				/* check for again '/', if exist than this is a 
				 * directory for the user, file name exist in next
				 * part */
				if (file_->flags == FS_FLAG_DIR)
					ent = (vfs_node_t*)file_->device;
				entry_found = file_;
			}
		}

		next = strchr(next + 1, '/');
		if (next)
			next++;
	}

	return entry_found;
}

/*
 * vfs_remove_file -- removes a file or directory
 * @param path -- dir/file path to remove
 */
void vfs_remove_file(char* path) {
	char* next = strchr(path, '/');
	if (next)
		next++;

	vfs_node_t *ent = root_dir;
	vfs_node_t *parent_node = 0;
	vfs_file_t *entry_found = 0;
	char pathname[16];
	int k = 0;
	while (next) {
		int i = 0;
		for (i = 0; i < 16; i++) {
			if (next[i] == '/' || next[i] == '\0')
				break;
			pathname[i] = next[i];
		}
		pathname[i] = 0;

		if (ent == NULL)
			ent = root_dir;

		for (int j = 0; j < ent->childs->pointer; j++) {
			vfs_file_t *file_ = (vfs_file_t*)list_get_at(ent->childs, j);
			if (strcmp(file_->filename, pathname) == 0) {
				/* check for again '/', if exist than this is a
				* directory for the user, file name exist in next
				* part */

				//! store the parent node
				parent_node = ent;

				/* directory removal is done in another part of the
				 * code, because removing a directory needs to remove
				 * all the entries inside the directory
				 */
				if (file_->flags == FS_FLAG_DIR) {
					ent = (vfs_node_t*)file_->device;
					k = j;
				}
				else {
					/* it's not a directory, so remove it from the parent
					 * it's a normal file
					 */
					list_remove(ent->childs, j);
				}
				entry_found = file_;
			}
		}

		next = strchr(next + 1, '/');
		if (next)
			next++;
	}

	/* here, handle the directory removal part */
	if (ent) {
		if (entry_found->flags == FS_FLAG_DIR) {
			for (int i = 0; i < ent->childs->pointer; i++) {
				vfs_file_t * file_ = (vfs_file_t*)list_remove(ent->childs, i);
				kfree(file_);
			}
			kfree(ent);

			list_remove(parent_node->childs, k);
			
		}

		/* it was not a directory, so directly remove it*/
		kfree(entry_found);
	}
}