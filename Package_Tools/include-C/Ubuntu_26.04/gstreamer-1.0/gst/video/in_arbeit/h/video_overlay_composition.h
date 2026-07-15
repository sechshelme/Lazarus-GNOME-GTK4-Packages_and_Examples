/* GStreamer Video Overlay Composition
 * Copyright (C) 2011 Intel Corporation
 * Copyright (C) 2011 Collabora Ltd.
 * Copyright (C) 2011 Tim-Philipp Müller <tim centricular net>
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

#ifndef __GST_VIDEO_OVERLAY_COMPOSITION_H__
#define __GST_VIDEO_OVERLAY_COMPOSITION_H__

#include <gst/gst.h>
#include <gst/video/video.h>



/**
 * GstVideoOverlayRectangle:
 *
 * An opaque video overlay rectangle object. A rectangle contains a single
 * overlay rectangle which can be added to a composition.
 */
#define GST_TYPE_VIDEO_OVERLAY_RECTANGLE			\
  (gst_video_overlay_rectangle_get_type ())
#define GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj)			\
  ((GstVideoOverlayRectangle *)(obj))
#define GST_VIDEO_OVERLAY_RECTANGLE(obj)			\
  (GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj))
#define GST_IS_VIDEO_OVERLAY_RECTANGLE(obj)			\
  (GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_VIDEO_OVERLAY_RECTANGLE))

typedef struct _GstVideoOverlayRectangle      GstVideoOverlayRectangle;


/**
 * GstVideoOverlayFormatFlags:
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_NONE: no flags
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_PREMULTIPLIED_ALPHA: RGB are premultiplied by A/255.
 * @GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA: a global-alpha value != 1 is set.
 *
 * Overlay format flags.
 */
typedef enum {
  GST_VIDEO_OVERLAY_FORMAT_FLAG_NONE = 0,
  GST_VIDEO_OVERLAY_FORMAT_FLAG_PREMULTIPLIED_ALPHA = (1<<0),
  GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA = (1<<1)
} GstVideoOverlayFormatFlags;

#define GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION "meta:GstVideoOverlayComposition"

/**
  * GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB:
  *
  * Supported RGB overlay video format.
  */
#if G_BYTE_ORDER == G_LITTLE_ENDIAN
#define GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB      GST_VIDEO_FORMAT_BGRA
#else
#define GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB      GST_VIDEO_FORMAT_ARGB
#endif

/**
  * GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_YUV:
  *
  * Supported YUV overlay video format.
  */
#define GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_YUV      GST_VIDEO_FORMAT_AYUV

/**
 * GST_VIDEO_OVERLAY_COMPOSITION_BLEND_FORMATS:
 *
 * Video formats supported by gst_video_overlay_composition_blend(), for
 * use in overlay elements' pad template caps.
 *
 * Since: 1.2
 */
#define GST_VIDEO_OVERLAY_COMPOSITION_BLEND_FORMATS GST_VIDEO_FORMATS_ALL

extern
GType                        gst_video_overlay_rectangle_get_type (void);

extern
GstVideoOverlayRectangle *   gst_video_overlay_rectangle_new_raw  (GstBuffer * pixels,
                                                                   gint render_x, gint render_y,
                                                                   guint render_width, guint render_height,
                                                                   GstVideoOverlayFormatFlags flags) ;

extern
GstVideoOverlayRectangle *   gst_video_overlay_rectangle_copy     (GstVideoOverlayRectangle * rectangle) ;

extern
guint                        gst_video_overlay_rectangle_get_seqnum (GstVideoOverlayRectangle  * rectangle);

extern
void                         gst_video_overlay_rectangle_set_render_rectangle     (GstVideoOverlayRectangle  * rectangle,
                                                                                   gint                        render_x,
                                                                                   gint                        render_y,
                                                                                   guint                       render_width,
                                                                                   guint                       render_height);

extern
gboolean                     gst_video_overlay_rectangle_get_render_rectangle     (GstVideoOverlayRectangle  * rectangle,
                                                                                   gint                      * render_x,
                                                                                   gint                      * render_y,
                                                                                   guint                     * render_width,
                                                                                   guint                     * render_height);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_raw           (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_argb          (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_ayuv          (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_unscaled_raw  (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_unscaled_argb (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstBuffer *                  gst_video_overlay_rectangle_get_pixels_unscaled_ayuv (GstVideoOverlayRectangle  * rectangle,
                                                                                   GstVideoOverlayFormatFlags  flags);

extern
GstVideoOverlayFormatFlags   gst_video_overlay_rectangle_get_flags                (GstVideoOverlayRectangle  * rectangle);

extern
gfloat                       gst_video_overlay_rectangle_get_global_alpha         (GstVideoOverlayRectangle  * rectangle);

extern
void                         gst_video_overlay_rectangle_set_global_alpha         (GstVideoOverlayRectangle  * rectangle,
                                                                                   gfloat                      global_alpha);

/**
 * GstVideoOverlayComposition:
 *
 * An opaque video overlay composition object. A composition contains
 * multiple overlay rectangles.
 */
#define GST_TYPE_VIDEO_OVERLAY_COMPOSITION			\
  (gst_video_overlay_composition_get_type ())
#define GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj)			\
  ((GstVideoOverlayComposition *)(obj))
#define GST_VIDEO_OVERLAY_COMPOSITION(obj)			\
  (GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj))
#define GST_IS_VIDEO_OVERLAY_COMPOSITION(obj)			\
  (GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_VIDEO_OVERLAY_COMPOSITION))

typedef struct _GstVideoOverlayComposition      GstVideoOverlayComposition;


extern
GType                        gst_video_overlay_composition_get_type (void);

extern
GstVideoOverlayComposition * gst_video_overlay_composition_copy          (GstVideoOverlayComposition * comp) ;

extern
GstVideoOverlayComposition * gst_video_overlay_composition_make_writable (GstVideoOverlayComposition * comp) ;

extern
GstVideoOverlayComposition * gst_video_overlay_composition_new           (GstVideoOverlayRectangle * rectangle) ;

extern
void                         gst_video_overlay_composition_add_rectangle (GstVideoOverlayComposition * comp,
                                                                          GstVideoOverlayRectangle   * rectangle);

extern
guint                        gst_video_overlay_composition_n_rectangles  (GstVideoOverlayComposition * comp);

extern
GstVideoOverlayRectangle *   gst_video_overlay_composition_get_rectangle (GstVideoOverlayComposition * comp, guint n);

extern
guint                        gst_video_overlay_composition_get_seqnum    (GstVideoOverlayComposition * comp);

/* blend composition onto raw video buffer */

extern
gboolean                     gst_video_overlay_composition_blend         (GstVideoOverlayComposition * comp,
                                                                          GstVideoFrame              * video_buf);

/* attach/retrieve composition from buffers */

#define GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE \
    (gst_video_overlay_composition_meta_api_get_type())
#define GST_VIDEO_OVERLAY_COMPOSITION_META_INFO \
    (gst_video_overlay_composition_meta_get_info())

typedef struct _GstVideoOverlayCompositionMeta GstVideoOverlayCompositionMeta;

/**
 * GstVideoOverlayCompositionMeta:
 * @meta: parent #GstMeta
 * @overlay: the attached #GstVideoOverlayComposition
 *
 * Extra buffer metadata describing image overlay data.
 */
struct _GstVideoOverlayCompositionMeta
{
  GstMeta meta;

  GstVideoOverlayComposition *overlay;
};

extern
GType gst_video_overlay_composition_meta_api_get_type (void);

extern
const GstMetaInfo *gst_video_overlay_composition_meta_get_info (void);

extern
GstVideoOverlayCompositionMeta * gst_buffer_add_video_overlay_composition_meta (GstBuffer                  * buf,
                                                                                GstVideoOverlayComposition * comp);

#ifndef GST_DISABLE_DEPRECATED
/**
 * gst_buffer_get_video_overlay_composition_meta:
 * @b: a #GstBuffer
 *
 * Gets the first video composition meta.
 *
 * Deprecated: It is common to have multiple video composition metas, it is thus
 *  recommended to use use gst_buffer_iterate_meta() instead.
 */
#define gst_buffer_get_video_overlay_composition_meta(b) \
  ((GstVideoOverlayCompositionMeta*)gst_buffer_get_meta((b),GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE))
#endif

#define gst_buffer_remove_video_overlay_composition_meta(b,m) \
  gst_buffer_remove_meta((b),((GstMeta *) m))

//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoOverlayComposition, gst_video_overlay_composition_unref)

//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoOverlayRectangle, gst_video_overlay_rectangle_unref)



#endif /* __GST_VIDEO_OVERLAY_COMPOSITION_H__ */
