
{$IFDEF read_interface}

const
  GST_VIDEO_DECODER_SINK_NAME = 'sink';
  GST_VIDEO_DECODER_SRC_NAME = 'src';

  GST_VIDEO_DECODER_FLOW_NEED_DATA = GST_FLOW_CUSTOM_SUCCESS;

  GST_VIDEO_DECODER_MAX_ERRORS = -(1);

type
  TGstVideoDecoderPrivate = record
  end;
  PGstVideoDecoderPrivate = ^TGstVideoDecoderPrivate;

  TGstVideoDecoder = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    stream_lock: TGRecMutex;
    input_segment: TGstSegment;
    output_segment: TGstSegment;
    priv: PGstVideoDecoderPrivate;
    padding: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstVideoDecoder = ^TGstVideoDecoder;

  TGstVideoDecoderClass = record
    element_class: TGstElementClass;
    Open: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    Close: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    start: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    stop: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    parse: function(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame; adapter: PGstAdapter; at_eos: Tgboolean): TGstFlowReturn; cdecl;
    set_format: function(decoder: PGstVideoDecoder; state: PGstVideoCodecState): Tgboolean; cdecl;
    reset: function(decoder: PGstVideoDecoder; hard: Tgboolean): Tgboolean; cdecl;
    finish: function(decoder: PGstVideoDecoder): TGstFlowReturn; cdecl;
    handle_frame: function(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl;
    sink_event: function(decoder: PGstVideoDecoder; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(decoder: PGstVideoDecoder; event: PGstEvent): Tgboolean; cdecl;
    negotiate: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    decide_allocation: function(decoder: PGstVideoDecoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(decoder: PGstVideoDecoder; query: PGstQuery): Tgboolean; cdecl;
    flush: function(decoder: PGstVideoDecoder): Tgboolean; cdecl;
    sink_query: function(decoder: PGstVideoDecoder; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(decoder: PGstVideoDecoder; query: PGstQuery): Tgboolean; cdecl;
    getcaps: function(decoder: PGstVideoDecoder; filter: PGstCaps): PGstCaps; cdecl;
    drain: function(decoder: PGstVideoDecoder): TGstFlowReturn; cdecl;
    transform_meta: function(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame; meta: PGstMeta): Tgboolean; cdecl;
    handle_missing_data: function(decoder: PGstVideoDecoder; timestamp: TGstClockTime; duration: TGstClockTime): Tgboolean; cdecl;
    padding: array[0..(GST_PADDING_LARGE - 7) - 1] of Tgpointer;
  end;
  PGstVideoDecoderClass = ^TGstVideoDecoderClass;

function _gst_video_decoder_error(Dec: PGstVideoDecoder; weight: Tgint; domain: TGQuark; code: Tgint; txt: Pgchar;
  debug: Pgchar; file_: Pgchar; _function: Pgchar; line: Tgint): TGstFlowReturn; cdecl; external libgstvideo;

type
  PGstVideoDecoderRequestSyncPointFlags = ^TGstVideoDecoderRequestSyncPointFlags;
  TGstVideoDecoderRequestSyncPointFlags = longint;

const
  GST_VIDEO_DECODER_REQUEST_SYNC_POINT_DISCARD_INPUT = 1 shl 0;
  GST_VIDEO_DECODER_REQUEST_SYNC_POINT_CORRUPT_OUTPUT = 1 shl 1;

function gst_video_decoder_get_type: TGType; cdecl; external libgstvideo;
procedure gst_video_decoder_set_packetized(decoder: PGstVideoDecoder; packetized: Tgboolean); cdecl; external libgstvideo;
function gst_video_decoder_get_packetized(decoder: PGstVideoDecoder): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_decoder_set_subframe_mode(decoder: PGstVideoDecoder; subframe_mode: Tgboolean); cdecl; external libgstvideo;
function gst_video_decoder_get_subframe_mode(decoder: PGstVideoDecoder): Tgboolean; cdecl; external libgstvideo;
function gst_video_decoder_get_input_subframe_index(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): Tguint; cdecl; external libgstvideo;
function gst_video_decoder_get_processed_subframe_index(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): Tguint; cdecl; external libgstvideo;
procedure gst_video_decoder_set_estimate_rate(Dec: PGstVideoDecoder; Enabled: Tgboolean); cdecl; external libgstvideo;
function gst_video_decoder_get_estimate_rate(Dec: PGstVideoDecoder): Tgint; cdecl; external libgstvideo;
procedure gst_video_decoder_set_max_errors(Dec: PGstVideoDecoder; num: Tgint); cdecl; external libgstvideo;
function gst_video_decoder_get_max_errors(Dec: PGstVideoDecoder): Tgint; cdecl; external libgstvideo;
procedure gst_video_decoder_set_needs_format(Dec: PGstVideoDecoder; Enabled: Tgboolean); cdecl; external libgstvideo;
function gst_video_decoder_get_needs_format(Dec: PGstVideoDecoder): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_decoder_set_needs_sync_point(Dec: PGstVideoDecoder; Enabled: Tgboolean); cdecl; external libgstvideo;
function gst_video_decoder_get_needs_sync_point(Dec: PGstVideoDecoder): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_decoder_set_latency(decoder: PGstVideoDecoder; min_latency: TGstClockTime; max_latency: TGstClockTime); cdecl; external libgstvideo;
procedure gst_video_decoder_get_latency(decoder: PGstVideoDecoder; min_latency: PGstClockTime; max_latency: PGstClockTime); cdecl; external libgstvideo;
procedure gst_video_decoder_get_allocator(decoder: PGstVideoDecoder; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstvideo;
function gst_video_decoder_get_buffer_pool(decoder: PGstVideoDecoder): PGstBufferPool; cdecl; external libgstvideo;
function gst_video_decoder_get_frame(decoder: PGstVideoDecoder; frame_number: longint): PGstVideoCodecFrame; cdecl; external libgstvideo;
function gst_video_decoder_get_oldest_frame(decoder: PGstVideoDecoder): PGstVideoCodecFrame; cdecl; external libgstvideo;
function gst_video_decoder_get_frames(decoder: PGstVideoDecoder): PGList; cdecl; external libgstvideo;
procedure gst_video_decoder_add_to_frame(decoder: PGstVideoDecoder; n_bytes: longint); cdecl; external libgstvideo;
function gst_video_decoder_have_frame(decoder: PGstVideoDecoder): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_have_last_subframe(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_get_pending_frame_size(decoder: PGstVideoDecoder): Tgsize; cdecl; external libgstvideo;
function gst_video_decoder_allocate_output_buffer(decoder: PGstVideoDecoder): PGstBuffer; cdecl; external libgstvideo;
function gst_video_decoder_allocate_output_frame_with_params(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame; params: PGstBufferPoolAcquireParams): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_allocate_output_frame(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_set_output_state(decoder: PGstVideoDecoder; fmt: TGstVideoFormat; Width: Tguint; Height: Tguint; reference: PGstVideoCodecState): PGstVideoCodecState; cdecl; external libgstvideo;
function gst_video_decoder_set_interlaced_output_state(decoder: PGstVideoDecoder; fmt: TGstVideoFormat; interlace_mode: TGstVideoInterlaceMode; Width: Tguint; Height: Tguint;
  reference: PGstVideoCodecState): PGstVideoCodecState; cdecl; external libgstvideo;
function gst_video_decoder_get_output_state(decoder: PGstVideoDecoder): PGstVideoCodecState; cdecl; external libgstvideo;
function gst_video_decoder_negotiate(decoder: PGstVideoDecoder): Tgboolean; cdecl; external libgstvideo;
function gst_video_decoder_get_max_decode_time(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstClockTimeDiff; cdecl; external libgstvideo;
function gst_video_decoder_get_qos_proportion(decoder: PGstVideoDecoder): Tgdouble; cdecl; external libgstvideo;
function gst_video_decoder_finish_frame(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_finish_subframe(decoder: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_drop_frame(Dec: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
function gst_video_decoder_drop_subframe(Dec: PGstVideoDecoder; frame: PGstVideoCodecFrame): TGstFlowReturn; cdecl; external libgstvideo;
procedure gst_video_decoder_request_sync_point(Dec: PGstVideoDecoder; frame: PGstVideoCodecFrame; flags: TGstVideoDecoderRequestSyncPointFlags); cdecl; external libgstvideo;
procedure gst_video_decoder_release_frame(Dec: PGstVideoDecoder; frame: PGstVideoCodecFrame); cdecl; external libgstvideo;
procedure gst_video_decoder_merge_tags(decoder: PGstVideoDecoder; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstvideo;
function gst_video_decoder_proxy_getcaps(decoder: PGstVideoDecoder; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstvideo;
procedure gst_video_decoder_set_use_default_pad_acceptcaps(decoder: PGstVideoDecoder; use: Tgboolean); cdecl; external libgstvideo;

function GST_VIDEO_DECODER_CAST(obj: Pointer): PGstVideoDecoder;
function GST_VIDEO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_DECODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
function GST_VIDEO_DECODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
procedure GST_VIDEO_DECODER_STREAM_LOCK(decoder: Pointer);
procedure GST_VIDEO_DECODER_STREAM_UNLOCK(decoder: Pointer);


// === Konventiert am: 29-9-24 17:22:57 ===

function GST_TYPE_VIDEO_DECODER: TGType;
function GST_VIDEO_DECODER(obj: Pointer): PGstVideoDecoder;
function GST_VIDEO_DECODER_CLASS(klass: Pointer): PGstVideoDecoderClass;
function GST_IS_VIDEO_DECODER(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_DECODER_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_DECODER_GET_CLASS(obj: Pointer): PGstVideoDecoderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_DECODER: TGType;
begin
  GST_TYPE_VIDEO_DECODER := gst_video_decoder_get_type;
end;

function GST_VIDEO_DECODER(obj: Pointer): PGstVideoDecoder;
begin
  Result := PGstVideoDecoder(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DECODER));
end;

function GST_VIDEO_DECODER_CLASS(klass: Pointer): PGstVideoDecoderClass;
begin
  Result := PGstVideoDecoderClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_DECODER));
end;

function GST_IS_VIDEO_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_DECODER);
end;

function GST_IS_VIDEO_DECODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_DECODER);
end;

function GST_VIDEO_DECODER_GET_CLASS(obj: Pointer): PGstVideoDecoderClass;
begin
  Result := PGstVideoDecoderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VIDEO_DECODER_CAST(obj: Pointer): PGstVideoDecoder;
begin
  GST_VIDEO_DECODER_CAST := PGstVideoDecoder(obj);
end;

function GST_VIDEO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_VIDEO_DECODER_SRC_PAD := (PGstVideoDecoder(obj))^.srcpad;
end;

function GST_VIDEO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_VIDEO_DECODER_SINK_PAD := (PGstVideoDecoder(obj))^.sinkpad;
end;

function GST_VIDEO_DECODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_VIDEO_DECODER_INPUT_SEGMENT := (GST_VIDEO_DECODER_CAST(obj))^.input_segment;
end;

function GST_VIDEO_DECODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_VIDEO_DECODER_OUTPUT_SEGMENT := (GST_VIDEO_DECODER_CAST(obj))^.output_segment;
end;

procedure GST_VIDEO_DECODER_STREAM_LOCK(decoder: Pointer);
begin
  g_rec_mutex_lock(@((GST_VIDEO_DECODER(decoder))^.stream_lock));
end;

procedure GST_VIDEO_DECODER_STREAM_UNLOCK(decoder: Pointer);
begin
  g_rec_mutex_unlock(@((GST_VIDEO_DECODER(decoder))^.stream_lock));
end;


{$ENDIF read_implementation}
