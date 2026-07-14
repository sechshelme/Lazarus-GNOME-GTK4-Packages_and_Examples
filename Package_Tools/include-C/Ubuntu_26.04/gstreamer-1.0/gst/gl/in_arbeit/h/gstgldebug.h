/*
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifndef __GST_GL_DEBUG_H__
#define __GST_GL_DEBUG_H__

#include <gst/gl/gstgl_fwd.h>



typedef gchar * (*GstGLAsyncDebugLogGetMessage) (gpointer user_data);

/**
 * GstGLAsyncDebug:
 *
 * #GstGLAsyncDebug an opaque structure and should only be accessed through the
 * provided API.
 */
struct _GstGLAsyncDebug
{
  /*< private >*/
  guint             state_flags;
  GstDebugCategory *cat;
  GstDebugLevel     level;
  const gchar      *file;
  const gchar      *function;
  gint              line;
  GObject          *object;
  gchar            *debug_msg;

  /*< protected >*/
  GstGLAsyncDebugLogGetMessage callback;
  gpointer          user_data;
  GDestroyNotify    notify;

  gpointer _padding[GST_PADDING];
};

extern
GstGLAsyncDebug *   gst_gl_async_debug_new                      (void);
extern
void                gst_gl_async_debug_free                     (GstGLAsyncDebug * ad);
extern
void                gst_gl_async_debug_init                     (GstGLAsyncDebug * ad);
extern
void                gst_gl_async_debug_unset                    (GstGLAsyncDebug * ad);
extern
void                gst_gl_async_debug_freeze                   (GstGLAsyncDebug * ad);
extern
void                gst_gl_async_debug_thaw                     (GstGLAsyncDebug * ad);


extern
void        gst_gl_insert_debug_marker              (GstGLContext * context,
                                                     const gchar * format, ...) ;// (2, 3);
extern
void        gst_gl_async_debug_output_log_msg       (GstGLAsyncDebug * ad);
extern
void        gst_gl_async_debug_store_log_msg        (GstGLAsyncDebug * ad,
                                                     GstDebugCategory * cat,
                                                     GstDebugLevel level,
                                                     const gchar * file,
                                                     const gchar * function,
                                                     gint line,
                                                     GObject * object,
                                                     const gchar * format, ...) ;// (8, 9);
extern
void        gst_gl_async_debug_store_log_msg_valist (GstGLAsyncDebug * ad,
                                                     GstDebugCategory * cat,
                                                     GstDebugLevel level,
                                                     const gchar * file,
                                                     const gchar * function,
                                                     gint line,
                                                     GObject * object,
                                                     const gchar * format,
                                                     va_list varargs) ;// (8, 0);




#endif /* __GST_GL_DEBUG_H__ */
