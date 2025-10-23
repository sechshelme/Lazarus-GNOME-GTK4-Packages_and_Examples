
{$IFDEF read_interface}


const
  GST_AUDIO_ENCODER_SINK_NAME = 'sink';
  GST_AUDIO_ENCODER_SRC_NAME = 'src';

type
  TGstAudioEncoderPrivate = record
  end;
  PGstAudioEncoderPrivate = ^TGstAudioEncoderPrivate;

  PGstAudioEncoder = ^TGstAudioEncoder;

  TGstAudioEncoder = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    stream_lock: TGRecMutex;
    input_segment: TGstSegment;
    output_segment: TGstSegment;
    priv: PGstAudioEncoderPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstAudioEncoderClass = ^TGstAudioEncoderClass;

  TGstAudioEncoderClass = record
    element_class: TGstElementClass;
    start: function(enc: PGstAudioEncoder): Tgboolean; cdecl;
    stop: function(enc: PGstAudioEncoder): Tgboolean; cdecl;
    set_format: function(enc: PGstAudioEncoder; info: PGstAudioInfo): Tgboolean; cdecl;
    handle_frame: function(enc: PGstAudioEncoder; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    flush: procedure(enc: PGstAudioEncoder); cdecl;
    pre_push: function(enc: PGstAudioEncoder; buffer: PPGstBuffer): TGstFlowReturn; cdecl;
    sink_event: function(enc: PGstAudioEncoder; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(enc: PGstAudioEncoder; event: PGstEvent): Tgboolean; cdecl;
    getcaps: function(enc: PGstAudioEncoder; filter: PGstCaps): PGstCaps; cdecl;
    Open: function(enc: PGstAudioEncoder): Tgboolean; cdecl;
    Close: function(enc: PGstAudioEncoder): Tgboolean; cdecl;
    negotiate: function(enc: PGstAudioEncoder): Tgboolean; cdecl;
    decide_allocation: function(enc: PGstAudioEncoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(enc: PGstAudioEncoder; query: PGstQuery): Tgboolean; cdecl;
    transform_meta: function(enc: PGstAudioEncoder; outbuf: PGstBuffer; meta: PGstMeta; inbuf: PGstBuffer): Tgboolean; cdecl;
    sink_query: function(encoder: PGstAudioEncoder; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(encoder: PGstAudioEncoder; query: PGstQuery): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 3) - 1] of Tgpointer;
  end;


function gst_audio_encoder_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_encoder_finish_frame(enc: PGstAudioEncoder; buffer: PGstBuffer; samples: Tgint): TGstFlowReturn; cdecl; external libgstaudio;
function gst_audio_encoder_proxy_getcaps(enc: PGstAudioEncoder; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstaudio;
function gst_audio_encoder_set_output_format(enc: PGstAudioEncoder; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
function gst_audio_encoder_negotiate(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
function gst_audio_encoder_allocate_output_buffer(enc: PGstAudioEncoder; size: Tgsize): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_encoder_get_audio_info(enc: PGstAudioEncoder): PGstAudioInfo; cdecl; external libgstaudio;
function gst_audio_encoder_get_frame_samples_min(enc: PGstAudioEncoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_frame_samples_min(enc: PGstAudioEncoder; num: Tgint); cdecl; external libgstaudio;
function gst_audio_encoder_get_frame_samples_max(enc: PGstAudioEncoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_frame_samples_max(enc: PGstAudioEncoder; num: Tgint); cdecl; external libgstaudio;
function gst_audio_encoder_get_frame_max(enc: PGstAudioEncoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_frame_max(enc: PGstAudioEncoder; num: Tgint); cdecl; external libgstaudio;
function gst_audio_encoder_get_lookahead(enc: PGstAudioEncoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_lookahead(enc: PGstAudioEncoder; num: Tgint); cdecl; external libgstaudio;
procedure gst_audio_encoder_get_latency(enc: PGstAudioEncoder; min: PGstClockTime; max: PGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_encoder_set_latency(enc: PGstAudioEncoder; min: TGstClockTime; max: TGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_encoder_set_headers(enc: PGstAudioEncoder; headers: PGList); cdecl; external libgstaudio;
procedure gst_audio_encoder_set_allocation_caps(enc: PGstAudioEncoder; allocation_caps: PGstCaps); cdecl; external libgstaudio;
procedure gst_audio_encoder_set_mark_granule(enc: PGstAudioEncoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_encoder_get_mark_granule(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_perfect_timestamp(enc: PGstAudioEncoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_encoder_get_perfect_timestamp(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_hard_resync(enc: PGstAudioEncoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_encoder_get_hard_resync(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_tolerance(enc: PGstAudioEncoder; tolerance: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_encoder_get_tolerance(enc: PGstAudioEncoder): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_hard_min(enc: PGstAudioEncoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_encoder_get_hard_min(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_encoder_set_drainable(enc: PGstAudioEncoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_encoder_get_drainable(enc: PGstAudioEncoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_encoder_get_allocator(enc: PGstAudioEncoder; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstaudio;
procedure gst_audio_encoder_merge_tags(enc: PGstAudioEncoder; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstaudio;

function GST_AUDIO_ENCODER_CAST(obj: Pointer): PGstAudioEncoder;

function GST_AUDIO_ENCODER_SRC_PAD(obj: Pointer): PGstPad;
function GST_AUDIO_ENCODER_SINK_PAD(obj: Pointer): PGstPad;
function GST_AUDIO_ENCODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
function GST_AUDIO_ENCODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
procedure GST_AUDIO_ENCODER_STREAM_LOCK(enc: Pointer);
procedure GST_AUDIO_ENCODER_STREAM_UNLOCK(enc: Pointer);


// === Konventiert am: 28-9-24 15:05:00 ===

function GST_TYPE_AUDIO_ENCODER: TGType;
function GST_AUDIO_ENCODER(obj: Pointer): PGstAudioEncoder;
function GST_AUDIO_ENCODER_CLASS(klass: Pointer): PGstAudioEncoderClass;
function GST_IS_AUDIO_ENCODER(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_ENCODER_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_ENCODER_GET_CLASS(obj: Pointer): PGstAudioEncoderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_ENCODER: TGType;
begin
  GST_TYPE_AUDIO_ENCODER := gst_audio_encoder_get_type;
end;

function GST_AUDIO_ENCODER(obj: Pointer): PGstAudioEncoder;
begin
  Result := PGstAudioEncoder(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_ENCODER));
end;

function GST_AUDIO_ENCODER_CLASS(klass: Pointer): PGstAudioEncoderClass;
begin
  Result := PGstAudioEncoderClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_ENCODER));
end;

function GST_IS_AUDIO_ENCODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_ENCODER);
end;

function GST_IS_AUDIO_ENCODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_ENCODER);
end;

function GST_AUDIO_ENCODER_GET_CLASS(obj: Pointer): PGstAudioEncoderClass;
begin
  Result := PGstAudioEncoderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_AUDIO_ENCODER_CAST(obj: Pointer): PGstAudioEncoder;
begin
  GST_AUDIO_ENCODER_CAST := PGstAudioEncoder(obj);
end;

function GST_AUDIO_ENCODER_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_ENCODER_SRC_PAD := (GST_AUDIO_ENCODER_CAST(obj))^.srcpad;
end;

function GST_AUDIO_ENCODER_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_ENCODER_SINK_PAD := (GST_AUDIO_ENCODER_CAST(obj))^.sinkpad;
end;

function GST_AUDIO_ENCODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_AUDIO_ENCODER_INPUT_SEGMENT := (GST_AUDIO_ENCODER_CAST(obj))^.input_segment;
end;

function GST_AUDIO_ENCODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_AUDIO_ENCODER_OUTPUT_SEGMENT := (GST_AUDIO_ENCODER_CAST(obj))^.output_segment;
end;

procedure GST_AUDIO_ENCODER_STREAM_LOCK(enc: Pointer);
begin
  g_rec_mutex_lock(@((GST_AUDIO_ENCODER(enc))^.stream_lock));
end;

procedure GST_AUDIO_ENCODER_STREAM_UNLOCK(enc: Pointer);
begin
  g_rec_mutex_unlock(@((GST_AUDIO_ENCODER(enc))^.stream_lock));
end;


{$ENDIF read_implementation}
