
{$IFDEF read_interface}

const
  GST_VIDEO_ENCODER_SRC_NAME = 'src';


const
  GST_VIDEO_ENCODER_FLOW_NEED_DATA = GST_FLOW_CUSTOM_SUCCESS;
  GST_VIDEO_ENCODER_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS_1;

type
  TGstVideoEncoderPrivate = record
  end;
  PGstVideoEncoderPrivate = ^TGstVideoEncoderPrivate;

  PGstVideoEncoder = ^TGstVideoEncoder;

  TGstVideoEncoder = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    stream_lock: TGRecMutex;
    input_segment: TGstSegment;
    output_segment: TGstSegment;
    priv: PGstVideoEncoderPrivate;
    padding: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstVideoEncoderClass = ^TGstVideoEncoderClass;

  TGstVideoEncoderClass = record
    element_class: TGstElementClass;
    Open: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    Close: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    start: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    stop: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    set_format: function(encoder: PGstVideoEncoder; state: PGstVideoCodecState): Tgboolean; cdecl;
    handle_frame: function(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl;
    reset: function(encoder: PGstVideoEncoder; hard: Tgboolean): Tgboolean; cdecl;
    finish: function(encoder: PGstVideoEncoder): TGstFlowReturn; cdecl;
    pre_push: function(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl;
    getcaps: function(enc: PGstVideoEncoder; filter: PGstCaps): PGstCaps; cdecl;
    sink_event: function(encoder: PGstVideoEncoder; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(encoder: PGstVideoEncoder; event: PGstEvent): Tgboolean; cdecl;
    negotiate: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    decide_allocation: function(encoder: PGstVideoEncoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(encoder: PGstVideoEncoder; query: PGstQuery): Tgboolean; cdecl;
    flush: function(encoder: PGstVideoEncoder): Tgboolean; cdecl;
    sink_query: function(encoder: PGstVideoEncoder; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(encoder: PGstVideoEncoder; query: PGstQuery): Tgboolean; cdecl;
    transform_meta: function(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame; meta: PGstMeta): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 4) - 1] of Tgpointer;
  end;


function gst_video_encoder_get_type: TGType; cdecl; external libgstvideo;
function gst_video_encoder_get_output_state(encoder: PGstVideoEncoder): PGstVideoCodecState; cdecl; external libgstvideo;
function gst_video_encoder_set_output_state(encoder: PGstVideoEncoder; caps: PGstCaps; reference: PGstVideoCodecState): PGstVideoCodecState; cdecl; external libgstvideo;
function gst_video_encoder_negotiate(encoder: PGstVideoEncoder): Tgboolean; cdecl; external libgstvideo;
function gst_video_encoder_get_frame(encoder: PGstVideoEncoder; frame_number: longint): PGstVideoCodecFrame; cdecl; external libgstvideo;
function gst_video_encoder_get_oldest_frame(encoder: PGstVideoEncoder): PGstVideoCodecFrame; cdecl; external libgstvideo;
function gst_video_encoder_get_frames(encoder: PGstVideoEncoder): PGList; cdecl; external libgstvideo;
function gst_video_encoder_allocate_output_buffer(encoder: PGstVideoEncoder; size: Tgsize): PGstBuffer; cdecl; external libgstvideo;
function gst_video_encoder_allocate_output_frame(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame; size: Tgsize): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_encoder_finish_frame(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_encoder_finish_subframe(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_encoder_proxy_getcaps(enc: PGstVideoEncoder; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstvideo;
procedure gst_video_encoder_set_latency(encoder: PGstVideoEncoder; min_latency: TGstClockTime; max_latency: TGstClockTime); cdecl; external libgstvideo;
procedure gst_video_encoder_get_latency(encoder: PGstVideoEncoder; min_latency: PGstClockTime; max_latency: PGstClockTime); cdecl; external libgstvideo;
procedure gst_video_encoder_set_headers(encoder: PGstVideoEncoder; headers: PGList); cdecl; external libgstvideo;
procedure gst_video_encoder_merge_tags(encoder: PGstVideoEncoder; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstvideo;
procedure gst_video_encoder_get_allocator(encoder: PGstVideoEncoder; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstvideo;
procedure gst_video_encoder_set_min_pts(encoder: PGstVideoEncoder; min_pts: TGstClockTime); cdecl; external libgstvideo;
procedure gst_video_encoder_set_qos_enabled(encoder: PGstVideoEncoder; Enabled: Tgboolean); cdecl; external libgstvideo;
function gst_video_encoder_is_qos_enabled(encoder: PGstVideoEncoder): Tgboolean; cdecl; external libgstvideo;
function gst_video_encoder_get_max_encode_time(encoder: PGstVideoEncoder; frame: PGstVideoCodecFrame): TGstClockTimeDiff; cdecl; external libgstvideo;
procedure gst_video_encoder_set_min_force_key_unit_interval(encoder: PGstVideoEncoder; interval: TGstClockTime); cdecl; external libgstvideo;
function gst_video_encoder_get_min_force_key_unit_interval(encoder: PGstVideoEncoder): TGstClockTime; cdecl; external libgstvideo;

function GST_VIDEO_ENCODER_CAST(enc: Pointer): PGstVideoEncoder;
function GST_VIDEO_ENCODER_SRC_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_ENCODER_SINK_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_ENCODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
function GST_VIDEO_ENCODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
procedure GST_VIDEO_ENCODER_STREAM_LOCK(encoder: Pointer);
procedure GST_VIDEO_ENCODER_STREAM_UNLOCK(encoder: Pointer);

// === Konventiert am: 29-9-24 19:15:10 ===

function GST_TYPE_VIDEO_ENCODER: TGType;
function GST_VIDEO_ENCODER(obj: Pointer): PGstVideoEncoder;
function GST_VIDEO_ENCODER_CLASS(klass: Pointer): PGstVideoEncoderClass;
function GST_IS_VIDEO_ENCODER(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_ENCODER_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_ENCODER_GET_CLASS(obj: Pointer): PGstVideoEncoderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_ENCODER: TGType;
begin
  GST_TYPE_VIDEO_ENCODER := gst_video_encoder_get_type;
end;

function GST_VIDEO_ENCODER(obj: Pointer): PGstVideoEncoder;
begin
  Result := PGstVideoEncoder(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_ENCODER));
end;

function GST_VIDEO_ENCODER_CLASS(klass: Pointer): PGstVideoEncoderClass;
begin
  Result := PGstVideoEncoderClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_ENCODER));
end;

function GST_IS_VIDEO_ENCODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_ENCODER);
end;

function GST_IS_VIDEO_ENCODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_ENCODER);
end;

function GST_VIDEO_ENCODER_GET_CLASS(obj: Pointer): PGstVideoEncoderClass;
begin
  Result := PGstVideoEncoderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VIDEO_ENCODER_CAST(enc: Pointer): PGstVideoEncoder;
begin
  GST_VIDEO_ENCODER_CAST := PGstVideoEncoder(enc);
end;

function GST_VIDEO_ENCODER_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_VIDEO_ENCODER_SRC_PAD := (PGstVideoEncoder(obj))^.srcpad;
end;

function GST_VIDEO_ENCODER_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_VIDEO_ENCODER_SINK_PAD := (PGstVideoEncoder(obj))^.sinkpad;
end;

function GST_VIDEO_ENCODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_VIDEO_ENCODER_INPUT_SEGMENT := (GST_VIDEO_ENCODER_CAST(obj))^.input_segment;
end;

function GST_VIDEO_ENCODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_VIDEO_ENCODER_OUTPUT_SEGMENT := (GST_VIDEO_ENCODER_CAST(obj))^.output_segment;
end;

procedure GST_VIDEO_ENCODER_STREAM_LOCK(encoder: Pointer);
begin
  g_rec_mutex_lock(@((GST_VIDEO_ENCODER(encoder))^.stream_lock));
end;

procedure GST_VIDEO_ENCODER_STREAM_UNLOCK(encoder: Pointer);
begin
  g_rec_mutex_unlock(@((GST_VIDEO_ENCODER(encoder))^.stream_lock));
end;


{$ENDIF read_implementation}
