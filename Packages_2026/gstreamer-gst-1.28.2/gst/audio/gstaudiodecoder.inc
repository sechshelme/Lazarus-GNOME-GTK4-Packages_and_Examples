

  {$IFDEF read_enum}
const
  GST_AUDIO_DECODER_SINK_NAME = 'sink';
  GST_AUDIO_DECODER_SRC_NAME = 'src';

  GST_AUDIO_DECODER_MAX_ERRORS = -(1);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstAudioDecoderPrivate = type Pointer;

  PGstAudioDecoder = ^TGstAudioDecoder;
  TGstAudioDecoder = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    stream_lock: TGRecMutex;
    input_segment: TGstSegment;
    output_segment: TGstSegment;
    priv: PGstAudioDecoderPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstAudioDecoderClass = ^TGstAudioDecoderClass;
  TGstAudioDecoderClass = record
    element_class: TGstElementClass;
    start: function(dec: PGstAudioDecoder): Tgboolean; cdecl;
    stop: function(dec: PGstAudioDecoder): Tgboolean; cdecl;
    set_format: function(dec: PGstAudioDecoder; caps: PGstCaps): Tgboolean; cdecl;
    parse: function(dec: PGstAudioDecoder; adapter: PGstAdapter; offset: Pgint; length: Pgint): TGstFlowReturn; cdecl;
    handle_frame: function(dec: PGstAudioDecoder; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    flush: procedure(dec: PGstAudioDecoder; hard: Tgboolean); cdecl;
    pre_push: function(dec: PGstAudioDecoder; buffer: PPGstBuffer): TGstFlowReturn; cdecl;
    sink_event: function(dec: PGstAudioDecoder; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(dec: PGstAudioDecoder; event: PGstEvent): Tgboolean; cdecl;
    open: function(dec: PGstAudioDecoder): Tgboolean; cdecl;
    close: function(dec: PGstAudioDecoder): Tgboolean; cdecl;
    negotiate: function(dec: PGstAudioDecoder): Tgboolean; cdecl;
    decide_allocation: function(dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    sink_query: function(dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    getcaps: function(dec: PGstAudioDecoder; filter: PGstCaps): PGstCaps; cdecl;
    transform_meta: function(enc: PGstAudioDecoder; outbuf: PGstBuffer; meta: PGstMeta; inbuf: PGstBuffer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 4) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function _gst_audio_decoder_error(dec: PGstAudioDecoder; weight: Tgint; domain: TGQuark; code: Tgint; txt: Pgchar;
  debug: Pgchar; file_: Pgchar; _function: Pgchar; line: Tgint): TGstFlowReturn; cdecl; external libgstaudio;

function gst_audio_decoder_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_decoder_set_output_format(dec: PGstAudioDecoder; info: PGstAudioInfo): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_set_output_caps(dec: PGstAudioDecoder; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_proxy_getcaps(decoder: PGstAudioDecoder; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstaudio;
function gst_audio_decoder_negotiate(dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_finish_subframe(dec: PGstAudioDecoder; buf: PGstBuffer): TGstFlowReturn; cdecl; external libgstaudio;
function gst_audio_decoder_finish_frame(dec: PGstAudioDecoder; buf: PGstBuffer; frames: Tgint): TGstFlowReturn; cdecl; external libgstaudio;
function gst_audio_decoder_allocate_output_buffer(dec: PGstAudioDecoder; size: Tgsize): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_decoder_get_audio_info(dec: PGstAudioDecoder): PGstAudioInfo; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_plc_aware(dec: PGstAudioDecoder; plc: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_plc_aware(dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_estimate_rate(dec: PGstAudioDecoder; enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_estimate_rate(dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
function gst_audio_decoder_get_delay(dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_max_errors(dec: PGstAudioDecoder; num: Tgint); cdecl; external libgstaudio;
function gst_audio_decoder_get_max_errors(dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_latency(dec: PGstAudioDecoder; min: TGstClockTime; max: TGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_decoder_get_latency(dec: PGstAudioDecoder; min: PGstClockTime; max: PGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_decoder_get_parse_state(dec: PGstAudioDecoder; sync: Pgboolean; eos: Pgboolean); cdecl; external libgstaudio;
procedure gst_audio_decoder_set_allocation_caps(dec: PGstAudioDecoder; allocation_caps: PGstCaps); cdecl; external libgstaudio;

procedure gst_audio_decoder_set_plc(dec: PGstAudioDecoder; enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_plc(dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_min_latency(dec: PGstAudioDecoder; num: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_decoder_get_min_latency(dec: PGstAudioDecoder): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_tolerance(dec: PGstAudioDecoder; tolerance: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_decoder_get_tolerance(dec: PGstAudioDecoder): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_drainable(dec: PGstAudioDecoder; enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_drainable(dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_needs_format(dec: PGstAudioDecoder; enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_needs_format(dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_get_allocator(dec: PGstAudioDecoder; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstaudio;
procedure gst_audio_decoder_merge_tags(dec: PGstAudioDecoder; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstaudio;
procedure gst_audio_decoder_set_use_default_pad_acceptcaps(decoder: PGstAudioDecoder; use: Tgboolean); cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:17:20 ===

function GST_AUDIO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
function GST_AUDIO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
procedure GST_AUDIO_DECODER_STREAM_LOCK(Dec: Pointer);
procedure GST_AUDIO_DECODER_STREAM_UNLOCK(Dec: Pointer);
function GST_AUDIO_DECODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
function GST_AUDIO_DECODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;

function GST_AUDIO_DECODER_CAST(obj: Pointer): PGstAudioDecoder;
function GST_TYPE_AUDIO_DECODER: TGType;
function GST_AUDIO_DECODER(obj: Pointer): PGstAudioDecoder;
function GST_AUDIO_DECODER_CLASS(klass: Pointer): PGstAudioDecoderClass;
function GST_IS_AUDIO_DECODER(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_DECODER_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_DECODER_GET_CLASS(klass: Pointer): PGstAudioDecoderClass;
{$ENDIF read_struct}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_DECODER: TGType;
begin
  GST_TYPE_AUDIO_DECODER := gst_audio_decoder_get_type;
end;

function GST_AUDIO_DECODER(obj: Pointer): PGstAudioDecoder;
begin
  Result := PGstAudioDecoder(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_DECODER));
end;

function GST_AUDIO_DECODER_CLASS(klass: Pointer): PGstAudioDecoderClass;
begin
  Result := PGstAudioDecoderClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_DECODER));
end;

function GST_IS_AUDIO_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_DECODER);
end;

function GST_IS_AUDIO_DECODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_DECODER);
end;

function GST_AUDIO_DECODER_GET_CLASS(klass: Pointer): PGstAudioDecoderClass;
begin
  Result := PGstAudioDecoderClass(PGTypeInstance(klass)^.g_class);
end;


function GST_AUDIO_DECODER_CAST(obj: Pointer): PGstAudioDecoder;
begin
  GST_AUDIO_DECODER_CAST := PGstAudioDecoder(obj);
end;

function GST_AUDIO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_DECODER_SRC_PAD := (PGstAudioDecoder(obj))^.srcpad;
end;

function GST_AUDIO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_AUDIO_DECODER_SINK_PAD := (PGstAudioDecoder(obj))^.sinkpad;
end;

procedure GST_AUDIO_DECODER_STREAM_LOCK(Dec: Pointer);
begin
  g_rec_mutex_lock(@((GST_AUDIO_DECODER(Dec))^.stream_lock));
end;

procedure GST_AUDIO_DECODER_STREAM_UNLOCK(Dec: Pointer);
begin
  g_rec_mutex_unlock(@((GST_AUDIO_DECODER(Dec))^.stream_lock));
end;

function GST_AUDIO_DECODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_AUDIO_DECODER_INPUT_SEGMENT := (GST_AUDIO_DECODER_CAST(obj))^.input_segment;
end;

function GST_AUDIO_DECODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;
begin
  GST_AUDIO_DECODER_OUTPUT_SEGMENT := (GST_AUDIO_DECODER_CAST(obj))^.output_segment;
end;

{$ENDIF read_implementation}
