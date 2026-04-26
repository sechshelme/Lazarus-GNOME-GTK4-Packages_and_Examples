/* memory utilities
 *
 * J.Cupitt, 8/4/93
 */

/*

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

 */

/*

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

 */

#ifndef VIPS_MEMORY_H
#define VIPS_MEMORY_H

#ifdef __cplusplus
extern "C" {
#endif /*__cplusplus*/


extern
void *vips_malloc(VipsObject *object, size_t size);
extern
char *vips_strdup(VipsObject *object, const char *str);

extern
void vips_tracked_free(void *s);
extern
void vips_tracked_aligned_free(void *s);
extern
void *vips_tracked_malloc(size_t size);
extern
void *vips_tracked_aligned_alloc(size_t size, size_t align);
extern
size_t vips_tracked_get_mem(void);
extern
size_t vips_tracked_get_mem_highwater(void);
extern
int vips_tracked_get_allocs(void);

extern
int vips_tracked_open(const char *pathname, int flags, int mode);
extern
int vips_tracked_close(int fd);
extern
int vips_tracked_get_files(void);

#ifdef __cplusplus
}
#endif /*__cplusplus*/

#endif /*VIPS_MEMORY_H*/
