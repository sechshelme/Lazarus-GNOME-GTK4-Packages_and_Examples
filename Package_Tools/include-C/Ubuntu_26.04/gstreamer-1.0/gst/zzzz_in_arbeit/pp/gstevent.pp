
unit gstevent;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstevent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstevent.h
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
Pgint64  = ^gint64;
PGList  = ^GList;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstClockTimeDiff  = ^GstClockTimeDiff;
PGstEvent  = ^GstEvent;
PGstEventType  = ^GstEventType;
PGstEventTypeFlags  = ^GstEventTypeFlags;
PGstFormat  = ^GstFormat;
PGstGapFlags  = ^GstGapFlags;
PGstMessage  = ^GstMessage;
PGstQOSType  = ^GstQOSType;
PGstSeekFlags  = ^GstSeekFlags;
PGstSeekType  = ^GstSeekType;
PGstSegment  = ^GstSegment;
PGstSegmentFlags  = ^GstSegmentFlags;
PGstStream  = ^GstStream;
PGstStreamCollection  = ^GstStreamCollection;
PGstStreamFlags  = ^GstStreamFlags;
PGstStructure  = ^GstStructure;
PGstTagList  = ^GstTagList;
PGstToc  = ^GstToc;
Pguint  = ^guint;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstevent.h: Header for GstEvent subsystem
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
{$ifndef __GST_EVENT_H__}
{$define __GST_EVENT_H__}
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(disable: 5287)*)
{$endif}
type
{*
 * GstEventTypeFlags:
 * @GST_EVENT_TYPE_UPSTREAM:     Set if the event can travel upstream.
 * @GST_EVENT_TYPE_DOWNSTREAM:   Set if the event can travel downstream.
 * @GST_EVENT_TYPE_SERIALIZED:   Set if the event should be serialized with data
 *                               flow.
 * @GST_EVENT_TYPE_STICKY:       Set if the event is sticky on the pads.
 * @GST_EVENT_TYPE_STICKY_MULTI: Multiple sticky events can be on a pad, each
 *                               identified by the event name.
 *
 * #GstEventTypeFlags indicate the aspects of the different #GstEventType
 * values. You can get the type flags of a #GstEventType with the
 * gst_event_type_get_flags() function.
  }

  PGstEventTypeFlags = ^TGstEventTypeFlags;
  TGstEventTypeFlags =  Longint;
  Const
    GST_EVENT_TYPE_UPSTREAM = 1 shl 0;
    GST_EVENT_TYPE_DOWNSTREAM = 1 shl 1;
    GST_EVENT_TYPE_SERIALIZED = 1 shl 2;
    GST_EVENT_TYPE_STICKY = 1 shl 3;
    GST_EVENT_TYPE_STICKY_MULTI = 1 shl 4;
;
{*
 * GST_EVENT_TYPE_BOTH: (value 3) (type GstEventTypeFlags)
 *
 * The same thing as #GST_EVENT_TYPE_UPSTREAM | #GST_EVENT_TYPE_DOWNSTREAM.
  }

{ was #define dname def_expr }
function GST_EVENT_TYPE_BOTH : TGstEventTypeFlags;  

const
  GST_EVENT_NUM_SHIFT = 8;  
{*
 * GST_EVENT_MAKE_TYPE:
 * @num: the event number to create
 * @flags: the event flags
 *
 * when making custom event types, use this macro with the num and
 * the given flags
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_EVENT_MAKE_TYPE(num,flags : longint) : longint;

{*
 * GstEventType:
 * @GST_EVENT_UNKNOWN: unknown event.
 * @GST_EVENT_FLUSH_START: Start a flush operation. This event clears all data
 *                 from the pipeline and unblock all streaming threads.
 * @GST_EVENT_FLUSH_STOP: Stop a flush operation. This event resets the
 *                 running-time of the pipeline.
 * @GST_EVENT_SELECT_STREAMS: A request to select one or more streams (Since: 1.10)
 * @GST_EVENT_STREAM_START: Event to mark the start of a new stream. Sent before any
 *                 other serialized event and only sent at the start of a new stream,
 *                 not after flushing seeks.
 * @GST_EVENT_CAPS: #GstCaps event. Notify the pad of a new media type.
 * @GST_EVENT_SEGMENT: A new media segment follows in the dataflow. The
 *                 segment events contains information for clipping buffers and
 *                 converting buffer timestamps to running-time and
 *                 stream-time.
 * @GST_EVENT_STREAM_COLLECTION: A new #GstStreamCollection is available (Since: 1.10)
 * @GST_EVENT_TAG: A new set of metadata tags has been found in the stream.
 * @GST_EVENT_BUFFERSIZE: Notification of buffering requirements. Currently not
 *                 used yet.
 * @GST_EVENT_SINK_MESSAGE: An event that sinks turn into a message. Used to
 *                          send messages that should be emitted in sync with
 *                          rendering.
 * @GST_EVENT_STREAM_GROUP_DONE: Indicates that there is no more data for
 *                 the stream group ID in the message. Sent before EOS
 *                 in some instances and should be handled mostly the same. (Since: 1.10)
 * @GST_EVENT_EOS: End-Of-Stream. No more data is to be expected to follow
 *                 without either a STREAM_START event, or a FLUSH_STOP and a SEGMENT
 *                 event.
 * @GST_EVENT_SEGMENT_DONE: Marks the end of a segment playback.
 * @GST_EVENT_GAP: Marks a gap in the datastream.
 * @GST_EVENT_TOC: An event which indicates that a new table of contents (TOC)
 *                 was found or updated.
 * @GST_EVENT_PROTECTION: An event which indicates that new or updated
 *                 encryption information has been found in the stream.
 * @GST_EVENT_QOS: A quality message. Used to indicate to upstream elements
 *                 that the downstream elements should adjust their processing
 *                 rate.
 * @GST_EVENT_SEEK: A request for a new playback position and rate.
 * @GST_EVENT_NAVIGATION: Navigation events are usually used for communicating
 *                        user requests, such as mouse or keyboard movements,
 *                        to upstream elements.
 * @GST_EVENT_LATENCY: Notification of new latency adjustment. Sinks will use
 *                     the latency information to adjust their synchronisation.
 * @GST_EVENT_STEP: A request for stepping through the media. Sinks will usually
 *                  execute the step operation.
 * @GST_EVENT_RECONFIGURE: A request for upstream renegotiating caps and reconfiguring.
 * @GST_EVENT_TOC_SELECT: A request for a new playback position based on TOC
 *                        entry's UID.
 * @GST_EVENT_INSTANT_RATE_CHANGE: Notify downstream that a playback rate override
 *                                 should be applied as soon as possible. (Since: 1.18)
 * @GST_EVENT_INSTANT_RATE_SYNC_TIME: Sent by the pipeline to notify elements that handle the
 *                                    instant-rate-change event about the running-time when
 *                                    the rate multiplier should be applied (or was applied). (Since: 1.18)
 * @GST_EVENT_CUSTOM_UPSTREAM: Upstream custom event
 * @GST_EVENT_CUSTOM_DOWNSTREAM: Downstream custom event that travels in the
 *                        data flow.
 * @GST_EVENT_CUSTOM_DOWNSTREAM_OOB: Custom out-of-band downstream event.
 * @GST_EVENT_CUSTOM_DOWNSTREAM_STICKY: Custom sticky downstream event.
 * @GST_EVENT_CUSTOM_BOTH: Custom upstream or downstream event.
 *                         In-band when travelling downstream.
 * @GST_EVENT_CUSTOM_BOTH_OOB: Custom upstream or downstream out-of-band event.
 *
 * #GstEventType lists the standard event types that can be sent in a pipeline.
 *
 * The custom event types can be used for private messages between elements
 * that can't be expressed using normal
 * GStreamer buffer passing semantics. Custom events carry an arbitrary
 * #GstStructure.
 * Specific custom events are distinguished by the name of the structure.
  }
{ NOTE: keep in sync with quark registration in gstevent.c  }
{ bidirectional events  }
{ downstream serialized events  }
{ non-sticky downstream serialized  }
{ sticky downstream non-serialized  }
{ FIXME 2.0: change to value 72 and move after the GST_EVENT_SEGMENT event  }
{ upstream events  }
{ custom events start here  }
type
  PGstEventType = ^TGstEventType;
  TGstEventType =  Longint;
  Const
    GST_EVENT_UNKNOWN = GST_EVENT_MAKE_TYPE(0,0);
    GST_EVENT_FLUSH_START = GST_EVENT_MAKE_TYPE(10,_FLAG(BOTH));
    GST_EVENT_FLUSH_STOP = GST_EVENT_MAKE_TYPE(20,(_FLAG(BOTH)) or (_FLAG(SERIALIZED)));
    GST_EVENT_STREAM_START = GST_EVENT_MAKE_TYPE(40,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_CAPS = GST_EVENT_MAKE_TYPE(50,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_SEGMENT = GST_EVENT_MAKE_TYPE(70,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_STREAM_COLLECTION = GST_EVENT_MAKE_TYPE(75,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_TAG = GST_EVENT_MAKE_TYPE(80,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_BUFFERSIZE = GST_EVENT_MAKE_TYPE(90,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_SINK_MESSAGE = GST_EVENT_MAKE_TYPE(100,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_STREAM_GROUP_DONE = GST_EVENT_MAKE_TYPE(105,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_EOS = GST_EVENT_MAKE_TYPE(110,((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY)));
    GST_EVENT_TOC = GST_EVENT_MAKE_TYPE(120,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_PROTECTION = GST_EVENT_MAKE_TYPE(130,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_SEGMENT_DONE = GST_EVENT_MAKE_TYPE(150,(_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED)));
    GST_EVENT_GAP = GST_EVENT_MAKE_TYPE(160,(_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED)));
    GST_EVENT_INSTANT_RATE_CHANGE = GST_EVENT_MAKE_TYPE(180,(_FLAG(DOWNSTREAM)) or (_FLAG(STICKY)));
    GST_EVENT_QOS = GST_EVENT_MAKE_TYPE(190,_FLAG(UPSTREAM));
    GST_EVENT_SEEK = GST_EVENT_MAKE_TYPE(200,_FLAG(UPSTREAM));
    GST_EVENT_NAVIGATION = GST_EVENT_MAKE_TYPE(210,_FLAG(UPSTREAM));
    GST_EVENT_LATENCY = GST_EVENT_MAKE_TYPE(220,_FLAG(UPSTREAM));
    GST_EVENT_STEP = GST_EVENT_MAKE_TYPE(230,_FLAG(UPSTREAM));
    GST_EVENT_RECONFIGURE = GST_EVENT_MAKE_TYPE(240,_FLAG(UPSTREAM));
    GST_EVENT_TOC_SELECT = GST_EVENT_MAKE_TYPE(250,_FLAG(UPSTREAM));
    GST_EVENT_SELECT_STREAMS = GST_EVENT_MAKE_TYPE(260,_FLAG(UPSTREAM));
    GST_EVENT_INSTANT_RATE_SYNC_TIME = GST_EVENT_MAKE_TYPE(261,_FLAG(UPSTREAM));
    GST_EVENT_CUSTOM_UPSTREAM = GST_EVENT_MAKE_TYPE(270,_FLAG(UPSTREAM));
    GST_EVENT_CUSTOM_DOWNSTREAM = GST_EVENT_MAKE_TYPE(280,(_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED)));
    GST_EVENT_CUSTOM_DOWNSTREAM_OOB = GST_EVENT_MAKE_TYPE(290,_FLAG(DOWNSTREAM));
    GST_EVENT_CUSTOM_DOWNSTREAM_STICKY = GST_EVENT_MAKE_TYPE(300,(((_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED))) or (_FLAG(STICKY))) or (_FLAG(STICKY_MULTI)));
    GST_EVENT_CUSTOM_BOTH = GST_EVENT_MAKE_TYPE(310,(_FLAG(BOTH)) or (_FLAG(SERIALIZED)));
    GST_EVENT_CUSTOM_BOTH_OOB = GST_EVENT_MAKE_TYPE(320,_FLAG(BOTH));
;
{$undef _FLAG}
{*
 * GstStreamFlags:
 * @GST_STREAM_FLAG_NONE: This stream has no special attributes
 * @GST_STREAM_FLAG_SPARSE: This stream is a sparse stream (e.g. a subtitle
 *    stream), data may flow only in irregular intervals with large gaps in
 *    between.
 * @GST_STREAM_FLAG_SELECT: This stream should be selected by default. This
 *    flag may be used by demuxers to signal that a stream should be selected
 *    by default in a playback scenario.
 * @GST_STREAM_FLAG_UNSELECT: This stream should not be selected by default.
 *    This flag may be used by demuxers to signal that a stream should not
 *    be selected by default in a playback scenario, but only if explicitly
 *    selected by the user (e.g. an audio track for the hard of hearing or
 *    a director's commentary track).
 *
 * Since: 1.2
  }
type
  PGstStreamFlags = ^TGstStreamFlags;
  TGstStreamFlags =  Longint;
  Const
    GST_STREAM_FLAG_NONE = 0;
    GST_STREAM_FLAG_SPARSE = 1 shl 0;
    GST_STREAM_FLAG_SELECT = 1 shl 1;
    GST_STREAM_FLAG_UNSELECT = 1 shl 2;
;
{$include <gst/gstminiobject.h>}
{$include <gst/gstformat.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstclock.h>}
{$include <gst/gststructure.h>}
{$include <gst/gsttaglist.h>}
{$include <gst/gstsegment.h>}
{$include <gst/gstmessage.h>}
{$include <gst/gstcontext.h>}
{$include <gst/gststreams.h>}
{$include <gst/gsttoc.h>}
{$include <gst/gststreamcollection.h>}
  var
    _gst_event_type : TGType;cvar;external;

const
  GST_TYPE_EVENT = _gst_event_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_EVENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_EVENT_CAST(obj : longint) : PGstEvent;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT(obj : longint) : longint;

{*
 * GST_EVENT_TYPE:
 * @event: the event to query
 *
 * Get the #GstEventType of the event.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TYPE(event : longint) : longint;

{*
 * GST_EVENT_TYPE_NAME:
 * @event: the event to query
 *
 * Get a constant string representation of the #GstEventType of the event.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TYPE_NAME(event : longint) : longint;

{*
 * GST_EVENT_TIMESTAMP:
 * @event: the event to query
 *
 * Get the #GstClockTime timestamp of the event. This is the time when the event
 * was created.
  }
{ FIXME 2.0: Remove the GstEvent::timestamp field  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TIMESTAMP(event : longint) : longint;

{*
 * GST_EVENT_SEQNUM:
 * @event: the event to query
 *
 * The sequence number of @event.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_SEQNUM(event : longint) : longint;

{*
 * GST_EVENT_IS_UPSTREAM:
 * @ev: the event to query
 *
 * Check if an event can travel upstream.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_UPSTREAM(ev : longint) : longint;

{*
 * GST_EVENT_IS_DOWNSTREAM:
 * @ev: the event to query
 *
 * Check if an event can travel downstream.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_DOWNSTREAM(ev : longint) : longint;

{*
 * GST_EVENT_IS_SERIALIZED:
 * @ev: the event to query
 *
 * Check if an event is serialized with the data stream.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_SERIALIZED(ev : longint) : longint;

{*
 * GST_EVENT_IS_STICKY:
 * @ev: the event to query
 *
 * Check if an event is sticky on the pads.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_STICKY(ev : longint) : longint;

function gst_event_make_writable(event:PGstEvent):PGstEvent;cdecl;external;
(* Const before type ignored *)
function gst_event_is_writable(event:PGstEvent):Tgboolean;cdecl;external;
function gst_event_replace(old_event:PPGstEvent; new_event:PGstEvent):Tgboolean;cdecl;external;
function gst_event_steal(old_event:PPGstEvent):PGstEvent;cdecl;external;
function gst_event_take(old_event:PPGstEvent; new_event:PGstEvent):Tgboolean;cdecl;external;
{*
 * GstQOSType:
 * @GST_QOS_TYPE_OVERFLOW: The QoS event type that is produced when upstream
 *    elements are producing data too quickly and the element can't keep up
 *    processing the data. Upstream should reduce their production rate. This
 *    type is also used when buffers arrive early or in time.
 * @GST_QOS_TYPE_UNDERFLOW: The QoS event type that is produced when upstream
 *    elements are producing data too slowly and need to speed up their
 *    production rate.
 * @GST_QOS_TYPE_THROTTLE: The QoS event type that is produced when the
 *    application enabled throttling to limit the data rate.
 *
 * The different types of QoS events that can be given to the
 * gst_event_new_qos() method.
  }
type
  PGstQOSType = ^TGstQOSType;
  TGstQOSType =  Longint;
  Const
    GST_QOS_TYPE_OVERFLOW = 0;
    GST_QOS_TYPE_UNDERFLOW = 1;
    GST_QOS_TYPE_THROTTLE = 2;
;
{*
 * GstGapFlags:
 * @GST_GAP_FLAG_MISSING_DATA: The #GST_EVENT_GAP signals missing data,
 *    for example because of packet loss.
 *
 * The different flags that can be set on #GST_EVENT_GAP events. See
 * gst_event_set_gap_flags() for details.
 *
 * Since: 1.20
  }
type
  PGstGapFlags = ^TGstGapFlags;
  TGstGapFlags =  Longint;
  Const
    GST_GAP_FLAG_MISSING_DATA = 1 shl 0;
;
{*
 * GstEvent:
 * @mini_object: the parent structure
 * @type: the #GstEventType of the event
 * @timestamp: the timestamp of the event
 * @seqnum: the sequence number of the event
 *
 * A #GstEvent.
  }
{< public > }{ with COW  }
{ FIXME 2.0: Remove the GstEvent::timestamp field  }
type
  PGstEvent = ^TGstEvent;
  TGstEvent = record
      mini_object : TGstMiniObject;
      _type : TGstEventType;
      timestamp : Tguint64;
      seqnum : Tguint32;
    end;

(* Const before type ignored *)

function gst_event_type_get_name(_type:TGstEventType):Pgchar;cdecl;external;
function gst_event_type_to_quark(_type:TGstEventType):TGQuark;cdecl;external;
function gst_event_type_get_flags(_type:TGstEventType):TGstEventTypeFlags;cdecl;external;
function gst_event_type_to_sticky_ordering(_type:TGstEventType):Tguint;cdecl;external;
function gst_event_ref(event:PGstEvent):PGstEvent;cdecl;external;
procedure gst_event_unref(event:PGstEvent);cdecl;external;
procedure gst_clear_event(event_ptr:PPGstEvent);cdecl;external;
(* Const before type ignored *)
function gst_event_copy(event:PGstEvent):PGstEvent;cdecl;external;
function gst_event_get_type:TGType;cdecl;external;
{ custom event  }
function gst_event_new_custom(_type:TGstEventType; structure:PGstStructure):PGstEvent;cdecl;external;
(* Const before type ignored *)
function gst_event_get_structure(event:PGstEvent):PGstStructure;cdecl;external;
function gst_event_writable_structure(event:PGstEvent):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_event_has_name(event:PGstEvent; name:Pgchar):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_event_has_name) }
function gst_event_has_name_id(event:PGstEvent; name:TGQuark):Tgboolean;cdecl;external;
{ identifiers for events and messages  }
function gst_event_get_seqnum(event:PGstEvent):Tguint32;cdecl;external;
procedure gst_event_set_seqnum(event:PGstEvent; seqnum:Tguint32);cdecl;external;
{ accumulated pad offsets for the event  }
function gst_event_get_running_time_offset(event:PGstEvent):Tgint64;cdecl;external;
procedure gst_event_set_running_time_offset(event:PGstEvent; offset:Tgint64);cdecl;external;
{ Stream start event  }
(* Const before type ignored *)
function gst_event_new_stream_start(stream_id:Pgchar):PGstEvent;cdecl;external;
(* Const before type ignored *)
procedure gst_event_parse_stream_start(event:PGstEvent; stream_id:PPgchar);cdecl;external;
procedure gst_event_set_stream(event:PGstEvent; stream:PGstStream);cdecl;external;
procedure gst_event_parse_stream(event:PGstEvent; stream:PPGstStream);cdecl;external;
procedure gst_event_set_stream_flags(event:PGstEvent; flags:TGstStreamFlags);cdecl;external;
procedure gst_event_parse_stream_flags(event:PGstEvent; flags:PGstStreamFlags);cdecl;external;
procedure gst_event_set_group_id(event:PGstEvent; group_id:Tguint);cdecl;external;
function gst_event_parse_group_id(event:PGstEvent; group_id:Pguint):Tgboolean;cdecl;external;
{ flush events  }
function gst_event_new_flush_start:PGstEvent;cdecl;external;
function gst_event_new_flush_stop(reset_time:Tgboolean):PGstEvent;cdecl;external;
procedure gst_event_parse_flush_stop(event:PGstEvent; reset_time:Pgboolean);cdecl;external;
{ Stream collection event  }
function gst_event_new_stream_collection(collection:PGstStreamCollection):PGstEvent;cdecl;external;
procedure gst_event_parse_stream_collection(event:PGstEvent; collection:PPGstStreamCollection);cdecl;external;
{ select streams event  }
function gst_event_new_select_streams(streams:PGList):PGstEvent;cdecl;external;
procedure gst_event_parse_select_streams(event:PGstEvent; streams:PPGList);cdecl;external;
{ stream-group-done event  }
function gst_event_new_stream_group_done(group_id:Tguint):PGstEvent;cdecl;external;
procedure gst_event_parse_stream_group_done(event:PGstEvent; group_id:Pguint);cdecl;external;
{ EOS event  }
function gst_event_new_eos:PGstEvent;cdecl;external;
{ GAP event  }
function gst_event_new_gap(timestamp:TGstClockTime; duration:TGstClockTime):PGstEvent;cdecl;external;
procedure gst_event_parse_gap(event:PGstEvent; timestamp:PGstClockTime; duration:PGstClockTime);cdecl;external;
procedure gst_event_set_gap_flags(event:PGstEvent; flags:TGstGapFlags);cdecl;external;
procedure gst_event_parse_gap_flags(event:PGstEvent; flags:PGstGapFlags);cdecl;external;
{ Caps events  }
function gst_event_new_caps(caps:PGstCaps):PGstEvent;cdecl;external;
procedure gst_event_parse_caps(event:PGstEvent; caps:PPGstCaps);cdecl;external;
{ segment event  }
(* Const before type ignored *)
function gst_event_new_segment(segment:PGstSegment):PGstEvent;cdecl;external;
(* Const before type ignored *)
procedure gst_event_parse_segment(event:PGstEvent; segment:PPGstSegment);cdecl;external;
procedure gst_event_copy_segment(event:PGstEvent; segment:PGstSegment);cdecl;external;
{ tag event  }
function gst_event_new_tag(taglist:PGstTagList):PGstEvent;cdecl;external;
procedure gst_event_parse_tag(event:PGstEvent; taglist:PPGstTagList);cdecl;external;
{ TOC event  }
function gst_event_new_toc(toc:PGstToc; updated:Tgboolean):PGstEvent;cdecl;external;
procedure gst_event_parse_toc(event:PGstEvent; toc:PPGstToc; updated:Pgboolean);cdecl;external;
{ Protection event  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_event_new_protection(system_id:Pgchar; data:PGstBuffer; origin:Pgchar):PGstEvent;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_event_parse_protection(event:PGstEvent; system_id:PPgchar; data:PPGstBuffer; origin:PPgchar);cdecl;external;
{ buffer  }
function gst_event_new_buffer_size(format:TGstFormat; minsize:Tgint64; maxsize:Tgint64; async:Tgboolean):PGstEvent;cdecl;external;
procedure gst_event_parse_buffer_size(event:PGstEvent; format:PGstFormat; minsize:Pgint64; maxsize:Pgint64; async:Pgboolean);cdecl;external;
{ sink message  }
(* Const before type ignored *)
function gst_event_new_sink_message(name:Pgchar; msg:PGstMessage):PGstEvent;cdecl;external;
procedure gst_event_parse_sink_message(event:PGstEvent; msg:PPGstMessage);cdecl;external;
{ QOS events  }
function gst_event_new_qos(_type:TGstQOSType; proportion:Tgdouble; diff:TGstClockTimeDiff; timestamp:TGstClockTime):PGstEvent;cdecl;external;
procedure gst_event_parse_qos(event:PGstEvent; _type:PGstQOSType; proportion:Pgdouble; diff:PGstClockTimeDiff; timestamp:PGstClockTime);cdecl;external;
{ seek event  }
function gst_event_new_seek(rate:Tgdouble; format:TGstFormat; flags:TGstSeekFlags; start_type:TGstSeekType; start:Tgint64; 
           stop_type:TGstSeekType; stop:Tgint64):PGstEvent;cdecl;external;
procedure gst_event_parse_seek(event:PGstEvent; rate:Pgdouble; format:PGstFormat; flags:PGstSeekFlags; start_type:PGstSeekType; 
            start:Pgint64; stop_type:PGstSeekType; stop:Pgint64);cdecl;external;
procedure gst_event_set_seek_trickmode_interval(event:PGstEvent; interval:TGstClockTime);cdecl;external;
procedure gst_event_parse_seek_trickmode_interval(event:PGstEvent; interval:PGstClockTime);cdecl;external;
{ navigation event  }
function gst_event_new_navigation(structure:PGstStructure):PGstEvent;cdecl;external;
{ latency event  }
function gst_event_new_latency(latency:TGstClockTime):PGstEvent;cdecl;external;
procedure gst_event_parse_latency(event:PGstEvent; latency:PGstClockTime);cdecl;external;
{ step event  }
function gst_event_new_step(format:TGstFormat; amount:Tguint64; rate:Tgdouble; flush:Tgboolean; intermediate:Tgboolean):PGstEvent;cdecl;external;
procedure gst_event_parse_step(event:PGstEvent; format:PGstFormat; amount:Pguint64; rate:Pgdouble; flush:Pgboolean; 
            intermediate:Pgboolean);cdecl;external;
{ renegotiate event  }
function gst_event_new_reconfigure:PGstEvent;cdecl;external;
{ TOC select event  }
(* Const before type ignored *)
function gst_event_new_toc_select(uid:Pgchar):PGstEvent;cdecl;external;
procedure gst_event_parse_toc_select(event:PGstEvent; uid:PPgchar);cdecl;external;
{ segment-done event  }
function gst_event_new_segment_done(format:TGstFormat; position:Tgint64):PGstEvent;cdecl;external;
procedure gst_event_parse_segment_done(event:PGstEvent; format:PGstFormat; position:Pgint64);cdecl;external;
{ instant-rate-change event  }
function gst_event_new_instant_rate_change(rate_multiplier:Tgdouble; new_flags:TGstSegmentFlags):PGstEvent;cdecl;external;
procedure gst_event_parse_instant_rate_change(event:PGstEvent; rate_multiplier:Pgdouble; new_flags:PGstSegmentFlags);cdecl;external;
{ instant-rate-change-sync-time event  }
function gst_event_new_instant_rate_sync_time(rate_multiplier:Tgdouble; running_time:TGstClockTime; upstream_running_time:TGstClockTime):PGstEvent;cdecl;external;
procedure gst_event_parse_instant_rate_sync_time(event:PGstEvent; rate_multiplier:Pgdouble; running_time:PGstClockTime; upstream_running_time:PGstClockTime);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstEvent, gst_event_unref) }
{$endif}
{ __GST_EVENT_H__  }

implementation

{ was #define dname def_expr }
function GST_EVENT_TYPE_BOTH : TGstEventTypeFlags;
  begin
    GST_EVENT_TYPE_BOTH:=TGstEventTypeFlags(GST_EVENT_TYPE_UPSTREAM or GST_EVENT_TYPE_DOWNSTREAM);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_MAKE_TYPE(num,flags : longint) : longint;
begin
  GST_EVENT_MAKE_TYPE:=(num shl GST_EVENT_NUM_SHIFT) or flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_EVENT(obj : longint) : longint;
begin
  GST_IS_EVENT:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_EVENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_EVENT_CAST(obj : longint) : PGstEvent;
begin
  GST_EVENT_CAST:=PGstEvent(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT(obj : longint) : longint;
begin
  GST_EVENT:=GST_EVENT_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TYPE(event : longint) : longint;
begin
  GST_EVENT_TYPE:=(GST_EVENT_CAST(event))^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TYPE_NAME(event : longint) : longint;
begin
  GST_EVENT_TYPE_NAME:=gst_event_type_get_name(GST_EVENT_TYPE(event));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_TIMESTAMP(event : longint) : longint;
begin
  GST_EVENT_TIMESTAMP:=(GST_EVENT_CAST(event))^.timestamp;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_SEQNUM(event : longint) : longint;
begin
  GST_EVENT_SEQNUM:=(GST_EVENT_CAST(event))^.seqnum;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_UPSTREAM(ev : longint) : longint;
begin
  GST_EVENT_IS_UPSTREAM:= not ( not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_UPSTREAM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_DOWNSTREAM(ev : longint) : longint;
begin
  GST_EVENT_IS_DOWNSTREAM:= not ( not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_DOWNSTREAM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_SERIALIZED(ev : longint) : longint;
begin
  GST_EVENT_IS_SERIALIZED:= not ( not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_SERIALIZED));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EVENT_IS_STICKY(ev : longint) : longint;
begin
  GST_EVENT_IS_STICKY:= not ( not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_STICKY));
end;


end.
