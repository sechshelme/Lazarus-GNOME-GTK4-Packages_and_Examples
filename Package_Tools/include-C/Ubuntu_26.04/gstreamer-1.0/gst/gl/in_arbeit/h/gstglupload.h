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

#ifndef __GST_GL_UPLOAD_H__
#define __GST_GL_UPLOAD_H__

#include <gst/video/video.h>

#include <gst/gl/gstgl_fwd.h>



extern
GType gst_gl_upload_get_type (void);
#define GST_TYPE_GL_UPLOAD (gst_gl_upload_get_type())
#define GST_GL_UPLOAD(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_GL_UPLOAD,GstGLUpload))
#define GST_GL_UPLOAD_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_GL_UPLOAD,GstGLUploadClass))
#define GST_IS_GL_UPLOAD(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_GL_UPLOAD))
#define GST_IS_GL_UPLOAD_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_GL_UPLOAD))
#define GST_GL_UPLOAD_CAST(obj) ((GstGLUpload*)(obj))

/**
 * GstGLUploadReturn:
 * @GST_GL_UPLOAD_DONE: No further processing required
 * @GST_GL_UPLOAD_ERROR: An unspecified error occurred
 * @GST_GL_UPLOAD_UNSUPPORTED: The configuration is unsupported.
 * @GST_GL_UPLOAD_RECONFIGURE: This element requires a reconfiguration.
 * @GST_GL_UPLOAD_UNSHARED_GL_CONTEXT: private return value.
 */
typedef enum
{
  GST_GL_UPLOAD_DONE = 1,

  GST_GL_UPLOAD_ERROR = -1,
  GST_GL_UPLOAD_UNSUPPORTED = -2,
  GST_GL_UPLOAD_RECONFIGURE = -3,

  GST_GL_UPLOAD_UNSHARED_GL_CONTEXT = -100,
} GstGLUploadReturn;

/**
 * GstGLUpload
 *
 * Opaque #GstGLUpload object
 */
struct _GstGLUpload
{
  GstObject        parent;

  GstGLContext    *context;

  /*< private >*/
  GstGLUploadPrivate *priv;

  gpointer _reserved[GST_PADDING];
};

/**
 * GstGLUploadClass:
 *
 * The #GstGLUploadClass struct only contains private data
 */
struct _GstGLUploadClass
{
  GstObjectClass object_class;

  /*< private >*/
  gpointer _padding[GST_PADDING];
};

extern
GstCaps *     gst_gl_upload_get_input_template_caps (void);

extern
GstGLUpload * gst_gl_upload_new                    (GstGLContext * context) ;

extern
void          gst_gl_upload_set_context            (GstGLUpload * upload,
                                                    GstGLContext * context);

extern
GstCaps *     gst_gl_upload_transform_caps         (GstGLUpload * upload,
                                                    GstGLContext * context,
                                                    GstPadDirection direction,
                                                    GstCaps * caps,
                                                    GstCaps * filter) ;
extern
gboolean      gst_gl_upload_set_caps               (GstGLUpload * upload,
                                                    GstCaps * in_caps,
                                                    GstCaps * out_caps);
extern
void          gst_gl_upload_get_caps               (GstGLUpload * upload,
                                                    GstCaps ** in_caps,
                                                    GstCaps ** out_caps);
extern
void          gst_gl_upload_propose_allocation     (GstGLUpload * upload,
                                                    GstQuery * decide_query,
                                                    GstQuery * query);

extern
GstGLUploadReturn gst_gl_upload_perform_with_buffer (GstGLUpload * upload,
                                                    GstBuffer * buffer,
                                                    GstBuffer ** outbuf_ptr);

extern
GstCaps *     gst_gl_upload_fixate_caps            (GstGLUpload * upload,
                                                    GstPadDirection direction,
                                                    GstCaps * caps,
                                                    GstCaps * othercaps) ;



#endif /* __GST_GL_UPLOAD_H__ */
