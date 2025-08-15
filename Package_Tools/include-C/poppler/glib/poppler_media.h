/* poppler-media.h: glib interface to MediaRendition
 *
 * Copyright (C) 2010 Carlos Garcia Campos <carlosgc@gnome.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 */

#ifndef __POPPLER_MEDIA_H__
#define __POPPLER_MEDIA_H__

#include <glib-object.h>
#include "poppler.h"



#define POPPLER_TYPE_MEDIA (poppler_media_get_type())
#define POPPLER_MEDIA(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), POPPLER_TYPE_MEDIA, PopplerMedia))
#define POPPLER_IS_MEDIA(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), POPPLER_TYPE_MEDIA))

/* FIXME: this should be generic (PopplerSaveToCallbackFunc) */

/**
 * PopplerMediaSaveFunc:
 * @buf: (array length=count) (element-type guint8): buffer containing
 *   bytes to be written.
 * @count: number of bytes in @buf.
 * @data: (closure): user data passed to poppler_media_save_to_callback()
 * @error: GError to set on error, or %NULL
 *
 * Specifies the type of the function passed to
 * poppler_media_save_to_callback().  It is called once for each block of
 * bytes that is "written" by poppler_media_save_to_callback().  If
 * successful it should return %TRUE.  If an error occurs it should set
 * @error and return %FALSE, in which case poppler_media_save_to_callback()
 * will fail with the same error.
 *
 * Returns: %TRUE if successful, %FALSE (with @error set) if failed.
 *
 * Since: 0.14
 */
typedef gboolean (*PopplerMediaSaveFunc)(const gchar *buf, gsize count, gpointer data, GError **error);

extern
GType poppler_media_get_type(void) ;
extern
gboolean poppler_media_is_embedded(PopplerMedia *poppler_media);
extern
const gchar *poppler_media_get_filename(PopplerMedia *poppler_media);
extern
const gchar *poppler_media_get_mime_type(PopplerMedia *poppler_media);
extern
gboolean poppler_media_get_auto_play(PopplerMedia *poppler_media);
extern
gboolean poppler_media_get_show_controls(PopplerMedia *poppler_media);
extern
gfloat poppler_media_get_repeat_count(PopplerMedia *poppler_media);
extern
gboolean poppler_media_save(PopplerMedia *poppler_media, const char *filename, GError **error);
#ifndef G_OS_WIN32
extern
gboolean poppler_media_save_to_fd(PopplerMedia *poppler_media, int fd, GError **error);
#endif
extern
gboolean poppler_media_save_to_callback(PopplerMedia *poppler_media, PopplerMediaSaveFunc save_func, gpointer user_data, GError **error);



#endif /* __POPPLER_MEDIA_H__ */
