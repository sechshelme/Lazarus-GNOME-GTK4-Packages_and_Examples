/* GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
 *
 * gstaudiostreamalign.h:
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

#ifndef __GST_AUDIO_STREAM_ALIGN_H__
#define __GST_AUDIO_STREAM_ALIGN_H__

#include <gst/gst.h>
#include <gst/audio/audio-prelude.h>



#define GST_TYPE_AUDIO_INFO_STREAM_ALIGN (gst_audio_stream_align_get_type ())

/**
 * GstAudioStreamAlign:
 *
 * The opaque #GstAudioStreamAlign data structure.
 *
 * Since: 1.14
 */
typedef struct _GstAudioStreamAlign GstAudioStreamAlign;

extern
GType                   gst_audio_stream_align_get_type                  (void);

extern
GstAudioStreamAlign *   gst_audio_stream_align_new                       (gint rate,
                                                                          GstClockTime alignment_threshold,
                                                                          GstClockTime discont_wait) ;
extern
GstAudioStreamAlign *   gst_audio_stream_align_copy                      (const GstAudioStreamAlign * align) ;
extern
void                    gst_audio_stream_align_free                      (GstAudioStreamAlign * align);

extern
void                    gst_audio_stream_align_set_rate                  (GstAudioStreamAlign * align,
                                                                          gint rate);
extern
gint                    gst_audio_stream_align_get_rate                  (const GstAudioStreamAlign * align);

extern
void                    gst_audio_stream_align_set_alignment_threshold   (GstAudioStreamAlign * align,
                                                                          GstClockTime alignment_threshold);
extern
GstClockTime            gst_audio_stream_align_get_alignment_threshold   (const GstAudioStreamAlign * align);

extern
void                    gst_audio_stream_align_set_discont_wait          (GstAudioStreamAlign * align,
                                                                          GstClockTime discont_wait);
extern
GstClockTime            gst_audio_stream_align_get_discont_wait          (const GstAudioStreamAlign * align);


extern
void                    gst_audio_stream_align_mark_discont              (GstAudioStreamAlign * align);

extern
GstClockTime            gst_audio_stream_align_get_timestamp_at_discont  (const GstAudioStreamAlign * align);

extern
guint64                 gst_audio_stream_align_get_samples_since_discont (const GstAudioStreamAlign * align);

extern
gboolean                gst_audio_stream_align_process                   (GstAudioStreamAlign * align,
                                                                          gboolean discont,
                                                                          GstClockTime timestamp,
                                                                          guint n_samples,
                                                                          GstClockTime *out_timestamp,
                                                                          GstClockTime *out_duration,
                                                                          guint64 *out_sample_position);



#endif /* __GST_AUDIO_STREAM_ALIGN_H__ */
