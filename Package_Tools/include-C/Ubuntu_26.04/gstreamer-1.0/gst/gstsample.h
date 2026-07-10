/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstsample.h: Header for GstSample object
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


#ifndef __GST_SAMPLE_H__
#define __GST_SAMPLE_H__

#include <gst/gstbuffer.h>
#include <gst/gstbufferlist.h>
#include <gst/gstcaps.h>
#include <gst/gstsegment.h>



extern GType _gst_sample_type;

#define GST_TYPE_SAMPLE      (_gst_sample_type)
#define GST_IS_SAMPLE(obj)   (GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_SAMPLE))
#define GST_SAMPLE_CAST(obj) ((GstSample *)obj)
#define GST_SAMPLE(obj)      (GST_SAMPLE_CAST(obj))

/**
 * GstSample:
 *
 * The opaque structure of a #GstSample. A sample contains a typed memory
 * block and the associated timing information. It is mainly used to
 * exchange buffers with an application.
 */
typedef struct _GstSample GstSample;

extern
GType                gst_sample_get_type      (void);

/* allocation */

extern
GstSample *          gst_sample_new           (GstBuffer          *buffer,
                                               GstCaps            *caps,
                                               const GstSegment   *segment,
                                               GstStructure       *info) ;
extern
GstBuffer *          gst_sample_get_buffer    (GstSample *sample);

extern
GstCaps *            gst_sample_get_caps      (GstSample *sample);

extern
GstSegment *         gst_sample_get_segment   (GstSample *sample);

extern
const GstStructure * gst_sample_get_info      (GstSample *sample);

extern
GstBufferList *      gst_sample_get_buffer_list (GstSample *sample);

extern
void                 gst_sample_set_buffer_list (GstSample *sample, GstBufferList *buffer_list);

extern
void                 gst_sample_set_buffer    (GstSample *sample, GstBuffer *buffer);

extern
void                 gst_sample_set_caps      (GstSample *sample, GstCaps *caps);

extern
void                 gst_sample_set_segment   (GstSample * sample, const GstSegment *segment);

extern
gboolean             gst_sample_set_info      (GstSample *sample, GstStructure *info);

#ifndef GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS
/* refcounting */
static inline GstSample *
gst_sample_ref (GstSample * sample)
{
  return GST_SAMPLE_CAST (gst_mini_object_ref (GST_MINI_OBJECT_CAST (
      sample)));
}

static inline void
gst_sample_unref (GstSample * sample)
{
  gst_mini_object_unref (GST_MINI_OBJECT_CAST (sample));
}

/* copy sample */
 static inline GstSample *
gst_sample_copy (const GstSample * sample)
{
  return GST_SAMPLE_CAST (gst_mini_object_copy (GST_MINI_OBJECT_CONST_CAST (sample)));
}

static inline void
gst_clear_sample (GstSample ** sample_ptr)
{
  gst_clear_mini_object ((GstMiniObject **) sample_ptr);
}

 static inline GstSample *
gst_sample_make_writable (GstSample * sample)
{
  return GST_SAMPLE_CAST (gst_mini_object_make_writable (GST_MINI_OBJECT_CAST (sample)));
}

static inline gboolean
gst_sample_is_writable (const GstSample * sample)
{
  return gst_mini_object_is_writable (GST_MINI_OBJECT_CONST_CAST (sample));
}
#else /* GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS */
extern
GstSample * gst_sample_ref    (GstSample * sample);

extern
void        gst_sample_unref  (GstSample * sample);

extern
GstSample *   gst_sample_copy (const GstSample * sample) ;

extern
void          gst_clear_sample (GstSample ** sample_ptr);

extern
GstSample *   gst_sample_make_writable (GstSample * sample) ;
extern
gboolean      gst_sample_is_writable (const GstSample * sample);
#endif /* GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS */

/**
 * gst_value_set_sample:
 * @v: a #GValue to receive the data
 * @b: (transfer none): a #GstSample to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller retains reference to sample.
 */
#define         gst_value_set_sample(v,b)       g_value_set_boxed((v),(b))
/**
 * gst_value_take_sample:
 * @v: a #GValue to receive the data
 * @b: (transfer full): a #GstSample to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller gives away reference to sample.
 */
#define         gst_value_take_sample(v,b)      g_value_take_boxed(v,(b))
/**
 * gst_value_get_sample:
 * @v: a #GValue to query
 *
 * Receives a #GstSample as the value of @v. Does not return a reference to
 * the sample, so the pointer is only valid for as long as the caller owns
 * a reference to @v.
 *
 * Returns: (transfer none): sample
 */
#define         gst_value_get_sample(v)         GST_SAMPLE_CAST (g_value_get_boxed(v))

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstSample, gst_sample_unref)



#endif /* __GST_SAMPLE_H__ */
