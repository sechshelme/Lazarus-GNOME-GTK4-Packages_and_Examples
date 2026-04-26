/* Various useful definitions.
 *
 * J.Cupitt, 8/4/93
 * 15/7/96 JC
 *	- C++ stuff added
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

#ifndef VIPS_UTIL_H
#define VIPS_UTIL_H

#ifdef __cplusplus
extern "C" {
#endif /*__cplusplus*/

#include <stdio.h>
#include <math.h>

/* Some platforms don't have M_PI :-(
 */

/* Testing status before the function call saves a lot of time.
 */

/* VIPS_RINT() does "bankers rounding", it rounds to the nearest even integer.
 * For things like image geometry, we want strict nearest int.
 *
 * If you know it's unsigned, _UINT is a little faster.
 */

extern
const char *vips_enum_string(GType enm, int value);
extern
const char *vips_enum_nick(GType enm, int value);
extern
int vips_enum_from_nick(const char *domain, GType type, const char *str);
extern
int vips_flags_from_nick(const char *domain, GType type, const char *nick);

extern
gboolean vips_slist_equal(GSList *l1, GSList *l2);
extern
void *vips_slist_map2(GSList *list, VipsSListMap2Fn fn, void *a, void *b);
extern
void *vips_slist_map2_rev(GSList *list, VipsSListMap2Fn fn, void *a, void *b);
extern
void *vips_slist_map4(GSList *list,
	VipsSListMap4Fn fn, void *a, void *b, void *c, void *d);
extern
void *vips_slist_fold2(GSList *list, void *start,
	VipsSListFold2Fn fn, void *a, void *b);
extern
GSList *vips_slist_filter(GSList *list, VipsSListMap2Fn fn, void *a, void *b);
extern
void vips_slist_free_all(GSList *list);
extern
void *vips_map_equal(void *a, void *b);

extern
void *vips_hash_table_map(GHashTable *hash,
	VipsSListMap2Fn fn, void *a, void *b);

extern
char *vips_strncpy(char *dest, const char *src, int n);
extern
char *vips_strrstr(const char *haystack, const char *needle);
extern
gboolean vips_ispostfix(const char *a, const char *b);
extern
gboolean vips_iscasepostfix(const char *a, const char *b);
extern
gboolean vips_isprefix(const char *a, const char *b);
extern
char *vips_break_token(char *str, const char *brk);

void vips__chomp(char *str);

extern
int vips_vsnprintf(char *str, size_t size, const char *format, va_list ap);
extern
int vips_snprintf(char *str, size_t size, const char *format, ...)
;

extern
int vips_filename_suffix_match(const char *path, const char *suffixes[]);

extern
gint64 vips_file_length(int fd);
/* TODO(kleisauke): extern is required by vipsedit.
 */
extern
int vips__write(int fd, const void *buf, size_t count);

/* TODO(kleisauke): extern is required by test_connections.
 */
extern
int vips__open(const char *filename, int flags, int mode);
int vips__open_read(const char *filename);
FILE *vips__fopen(const char *filename, const char *mode);

FILE *vips__file_open_read(const char *filename,
	const char *fallback_dir, gboolean text_mode);
FILE *vips__file_open_write(const char *filename,
	gboolean text_mode);
/* TODO(kleisauke): extern is required by vipsedit.
 */
extern
char *vips__file_read(FILE *fp, const char *name, size_t *length_out);
char *vips__file_read_name(const char *name, const char *fallback_dir,
	size_t *length_out);
int vips__file_write(void *data, size_t size, size_t nmemb, FILE *stream);
/* TODO(kleisauke): extern is required by the magick module.
 */
extern
gint64 vips__get_bytes(const char *filename,
	unsigned char buf[], gint64 len);
int vips__fgetc(FILE *fp);

GValue *vips__gvalue_ref_string_new(const char *text);
void vips__gslist_gvalue_free(GSList *list);
GSList *vips__gslist_gvalue_copy(const GSList *list);
GSList *vips__gslist_gvalue_merge(GSList *a, const GSList *b);
char *vips__gslist_gvalue_get(const GSList *list);

gint64 vips__seek_no_error(int fd, gint64 pos, int whence);
/* TODO(kleisauke): extern is required by vipsedit.
 */
extern
gint64 vips__seek(int fd, gint64 pos, int whence);
int vips__ftruncate(int fd, gint64 pos);
extern
int vips_existsf(const char *name, ...)
;
extern
int vips_isdirf(const char *name, ...)
;
extern
int vips_mkdirf(const char *name, ...)
;
extern
int vips_rmdirf(const char *name, ...)
;
extern
int vips_rename(const char *old_name, const char *new_name);

/**
 * VipsToken:
 * @VIPS_TOKEN_LEFT: left bracket
 * @VIPS_TOKEN_RIGHT: right bracket
 * @VIPS_TOKEN_STRING: string constant
 * @VIPS_TOKEN_EQUALS: equals sign
 * @VIPS_TOKEN_COMMA: comma
 *
 * Tokens returned by the vips lexical analyzer, see vips__token_get(). This
 * is used to parse option strings for arguments.
 *
 * Left and right brackets can be any of (, {, [, <.
 *
 * Strings may be in double quotes, and may contain escaped quote characters,
 * for example string, "string" and "str\"ing".
 *
 */
typedef enum {
	VIPS_TOKEN_LEFT = 1,
	VIPS_TOKEN_RIGHT,
	VIPS_TOKEN_STRING,
	VIPS_TOKEN_EQUALS,
	VIPS_TOKEN_COMMA
} VipsToken;

const char *vips__token_get(const char *buffer,
	VipsToken *token, char *string, int size);
const char *vips__token_must(const char *buffer, VipsToken *token,
	char *string, int size);
const char *vips__token_need(const char *buffer, VipsToken need_token,
	char *string, int size);
const char *vips__token_segment(const char *p, VipsToken *token,
	char *string, int size);
const char *vips__token_segment_need(const char *p, VipsToken need_token,
	char *string, int size);
const char *vips__find_rightmost_brackets(const char *p);
/* TODO(kleisauke): extern is required by libvips-cpp and vipsheader.
 */
extern
void vips__filename_split8(const char *name,
	char *filename, char *option_string);

extern
int vips_ispoweroftwo(int p);
extern
int vips_amiMSBfirst(void);

/* TODO(kleisauke): extern is required by jpegsave_file_fuzzer.
 */
extern
char *vips__temp_name(const char *format);

void vips__change_suffix(const char *name, char *out, int mx,
	const char *new_suff, const char **olds, int nolds);

extern
char *vips_realpath(const char *path);

guint32 vips__random(guint32 seed);
guint32 vips__random_add(guint32 seed, int value);

const char *vips__icc_dir(void);
const char *vips__windows_prefix(void);

char *vips__get_iso8601(void);

extern
int vips_strtod(const char *str, double *out);

#ifdef __cplusplus
}
#endif /*__cplusplus*/

#endif /*VIPS_UTIL_H*/
