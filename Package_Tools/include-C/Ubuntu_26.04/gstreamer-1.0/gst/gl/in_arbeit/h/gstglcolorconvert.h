/*
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystree00@gmail.com>
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

#ifndef __GST_GL_COLOR_CONVERT_H__
#define __GST_GL_COLOR_CONVERT_H__

#include <gst/video/video.h>
#include <gst/gstmemory.h>

#include <gst/gl/gstgl_fwd.h>



extern
GType gst_gl_color_convert_get_type (void);
#define GST_TYPE_GL_COLOR_CONVERT (gst_gl_color_convert_get_type())
#define GST_GL_COLOR_CONVERT(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_GL_COLOR_CONVERT,GstGLColorConvert))
#define GST_GL_COLOR_CONVERT_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_GL_DISPLAY,GstGLColorConvertClass))
#define GST_IS_GL_COLOR_CONVERT(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_GL_COLOR_CONVERT))
#define GST_IS_GL_COLOR_CONVERT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_GL_COLOR_CONVERT))
#define GST_GL_COLOR_CONVERT_CAST(obj) ((GstGLColorConvert*)(obj))

/**
 * GstGLColorConvert
 *
 * Opaque #GstGLColorConvert object
 */
struct _GstGLColorConvert
{
  /*< private >*/
  GstObject        parent;

  GstGLContext    *context;

  /* input data */
  GstVideoInfo     in_info;
  GstVideoInfo     out_info;

  gboolean         initted;
  gboolean         passthrough;

  GstBuffer *    inbuf;
  GstBuffer *    outbuf;

  /* used for the conversion */
  GstGLFramebuffer *fbo;
  GstGLShader     *shader;

  /*< private >*/
  GstGLColorConvertPrivate *priv;

  gpointer _reserved[GST_PADDING];
};

/**
 * GstGLColorConvertClass:
 *
 * The #GstGLColorConvertClass struct only contains private data
 */
struct _GstGLColorConvertClass
{
  /*< private >*/
  GstObjectClass object_class;

  gpointer _padding[GST_PADDING];
};

/**
 * GST_GL_COLOR_CONVERT_EXT_FORMATS: (skip)
 *
 */

/**
 * GST_GL_COLOR_CONVERT_VIDEO_CAPS:
 *
 * The currently supported #GstCaps that can be converted
 */

extern
GstGLColorConvert * gst_gl_color_convert_new (GstGLContext * context) ;

extern
GstCaps *   gst_gl_color_convert_transform_caps (GstGLContext * context,
                                                 GstPadDirection direction,
                                                 GstCaps * caps,
                                                 GstCaps * filter);
extern
GstCaps *   gst_gl_color_convert_fixate_caps    (GstGLContext * context,
                                                 GstPadDirection direction,
                                                 GstCaps * caps,
                                                 GstCaps * other);
extern
gboolean    gst_gl_color_convert_set_caps    (GstGLColorConvert * convert,
                                              GstCaps           * in_caps,
                                              GstCaps           * out_caps);
extern
gboolean    gst_gl_color_convert_decide_allocation (GstGLColorConvert   * convert,
                                                    GstQuery            * query);

extern
GstBuffer * gst_gl_color_convert_perform    (GstGLColorConvert * convert, GstBuffer * inbuf) ;

extern
gchar *     gst_gl_color_convert_swizzle_shader_string (GstGLContext * context);

extern
gchar *     gst_gl_color_convert_yuv_to_rgb_shader_string (GstGLContext * context);



#endif /* __GST_GL_COLOR_CONVERT_H__ */
