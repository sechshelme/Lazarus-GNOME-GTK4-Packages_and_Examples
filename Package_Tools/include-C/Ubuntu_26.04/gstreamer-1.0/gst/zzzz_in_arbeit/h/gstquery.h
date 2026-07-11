/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *                    2011 Wim Taymans <wim.taymans@gmail.com>
 *
 * gstquery.h: GstQuery API declaration
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


#ifndef __GST_QUERY_H__
#define __GST_QUERY_H__

#include <glib.h>
#include <glib-object.h>
#include <gst/gstconfig.h>



#ifdef _MSC_VER
#pragma warning(disable: 5287)
#endif

typedef struct _GstQuery GstQuery;

#include <gst/gstminiobject.h>

/**
 * GstQueryTypeFlags:
 * @GST_QUERY_TYPE_UPSTREAM:     Set if the query can travel upstream.
 * @GST_QUERY_TYPE_DOWNSTREAM:   Set if the query can travel downstream.
 * @GST_QUERY_TYPE_SERIALIZED:   Set if the query should be serialized with data
 *                               flow.
 *
 * #GstQueryTypeFlags indicate the aspects of the different #GstQueryType
 * values. You can get the type flags of a #GstQueryType with the
 * gst_query_type_get_flags() function.
 */
typedef enum {
  GST_QUERY_TYPE_UPSTREAM       = 1 << 0,
  GST_QUERY_TYPE_DOWNSTREAM     = 1 << 1,
  GST_QUERY_TYPE_SERIALIZED     = 1 << 2
} GstQueryTypeFlags;

/**
 * GST_QUERY_TYPE_BOTH: (value 3) (type GstQueryTypeFlags)
 *
 * The same thing as #GST_QUERY_TYPE_UPSTREAM | #GST_QUERY_TYPE_DOWNSTREAM.
 */
#define GST_QUERY_TYPE_BOTH \
    ((GstQueryTypeFlags)(GST_QUERY_TYPE_UPSTREAM | GST_QUERY_TYPE_DOWNSTREAM))

#define GST_QUERY_NUM_SHIFT     (8)

/**
 * GST_QUERY_MAKE_TYPE:
 * @num: the query number to create
 * @flags: the query flags
 *
 * when making custom query types, use this macro with the num and
 * the given flags
 */


/**
 * GstQueryType:
 * @GST_QUERY_UNKNOWN: unknown query type
 * @GST_QUERY_POSITION: current position in stream
 * @GST_QUERY_DURATION: total duration of the stream
 * @GST_QUERY_LATENCY: latency of stream
 * @GST_QUERY_JITTER: current jitter of stream
 * @GST_QUERY_RATE: current rate of the stream
 * @GST_QUERY_SEEKING: seeking capabilities
 * @GST_QUERY_SEGMENT: segment start/stop positions
 * @GST_QUERY_CONVERT: convert values between formats
 * @GST_QUERY_FORMATS: query supported formats for convert
 * @GST_QUERY_BUFFERING: query available media for efficient seeking.
 * @GST_QUERY_CUSTOM: a custom application or element defined query.
 * @GST_QUERY_URI: query the URI of the source or sink.
 * @GST_QUERY_ALLOCATION: the buffer allocation properties
 * @GST_QUERY_SCHEDULING: the scheduling properties
 * @GST_QUERY_ACCEPT_CAPS: the accept caps query
 * @GST_QUERY_CAPS: the caps query
 * @GST_QUERY_DRAIN: wait till all serialized data is consumed downstream
 * @GST_QUERY_CONTEXT: query the pipeline-local context from
 *     downstream or upstream (since 1.2)
 * @GST_QUERY_BITRATE: the bitrate query (since 1.16)
 * @GST_QUERY_SELECTABLE: Query stream selection capability (Since: 1.22)
 *
 * Standard predefined Query types
 */
/* NOTE: don't forget to update the table in gstquery.c when changing
 * this enum */
typedef enum {
  GST_QUERY_UNKNOWN      = GST_QUERY_MAKE_TYPE (0, 0),
  GST_QUERY_POSITION     = GST_QUERY_MAKE_TYPE (10, _FLAG(BOTH)),
  GST_QUERY_DURATION     = GST_QUERY_MAKE_TYPE (20, _FLAG(BOTH)),
  GST_QUERY_LATENCY      = GST_QUERY_MAKE_TYPE (30, _FLAG(BOTH)),
  GST_QUERY_JITTER       = GST_QUERY_MAKE_TYPE (40, _FLAG(BOTH)),
  GST_QUERY_RATE         = GST_QUERY_MAKE_TYPE (50, _FLAG(BOTH)),
  GST_QUERY_SEEKING      = GST_QUERY_MAKE_TYPE (60, _FLAG(BOTH)),
  GST_QUERY_SEGMENT      = GST_QUERY_MAKE_TYPE (70, _FLAG(BOTH)),
  GST_QUERY_CONVERT      = GST_QUERY_MAKE_TYPE (80, _FLAG(BOTH)),
  GST_QUERY_FORMATS      = GST_QUERY_MAKE_TYPE (90, _FLAG(BOTH)),
  GST_QUERY_BUFFERING    = GST_QUERY_MAKE_TYPE (110, _FLAG(BOTH)),
  GST_QUERY_CUSTOM       = GST_QUERY_MAKE_TYPE (120, _FLAG(BOTH)),
  GST_QUERY_URI          = GST_QUERY_MAKE_TYPE (130, _FLAG(BOTH)),
  GST_QUERY_ALLOCATION   = GST_QUERY_MAKE_TYPE (140, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  GST_QUERY_SCHEDULING   = GST_QUERY_MAKE_TYPE (150, _FLAG(UPSTREAM)),
  GST_QUERY_ACCEPT_CAPS  = GST_QUERY_MAKE_TYPE (160, _FLAG(BOTH)),
  GST_QUERY_CAPS         = GST_QUERY_MAKE_TYPE (170, _FLAG(BOTH)),
  GST_QUERY_DRAIN        = GST_QUERY_MAKE_TYPE (180, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  GST_QUERY_CONTEXT      = GST_QUERY_MAKE_TYPE (190, _FLAG(BOTH)),
  GST_QUERY_BITRATE      = GST_QUERY_MAKE_TYPE (200, _FLAG(DOWNSTREAM)),

  /**
   * GST_QUERY_SELECTABLE:
   *
   * Query stream selection capability.
   *
   * Since: 1.22
   */
  GST_QUERY_SELECTABLE   = GST_QUERY_MAKE_TYPE (210, _FLAG(BOTH)),
} GstQueryType;
#undef _FLAG

extern GType _gst_query_type;

#define GST_TYPE_QUERY                         (_gst_query_type)
#define GST_IS_QUERY(obj)                      (GST_IS_MINI_OBJECT_TYPE (obj, GST_TYPE_QUERY))
#define GST_QUERY_CAST(obj)                    ((GstQuery*)(obj))
#define GST_QUERY(obj)                         (GST_QUERY_CAST(obj))

/**
 * GstQuery:
 * @mini_object: The parent #GstMiniObject type
 * @type: the #GstQueryType
 *
 * The #GstQuery structure.
 */
struct _GstQuery
{
  GstMiniObject mini_object;

  /*< public > *//* with COW */
  GstQueryType type;
};

/**
 * GstBufferingMode:
 * @GST_BUFFERING_STREAM: a small amount of data is buffered
 * @GST_BUFFERING_DOWNLOAD: the stream is being downloaded
 * @GST_BUFFERING_TIMESHIFT: the stream is being downloaded in a ringbuffer
 * @GST_BUFFERING_LIVE: the stream is a live stream
 *
 * The different types of buffering methods.
 */
typedef enum {
  GST_BUFFERING_STREAM,
  GST_BUFFERING_DOWNLOAD,
  GST_BUFFERING_TIMESHIFT,
  GST_BUFFERING_LIVE
} GstBufferingMode;

#include <gst/gstiterator.h>
#include <gst/gststructure.h>
#include <gst/gstformat.h>
#include <gst/gstpad.h>
#include <gst/gstallocator.h>
#include <gst/gsttoc.h>
#include <gst/gstcontext.h>

extern
const gchar*    gst_query_type_get_name        (GstQueryType type);

extern
GQuark          gst_query_type_to_quark        (GstQueryType type);

extern
GstQueryTypeFlags
                gst_query_type_get_flags       (GstQueryType type);


extern
GType           gst_query_get_type             (void);

extern
GstQuery *  gst_query_ref   (GstQuery * q);

extern
void        gst_query_unref (GstQuery * q);

extern
void        gst_clear_query (GstQuery ** query_ptr);

extern
GstQuery *  gst_query_copy  (const GstQuery * q) ;

extern
GstQuery *  gst_query_make_writable (GstQuery * query) ;
extern
gboolean    gst_query_is_writable   (const GstQuery * query);

extern
gboolean        gst_query_replace               (GstQuery ** old_query,
                                                 GstQuery * new_query);

extern
gboolean        gst_query_take                  (GstQuery ** old_query,
                                                 GstQuery * new_query);

extern
GstQuery *gst_query_steal (GstQuery **old_query);
#endif /* GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS */

/* application specific query */

extern
GstQuery *      gst_query_new_custom            (GstQueryType type, GstStructure *structure)  ;

extern
const GstStructure *
                gst_query_get_structure         (GstQuery *query);

extern
GstStructure *  gst_query_writable_structure    (GstQuery *query);

/* position query */

extern
GstQuery*       gst_query_new_position          (GstFormat format)  ;

extern
void            gst_query_set_position          (GstQuery *query, GstFormat format, gint64 cur);

extern
void            gst_query_parse_position        (GstQuery *query, GstFormat *format, gint64 *cur);

/* duration query */

extern
GstQuery*       gst_query_new_duration          (GstFormat format)  ;

extern
void            gst_query_set_duration          (GstQuery *query, GstFormat format, gint64 duration);

extern
void            gst_query_parse_duration        (GstQuery *query, GstFormat *format, gint64 *duration);

/* latency query */

extern
GstQuery*       gst_query_new_latency           (void)  ;

extern
void            gst_query_set_latency           (GstQuery *query, gboolean live, GstClockTime min_latency,
                                                 GstClockTime max_latency);

extern
void            gst_query_parse_latency         (GstQuery *query, gboolean *live, GstClockTime *min_latency,
                                                 GstClockTime *max_latency);

/* convert query */

extern
GstQuery*       gst_query_new_convert           (GstFormat src_format, gint64 value, GstFormat dest_format)  ;

extern
void            gst_query_set_convert           (GstQuery *query, GstFormat src_format, gint64 src_value,
                                                 GstFormat dest_format, gint64 dest_value);

extern
void            gst_query_parse_convert         (GstQuery *query, GstFormat *src_format, gint64 *src_value,
                                                 GstFormat *dest_format, gint64 *dest_value);
/* segment query */

extern
GstQuery*       gst_query_new_segment           (GstFormat format)  ;

extern
void            gst_query_set_segment           (GstQuery *query, gdouble rate, GstFormat format,
                                                 gint64 start_value, gint64 stop_value);

extern
void            gst_query_parse_segment         (GstQuery *query, gdouble *rate, GstFormat *format,
                                                 gint64 *start_value, gint64 *stop_value);

/* seeking query */

extern
GstQuery*       gst_query_new_seeking           (GstFormat format)  ;

extern
void            gst_query_set_seeking           (GstQuery *query, GstFormat format,
                                                 gboolean seekable,
                                                 gint64 segment_start,
                                                 gint64 segment_end);

extern
void            gst_query_parse_seeking         (GstQuery *query, GstFormat *format,
                                                 gboolean *seekable,
                                                 gint64 *segment_start,
                                                 gint64 *segment_end);
/* formats query */

extern
GstQuery*       gst_query_new_formats           (void)  ;

extern
void            gst_query_set_formats           (GstQuery *query, gint n_formats, ...);

extern
void            gst_query_set_formatsv          (GstQuery *query, gint n_formats, const GstFormat *formats);

extern
void            gst_query_parse_n_formats       (GstQuery *query, guint *n_formats);

extern
void            gst_query_parse_nth_format      (GstQuery *query, guint nth, GstFormat *format);

/* buffering query */

extern
GstQuery*       gst_query_new_buffering           (GstFormat format)  ;

extern
void            gst_query_set_buffering_percent   (GstQuery *query, gboolean busy, gint percent);

extern
void            gst_query_parse_buffering_percent (GstQuery *query, gboolean *busy, gint *percent);

extern
void            gst_query_set_buffering_stats     (GstQuery *query, GstBufferingMode mode,
                                                   gint avg_in, gint avg_out,
                                                   gint64 buffering_left);

extern
void            gst_query_parse_buffering_stats    (GstQuery *query, GstBufferingMode *mode,
                                                   gint *avg_in, gint *avg_out,
                                                   gint64 *buffering_left);

extern
void            gst_query_set_buffering_range     (GstQuery *query, GstFormat format,
                                                   gint64 start, gint64 stop,
                                                   gint64 estimated_total);

extern
void            gst_query_parse_buffering_range   (GstQuery *query, GstFormat *format,
                                                   gint64 *start, gint64 *stop,
                                                   gint64 *estimated_total);

extern
gboolean        gst_query_add_buffering_range       (GstQuery *query,
                                                     gint64 start, gint64 stop);

extern
guint           gst_query_get_n_buffering_ranges    (GstQuery *query);

extern
gboolean        gst_query_parse_nth_buffering_range (GstQuery *query,
                                                     guint index, gint64 *start,
                                                     gint64 *stop);

/* URI query */

extern
GstQuery *      gst_query_new_uri                    (void)  ;

extern
void            gst_query_parse_uri                  (GstQuery *query, gchar **uri);

extern
void            gst_query_set_uri                    (GstQuery *query, const gchar *uri);

extern
void            gst_query_parse_uri_redirection      (GstQuery *query, gchar **uri);

extern
void            gst_query_set_uri_redirection        (GstQuery *query, const gchar *uri);

extern
void            gst_query_parse_uri_redirection_permanent (GstQuery *query, gboolean * permanent);

extern
void            gst_query_set_uri_redirection_permanent (GstQuery *query, gboolean permanent);

/* allocation query */

extern
GstQuery *      gst_query_new_allocation             (GstCaps *caps, gboolean need_pool)  ;

extern
void            gst_query_parse_allocation           (GstQuery *query, GstCaps **caps, gboolean *need_pool);

/* pools */

extern
void            gst_query_add_allocation_pool        (GstQuery *query, GstBufferPool *pool,
                                                      guint size, guint min_buffers,
                                                      guint max_buffers);

extern
guint           gst_query_get_n_allocation_pools     (GstQuery *query);

extern
void            gst_query_parse_nth_allocation_pool  (GstQuery *query, guint index,
                                                      GstBufferPool **pool,
                                                      guint *size, guint *min_buffers,
                                                      guint *max_buffers);

extern
void            gst_query_set_nth_allocation_pool    (GstQuery *query, guint index,
                                                      GstBufferPool *pool,
                                                      guint size, guint min_buffers,
                                                      guint max_buffers);

extern
void            gst_query_remove_nth_allocation_pool (GstQuery *query, guint index);

/* allocators */

extern
void            gst_query_add_allocation_param       (GstQuery *query, GstAllocator *allocator,
                                                      const GstAllocationParams *params);

extern
guint           gst_query_get_n_allocation_params    (GstQuery *query);

extern
void            gst_query_parse_nth_allocation_param (GstQuery *query, guint index,
                                                      GstAllocator **allocator,
                                                      GstAllocationParams *params);

extern
void            gst_query_set_nth_allocation_param   (GstQuery *query, guint index,
                                                      GstAllocator *allocator,
                                                      const GstAllocationParams *params);

extern
void            gst_query_remove_nth_allocation_param (GstQuery *query, guint index);

/* metadata */

extern
void            gst_query_add_allocation_meta        (GstQuery *query, GType api, const GstStructure *params);

extern
guint           gst_query_get_n_allocation_metas     (GstQuery *query);

extern
GType           gst_query_parse_nth_allocation_meta  (GstQuery *query, guint index,
                                                      const GstStructure **params);

extern
void            gst_query_remove_nth_allocation_meta (GstQuery *query, guint index);

extern
gboolean        gst_query_find_allocation_meta       (GstQuery *query, GType api, guint *index);


/* scheduling query */
/**
 * GstSchedulingFlags:
 * @GST_SCHEDULING_FLAG_SEEKABLE: if seeking is possible
 * @GST_SCHEDULING_FLAG_SEQUENTIAL: if sequential access is recommended
 * @GST_SCHEDULING_FLAG_BANDWIDTH_LIMITED: if bandwidth is limited and buffering possible (since 1.2)
 *
 * The different scheduling flags.
 */
typedef enum {
  GST_SCHEDULING_FLAG_SEEKABLE          = (1 << 0),
  GST_SCHEDULING_FLAG_SEQUENTIAL        = (1 << 1),
  GST_SCHEDULING_FLAG_BANDWIDTH_LIMITED = (1 << 2)
} GstSchedulingFlags;

extern
GstQuery *      gst_query_new_scheduling          (void)  ;

extern
void            gst_query_set_scheduling          (GstQuery *query, GstSchedulingFlags flags,
                                                   gint minsize, gint maxsize, gint align);

extern
void            gst_query_parse_scheduling        (GstQuery *query, GstSchedulingFlags *flags,
                                                   gint *minsize, gint *maxsize, gint *align);

extern
void            gst_query_add_scheduling_mode       (GstQuery *query, GstPadMode mode);

extern
guint           gst_query_get_n_scheduling_modes    (GstQuery *query);

extern
GstPadMode      gst_query_parse_nth_scheduling_mode (GstQuery *query, guint index);

extern
gboolean        gst_query_has_scheduling_mode       (GstQuery *query, GstPadMode mode);

extern
gboolean        gst_query_has_scheduling_mode_with_flags (GstQuery * query, GstPadMode mode,
                                                    GstSchedulingFlags flags);

/* accept-caps query */

extern
GstQuery *      gst_query_new_accept_caps          (GstCaps *caps)  ;

extern
void            gst_query_parse_accept_caps        (GstQuery *query, GstCaps **caps);

extern
void            gst_query_set_accept_caps_result   (GstQuery *query, gboolean result);

extern
void            gst_query_parse_accept_caps_result (GstQuery *query, gboolean *result);

/* caps query */

extern
GstQuery *      gst_query_new_caps                 (GstCaps *filter)  ;

extern
void            gst_query_parse_caps               (GstQuery *query, GstCaps **filter);

extern
void            gst_query_set_caps_result          (GstQuery *query, GstCaps *caps);

extern
void            gst_query_parse_caps_result        (GstQuery *query, GstCaps **caps);

/* drain query */

extern
GstQuery *      gst_query_new_drain                (void)  ;

/* context query */

extern
GstQuery *      gst_query_new_context              (const gchar * context_type)  ;

extern
gboolean        gst_query_parse_context_type       (GstQuery * query, const gchar ** context_type);

extern
void            gst_query_set_context              (GstQuery *query, GstContext *context);

extern
void            gst_query_parse_context            (GstQuery *query, GstContext **context);

/* bitrate query */

extern
GstQuery *      gst_query_new_bitrate              (void)  ;

extern
void            gst_query_set_bitrate              (GstQuery * query, guint nominal_bitrate);

extern
void            gst_query_parse_bitrate            (GstQuery * query, guint * nominal_bitrate);

/* selectable query */

extern
GstQuery *      gst_query_new_selectable           (void)  ;

extern
void            gst_query_set_selectable           (GstQuery *query, gboolean selectable);

extern
void            gst_query_parse_selectable         (GstQuery *query, gboolean * selectable);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstQuery, gst_query_unref)



#endif /* __GST_QUERY_H__ */

