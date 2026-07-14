/*
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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

#ifndef __GST_GL_QUERY_H__
#define __GST_GL_QUERY_H__

#include <gst/gl/gstgl_fwd.h>
#include <gst/gl/gstgldebug.h>



/**
 * GstGLQueryType:
 * @GST_GL_QUERY_NONE: no query
 * @GST_GL_QUERY_TIME_ELAPSED: query the time elapsed
 * @GST_GL_QUERY_TIMESTAMP: query the current time
 */
typedef enum
{
  GST_GL_QUERY_NONE,
  GST_GL_QUERY_TIME_ELAPSED,
  GST_GL_QUERY_TIMESTAMP,
} GstGLQueryType;

/**
 * GstGLQuery:
 *
 * Opaque #GstGLQuery struct
 */
struct _GstGLQuery
{
  /*< private >*/
  GstGLContext *    context;
  guint             query_type;
  guint             query_id;
  gboolean          supported;

  gboolean          start_called;
  GstGLAsyncDebug   debug;

  gpointer          _padding[GST_PADDING];
};

extern
void                gst_gl_query_init               (GstGLQuery * query,
                                                     GstGLContext * context,
                                                     GstGLQueryType query_type);
extern
void                gst_gl_query_unset              (GstGLQuery * query);
extern
GstGLQuery *        gst_gl_query_new                (GstGLContext * context,
                                                     GstGLQueryType query_type);
extern
void                gst_gl_query_free               (GstGLQuery * query);

extern
void                gst_gl_query_start              (GstGLQuery * query);
extern
void                gst_gl_query_end                (GstGLQuery * query);
extern
void                gst_gl_query_counter            (GstGLQuery * query);
extern
guint64             gst_gl_query_result             (GstGLQuery * query);



#endif /* __GST_GL_QUERY_H__ */
