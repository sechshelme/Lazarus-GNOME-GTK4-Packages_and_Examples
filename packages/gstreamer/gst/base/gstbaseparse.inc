
{$IFDEF read_interface}


const
  GST_BASE_PARSE_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;
  GST_BASE_PARSE_FLAG_LOST_SYNC = 1 shl 0;
  GST_BASE_PARSE_FLAG_DRAINING = 1 shl 1;

type
  PGstBaseParseFrameFlags = ^TGstBaseParseFrameFlags;
  TGstBaseParseFrameFlags = longint;

const
  GST_BASE_PARSE_FRAME_FLAG_NONE = 0;
  GST_BASE_PARSE_FRAME_FLAG_NEW_FRAME = 1 shl 0;
  GST_BASE_PARSE_FRAME_FLAG_NO_FRAME = 1 shl 1;
  GST_BASE_PARSE_FRAME_FLAG_CLIP = 1 shl 2;
  GST_BASE_PARSE_FRAME_FLAG_DROP = 1 shl 3;
  GST_BASE_PARSE_FRAME_FLAG_QUEUE = 1 shl 4;

type
  TGstBaseParseFrame = record
    buffer: PGstBuffer;
    out_buffer: PGstBuffer;
    flags: Tguint;
    offset: Tguint64;
    overhead: Tgint;
    size: Tgint;
    _gst_reserved_i: array[0..1] of Tguint;
    _gst_reserved_p: array[0..1] of Tgpointer;
    _private_flags: Tguint;
  end;
  PGstBaseParseFrame = ^TGstBaseParseFrame;

  TGstBaseParsePrivate = record
  end;
  PGstBaseParsePrivate = ^TGstBaseParsePrivate;

  TGstBaseParse = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    flags: Tguint;
    segment: TGstSegment;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
    priv: PGstBaseParsePrivate;
  end;
  PGstBaseParse = ^TGstBaseParse;

  TGstBaseParseClass = record
    parent_class: TGstElementClass;
    start: function(parse: PGstBaseParse): Tgboolean; cdecl;
    stop: function(parse: PGstBaseParse): Tgboolean; cdecl;
    set_sink_caps: function(parse: PGstBaseParse; caps: PGstCaps): Tgboolean; cdecl;
    handle_frame: function(parse: PGstBaseParse; frame: PGstBaseParseFrame; skipsize: Pgint): TGstFlowReturn; cdecl;
    pre_push_frame: function(parse: PGstBaseParse; frame: PGstBaseParseFrame): TGstFlowReturn; cdecl;
    convert: function(parse: PGstBaseParse; src_format: TGstFormat; src_value: Tgint64; dest_format: TGstFormat; dest_value: Pgint64): Tgboolean; cdecl;
    sink_event: function(parse: PGstBaseParse; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(parse: PGstBaseParse; event: PGstEvent): Tgboolean; cdecl;
    get_sink_caps: function(parse: PGstBaseParse; filter: PGstCaps): PGstCaps; cdecl;
    detect: function(parse: PGstBaseParse; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    sink_query: function(parse: PGstBaseParse; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(parse: PGstBaseParse; query: PGstQuery): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 2) - 1] of Tgpointer;
  end;
  PGstBaseParseClass = ^TGstBaseParseClass;

function gst_base_parse_get_type: TGType; cdecl; external libgstbase;
function gst_base_parse_frame_get_type: TGType; cdecl; external libgstbase;
function gst_base_parse_frame_new(buffer: PGstBuffer; flags: TGstBaseParseFrameFlags; overhead: Tgint): PGstBaseParseFrame; cdecl; external libgstbase;
procedure gst_base_parse_frame_init(frame: PGstBaseParseFrame); cdecl; external libgstbase;
function gst_base_parse_frame_copy(frame: PGstBaseParseFrame): PGstBaseParseFrame; cdecl; external libgstbase;
procedure gst_base_parse_frame_free(frame: PGstBaseParseFrame); cdecl; external libgstbase;
function gst_base_parse_push_frame(parse: PGstBaseParse; frame: PGstBaseParseFrame): TGstFlowReturn; cdecl; external libgstbase;
function gst_base_parse_finish_frame(parse: PGstBaseParse; frame: PGstBaseParseFrame; size: Tgint): TGstFlowReturn; cdecl; external libgstbase;
procedure gst_base_parse_set_duration(parse: PGstBaseParse; fmt: TGstFormat; duration: Tgint64; interval: Tgint); cdecl; external libgstbase;
procedure gst_base_parse_set_average_bitrate(parse: PGstBaseParse; bitrate: Tguint); cdecl; external libgstbase;
procedure gst_base_parse_set_min_frame_size(parse: PGstBaseParse; min_size: Tguint); cdecl; external libgstbase;
procedure gst_base_parse_set_has_timing_info(parse: PGstBaseParse; has_timing: Tgboolean); cdecl; external libgstbase;
procedure gst_base_parse_drain(parse: PGstBaseParse); cdecl; external libgstbase;
procedure gst_base_parse_set_syncable(parse: PGstBaseParse; syncable: Tgboolean); cdecl; external libgstbase;
procedure gst_base_parse_set_passthrough(parse: PGstBaseParse; passthrough: Tgboolean); cdecl; external libgstbase;
procedure gst_base_parse_set_pts_interpolation(parse: PGstBaseParse; pts_interpolate: Tgboolean); cdecl; external libgstbase;
procedure gst_base_parse_set_infer_ts(parse: PGstBaseParse; infer_ts: Tgboolean); cdecl; external libgstbase;
procedure gst_base_parse_set_frame_rate(parse: PGstBaseParse; fps_num: Tguint; fps_den: Tguint; lead_in: Tguint; lead_out: Tguint); cdecl; external libgstbase;
procedure gst_base_parse_set_latency(parse: PGstBaseParse; min_latency: TGstClockTime; max_latency: TGstClockTime); cdecl; external libgstbase;
function gst_base_parse_convert_default(parse: PGstBaseParse; src_format: TGstFormat; src_value: Tgint64; dest_format: TGstFormat; dest_value: Pgint64): Tgboolean; cdecl; external libgstbase;
function gst_base_parse_add_index_entry(parse: PGstBaseParse; offset: Tguint64; ts: TGstClockTime; key: Tgboolean; force: Tgboolean): Tgboolean; cdecl; external libgstbase;
procedure gst_base_parse_set_ts_at_offset(parse: PGstBaseParse; offset: Tgsize); cdecl; external libgstbase;
procedure gst_base_parse_merge_tags(parse: PGstBaseParse; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstbase;

function GST_BASE_PARSE_CAST(obj: Pointer): PGstBaseParse;
function GST_BASE_PARSE_SRC_PAD(obj: Pointer): PGstPad;
function GST_BASE_PARSE_SINK_PAD(obj: Pointer): PGstPad;
function GST_BASE_PARSE_LOST_SYNC(parse: PGstBaseParse): Tguint;
function GST_BASE_PARSE_DRAINING(parse: PGstBaseParse): Tguint;

// === Konventiert am: 28-9-24 13:06:13 ===

function GST_TYPE_BASE_PARSE: TGType;
function GST_BASE_PARSE(obj: Pointer): PGstBaseParse;
function GST_BASE_PARSE_CLASS(klass: Pointer): PGstBaseParseClass;
function GST_IS_BASE_PARSE(obj: Pointer): Tgboolean;
function GST_IS_BASE_PARSE_CLASS(klass: Pointer): Tgboolean;
function GST_BASE_PARSE_GET_CLASS(obj: Pointer): PGstBaseParseClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BASE_PARSE: TGType;
begin
  GST_TYPE_BASE_PARSE := gst_base_parse_get_type;
end;

function GST_BASE_PARSE(obj: Pointer): PGstBaseParse;
begin
  Result := PGstBaseParse(g_type_check_instance_cast(obj, GST_TYPE_BASE_PARSE));
end;

function GST_BASE_PARSE_CLASS(klass: Pointer): PGstBaseParseClass;
begin
  Result := PGstBaseParseClass(g_type_check_class_cast(klass, GST_TYPE_BASE_PARSE));
end;

function GST_IS_BASE_PARSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BASE_PARSE);
end;

function GST_IS_BASE_PARSE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BASE_PARSE);
end;

function GST_BASE_PARSE_GET_CLASS(obj: Pointer): PGstBaseParseClass;
begin
  Result := PGstBaseParseClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BASE_PARSE_CAST(obj: Pointer): PGstBaseParse;
begin
  GST_BASE_PARSE_CAST := PGstBaseParse(obj);
end;

function GST_BASE_PARSE_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_PARSE_SRC_PAD := (GST_BASE_PARSE_CAST(obj))^.srcpad;
end;

function GST_BASE_PARSE_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_PARSE_SINK_PAD := (GST_BASE_PARSE_CAST(obj))^.sinkpad;
end;

function GST_BASE_PARSE_LOST_SYNC(parse: PGstBaseParse): Tguint;
begin
  GST_BASE_PARSE_LOST_SYNC := ((GST_BASE_PARSE_CAST(parse))^.flags) and GST_BASE_PARSE_FLAG_LOST_SYNC;
end;

function GST_BASE_PARSE_DRAINING(parse: PGstBaseParse): Tguint;
begin
  GST_BASE_PARSE_DRAINING := ((GST_BASE_PARSE_CAST(parse))^.flags) and GST_BASE_PARSE_FLAG_DRAINING;
end;


{$ENDIF read_implementation}
