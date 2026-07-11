/* GStreamer
 * Copyright (C) 2004 Wim Taymans <wim@fluendo.com>
 *
 * gstmessage.h: Header for GstMessage subsystem
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

#ifndef __GST_MESSAGE_H__
#define __GST_MESSAGE_H__

#include <glib.h>



typedef struct _GstMessage GstMessage;

/**
 * GstMessageType:
 * @GST_MESSAGE_UNKNOWN: an undefined message
 * @GST_MESSAGE_EOS: end-of-stream reached in a pipeline. The application will
 * only receive this message in the PLAYING state and every time it sets a
 * pipeline to PLAYING that is in the EOS state. The application can perform a
 * flushing seek in the pipeline, which will undo the EOS state again.
 * @GST_MESSAGE_ERROR: an error occurred. When the application receives an error
 * message it should stop playback of the pipeline and not assume that more
 * data will be played. It is possible to specify a redirection url to the error
 * messages by setting a `redirect-location` field into the error message, application
 * or high level bins might use the information as required.
 * @GST_MESSAGE_WARNING: a warning occurred.
 * @GST_MESSAGE_INFO: an info message occurred
 * @GST_MESSAGE_TAG: a tag was found.
 * @GST_MESSAGE_BUFFERING: the pipeline is buffering. When the application
 * receives a buffering message in the PLAYING state for a non-live pipeline it
 * must PAUSE the pipeline until the buffering completes, when the percentage
 * field in the message is 100%. For live pipelines, no action must be
 * performed and the buffering percentage can be used to inform the user about
 * the progress.
 * @GST_MESSAGE_STATE_CHANGED: a state change happened
 * @GST_MESSAGE_STATE_DIRTY: an element changed state in a streaming thread.
 * This message is deprecated.
 * @GST_MESSAGE_STEP_DONE: a stepping operation finished.
 * @GST_MESSAGE_CLOCK_PROVIDE: an element notifies its capability of providing
 *                             a clock. This message is used internally and
 *                             never forwarded to the application.
 * @GST_MESSAGE_CLOCK_LOST: The current clock as selected by the pipeline became
 *                          unusable. The pipeline will select a new clock on
 *                          the next PLAYING state change. The application
 *                          should set the pipeline to PAUSED and back to
 *                          PLAYING when this message is received.
 * @GST_MESSAGE_NEW_CLOCK: a new clock was selected in the pipeline.
 * @GST_MESSAGE_STRUCTURE_CHANGE: the structure of the pipeline changed. This
 * message is used internally and never forwarded to the application.
 * @GST_MESSAGE_STREAM_STATUS: status about a stream, emitted when it starts,
 *                             stops, errors, etc..
 * @GST_MESSAGE_APPLICATION: message posted by the application, possibly
 *                           via an application-specific element.
 * @GST_MESSAGE_ELEMENT: element-specific message, see the specific element's
 *                       documentation
 * @GST_MESSAGE_SEGMENT_START: pipeline started playback of a segment. This
 * message is used internally and never forwarded to the application.
 * @GST_MESSAGE_SEGMENT_DONE: pipeline completed playback of a segment. This
 * message is forwarded to the application after all elements that posted
 * @GST_MESSAGE_SEGMENT_START posted a GST_MESSAGE_SEGMENT_DONE message.
 * @GST_MESSAGE_DURATION_CHANGED: The duration of a pipeline changed. The
 * application can get the new duration with a duration query.
 * @GST_MESSAGE_ASYNC_START: Posted by elements when they start an ASYNC
 * #GstStateChange. This message is not forwarded to the application but is used
 * internally.
 * @GST_MESSAGE_ASYNC_DONE: Posted by elements when they complete an ASYNC
 * #GstStateChange. The application will only receive this message from the toplevel
 * pipeline.
 * @GST_MESSAGE_LATENCY: Posted by elements when their latency changes. The
 * application should recalculate and distribute a new latency.
 * @GST_MESSAGE_REQUEST_STATE: Posted by elements when they want the pipeline to
 * change state. This message is a suggestion to the application which can
 * decide to perform the state change on (part of) the pipeline.
 * @GST_MESSAGE_STEP_START: A stepping operation was started.
 * @GST_MESSAGE_QOS: A buffer was dropped or an element changed its processing
 * strategy for Quality of Service reasons.
 * @GST_MESSAGE_PROGRESS: A progress message.
 * @GST_MESSAGE_TOC: A new table of contents (TOC) was found or previously found TOC
 * was updated.
 * @GST_MESSAGE_RESET_TIME: Message to request resetting the pipeline's
 *     running time from the pipeline. This is an internal message which
 *     applications will likely never receive.
 * @GST_MESSAGE_STREAM_START: Message indicating start of a new stream. Useful
 *     e.g. when using playbin in gapless playback mode, to get notified when
 *     the next title actually starts playing (which will be some time after
 *     the URI for the next title has been set).
 * @GST_MESSAGE_NEED_CONTEXT: Message indicating that an element wants a specific context (Since: 1.2)
 * @GST_MESSAGE_HAVE_CONTEXT: Message indicating that an element created a context (Since: 1.2)
 * @GST_MESSAGE_EXTENDED: Message is an extended message type (see below).
 *     These extended message IDs can't be used directly with mask-based API
 *     like gst_bus_poll() or gst_bus_timed_pop_filtered(), but you can still
 *     filter for GST_MESSAGE_EXTENDED and then check the result for the
 *     specific type. (Since: 1.4)
 * @GST_MESSAGE_DEVICE_ADDED: Message indicating a #GstDevice was added to
 *     a #GstDeviceProvider (Since: 1.4)
 * @GST_MESSAGE_DEVICE_REMOVED: Message indicating a #GstDevice was removed
 *     from a #GstDeviceProvider (Since: 1.4)
 * @GST_MESSAGE_PROPERTY_NOTIFY: Message indicating a #GObject property has
 *     changed (Since: 1.10)
 * @GST_MESSAGE_STREAM_COLLECTION: Message indicating a new #GstStreamCollection
 *     is available (Since: 1.10)
 * @GST_MESSAGE_STREAMS_SELECTED: Message indicating the active selection of
 *     #GstStreams has changed (Since: 1.10)
 * @GST_MESSAGE_REDIRECT: Message indicating to request the application to
 *     try to play the given URL(s). Useful if for example a HTTP 302/303
 *     response is received with a non-HTTP URL inside. (Since: 1.10)
 * @GST_MESSAGE_DEVICE_CHANGED: Message indicating a #GstDevice was changed
 *     a #GstDeviceProvider (Since: 1.16)
 * @GST_MESSAGE_INSTANT_RATE_REQUEST: Message sent by elements to request the
 *     running time from the pipeline when an instant rate change should
 *     be applied (which may be in the past when the answer arrives). (Since: 1.18)
 * @GST_MESSAGE_DEVICE_MONITOR_STARTED: Message indicating the
 *     #GstDeviceMonitor has completed async startup (Since: 1.28)
 * @GST_MESSAGE_ANY: mask for all of the above messages.
 *
 * The different message types that are available.
 */
/* NOTE: keep in sync with quark registration in gstmessage.c
 * NOTE: keep GST_MESSAGE_ANY a valid gint to avoid compiler warnings.
 */
/* FIXME: 2.0: Make it NOT flags, just a regular 1,2,3,4.. enumeration */
/* FIXME: For GST_MESSAGE_ANY ~0 -> 0xffffffff see
 *        https://bugzilla.gnome.org/show_bug.cgi?id=732633
 */
typedef enum
{
  GST_MESSAGE_UNKNOWN           = 0,
  GST_MESSAGE_EOS               = (1 << 0),
  GST_MESSAGE_ERROR             = (1 << 1),
  GST_MESSAGE_WARNING           = (1 << 2),
  GST_MESSAGE_INFO              = (1 << 3),
  GST_MESSAGE_TAG               = (1 << 4),
  GST_MESSAGE_BUFFERING         = (1 << 5),
  GST_MESSAGE_STATE_CHANGED     = (1 << 6),
  GST_MESSAGE_STATE_DIRTY       = (1 << 7),
  GST_MESSAGE_STEP_DONE         = (1 << 8),
  GST_MESSAGE_CLOCK_PROVIDE     = (1 << 9),
  GST_MESSAGE_CLOCK_LOST        = (1 << 10),
  GST_MESSAGE_NEW_CLOCK         = (1 << 11),
  GST_MESSAGE_STRUCTURE_CHANGE  = (1 << 12),
  GST_MESSAGE_STREAM_STATUS     = (1 << 13),
  GST_MESSAGE_APPLICATION       = (1 << 14),
  GST_MESSAGE_ELEMENT           = (1 << 15),
  GST_MESSAGE_SEGMENT_START     = (1 << 16),
  GST_MESSAGE_SEGMENT_DONE      = (1 << 17),
  GST_MESSAGE_DURATION_CHANGED  = (1 << 18),
  GST_MESSAGE_LATENCY           = (1 << 19),
  GST_MESSAGE_ASYNC_START       = (1 << 20),
  GST_MESSAGE_ASYNC_DONE        = (1 << 21),
  GST_MESSAGE_REQUEST_STATE     = (1 << 22),
  GST_MESSAGE_STEP_START        = (1 << 23),
  GST_MESSAGE_QOS               = (1 << 24),
  GST_MESSAGE_PROGRESS          = (1 << 25),
  GST_MESSAGE_TOC               = (1 << 26),
  GST_MESSAGE_RESET_TIME        = (1 << 27),
  GST_MESSAGE_STREAM_START      = (1 << 28),
  GST_MESSAGE_NEED_CONTEXT      = (1 << 29),
  GST_MESSAGE_HAVE_CONTEXT      = (1 << 30),
  GST_MESSAGE_EXTENDED          = (gint) (1u << 31),
  GST_MESSAGE_DEVICE_ADDED      = GST_MESSAGE_EXTENDED + 1,
  GST_MESSAGE_DEVICE_REMOVED    = GST_MESSAGE_EXTENDED + 2,
  GST_MESSAGE_PROPERTY_NOTIFY   = GST_MESSAGE_EXTENDED + 3,
  GST_MESSAGE_STREAM_COLLECTION = GST_MESSAGE_EXTENDED + 4,
  GST_MESSAGE_STREAMS_SELECTED  = GST_MESSAGE_EXTENDED + 5,
  GST_MESSAGE_REDIRECT          = GST_MESSAGE_EXTENDED + 6,
  GST_MESSAGE_DEVICE_CHANGED    = GST_MESSAGE_EXTENDED + 7,
  GST_MESSAGE_INSTANT_RATE_REQUEST = GST_MESSAGE_EXTENDED + 8,
  /**
   * GST_MESSAGE_DEVICE_MONITOR_STARTED:
   *
   * Message indicating the #GstDeviceMonitor has completed async startup.
   *
   * Since: 1.28
   */
  GST_MESSAGE_DEVICE_MONITOR_STARTED = GST_MESSAGE_EXTENDED + 9,
  GST_MESSAGE_ANY               = (gint) (0xffffffff)
} GstMessageType;

#include <gst/gstminiobject.h>
#include <gst/gstobject.h>
#include <gst/gstelement.h>
#include <gst/gsttaglist.h>
#include <gst/gststructure.h>
#include <gst/gstquery.h>
#include <gst/gsttoc.h>
#include <gst/gstdevice.h>
#include <gst/gststreams.h>
#include <gst/gststreamcollection.h>

extern GType _gst_message_type;

#define GST_TYPE_MESSAGE                         (_gst_message_type)
#define GST_IS_MESSAGE(obj)                      (GST_IS_MINI_OBJECT_TYPE (obj, GST_TYPE_MESSAGE))
#define GST_MESSAGE_CAST(obj)                    ((GstMessage*)(obj))
#define GST_MESSAGE(obj)                         (GST_MESSAGE_CAST(obj))

/* the lock is used to handle the synchronous handling of messages,
 * the emitting thread is blocked until the handling thread processed
 * the message using this mutex/cond pair */

/**
 * GST_MESSAGE_TYPE:
 * @message: a #GstMessage
 *
 * Get the #GstMessageType of @message.
 */
#define GST_MESSAGE_TYPE(message)       (GST_MESSAGE_CAST(message)->type)
/**
 * GST_MESSAGE_TYPE_IS_EXTENDED:
 * @message: a #GstMessage
 *
 * Check if the message is in the extended message group
 * Since: 1.4
 */
#define GST_MESSAGE_TYPE_IS_EXTENDED(message)       (!!(GST_MESSAGE_CAST(message)->type & GST_MESSAGE_EXTENDED))

/**
 * GST_MESSAGE_TYPE_NAME:
 * @message: a #GstMessage
 *
 * Get a constant string representation of the #GstMessageType of @message.
 */
#define GST_MESSAGE_TYPE_NAME(message)  gst_message_type_get_name(GST_MESSAGE_TYPE(message))
/**
 * GST_MESSAGE_TIMESTAMP:
 * @message: a #GstMessage
 *
 * Get the timestamp of @message. This is the timestamp when the message
 * was created.
 */
#define GST_MESSAGE_TIMESTAMP(message)  (GST_MESSAGE_CAST(message)->timestamp)
/**
 * GST_MESSAGE_SRC:
 * @message: a #GstMessage
 *
 * Get the object that posted @message.
 */
#define GST_MESSAGE_SRC(message)        (GST_MESSAGE_CAST(message)->src)

/**
 * GST_MESSAGE_SEQNUM:
 * @message: a #GstMessage
 *
 * Get the sequence number of @message.
 */
#define GST_MESSAGE_SEQNUM(message)     (GST_MESSAGE_CAST(message)->seqnum)

/**
 * GST_MESSAGE_SRC_NAME:
 * @message: a #GstMessage
 *
 * Get the name of the object that posted @message. Returns "(NULL)" if
 * the message has no source object set.
 */
#define GST_MESSAGE_SRC_NAME(message)   (GST_MESSAGE_SRC(message) ? \
    GST_OBJECT_NAME (GST_MESSAGE_SRC(message)) : "(NULL)")

/**
 * GstStructureChangeType:
 * @GST_STRUCTURE_CHANGE_TYPE_PAD_LINK: Pad linking is starting or done.
 * @GST_STRUCTURE_CHANGE_TYPE_PAD_UNLINK: Pad unlinking is starting or done.
 *
 * The type of a %GST_MESSAGE_STRUCTURE_CHANGE.
 */
typedef enum {
  GST_STRUCTURE_CHANGE_TYPE_PAD_LINK   = 0,
  GST_STRUCTURE_CHANGE_TYPE_PAD_UNLINK = 1
} GstStructureChangeType;

/**
 * GstStreamStatusType:
 * @GST_STREAM_STATUS_TYPE_CREATE: A new thread need to be created.
 * @GST_STREAM_STATUS_TYPE_ENTER: a thread entered its loop function
 * @GST_STREAM_STATUS_TYPE_LEAVE: a thread left its loop function
 * @GST_STREAM_STATUS_TYPE_DESTROY: a thread is destroyed
 * @GST_STREAM_STATUS_TYPE_START: a thread is started
 * @GST_STREAM_STATUS_TYPE_PAUSE: a thread is paused
 * @GST_STREAM_STATUS_TYPE_STOP: a thread is stopped
 *
 * The type of a %GST_MESSAGE_STREAM_STATUS. The stream status messages inform the
 * application of new streaming threads and their status.
 */
typedef enum {
  GST_STREAM_STATUS_TYPE_CREATE   = 0,
  GST_STREAM_STATUS_TYPE_ENTER    = 1,
  GST_STREAM_STATUS_TYPE_LEAVE    = 2,
  GST_STREAM_STATUS_TYPE_DESTROY  = 3,

  GST_STREAM_STATUS_TYPE_START    = 8,
  GST_STREAM_STATUS_TYPE_PAUSE    = 9,
  GST_STREAM_STATUS_TYPE_STOP     = 10
} GstStreamStatusType;

/**
 * GstProgressType:
 * @GST_PROGRESS_TYPE_START: A new task started.
 * @GST_PROGRESS_TYPE_CONTINUE: A task completed and a new one continues.
 * @GST_PROGRESS_TYPE_COMPLETE: A task completed.
 * @GST_PROGRESS_TYPE_CANCELED: A task was canceled.
 * @GST_PROGRESS_TYPE_ERROR: A task caused an error. An error message is also
 *          posted on the bus.
 *
 * The type of a %GST_MESSAGE_PROGRESS. The progress messages inform the
 * application of the status of asynchronous tasks.
 */
typedef enum {
  GST_PROGRESS_TYPE_START    = 0,
  GST_PROGRESS_TYPE_CONTINUE = 1,
  GST_PROGRESS_TYPE_COMPLETE = 2,
  GST_PROGRESS_TYPE_CANCELED = 3,
  GST_PROGRESS_TYPE_ERROR    = 4
} GstProgressType;

/**
 * GstMessage:
 * @mini_object: the parent structure
 * @type: the #GstMessageType of the message
 * @timestamp: the timestamp of the message
 * @src: the src of the message
 * @seqnum: the sequence number of the message
 *
 * A #GstMessage.
 */
struct _GstMessage
{
  GstMiniObject   mini_object;

  /*< public > *//* with COW */
  GstMessageType  type;
  guint64         timestamp;
  GstObject      *src;
  guint32         seqnum;

  /*< private >*//* with MESSAGE_LOCK */
  GMutex          lock;                 /* lock and cond for async delivery */
  GCond           cond;
};

#include <gst/gstquery.h>

extern
GType           gst_message_get_type            (void);

extern
const gchar*    gst_message_type_get_name       (GstMessageType type);

extern
GQuark          gst_message_type_to_quark       (GstMessageType type);

extern
GstMessage *  gst_message_ref   (GstMessage * msg);

extern
void          gst_message_unref (GstMessage * msg);

extern
void          gst_clear_message (GstMessage ** msg_ptr);

extern
GstMessage *  gst_message_copy  (const GstMessage * msg) ;

extern
GstMessage *  gst_message_make_writable (GstMessage * message) ;
extern
gboolean      gst_message_is_writable   (const GstMessage * message);

extern
gboolean  gst_message_replace                   (GstMessage ** old_message,
                                                 GstMessage * new_message);

extern
gboolean  gst_message_take                      (GstMessage ** old_message,
                                                 GstMessage * new_message);

extern
GstMessage *gst_message_steal (GstMessage **old_message);

/* custom messages */

extern
GstMessage *    gst_message_new_custom          (GstMessageType type,
                                                 GstObject    * src,
                                                 GstStructure * structure)  ;
extern
const GstStructure *
                gst_message_get_structure       (GstMessage *message);

extern
GstStructure *  gst_message_writable_structure  (GstMessage *message);

extern
gboolean        gst_message_has_name            (GstMessage *message, const gchar *name);

extern
void            gst_message_set_details         (GstMessage *message, GstStructure *details);

extern
const GstStructure *
                gst_message_get_details         (GstMessage *message);

extern
GstStructure *  gst_message_writable_details    (GstMessage *message);

/* identifiers for events and messages */

extern
guint32         gst_message_get_seqnum          (GstMessage *message);

extern
void            gst_message_set_seqnum          (GstMessage *message, guint32 seqnum);

/* EOS */

extern
GstMessage *    gst_message_new_eos             (GstObject * src)  ;

/* ERROR */

extern
GstMessage *    gst_message_new_error           (GstObject * src, GError * error, const gchar * debug)  ;

extern
GstMessage *    gst_message_new_error_with_details (GstObject * src, GError * error, const gchar * debug, GstStructure * details)  ;

extern
void            gst_message_parse_error         (GstMessage *message, GError **gerror, gchar **debug);

extern
void            gst_message_parse_error_details (GstMessage *message, const GstStructure **structure);

extern
void            gst_message_parse_error_writable_details (GstMessage *message, GstStructure **structure);

/* WARNING */

extern
GstMessage *    gst_message_new_warning         (GstObject * src, GError * error, const gchar * debug)  ;

extern
GstMessage *    gst_message_new_warning_with_details (GstObject * src, GError * error, const gchar * debug, GstStructure * details)  ;

extern
void            gst_message_parse_warning       (GstMessage *message, GError **gerror, gchar **debug);

extern
void            gst_message_parse_warning_details (GstMessage *message, const GstStructure **structure);

extern
void            gst_message_parse_warning_writable_details (GstMessage *message, GstStructure **structure);

/* INFO */

extern
GstMessage *    gst_message_new_info            (GstObject * src, GError * error, const gchar * debug)  ;

extern
GstMessage *    gst_message_new_info_with_details (GstObject * src, GError * error, const gchar * debug, GstStructure * details)  ;

extern
void            gst_message_parse_info          (GstMessage *message, GError **gerror, gchar **debug);

extern
void            gst_message_parse_info_details  (GstMessage *message, const GstStructure **structure);

extern
void            gst_message_parse_info_writable_details  (GstMessage *message, GstStructure **structure);

/* TAG */

extern
GstMessage *    gst_message_new_tag             (GstObject * src, GstTagList * tag_list)  ;

extern
void            gst_message_parse_tag           (GstMessage *message, GstTagList **tag_list);

/* BUFFERING */

extern
GstMessage *    gst_message_new_buffering         (GstObject * src, gint percent)  ;

extern
void            gst_message_parse_buffering       (GstMessage *message, gint *percent);

extern
void            gst_message_set_buffering_stats   (GstMessage *message, GstBufferingMode mode,
                                                   gint avg_in, gint avg_out,
                                                   gint64 buffering_left);
extern
void            gst_message_parse_buffering_stats (GstMessage *message, GstBufferingMode *mode,
                                                   gint *avg_in, gint *avg_out,
                                                   gint64 *buffering_left);

/* STATE_CHANGED */

extern
GstMessage *    gst_message_new_state_changed   (GstObject * src, GstState oldstate,
                                                 GstState newstate, GstState pending)  ;
extern
void            gst_message_parse_state_changed (GstMessage *message, GstState *oldstate,
                                                 GstState *newstate, GstState *pending);

/* STATE_DIRTY */

extern
GstMessage *    gst_message_new_state_dirty     (GstObject * src)  ;

/* STEP_DONE */

extern
GstMessage *    gst_message_new_step_done       (GstObject * src, GstFormat format, guint64 amount,
                                                 gdouble rate, gboolean flush, gboolean intermediate,
                                                 guint64 duration, gboolean eos)  ;
extern
void            gst_message_parse_step_done     (GstMessage * message, GstFormat *format, guint64 *amount,
                                                 gdouble *rate, gboolean *flush, gboolean *intermediate,
                                                 guint64 *duration, gboolean *eos);
/* CLOCK_PROVIDE */

extern
GstMessage *    gst_message_new_clock_provide   (GstObject * src, GstClock *clock, gboolean ready)  ;

extern
void            gst_message_parse_clock_provide (GstMessage *message, GstClock **clock,
                                                 gboolean *ready);

/* CLOCK_LOST */

extern
GstMessage *    gst_message_new_clock_lost      (GstObject * src, GstClock *clock)  ;

extern
void            gst_message_parse_clock_lost    (GstMessage *message, GstClock **clock);

/* NEW_CLOCK */

extern
GstMessage *    gst_message_new_new_clock       (GstObject * src, GstClock *clock)  ;

extern
void            gst_message_parse_new_clock     (GstMessage *message, GstClock **clock);

/* APPLICATION */

extern
GstMessage *    gst_message_new_application     (GstObject * src, GstStructure * structure)  ;

/* ELEMENT */

extern
GstMessage *    gst_message_new_element         (GstObject * src, GstStructure * structure)  ;

/* SEGMENT_START */

extern
GstMessage *    gst_message_new_segment_start   (GstObject * src, GstFormat format, gint64 position)  ;

extern
void            gst_message_parse_segment_start (GstMessage *message, GstFormat *format,
                                                 gint64 *position);

/* SEGMENT_DONE */

extern
GstMessage *    gst_message_new_segment_done    (GstObject * src, GstFormat format, gint64 position)  ;

extern
void            gst_message_parse_segment_done  (GstMessage *message, GstFormat *format,
                                                 gint64 *position);

/* DURATION_CHANGED */

extern
GstMessage *    gst_message_new_duration_changed (GstObject * src)  ;

/* LATENCY */

extern
GstMessage *    gst_message_new_latency         (GstObject * src)  ;

/* ASYNC_START */

extern
GstMessage *    gst_message_new_async_start     (GstObject * src)  ;

/* ASYNC_DONE */

extern
GstMessage *    gst_message_new_async_done      (GstObject * src, GstClockTime running_time)  ;

extern
void            gst_message_parse_async_done    (GstMessage *message, GstClockTime *running_time);

/* STRUCTURE CHANGE */

extern
GstMessage *    gst_message_new_structure_change   (GstObject * src, GstStructureChangeType type,
                                                    GstElement *owner, gboolean busy)  ;
extern
void            gst_message_parse_structure_change (GstMessage *message, GstStructureChangeType *type,
                                                    GstElement **owner, gboolean *busy);

/* STREAM STATUS */

extern
GstMessage *    gst_message_new_stream_status        (GstObject * src, GstStreamStatusType type,
                                                      GstElement *owner)  ;
extern
void            gst_message_parse_stream_status      (GstMessage *message, GstStreamStatusType *type,
                                                      GstElement **owner);
extern
void            gst_message_set_stream_status_object (GstMessage *message, const GValue *object);

extern
const GValue *  gst_message_get_stream_status_object (GstMessage *message);

/* REQUEST_STATE */

extern
GstMessage *    gst_message_new_request_state   (GstObject * src, GstState state)  ;

extern
void            gst_message_parse_request_state (GstMessage * message, GstState *state);

/* STEP_START */

extern
GstMessage *    gst_message_new_step_start      (GstObject * src, gboolean active, GstFormat format,
                                                 guint64 amount, gdouble rate, gboolean flush,
                                                 gboolean intermediate)  ;
extern
void            gst_message_parse_step_start    (GstMessage * message, gboolean *active, GstFormat *format,
                                                 guint64 *amount, gdouble *rate, gboolean *flush,
                                                 gboolean *intermediate);

/* QOS */

extern
GstMessage *    gst_message_new_qos             (GstObject * src, gboolean live, guint64 running_time,
                                                 guint64 stream_time, guint64 timestamp, guint64 duration)  ;
extern
void            gst_message_set_qos_values      (GstMessage * message, gint64 jitter, gdouble proportion,
                                                 gint quality);
extern
void            gst_message_set_qos_stats       (GstMessage * message, GstFormat format, guint64 processed,
                                                 guint64 dropped);
extern
void            gst_message_parse_qos           (GstMessage * message, gboolean * live, guint64 * running_time,
                                                 guint64 * stream_time, guint64 * timestamp, guint64 * duration);
extern
void            gst_message_parse_qos_values    (GstMessage * message, gint64 * jitter, gdouble * proportion,
                                                 gint * quality);
extern
void            gst_message_parse_qos_stats     (GstMessage * message, GstFormat * format, guint64 * processed,
                                                 guint64 * dropped);
/* PROGRESS */

extern
GstMessage *    gst_message_new_progress           (GstObject * src, GstProgressType type, const gchar *code,
                                                    const gchar *text)  ;
extern
void            gst_message_parse_progress         (GstMessage * message, GstProgressType * type, gchar ** code,
                                                    gchar ** text);

/* TOC */

extern
GstMessage *    gst_message_new_toc             (GstObject *src, GstToc *toc, gboolean updated) ;

extern
void            gst_message_parse_toc           (GstMessage *message, GstToc **toc, gboolean *updated);

/* RESET_TIME */

extern
GstMessage *    gst_message_new_reset_time      (GstObject * src, GstClockTime running_time)  ;

extern
void            gst_message_parse_reset_time    (GstMessage *message, GstClockTime *running_time);

/* STREAM_START */

extern
GstMessage *    gst_message_new_stream_start    (GstObject * src)  ;

extern
void            gst_message_set_group_id        (GstMessage *message, guint group_id);

extern
gboolean        gst_message_parse_group_id      (GstMessage *message, guint *group_id);

/* NEED_CONTEXT */

extern
GstMessage *    gst_message_new_need_context    (GstObject * src, const gchar * context_type)  ;

extern
gboolean        gst_message_parse_context_type  (GstMessage * message, const gchar ** context_type);

/* HAVE_CONTEXT */

extern
GstMessage *    gst_message_new_have_context    (GstObject * src, GstContext *context)  ;

extern
void            gst_message_parse_have_context  (GstMessage *message, GstContext **context);

/* DEVICE_ADDED */

extern
GstMessage *    gst_message_new_device_added    (GstObject * src, GstDevice * device)  ;

extern
void            gst_message_parse_device_added  (GstMessage * message, GstDevice ** device);

/* DEVICE_REMOVED */

extern
GstMessage *    gst_message_new_device_removed    (GstObject * src, GstDevice * device)  ;

extern
void            gst_message_parse_device_removed  (GstMessage * message, GstDevice ** device);

/* DEVICE_CHANGED */

extern
GstMessage *    gst_message_new_device_changed    (GstObject * src, GstDevice * device, GstDevice *changed_device) ;

extern
void            gst_message_parse_device_changed  (GstMessage * message, GstDevice ** device, GstDevice ** changed_device);

/* DEVICE_MONITOR_STARTED */

extern
GstMessage *    gst_message_new_device_monitor_started    (GstObject * src, gboolean success);

extern
void            gst_message_parse_device_monitor_started  (GstMessage * message, gboolean *success);


/* PROPERTY_NOTIFY */

extern
GstMessage *    gst_message_new_property_notify   (GstObject * src, const gchar * property_name, GValue * val)  ;

extern
void            gst_message_parse_property_notify (GstMessage * message, GstObject ** object, const gchar ** property_name, const GValue ** property_value);

/* STREAM_COLLECTION */

extern
GstMessage *    gst_message_new_stream_collection   (GstObject * src, GstStreamCollection * collection)  ;

extern
void            gst_message_parse_stream_collection (GstMessage *message, GstStreamCollection **collection);

/* STREAMS_SELECTED */

extern
GstMessage *    gst_message_new_streams_selected (GstObject *src, GstStreamCollection *collection) ;

extern
void            gst_message_streams_selected_add (GstMessage *message, GstStream *stream);

extern
void            gst_message_parse_streams_selected (GstMessage * message, GstStreamCollection **collection);

extern
guint           gst_message_streams_selected_get_size (GstMessage * message);

extern
GstStream      *gst_message_streams_selected_get_stream (GstMessage *message, guint idx) ;

/* REDIRECT */

extern
GstMessage *    gst_message_new_redirect             (GstObject * src, const gchar * location, GstTagList * tag_list, GstStructure * entry_struct)  ;

extern
void            gst_message_add_redirect_entry       (GstMessage * message, const gchar * location, GstTagList * tag_list, GstStructure * entry_struct);

extern
void            gst_message_parse_redirect_entry     (GstMessage * message, gsize entry_index, const gchar ** location, GstTagList ** tag_list, const GstStructure ** entry_struct);

extern
gsize           gst_message_get_num_redirect_entries (GstMessage * message);

/* INSTANT_RATE_REQUEST */

extern
GstMessage *    gst_message_new_instant_rate_request   (GstObject * src, gdouble rate_multiplier)  ;
extern
void            gst_message_parse_instant_rate_request (GstMessage * message, gdouble * rate_multiplier);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstMessage, gst_message_unref)



#endif /* __GST_MESSAGE_H__ */
