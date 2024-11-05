/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMessageType = ^TGstMessageType;
  TGstMessageType = longint;

const
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
  GST_MESSAGE_DEVICE_ADDED = GST_MESSAGE_EXTENDED + 1;
  GST_MESSAGE_DEVICE_REMOVED = GST_MESSAGE_EXTENDED + 2;
  GST_MESSAGE_PROPERTY_NOTIFY = GST_MESSAGE_EXTENDED + 3;
  GST_MESSAGE_STREAM_COLLECTION = GST_MESSAGE_EXTENDED + 4;
  GST_MESSAGE_STREAMS_SELECTED = GST_MESSAGE_EXTENDED + 5;
  GST_MESSAGE_REDIRECT = GST_MESSAGE_EXTENDED + 6;
  GST_MESSAGE_DEVICE_CHANGED = GST_MESSAGE_EXTENDED + 7;
  GST_MESSAGE_INSTANT_RATE_REQUEST = GST_MESSAGE_EXTENDED + 8;
  GST_MESSAGE_ANY = Tgint($ffffffff);

var
  _gst_message_type: TGType; cvar;external libgstreamer;

type
  PGstStructureChangeType = ^TGstStructureChangeType;
  TGstStructureChangeType = longint;

const
  GST_STRUCTURE_CHANGE_TYPE_PAD_LINK = 0;
  GST_STRUCTURE_CHANGE_TYPE_PAD_UNLINK = 1;

type
  PGstStreamStatusType = ^TGstStreamStatusType;
  TGstStreamStatusType = longint;

const
  GST_STREAM_STATUS_TYPE_CREATE = 0;
  GST_STREAM_STATUS_TYPE_ENTER = 1;
  GST_STREAM_STATUS_TYPE_LEAVE = 2;
  GST_STREAM_STATUS_TYPE_DESTROY = 3;
  GST_STREAM_STATUS_TYPE_START = 8;
  GST_STREAM_STATUS_TYPE_PAUSE = 9;
  GST_STREAM_STATUS_TYPE_STOP = 10;

type
  PGstProgressType = ^TGstProgressType;
  TGstProgressType = longint;

const
  GST_PROGRESS_TYPE_START = 0;
  GST_PROGRESS_TYPE_CONTINUE = 1;
  GST_PROGRESS_TYPE_COMPLETE = 2;
  GST_PROGRESS_TYPE_CANCELED = 3;
  GST_PROGRESS_TYPE_ERROR = 4;

type
  TGstMessage = record
    mini_object: TGstMiniObject;
    _type: TGstMessageType;
    timestamp: Tguint64;
    src: PGstObject;
    seqnum: Tguint32;
    lock: TGMutex;
    cond: TGCond;
  end;
  PGstMessage = ^TGstMessage;
  PPGstMessage = ^PGstMessage;

function gst_message_get_type: TGType; cdecl; external libgstreamer;
function gst_message_type_get_name(_type: TGstMessageType): Pgchar; cdecl; external libgstreamer;
function gst_message_type_to_quark(_type: TGstMessageType): TGQuark; cdecl; external libgstreamer;
function gst_message_ref(msg: PGstMessage): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_unref(msg: PGstMessage); cdecl; external libgstreamer;
procedure gst_clear_message(msg_ptr: PPGstMessage); cdecl; external libgstreamer;
function gst_message_copy(msg: PGstMessage): PGstMessage; cdecl; external libgstreamer;

function gst_message_replace(old_message: PPGstMessage; new_message: PGstMessage): Tgboolean; cdecl; external libgstreamer;
function gst_message_take(old_message: PPGstMessage; new_message: PGstMessage): Tgboolean; cdecl; external libgstreamer;

function gst_message_new_custom(_type: TGstMessageType; src: PGstObject; structure: PGstStructure): PGstMessage; cdecl; external libgstreamer;
function gst_message_get_structure(message: PGstMessage): PGstStructure; cdecl; external libgstreamer;
function gst_message_writable_structure(message: PGstMessage): PGstStructure; cdecl; external libgstreamer;
function gst_message_has_name(message: PGstMessage; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_message_get_seqnum(message: PGstMessage): Tguint32; cdecl; external libgstreamer;
procedure gst_message_set_seqnum(message: PGstMessage; seqnum: Tguint32); cdecl; external libgstreamer;
function gst_message_new_eos(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_error(src: PGstObject; error: PGError; debug: Pgchar): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_error_with_details(src: PGstObject; error: PGError; debug: Pgchar; details: PGstStructure): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_error(message: PGstMessage; gerror: PPGError; debug: PPgchar); cdecl; external libgstreamer;
procedure gst_message_parse_error_details(message: PGstMessage; structure: PPGstStructure); cdecl; external libgstreamer;
function gst_message_new_warning(src: PGstObject; error: PGError; debug: Pgchar): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_warning_with_details(src: PGstObject; error: PGError; debug: Pgchar; details: PGstStructure): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_warning(message: PGstMessage; gerror: PPGError; debug: PPgchar); cdecl; external libgstreamer;
procedure gst_message_parse_warning_details(message: PGstMessage; structure: PPGstStructure); cdecl; external libgstreamer;
function gst_message_new_info(src: PGstObject; error: PGError; debug: Pgchar): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_info_with_details(src: PGstObject; error: PGError; debug: Pgchar; details: PGstStructure): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_info(message: PGstMessage; gerror: PPGError; debug: PPgchar); cdecl; external libgstreamer;
procedure gst_message_parse_info_details(message: PGstMessage; structure: PPGstStructure); cdecl; external libgstreamer;
function gst_message_new_tag(src: PGstObject; tag_list: PGstTagList): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_tag(message: PGstMessage; tag_list: PPGstTagList); cdecl; external libgstreamer;
function gst_message_new_buffering(src: PGstObject; percent: Tgint): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_buffering(message: PGstMessage; percent: Pgint); cdecl; external libgstreamer;
procedure gst_message_set_buffering_stats(message: PGstMessage; mode: TGstBufferingMode; avg_in: Tgint; avg_out: Tgint; buffering_left: Tgint64); cdecl; external libgstreamer;
procedure gst_message_parse_buffering_stats(message: PGstMessage; mode: PGstBufferingMode; avg_in: Pgint; avg_out: Pgint; buffering_left: Pgint64); cdecl; external libgstreamer;
function gst_message_new_state_dirty(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_step_done(src: PGstObject; format: TGstFormat; amount: Tguint64; rate: Tgdouble; flush: Tgboolean;
  intermediate: Tgboolean; duration: Tguint64; eos: Tgboolean): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_step_done(message: PGstMessage; format: PGstFormat; amount: Pguint64; rate: Pgdouble; flush: Pgboolean;
  intermediate: Pgboolean; duration: Pguint64; eos: Pgboolean); cdecl; external libgstreamer;
function gst_message_new_clock_provide(src: PGstObject; clock: PGstClock; ready: Tgboolean): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_clock_provide(message: PGstMessage; clock: PPGstClock; ready: Pgboolean); cdecl; external libgstreamer;
function gst_message_new_clock_lost(src: PGstObject; clock: PGstClock): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_clock_lost(message: PGstMessage; clock: PPGstClock); cdecl; external libgstreamer;
function gst_message_new_new_clock(src: PGstObject; clock: PGstClock): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_new_clock(message: PGstMessage; clock: PPGstClock); cdecl; external libgstreamer;
function gst_message_new_application(src: PGstObject; structure: PGstStructure): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_element(src: PGstObject; structure: PGstStructure): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_segment_start(src: PGstObject; format: TGstFormat; position: Tgint64): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_segment_start(message: PGstMessage; format: PGstFormat; position: Pgint64); cdecl; external libgstreamer;
function gst_message_new_segment_done(src: PGstObject; format: TGstFormat; position: Tgint64): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_segment_done(message: PGstMessage; format: PGstFormat; position: Pgint64); cdecl; external libgstreamer;
function gst_message_new_duration_changed(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_latency(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_async_start(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
function gst_message_new_async_done(src: PGstObject; running_time: TGstClockTime): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_async_done(message: PGstMessage; running_time: PGstClockTime); cdecl; external libgstreamer;
procedure gst_message_set_stream_status_object(message: PGstMessage; obj: PGValue); cdecl; external libgstreamer;
function gst_message_get_stream_status_object(message: PGstMessage): PGValue; cdecl; external libgstreamer;
function gst_message_new_step_start(src: PGstObject; active: Tgboolean; format: TGstFormat; amount: Tguint64; rate: Tgdouble;
  flush: Tgboolean; intermediate: Tgboolean): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_step_start(message: PGstMessage; active: Pgboolean; format: PGstFormat; amount: Pguint64; rate: Pgdouble;
  flush: Pgboolean; intermediate: Pgboolean); cdecl; external libgstreamer;
function gst_message_new_qos(src: PGstObject; live: Tgboolean; running_time: Tguint64; stream_time: Tguint64; timestamp: Tguint64;
  duration: Tguint64): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_set_qos_values(message: PGstMessage; jitter: Tgint64; proportion: Tgdouble; quality: Tgint); cdecl; external libgstreamer;
procedure gst_message_set_qos_stats(message: PGstMessage; format: TGstFormat; processed: Tguint64; dropped: Tguint64); cdecl; external libgstreamer;
procedure gst_message_parse_qos(message: PGstMessage; live: Pgboolean; running_time: Pguint64; stream_time: Pguint64; timestamp: Pguint64;
  duration: Pguint64); cdecl; external libgstreamer;
procedure gst_message_parse_qos_values(message: PGstMessage; jitter: Pgint64; proportion: Pgdouble; quality: Pgint); cdecl; external libgstreamer;
procedure gst_message_parse_qos_stats(message: PGstMessage; format: PGstFormat; processed: Pguint64; dropped: Pguint64); cdecl; external libgstreamer;
function gst_message_new_progress(src: PGstObject; _type: TGstProgressType; code: Pgchar; Text: Pgchar): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_progress(message: PGstMessage; _type: PGstProgressType; code: PPgchar; Text: PPgchar); cdecl; external libgstreamer;
function gst_message_new_toc(src: PGstObject; toc: PGstToc; updated: Tgboolean): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_toc(message: PGstMessage; toc: PPGstToc; updated: Pgboolean); cdecl; external libgstreamer;
function gst_message_new_reset_time(src: PGstObject; running_time: TGstClockTime): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_reset_time(message: PGstMessage; running_time: PGstClockTime); cdecl; external libgstreamer;
function gst_message_new_stream_start(src: PGstObject): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_set_group_id(message: PGstMessage; group_id: Tguint); cdecl; external libgstreamer;
function gst_message_parse_group_id(message: PGstMessage; group_id: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_message_new_need_context(src: PGstObject; context_type: Pgchar): PGstMessage; cdecl; external libgstreamer;
function gst_message_parse_context_type(message: PGstMessage; context_type: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_message_new_have_context(src: PGstObject; context: PGstContext): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_have_context(message: PGstMessage; context: PPGstContext); cdecl; external libgstreamer;
function gst_message_new_device_added(src: PGstObject; device: PGstDevice): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_device_added(message: PGstMessage; device: PPGstDevice); cdecl; external libgstreamer;
function gst_message_new_device_removed(src: PGstObject; device: PGstDevice): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_device_removed(message: PGstMessage; device: PPGstDevice); cdecl; external libgstreamer;
function gst_message_new_device_changed(src: PGstObject; device: PGstDevice; changed_device: PGstDevice): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_device_changed(message: PGstMessage; device: PPGstDevice; changed_device: PPGstDevice); cdecl; external libgstreamer;
function gst_message_new_property_notify(src: PGstObject; property_name: Pgchar; val: PGValue): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_property_notify(message: PGstMessage; obj: PPGstObject; property_name: PPgchar; property_value: PPGValue); cdecl; external libgstreamer;
function gst_message_new_stream_collection(src: PGstObject; collection: PGstStreamCollection): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_stream_collection(message: PGstMessage; collection: PPGstStreamCollection); cdecl; external libgstreamer;
function gst_message_new_streams_selected(src: PGstObject; collection: PGstStreamCollection): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_streams_selected_add(message: PGstMessage; stream: PGstStream); cdecl; external libgstreamer;
procedure gst_message_parse_streams_selected(message: PGstMessage; collection: PPGstStreamCollection); cdecl; external libgstreamer;
function gst_message_streams_selected_get_size(message: PGstMessage): Tguint; cdecl; external libgstreamer;
function gst_message_streams_selected_get_stream(message: PGstMessage; idx: Tguint): PGstStream; cdecl; external libgstreamer;
function gst_message_new_redirect(src: PGstObject; location: Pgchar; tag_list: PGstTagList; entry_struct: PGstStructure): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_add_redirect_entry(message: PGstMessage; location: Pgchar; tag_list: PGstTagList; entry_struct: PGstStructure); cdecl; external libgstreamer;
procedure gst_message_parse_redirect_entry(message: PGstMessage; entry_index: Tgsize; location: PPgchar; tag_list: PPGstTagList; entry_struct: PPGstStructure); cdecl; external libgstreamer;
function gst_message_get_num_redirect_entries(message: PGstMessage): Tgsize; cdecl; external libgstreamer;
function gst_message_new_instant_rate_request(src: PGstObject; rate_multiplier: Tgdouble): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_instant_rate_request(message: PGstMessage; rate_multiplier: Pgdouble); cdecl; external libgstreamer;

// Ausgelagert
function gst_event_new_sink_message(Name: Pgchar; msg: PGstMessage): PGstEvent; cdecl; external libgstreamer;
procedure gst_event_parse_sink_message(event: PGstEvent; msg: PPGstMessage); cdecl; external libgstreamer;
// ----

function GST_TYPE_MESSAGE: TGType;
function GST_MESSAGE(obj: Pointer): PGstMessage;
function GST_IS_MESSAGE(obj: Pointer): Tgboolean;
function GST_MESSAGE_CAST(obj: Pointer): PGstMessage;
function GST_MESSAGE_GET_LOCK(message: Pointer): PGMutex;
procedure GST_MESSAGE_LOCK(message: Pointer);
procedure GST_MESSAGE_UNLOCK(message: Pointer);
function GST_MESSAGE_GET_COND(message: Pointer): PGCond;
procedure GST_MESSAGE_WAIT(message: Pointer);
procedure GST_MESSAGE_SIGNAL(message: Pointer);
function GST_MESSAGE_TYPE(message: Pointer): TGstMessageType;
function GST_MESSAGE_TYPE_IS_EXTENDED(message: Pointer): Tgboolean;
function GST_MESSAGE_TYPE_NAME(message: Pointer): Pgchar;
function GST_MESSAGE_TIMESTAMP(message: Pointer): Tguint64;
function GST_MESSAGE_SRC(message: Pointer): PGstObject;
function GST_MESSAGE_SEQNUM(message: Pointer): Tguint32;
function GST_MESSAGE_SRC_NAME(message: Pointer): Pgchar;

function gst_message_is_writable(msg: Pointer): Tgboolean;
function gst_message_make_writable(msg: Pointer): PGstMessage;

// === Konventiert am: 11-9-24 17:06:26 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_MESSAGE: TGType;
begin
  Result := _gst_message_type;
end;

function GST_MESSAGE(obj: Pointer): PGstMessage;
begin
  GST_MESSAGE := GST_MESSAGE_CAST(obj);
end;

function GST_IS_MESSAGE(obj: Pointer): Tgboolean;
begin
  GST_IS_MESSAGE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_MESSAGE);
end;

function GST_MESSAGE_CAST(obj: Pointer): PGstMessage;
begin
  GST_MESSAGE_CAST := PGstMessage(obj);
end;

function GST_MESSAGE_GET_LOCK(message: Pointer): PGMutex;
begin
  GST_MESSAGE_GET_LOCK := @((GST_MESSAGE_CAST(message))^.lock);
end;

procedure GST_MESSAGE_LOCK(message: Pointer);
begin
  g_mutex_lock(GST_MESSAGE_GET_LOCK(message));
end;

procedure GST_MESSAGE_UNLOCK(message: Pointer);
begin
  g_mutex_unlock(GST_MESSAGE_GET_LOCK(message));
end;

function GST_MESSAGE_GET_COND(message: Pointer): PGCond;
begin
  GST_MESSAGE_GET_COND := @((GST_MESSAGE_CAST(message))^.cond);
end;

procedure GST_MESSAGE_WAIT(message: Pointer);
begin
  g_cond_wait(GST_MESSAGE_GET_COND(message), GST_MESSAGE_GET_LOCK(message));
end;

procedure GST_MESSAGE_SIGNAL(message: Pointer);
begin
  g_cond_signal(GST_MESSAGE_GET_COND(message));
end;

function GST_MESSAGE_TYPE(message: Pointer): TGstMessageType;
begin
  GST_MESSAGE_TYPE := (GST_MESSAGE_CAST(message))^._type;
end;

function GST_MESSAGE_TYPE_IS_EXTENDED(message: Pointer): Tgboolean;
begin
  GST_MESSAGE_TYPE_IS_EXTENDED := not (not (((GST_MESSAGE_CAST(message))^._type) and GST_MESSAGE_EXTENDED)) <> 0;
end;

function GST_MESSAGE_TYPE_NAME(message: Pointer): Pgchar;
begin
  GST_MESSAGE_TYPE_NAME := gst_message_type_get_name(GST_MESSAGE_TYPE(message));
end;

function GST_MESSAGE_TIMESTAMP(message: Pointer): Tguint64;
begin
  GST_MESSAGE_TIMESTAMP := (GST_MESSAGE_CAST(message))^.timestamp;
end;

function GST_MESSAGE_SRC(message: Pointer): PGstObject;
begin
  GST_MESSAGE_SRC := (GST_MESSAGE_CAST(message))^.src;
end;

function GST_MESSAGE_SEQNUM(message: Pointer): Tguint32;
begin
  GST_MESSAGE_SEQNUM := (GST_MESSAGE_CAST(message))^.seqnum;
end;

function GST_MESSAGE_SRC_NAME(message: Pointer): Pgchar;
begin
  if GST_MESSAGE_SRC(message) <> nil then begin
    Result := GST_OBJECT_NAME(GST_MESSAGE_SRC(message));
  end else begin
    Result := '(NULL)';
  end;
end;

function gst_message_is_writable(msg: Pointer): Tgboolean;
begin
  gst_message_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(msg));
end;

function gst_message_make_writable(msg: Pointer): PGstMessage;
begin
  gst_message_make_writable := GST_MESSAGE_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(msg)));
end;


{$ENDIF read_implementation}
