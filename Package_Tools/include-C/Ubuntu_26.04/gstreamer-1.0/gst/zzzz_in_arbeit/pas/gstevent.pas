unit gstevent;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstminiobject, gststructure, gststreams, gststreamcollection, gstsegment, gsttaglist, gsttoc, gstbuffer, gstformat, gstmessage, gstclock;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstEventTypeFlags = ^TGstEventTypeFlags;
  TGstEventTypeFlags = longint;
const
  GST_EVENT_TYPE_UPSTREAM = 1 shl 0;
  GST_EVENT_TYPE_DOWNSTREAM = 1 shl 1;
  GST_EVENT_TYPE_SERIALIZED = 1 shl 2;
  GST_EVENT_TYPE_STICKY = 1 shl 3;
  GST_EVENT_TYPE_STICKY_MULTI = 1 shl 4;

const
  GST_EVENT_NUM_SHIFT = 8;
  GST_EVENT_TYPE_BOTH = GST_EVENT_TYPE_UPSTREAM or GST_EVENT_TYPE_DOWNSTREAM;

type
  PGstEventType = ^TGstEventType;
  TGstEventType = longint;
const
  GST_EVENT_UNKNOWN = (0 shl GST_EVENT_NUM_SHIFT) or 0;
  GST_EVENT_FLUSH_START = (10 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_BOTH;
  GST_EVENT_FLUSH_STOP = (20 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_BOTH or GST_EVENT_TYPE_SERIALIZED;
  GST_EVENT_STREAM_START = (40 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_CAPS = (50 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_SEGMENT = (70 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_STREAM_COLLECTION = (75 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_TAG = (80 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_BUFFERSIZE = (90 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_SINK_MESSAGE = (100 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_STREAM_GROUP_DONE = (105 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_EOS = (110 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY;
  GST_EVENT_TOC = (120 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_PROTECTION = (130 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_SEGMENT_DONE = (150 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED;
  GST_EVENT_GAP = (160 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED;
  GST_EVENT_INSTANT_RATE_CHANGE = (180 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_STICKY;
  GST_EVENT_QOS = (190 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_SEEK = (200 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_NAVIGATION = (210 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_LATENCY = (220 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_STEP = (230 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_RECONFIGURE = (240 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_TOC_SELECT = (250 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_SELECT_STREAMS = (260 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_INSTANT_RATE_SYNC_TIME = (261 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_CUSTOM_UPSTREAM = (270 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_UPSTREAM;
  GST_EVENT_CUSTOM_DOWNSTREAM = (280 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED;
  GST_EVENT_CUSTOM_DOWNSTREAM_OOB = (290 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM;
  GST_EVENT_CUSTOM_DOWNSTREAM_STICKY = (300 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_DOWNSTREAM or GST_EVENT_TYPE_SERIALIZED or GST_EVENT_TYPE_STICKY or GST_EVENT_TYPE_STICKY_MULTI;
  GST_EVENT_CUSTOM_BOTH = (310 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_BOTH or GST_EVENT_TYPE_SERIALIZED;
  GST_EVENT_CUSTOM_BOTH_OOB = (320 shl GST_EVENT_NUM_SHIFT) or GST_EVENT_TYPE_BOTH;

type
  PGstStreamFlags = ^TGstStreamFlags;
  TGstStreamFlags = longint;
const
  GST_STREAM_FLAG_NONE = 0;
  GST_STREAM_FLAG_SPARSE = 1 shl 0;
  GST_STREAM_FLAG_SELECT = 1 shl 1;
  GST_STREAM_FLAG_UNSELECT = 1 shl 2;

type
  PGstQOSType = ^TGstQOSType;
  TGstQOSType = longint;
const
  GST_QOS_TYPE_OVERFLOW = 0;
  GST_QOS_TYPE_UNDERFLOW = 1;
  GST_QOS_TYPE_THROTTLE = 2;

type
  PGstGapFlags = ^TGstGapFlags;
  TGstGapFlags = longint;
const
  GST_GAP_FLAG_MISSING_DATA = 1 shl 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PPGstEvent = ^PGstEvent;
  PGstEvent = ^TGstEvent;
  TGstEvent = record
    mini_object: TGstMiniObject;
    _type: TGstEventType;
    timestamp: Tguint64;
    seqnum: Tguint32;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_event_type: TGType; cvar;external libgstreamer;

function gst_event_make_writable(event: PGstEvent): PGstEvent; cdecl; external libgstreamer;
function gst_event_is_writable(event: PGstEvent): Tgboolean; cdecl; external libgstreamer;
function gst_event_replace(old_event: PPGstEvent; new_event: PGstEvent): Tgboolean; cdecl; external libgstreamer;
function gst_event_steal(old_event: PPGstEvent): PGstEvent; cdecl; external libgstreamer;
function gst_event_take(old_event: PPGstEvent; new_event: PGstEvent): Tgboolean; cdecl; external libgstreamer;

function gst_event_type_get_name(_type: TGstEventType): Pgchar; cdecl; external libgstreamer;
function gst_event_type_to_quark(_type: TGstEventType): TGQuark; cdecl; external libgstreamer;
function gst_event_type_get_flags(_type: TGstEventType): TGstEventTypeFlags; cdecl; external libgstreamer;
function gst_event_type_to_sticky_ordering(_type: TGstEventType): Tguint; cdecl; external libgstreamer;
function gst_event_ref(event: PGstEvent): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_unref(event: PGstEvent); cdecl; external libgstreamer;
procedure gst_clear_event(event_ptr: PPGstEvent); cdecl; external libgstreamer;
function gst_event_copy(event: PGstEvent): PGstEvent; cdecl; external libgstreamer;
function gst_event_get_type: TGType; cdecl; external libgstreamer;
function gst_event_new_custom(_type: TGstEventType; structure: PGstStructure): PGstEvent; cdecl; external libgstreamer;
function gst_event_get_structure(event: PGstEvent): PGstStructure; cdecl; external libgstreamer;
function gst_event_writable_structure(event: PGstEvent): PGstStructure; cdecl; external libgstreamer;
function gst_event_has_name(event: PGstEvent; name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_event_has_name_id(event: PGstEvent; name: TGQuark): Tgboolean; cdecl; external libgstreamer; deprecated;
function gst_event_get_seqnum(event: PGstEvent): Tguint32; cdecl; external libgstreamer;
procedure gst_event_set_seqnum(event: PGstEvent; seqnum: Tguint32); cdecl; external libgstreamer;
function gst_event_get_running_time_offset(event: PGstEvent): Tgint64; cdecl; external libgstreamer;
procedure gst_event_set_running_time_offset(event: PGstEvent; offset: Tgint64); cdecl; external libgstreamer;
function gst_event_new_stream_start(stream_id: Pgchar): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_stream_start(event: PGstEvent; stream_id: PPgchar); cdecl; external libgstreamer;
procedure gst_event_set_stream(event: PGstEvent; stream: PGstStream); cdecl; external libgstreamer;
procedure gst_event_parse_stream(event: PGstEvent; stream: PPGstStream); cdecl; external libgstreamer;
procedure gst_event_set_stream_flags(event: PGstEvent; flags: TGstStreamFlags); cdecl; external libgstreamer;
procedure gst_event_parse_stream_flags(event: PGstEvent; flags: PGstStreamFlags); cdecl; external libgstreamer;
procedure gst_event_set_group_id(event: PGstEvent; group_id: Tguint); cdecl; external libgstreamer;
function gst_event_parse_group_id(event: PGstEvent; group_id: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_event_new_flush_start: PGstEvent; cdecl; external libgstreamer;
function gst_event_new_flush_stop(reset_time: Tgboolean): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_flush_stop(event: PGstEvent; reset_time: Pgboolean); cdecl; external libgstreamer;
function gst_event_new_stream_collection(collection: PGstStreamCollection): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_stream_collection(event: PGstEvent; collection: PPGstStreamCollection); cdecl; external libgstreamer;
function gst_event_new_select_streams(streams: PGList): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_select_streams(event: PGstEvent; streams: PPGList); cdecl; external libgstreamer;
function gst_event_new_stream_group_done(group_id: Tguint): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_stream_group_done(event: PGstEvent; group_id: Pguint); cdecl; external libgstreamer;
function gst_event_new_eos: PGstEvent; cdecl; external libgstreamer;
function gst_event_new_gap(timestamp: TGstClockTime; duration: TGstClockTime): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_gap(event: PGstEvent; timestamp: PGstClockTime; duration: PGstClockTime); cdecl; external libgstreamer;
procedure gst_event_set_gap_flags(event: PGstEvent; flags: TGstGapFlags); cdecl; external libgstreamer;
procedure gst_event_parse_gap_flags(event: PGstEvent; flags: PGstGapFlags); cdecl; external libgstreamer;
function gst_event_new_caps(caps: PGstCaps): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_caps(event: PGstEvent; caps: PPGstCaps); cdecl; external libgstreamer;
function gst_event_new_segment(segment: PGstSegment): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_segment(event: PGstEvent; segment: PPGstSegment); cdecl; external libgstreamer;
procedure gst_event_copy_segment(event: PGstEvent; segment: PGstSegment); cdecl; external libgstreamer;
function gst_event_new_tag(taglist: PGstTagList): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_tag(event: PGstEvent; taglist: PPGstTagList); cdecl; external libgstreamer;
function gst_event_new_toc(toc: PGstToc; updated: Tgboolean): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_toc(event: PGstEvent; toc: PPGstToc; updated: Pgboolean); cdecl; external libgstreamer;
function gst_event_new_protection(system_id: Pgchar; data: PGstBuffer; origin: Pgchar): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_protection(event: PGstEvent; system_id: PPgchar; data: PPGstBuffer; origin: PPgchar); cdecl; external libgstreamer;
function gst_event_new_buffer_size(format: TGstFormat; minsize: Tgint64; maxsize: Tgint64; async: Tgboolean): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_buffer_size(event: PGstEvent; format: PGstFormat; minsize: Pgint64; maxsize: Pgint64; async: Pgboolean); cdecl; external libgstreamer;
function gst_event_new_sink_message(name: Pgchar; msg: PGstMessage): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_sink_message(event: PGstEvent; msg: PPGstMessage); cdecl; external libgstreamer;
function gst_event_new_qos(_type: TGstQOSType; proportion: Tgdouble; diff: TGstClockTimeDiff; timestamp: TGstClockTime): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_qos(event: PGstEvent; _type: PGstQOSType; proportion: Pgdouble; diff: PGstClockTimeDiff; timestamp: PGstClockTime); cdecl; external libgstreamer;
function gst_event_new_seek(rate: Tgdouble; format: TGstFormat; flags: TGstSeekFlags; start_type: TGstSeekType; start: Tgint64;
  stop_type: TGstSeekType; stop: Tgint64): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_seek(event: PGstEvent; rate: Pgdouble; format: PGstFormat; flags: PGstSeekFlags; start_type: PGstSeekType;
  start: Pgint64; stop_type: PGstSeekType; stop: Pgint64); cdecl; external libgstreamer;
procedure gst_event_set_seek_trickmode_interval(event: PGstEvent; interval: TGstClockTime); cdecl; external libgstreamer;
procedure gst_event_parse_seek_trickmode_interval(event: PGstEvent; interval: PGstClockTime); cdecl; external libgstreamer;
function gst_event_new_navigation(structure: PGstStructure): PGstEvent; cdecl; external libgstreamer;
function gst_event_new_latency(latency: TGstClockTime): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_latency(event: PGstEvent; latency: PGstClockTime); cdecl; external libgstreamer;
function gst_event_new_step(format: TGstFormat; amount: Tguint64; rate: Tgdouble; flush: Tgboolean; intermediate: Tgboolean): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_step(event: PGstEvent; format: PGstFormat; amount: Pguint64; rate: Pgdouble; flush: Pgboolean;
  intermediate: Pgboolean); cdecl; external libgstreamer;
function gst_event_new_reconfigure: PGstEvent; cdecl; external libgstreamer;
function gst_event_new_toc_select(uid: Pgchar): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_toc_select(event: PGstEvent; uid: PPgchar); cdecl; external libgstreamer;
function gst_event_new_segment_done(format: TGstFormat; position: Tgint64): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_segment_done(event: PGstEvent; format: PGstFormat; position: Pgint64); cdecl; external libgstreamer;
function gst_event_new_instant_rate_change(rate_multiplier: Tgdouble; new_flags: TGstSegmentFlags): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_instant_rate_change(event: PGstEvent; rate_multiplier: Pgdouble; new_flags: PGstSegmentFlags); cdecl; external libgstreamer;
function gst_event_new_instant_rate_sync_time(rate_multiplier: Tgdouble; running_time: TGstClockTime; upstream_running_time: TGstClockTime): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_instant_rate_sync_time(event: PGstEvent; rate_multiplier: Pgdouble; running_time: PGstClockTime; upstream_running_time: PGstClockTime); cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 11:31:18 ===

function GST_TYPE_EVENT: TGType;

function GST_EVENT_MAKE_TYPE(num, flags: Tguint32): Tguint32;

function GST_IS_EVENT(obj: Pointer): Tgboolean;
function GST_EVENT_CAST(obj: Pointer): PGstEvent;
function GST_EVENT(obj: Pointer): Pointer;
function GST_EVENT_TYPE(event: Pointer): TGstEventType;
function GST_EVENT_TYPE_NAME(event: Pointer): Pgchar;
function GST_EVENT_TIMESTAMP(event: Pointer): Tguint64;
function GST_EVENT_SEQNUM(event: Pointer): Tguint64;
function GST_EVENT_IS_UPSTREAM(ev: Pointer): Tgboolean;
function GST_EVENT_IS_DOWNSTREAM(ev: Pointer): Tgboolean;
function GST_EVENT_IS_SERIALIZED(ev: Pointer): Tgboolean;
function GST_EVENT_IS_STICKY(ev: Pointer): Tgboolean;

function gst_event_is_writable(ev: Pointer): Tgboolean;
function gst_event_make_writable(ev: Pointer): PGstEvent;
{$ENDIF read_function}

implementation

function GST_TYPE_EVENT: TGType;
begin
  Result := _gst_event_type;
end;

function GST_EVENT_MAKE_TYPE(num, flags: Tguint32): Tguint32;
begin
  GST_EVENT_MAKE_TYPE := (num shl GST_EVENT_NUM_SHIFT) or flags;
end;

function GST_IS_EVENT(obj: Pointer): Tgboolean;
begin
  GST_IS_EVENT := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_EVENT);
end;

function GST_EVENT_CAST(obj: Pointer): PGstEvent;
begin
  GST_EVENT_CAST := PGstEvent(obj);
end;

function GST_EVENT(obj: Pointer): Pointer;
begin
  GST_EVENT := GST_EVENT_CAST(obj);
end;

function GST_EVENT_TYPE(event: Pointer): TGstEventType;
begin
  GST_EVENT_TYPE := (GST_EVENT_CAST(event))^._type;
end;

function GST_EVENT_TYPE_NAME(event: Pointer): Pgchar;
begin
  GST_EVENT_TYPE_NAME := gst_event_type_get_name(GST_EVENT_TYPE(event));
end;

function GST_EVENT_TIMESTAMP(event: Pointer): Tguint64;
begin
  GST_EVENT_TIMESTAMP := (GST_EVENT_CAST(event))^.timestamp;
end;

function GST_EVENT_SEQNUM(event: Pointer): Tguint64;
begin
  GST_EVENT_SEQNUM := (GST_EVENT_CAST(event))^.seqnum;
end;

function GST_EVENT_IS_UPSTREAM(ev: Pointer): Tgboolean;
begin
  GST_EVENT_IS_UPSTREAM := not (not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_UPSTREAM)) <> 0;
end;

function GST_EVENT_IS_DOWNSTREAM(ev: Pointer): Tgboolean;
begin
  GST_EVENT_IS_DOWNSTREAM := not (not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_DOWNSTREAM)) <> 0;
end;

function GST_EVENT_IS_SERIALIZED(ev: Pointer): Tgboolean;
begin
  GST_EVENT_IS_SERIALIZED := not (not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_SERIALIZED)) <> 0;
end;

function GST_EVENT_IS_STICKY(ev: Pointer): Tgboolean;
begin
  GST_EVENT_IS_STICKY := not (not ((GST_EVENT_TYPE(ev)) and GST_EVENT_TYPE_STICKY)) <> 0;
end;

function gst_event_is_writable(ev: Pointer): Tgboolean;
begin
  gst_event_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(ev));
end;

function gst_event_make_writable(ev: Pointer): PGstEvent;
begin
  gst_event_make_writable := GST_EVENT_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(ev)));
end;

end.
