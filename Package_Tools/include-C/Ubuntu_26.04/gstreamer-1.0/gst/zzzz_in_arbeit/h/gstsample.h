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


