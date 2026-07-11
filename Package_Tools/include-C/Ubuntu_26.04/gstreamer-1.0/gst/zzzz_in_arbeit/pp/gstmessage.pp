
unit gstmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmessage.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGError  = ^GError;
Pgint  = ^gint;
Pgint64  = ^gint64;
PGstBufferingMode  = ^GstBufferingMode;
PGstClock  = ^GstClock;
PGstClockTime  = ^GstClockTime;
PGstContext  = ^GstContext;
PGstDevice  = ^GstDevice;
PGstElement  = ^GstElement;
PGstFormat  = ^GstFormat;
PGstMessage  = ^GstMessage;
PGstMessageType  = ^GstMessageType;
PGstObject  = ^GstObject;
PGstProgressType  = ^GstProgressType;
PGstState  = ^GstState;
PGstStream  = ^GstStream;
PGstStreamCollection  = ^GstStreamCollection;
PGstStreamStatusType  = ^GstStreamStatusType;
PGstStructure  = ^GstStructure;
PGstStructureChangeType  = ^GstStructureChangeType;
PGstTagList  = ^GstTagList;
PGstToc  = ^GstToc;
Pguint  = ^guint;
Pguint64  = ^guint64;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
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
  }
{$ifndef __GST_MESSAGE_H__}
{$define __GST_MESSAGE_H__}
{$include <glib.h>}
type
{*
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
  }
{ NOTE: keep in sync with quark registration in gstmessage.c
 * NOTE: keep GST_MESSAGE_ANY a valid gint to avoid compiler warnings.
  }
{ FIXME: 2.0: Make it NOT flags, just a regular 1,2,3,4.. enumeration  }
{ FIXME: For GST_MESSAGE_ANY ~0 -> 0xffffffff see
 *        https://bugzilla.gnome.org/show_bug.cgi?id=732633
  }
{*
   * GST_MESSAGE_DEVICE_MONITOR_STARTED:
   *
   * Message indicating the #GstDeviceMonitor has completed async startup.
   *
   * Since: 1.28
    }

  PGstMessageType = ^TGstMessageType;
  TGstMessageType =  Longint;
  Const
    GST_MESSAGE_UNKNOWN = 0;
    GST_MESSAGE_EOS = 1 shl 0;
    GST_MESSAGE_ERROR = 1 shl 1;
    GST_MESSAGE_WARNING = 1 shl 2;
    GST_MESSAGE_INFO = 1 shl 3;
    GST_MESSAGE_TAG = 1 shl 4;
    GST_MESSAGE_BUFFERING = 1 shl 5;
    GST_MESSAGE_STATE_CHANGED = 1 shl 6;
    GST_MESSAGE_STATE_DIRTY = 1 shl 7;
    GST_MESSAGE_STEP_DONE = 1 shl 8;
    GST_MESSAGE_CLOCK_PROVIDE = 1 shl 9;
    GST_MESSAGE_CLOCK_LOST = 1 shl 10;
    GST_MESSAGE_NEW_CLOCK = 1 shl 11;
    GST_MESSAGE_STRUCTURE_CHANGE = 1 shl 12;
    GST_MESSAGE_STREAM_STATUS = 1 shl 13;
    GST_MESSAGE_APPLICATION = 1 shl 14;
    GST_MESSAGE_ELEMENT = 1 shl 15;
    GST_MESSAGE_SEGMENT_START = 1 shl 16;
    GST_MESSAGE_SEGMENT_DONE = 1 shl 17;
    GST_MESSAGE_DURATION_CHANGED = 1 shl 18;
    GST_MESSAGE_LATENCY = 1 shl 19;
    GST_MESSAGE_ASYNC_START = 1 shl 20;
    GST_MESSAGE_ASYNC_DONE = 1 shl 21;
    GST_MESSAGE_REQUEST_STATE = 1 shl 22;
    GST_MESSAGE_STEP_START = 1 shl 23;
    GST_MESSAGE_QOS = 1 shl 24;
    GST_MESSAGE_PROGRESS = 1 shl 25;
    GST_MESSAGE_TOC = 1 shl 26;
    GST_MESSAGE_RESET_TIME = 1 shl 27;
    GST_MESSAGE_STREAM_START = 1 shl 28;
    GST_MESSAGE_NEED_CONTEXT = 1 shl 29;
    GST_MESSAGE_HAVE_CONTEXT = 1 shl 30;
    GST_MESSAGE_EXTENDED = Tgint(1 shl 31);
    GST_MESSAGE_DEVICE_ADDED = GST_MESSAGE_EXTENDED+1;
    GST_MESSAGE_DEVICE_REMOVED = GST_MESSAGE_EXTENDED+2;
    GST_MESSAGE_PROPERTY_NOTIFY = GST_MESSAGE_EXTENDED+3;
    GST_MESSAGE_STREAM_COLLECTION = GST_MESSAGE_EXTENDED+4;
    GST_MESSAGE_STREAMS_SELECTED = GST_MESSAGE_EXTENDED+5;
    GST_MESSAGE_REDIRECT = GST_MESSAGE_EXTENDED+6;
    GST_MESSAGE_DEVICE_CHANGED = GST_MESSAGE_EXTENDED+7;
    GST_MESSAGE_INSTANT_RATE_REQUEST = GST_MESSAGE_EXTENDED+8;
    GST_MESSAGE_DEVICE_MONITOR_STARTED = GST_MESSAGE_EXTENDED+9;
    GST_MESSAGE_ANY = Tgint($ffffffff);
;
{$include <gst/gstminiobject.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstelement.h>}
{$include <gst/gsttaglist.h>}
{$include <gst/gststructure.h>}
{$include <gst/gstquery.h>}
{$include <gst/gsttoc.h>}
{$include <gst/gstdevice.h>}
{$include <gst/gststreams.h>}
{$include <gst/gststreamcollection.h>}
  var
    _gst_message_type : TGType;cvar;external;

const
  GST_TYPE_MESSAGE = _gst_message_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_MESSAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MESSAGE_CAST(obj : longint) : PGstMessage;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE(obj : longint) : longint;

{ the lock is used to handle the synchronous handling of messages,
 * the emitting thread is blocked until the handling thread processed
 * the message using this mutex/cond pair  }
{*
 * GST_MESSAGE_TYPE:
 * @message: a #GstMessage
 *
 * Get the #GstMessageType of @message.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE(message : longint) : longint;

{*
 * GST_MESSAGE_TYPE_IS_EXTENDED:
 * @message: a #GstMessage
 *
 * Check if the message is in the extended message group
 * Since: 1.4
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE_IS_EXTENDED(message : longint) : longint;

{*
 * GST_MESSAGE_TYPE_NAME:
 * @message: a #GstMessage
 *
 * Get a constant string representation of the #GstMessageType of @message.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE_NAME(message : longint) : longint;

{*
 * GST_MESSAGE_TIMESTAMP:
 * @message: a #GstMessage
 *
 * Get the timestamp of @message. This is the timestamp when the message
 * was created.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TIMESTAMP(message : longint) : longint;

{*
 * GST_MESSAGE_SRC:
 * @message: a #GstMessage
 *
 * Get the object that posted @message.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SRC(message : longint) : longint;

{*
 * GST_MESSAGE_SEQNUM:
 * @message: a #GstMessage
 *
 * Get the sequence number of @message.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SEQNUM(message : longint) : longint;

{*
 * GST_MESSAGE_SRC_NAME:
 * @message: a #GstMessage
 *
 * Get the name of the object that posted @message. Returns "(NULL)" if
 * the message has no source object set.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SRC_NAME(message : longint) : longint;

{*
 * GstStructureChangeType:
 * @GST_STRUCTURE_CHANGE_TYPE_PAD_LINK: Pad linking is starting or done.
 * @GST_STRUCTURE_CHANGE_TYPE_PAD_UNLINK: Pad unlinking is starting or done.
 *
 * The type of a %GST_MESSAGE_STRUCTURE_CHANGE.
  }
type
  PGstStructureChangeType = ^TGstStructureChangeType;
  TGstStructureChangeType =  Longint;
  Const
    GST_STRUCTURE_CHANGE_TYPE_PAD_LINK = 0;
    GST_STRUCTURE_CHANGE_TYPE_PAD_UNLINK = 1;
;
{*
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
  }
type
  PGstStreamStatusType = ^TGstStreamStatusType;
  TGstStreamStatusType =  Longint;
  Const
    GST_STREAM_STATUS_TYPE_CREATE = 0;
    GST_STREAM_STATUS_TYPE_ENTER = 1;
    GST_STREAM_STATUS_TYPE_LEAVE = 2;
    GST_STREAM_STATUS_TYPE_DESTROY = 3;
    GST_STREAM_STATUS_TYPE_START = 8;
    GST_STREAM_STATUS_TYPE_PAUSE = 9;
    GST_STREAM_STATUS_TYPE_STOP = 10;
;
{*
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
  }
type
  PGstProgressType = ^TGstProgressType;
  TGstProgressType =  Longint;
  Const
    GST_PROGRESS_TYPE_START = 0;
    GST_PROGRESS_TYPE_CONTINUE = 1;
    GST_PROGRESS_TYPE_COMPLETE = 2;
    GST_PROGRESS_TYPE_CANCELED = 3;
    GST_PROGRESS_TYPE_ERROR = 4;
;
{*
 * GstMessage:
 * @mini_object: the parent structure
 * @type: the #GstMessageType of the message
 * @timestamp: the timestamp of the message
 * @src: the src of the message
 * @seqnum: the sequence number of the message
 *
 * A #GstMessage.
  }
{< public >  }{ with COW  }
{< private > }{ with MESSAGE_LOCK  }
{ lock and cond for async delivery  }
type
  PGstMessage = ^TGstMessage;
  TGstMessage = record
      mini_object : TGstMiniObject;
      _type : TGstMessageType;
      timestamp : Tguint64;
      src : PGstObject;
      seqnum : Tguint32;
      lock : TGMutex;
      cond : TGCond;
    end;

{$include <gst/gstquery.h>}

function gst_message_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_message_type_get_name(_type:TGstMessageType):Pgchar;cdecl;external;
function gst_message_type_to_quark(_type:TGstMessageType):TGQuark;cdecl;external;
function gst_message_ref(msg:PGstMessage):PGstMessage;cdecl;external;
procedure gst_message_unref(msg:PGstMessage);cdecl;external;
procedure gst_clear_message(msg_ptr:PPGstMessage);cdecl;external;
(* Const before type ignored *)
function gst_message_copy(msg:PGstMessage):PGstMessage;cdecl;external;
function gst_message_make_writable(message:PGstMessage):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_is_writable(message:PGstMessage):Tgboolean;cdecl;external;
function gst_message_replace(old_message:PPGstMessage; new_message:PGstMessage):Tgboolean;cdecl;external;
function gst_message_take(old_message:PPGstMessage; new_message:PGstMessage):Tgboolean;cdecl;external;
function gst_message_steal(old_message:PPGstMessage):PGstMessage;cdecl;external;
{ custom messages  }
function gst_message_new_custom(_type:TGstMessageType; src:PGstObject; structure:PGstStructure):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_get_structure(message:PGstMessage):PGstStructure;cdecl;external;
function gst_message_writable_structure(message:PGstMessage):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_message_has_name(message:PGstMessage; name:Pgchar):Tgboolean;cdecl;external;
procedure gst_message_set_details(message:PGstMessage; details:PGstStructure);cdecl;external;
(* Const before type ignored *)
function gst_message_get_details(message:PGstMessage):PGstStructure;cdecl;external;
function gst_message_writable_details(message:PGstMessage):PGstStructure;cdecl;external;
{ identifiers for events and messages  }
function gst_message_get_seqnum(message:PGstMessage):Tguint32;cdecl;external;
procedure gst_message_set_seqnum(message:PGstMessage; seqnum:Tguint32);cdecl;external;
{ EOS  }
function gst_message_new_eos(src:PGstObject):PGstMessage;cdecl;external;
{ ERROR  }
(* Const before type ignored *)
function gst_message_new_error(src:PGstObject; error:PGError; debug:Pgchar):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_new_error_with_details(src:PGstObject; error:PGError; debug:Pgchar; details:PGstStructure):PGstMessage;cdecl;external;
procedure gst_message_parse_error(message:PGstMessage; gerror:PPGError; debug:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_message_parse_error_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
procedure gst_message_parse_error_writable_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
{ WARNING  }
(* Const before type ignored *)
function gst_message_new_warning(src:PGstObject; error:PGError; debug:Pgchar):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_new_warning_with_details(src:PGstObject; error:PGError; debug:Pgchar; details:PGstStructure):PGstMessage;cdecl;external;
procedure gst_message_parse_warning(message:PGstMessage; gerror:PPGError; debug:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_message_parse_warning_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
procedure gst_message_parse_warning_writable_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
{ INFO  }
(* Const before type ignored *)
function gst_message_new_info(src:PGstObject; error:PGError; debug:Pgchar):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_new_info_with_details(src:PGstObject; error:PGError; debug:Pgchar; details:PGstStructure):PGstMessage;cdecl;external;
procedure gst_message_parse_info(message:PGstMessage; gerror:PPGError; debug:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_message_parse_info_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
procedure gst_message_parse_info_writable_details(message:PGstMessage; structure:PPGstStructure);cdecl;external;
{ TAG  }
function gst_message_new_tag(src:PGstObject; tag_list:PGstTagList):PGstMessage;cdecl;external;
procedure gst_message_parse_tag(message:PGstMessage; tag_list:PPGstTagList);cdecl;external;
{ BUFFERING  }
function gst_message_new_buffering(src:PGstObject; percent:Tgint):PGstMessage;cdecl;external;
procedure gst_message_parse_buffering(message:PGstMessage; percent:Pgint);cdecl;external;
procedure gst_message_set_buffering_stats(message:PGstMessage; mode:TGstBufferingMode; avg_in:Tgint; avg_out:Tgint; buffering_left:Tgint64);cdecl;external;
procedure gst_message_parse_buffering_stats(message:PGstMessage; mode:PGstBufferingMode; avg_in:Pgint; avg_out:Pgint; buffering_left:Pgint64);cdecl;external;
{ STATE_CHANGED  }
function gst_message_new_state_changed(src:PGstObject; oldstate:TGstState; newstate:TGstState; pending:TGstState):PGstMessage;cdecl;external;
procedure gst_message_parse_state_changed(message:PGstMessage; oldstate:PGstState; newstate:PGstState; pending:PGstState);cdecl;external;
{ STATE_DIRTY  }
function gst_message_new_state_dirty(src:PGstObject):PGstMessage;cdecl;external;
{ STEP_DONE  }
function gst_message_new_step_done(src:PGstObject; format:TGstFormat; amount:Tguint64; rate:Tgdouble; flush:Tgboolean; 
           intermediate:Tgboolean; duration:Tguint64; eos:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_step_done(message:PGstMessage; format:PGstFormat; amount:Pguint64; rate:Pgdouble; flush:Pgboolean; 
            intermediate:Pgboolean; duration:Pguint64; eos:Pgboolean);cdecl;external;
{ CLOCK_PROVIDE  }
function gst_message_new_clock_provide(src:PGstObject; clock:PGstClock; ready:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_clock_provide(message:PGstMessage; clock:PPGstClock; ready:Pgboolean);cdecl;external;
{ CLOCK_LOST  }
function gst_message_new_clock_lost(src:PGstObject; clock:PGstClock):PGstMessage;cdecl;external;
procedure gst_message_parse_clock_lost(message:PGstMessage; clock:PPGstClock);cdecl;external;
{ NEW_CLOCK  }
function gst_message_new_new_clock(src:PGstObject; clock:PGstClock):PGstMessage;cdecl;external;
procedure gst_message_parse_new_clock(message:PGstMessage; clock:PPGstClock);cdecl;external;
{ APPLICATION  }
function gst_message_new_application(src:PGstObject; structure:PGstStructure):PGstMessage;cdecl;external;
{ ELEMENT  }
function gst_message_new_element(src:PGstObject; structure:PGstStructure):PGstMessage;cdecl;external;
{ SEGMENT_START  }
function gst_message_new_segment_start(src:PGstObject; format:TGstFormat; position:Tgint64):PGstMessage;cdecl;external;
procedure gst_message_parse_segment_start(message:PGstMessage; format:PGstFormat; position:Pgint64);cdecl;external;
{ SEGMENT_DONE  }
function gst_message_new_segment_done(src:PGstObject; format:TGstFormat; position:Tgint64):PGstMessage;cdecl;external;
procedure gst_message_parse_segment_done(message:PGstMessage; format:PGstFormat; position:Pgint64);cdecl;external;
{ DURATION_CHANGED  }
function gst_message_new_duration_changed(src:PGstObject):PGstMessage;cdecl;external;
{ LATENCY  }
function gst_message_new_latency(src:PGstObject):PGstMessage;cdecl;external;
{ ASYNC_START  }
function gst_message_new_async_start(src:PGstObject):PGstMessage;cdecl;external;
{ ASYNC_DONE  }
function gst_message_new_async_done(src:PGstObject; running_time:TGstClockTime):PGstMessage;cdecl;external;
procedure gst_message_parse_async_done(message:PGstMessage; running_time:PGstClockTime);cdecl;external;
{ STRUCTURE CHANGE  }
function gst_message_new_structure_change(src:PGstObject; _type:TGstStructureChangeType; owner:PGstElement; busy:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_structure_change(message:PGstMessage; _type:PGstStructureChangeType; owner:PPGstElement; busy:Pgboolean);cdecl;external;
{ STREAM STATUS  }
function gst_message_new_stream_status(src:PGstObject; _type:TGstStreamStatusType; owner:PGstElement):PGstMessage;cdecl;external;
procedure gst_message_parse_stream_status(message:PGstMessage; _type:PGstStreamStatusType; owner:PPGstElement);cdecl;external;
(* Const before type ignored *)
procedure gst_message_set_stream_status_object(message:PGstMessage; object:PGValue);cdecl;external;
(* Const before type ignored *)
function gst_message_get_stream_status_object(message:PGstMessage):PGValue;cdecl;external;
{ REQUEST_STATE  }
function gst_message_new_request_state(src:PGstObject; state:TGstState):PGstMessage;cdecl;external;
procedure gst_message_parse_request_state(message:PGstMessage; state:PGstState);cdecl;external;
{ STEP_START  }
function gst_message_new_step_start(src:PGstObject; active:Tgboolean; format:TGstFormat; amount:Tguint64; rate:Tgdouble; 
           flush:Tgboolean; intermediate:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_step_start(message:PGstMessage; active:Pgboolean; format:PGstFormat; amount:Pguint64; rate:Pgdouble; 
            flush:Pgboolean; intermediate:Pgboolean);cdecl;external;
{ QOS  }
function gst_message_new_qos(src:PGstObject; live:Tgboolean; running_time:Tguint64; stream_time:Tguint64; timestamp:Tguint64; 
           duration:Tguint64):PGstMessage;cdecl;external;
procedure gst_message_set_qos_values(message:PGstMessage; jitter:Tgint64; proportion:Tgdouble; quality:Tgint);cdecl;external;
procedure gst_message_set_qos_stats(message:PGstMessage; format:TGstFormat; processed:Tguint64; dropped:Tguint64);cdecl;external;
procedure gst_message_parse_qos(message:PGstMessage; live:Pgboolean; running_time:Pguint64; stream_time:Pguint64; timestamp:Pguint64; 
            duration:Pguint64);cdecl;external;
procedure gst_message_parse_qos_values(message:PGstMessage; jitter:Pgint64; proportion:Pgdouble; quality:Pgint);cdecl;external;
procedure gst_message_parse_qos_stats(message:PGstMessage; format:PGstFormat; processed:Pguint64; dropped:Pguint64);cdecl;external;
{ PROGRESS  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_message_new_progress(src:PGstObject; _type:TGstProgressType; code:Pgchar; text:Pgchar):PGstMessage;cdecl;external;
procedure gst_message_parse_progress(message:PGstMessage; _type:PGstProgressType; code:PPgchar; text:PPgchar);cdecl;external;
{ TOC  }
function gst_message_new_toc(src:PGstObject; toc:PGstToc; updated:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_toc(message:PGstMessage; toc:PPGstToc; updated:Pgboolean);cdecl;external;
{ RESET_TIME  }
function gst_message_new_reset_time(src:PGstObject; running_time:TGstClockTime):PGstMessage;cdecl;external;
procedure gst_message_parse_reset_time(message:PGstMessage; running_time:PGstClockTime);cdecl;external;
{ STREAM_START  }
function gst_message_new_stream_start(src:PGstObject):PGstMessage;cdecl;external;
procedure gst_message_set_group_id(message:PGstMessage; group_id:Tguint);cdecl;external;
function gst_message_parse_group_id(message:PGstMessage; group_id:Pguint):Tgboolean;cdecl;external;
{ NEED_CONTEXT  }
(* Const before type ignored *)
function gst_message_new_need_context(src:PGstObject; context_type:Pgchar):PGstMessage;cdecl;external;
(* Const before type ignored *)
function gst_message_parse_context_type(message:PGstMessage; context_type:PPgchar):Tgboolean;cdecl;external;
{ HAVE_CONTEXT  }
function gst_message_new_have_context(src:PGstObject; context:PGstContext):PGstMessage;cdecl;external;
procedure gst_message_parse_have_context(message:PGstMessage; context:PPGstContext);cdecl;external;
{ DEVICE_ADDED  }
function gst_message_new_device_added(src:PGstObject; device:PGstDevice):PGstMessage;cdecl;external;
procedure gst_message_parse_device_added(message:PGstMessage; device:PPGstDevice);cdecl;external;
{ DEVICE_REMOVED  }
function gst_message_new_device_removed(src:PGstObject; device:PGstDevice):PGstMessage;cdecl;external;
procedure gst_message_parse_device_removed(message:PGstMessage; device:PPGstDevice);cdecl;external;
{ DEVICE_CHANGED  }
function gst_message_new_device_changed(src:PGstObject; device:PGstDevice; changed_device:PGstDevice):PGstMessage;cdecl;external;
procedure gst_message_parse_device_changed(message:PGstMessage; device:PPGstDevice; changed_device:PPGstDevice);cdecl;external;
{ DEVICE_MONITOR_STARTED  }
function gst_message_new_device_monitor_started(src:PGstObject; success:Tgboolean):PGstMessage;cdecl;external;
procedure gst_message_parse_device_monitor_started(message:PGstMessage; success:Pgboolean);cdecl;external;
{ PROPERTY_NOTIFY  }
(* Const before type ignored *)
function gst_message_new_property_notify(src:PGstObject; property_name:Pgchar; val:PGValue):PGstMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_message_parse_property_notify(message:PGstMessage; object:PPGstObject; property_name:PPgchar; property_value:PPGValue);cdecl;external;
{ STREAM_COLLECTION  }
function gst_message_new_stream_collection(src:PGstObject; collection:PGstStreamCollection):PGstMessage;cdecl;external;
procedure gst_message_parse_stream_collection(message:PGstMessage; collection:PPGstStreamCollection);cdecl;external;
{ STREAMS_SELECTED  }
function gst_message_new_streams_selected(src:PGstObject; collection:PGstStreamCollection):PGstMessage;cdecl;external;
procedure gst_message_streams_selected_add(message:PGstMessage; stream:PGstStream);cdecl;external;
procedure gst_message_parse_streams_selected(message:PGstMessage; collection:PPGstStreamCollection);cdecl;external;
function gst_message_streams_selected_get_size(message:PGstMessage):Tguint;cdecl;external;
function gst_message_streams_selected_get_stream(message:PGstMessage; idx:Tguint):PGstStream;cdecl;external;
{ REDIRECT  }
(* Const before type ignored *)
function gst_message_new_redirect(src:PGstObject; location:Pgchar; tag_list:PGstTagList; entry_struct:PGstStructure):PGstMessage;cdecl;external;
(* Const before type ignored *)
procedure gst_message_add_redirect_entry(message:PGstMessage; location:Pgchar; tag_list:PGstTagList; entry_struct:PGstStructure);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_message_parse_redirect_entry(message:PGstMessage; entry_index:Tgsize; location:PPgchar; tag_list:PPGstTagList; entry_struct:PPGstStructure);cdecl;external;
function gst_message_get_num_redirect_entries(message:PGstMessage):Tgsize;cdecl;external;
{ INSTANT_RATE_REQUEST  }
function gst_message_new_instant_rate_request(src:PGstObject; rate_multiplier:Tgdouble):PGstMessage;cdecl;external;
procedure gst_message_parse_instant_rate_request(message:PGstMessage; rate_multiplier:Pgdouble);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstMessage, gst_message_unref) }
{$endif}
{ __GST_MESSAGE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_MESSAGE(obj : longint) : longint;
begin
  GST_IS_MESSAGE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_MESSAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MESSAGE_CAST(obj : longint) : PGstMessage;
begin
  GST_MESSAGE_CAST:=PGstMessage(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE(obj : longint) : longint;
begin
  GST_MESSAGE:=GST_MESSAGE_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE(message : longint) : longint;
begin
  GST_MESSAGE_TYPE:=(GST_MESSAGE_CAST(message))^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE_IS_EXTENDED(message : longint) : longint;
begin
  GST_MESSAGE_TYPE_IS_EXTENDED:= not ( not (((GST_MESSAGE_CAST(message))^._type) and GST_MESSAGE_EXTENDED));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TYPE_NAME(message : longint) : longint;
begin
  GST_MESSAGE_TYPE_NAME:=gst_message_type_get_name(GST_MESSAGE_TYPE(message));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_TIMESTAMP(message : longint) : longint;
begin
  GST_MESSAGE_TIMESTAMP:=(GST_MESSAGE_CAST(message))^.timestamp;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SRC(message : longint) : longint;
begin
  GST_MESSAGE_SRC:=(GST_MESSAGE_CAST(message))^.src;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SEQNUM(message : longint) : longint;
begin
  GST_MESSAGE_SEQNUM:=(GST_MESSAGE_CAST(message))^.seqnum;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MESSAGE_SRC_NAME(message : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if GST_MESSAGE_SRC(message) then
    if_local1:=GST_OBJECT_NAME(GST_MESSAGE_SRC(message))
  else
    if_local1:='(NULL)';
  GST_MESSAGE_SRC_NAME:=if_local1;
end;


end.
