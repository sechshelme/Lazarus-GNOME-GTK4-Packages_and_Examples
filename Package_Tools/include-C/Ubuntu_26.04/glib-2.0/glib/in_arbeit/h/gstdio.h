/* gstdio.h - GFilename wrappers for C library functions
 *
 * Copyright 2004 Tor Lillqvist
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __G_STDIO_H__
#define __G_STDIO_H__

#include <glib/gprintf.h>

#include <errno.h>
#include <sys/stat.h>



#if (defined (__MINGW64_VERSION_MAJOR) || defined (_MSC_VER)) && !defined(_WIN64)

typedef struct _stat32 GStatBuf;

#elif defined(__MINGW64_VERSION_MAJOR) && defined(_WIN64)

// xxxxxxxxxxxxxxxxx
typedef struct _stat64 GStatBuf;

#else

// xxxxxxxxxxxxxxxxx
typedef struct stat GStatBuf;

#endif

#if defined(G_OS_UNIX) && !defined(G_STDIO_WRAP_ON_UNIX) && !defined(__GI_SCANNER__)

/* Just pass on to the system functions, so there's no potential for data
 * format mismatches, especially with large file interfaces. 
 * A few functions can't be handled in this way, since they are not defined
 * in a portable system header that we could include here.
 *
 * G_STDIO_WRAP_ON_UNIX is not public API and its behaviour is not guaranteed
 * in future.
 */

extern
int g_access (const gchar *filename,
	      int          mode);

extern
int g_chdir  (const gchar *path);

extern
int g_unlink (const gchar *filename);

extern
int g_rmdir  (const gchar *filename);

#else /* ! G_OS_UNIX */

/* Wrappers for C library functions that take pathname arguments. On
 * Unix, the pathname is a file name as it literally is in the file
 * system. On well-maintained systems with consistent users who know
 * what they are doing and no exchange of files with others this would
 * be a well-defined encoding, preferably UTF-8. On Windows, the
 * pathname is always in UTF-8, even if that is not the on-disk
 * encoding, and not the encoding accepted by the C library or Win32
 * API.
 */

extern
int g_access    (const gchar *filename,
		 int          mode);

extern
int g_chmod     (const gchar *filename,
		 int          mode);

extern
int g_open      (const gchar *filename,
                 int          flags,
                 int          mode);

extern
int g_creat     (const gchar *filename,
                 int          mode);

extern
int g_rename    (const gchar *oldfilename,
                 const gchar *newfilename);

extern
int g_mkdir     (const gchar *filename,
                 int          mode);

extern
int g_chdir     (const gchar *path);

extern
int g_stat      (const gchar *filename,
                 GStatBuf    *buf);

extern
int g_lstat     (const gchar *filename,
                 GStatBuf    *buf);

extern
int g_unlink    (const gchar *filename);

extern
int g_remove    (const gchar *filename);

extern
int g_rmdir     (const gchar *filename);

extern
FILE *g_fopen   (const gchar *filename,
                 const gchar *mode);

extern
FILE *g_freopen (const gchar *filename,
                 const gchar *mode,
                 FILE        *stream);

extern
gint g_fsync    (gint fd);

struct utimbuf;			/* Don't need the real definition of struct utimbuf when just
				 * including this header.
				 */

extern
int g_utime     (const gchar    *filename,
		 struct utimbuf *utb);

#endif /* G_OS_UNIX */

extern
gboolean g_close (gint       fd,
                  GError   **error);

/**
GLIB_AVAILABLE_STATIC_INLINE_IN_2_76
static inline gboolean g_clear_fd (int     *fd_ptr,
                                   GError **error);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_76
static inline gboolean
g_clear_fd (int     *fd_ptr,
            GError **error)
{
  int fd = *fd_ptr;

  *fd_ptr = -1;

  if (fd < 0)
    return TRUE;

  return g_close (fd, error);
  
}
 */




#endif /* __G_STDIO_H__ */
