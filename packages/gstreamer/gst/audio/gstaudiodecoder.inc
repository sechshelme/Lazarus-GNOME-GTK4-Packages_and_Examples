/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_AUDIO_DECODER_SINK_NAME = 'sink';
  GST_AUDIO_DECODER_SRC_NAME = 'src';

const
  GST_AUDIO_DECODER_MAX_ERRORS = -(1);

type
  TGstAudioDecoderPrivate = record
  end;
  PGstAudioDecoderPrivate = ^TGstAudioDecoderPrivate;

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
    start: function(Dec: PGstAudioDecoder): Tgboolean; cdecl;
    stop: function(Dec: PGstAudioDecoder): Tgboolean; cdecl;
    set_format: function(Dec: PGstAudioDecoder; caps: PGstCaps): Tgboolean; cdecl;
    parse: function(Dec: PGstAudioDecoder; adapter: PGstAdapter; offset: Pgint; length: Pgint): TGstFlowReturn; cdecl;
    handle_frame: function(Dec: PGstAudioDecoder; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    flush: procedure(Dec: PGstAudioDecoder; hard: Tgboolean); cdecl;
    pre_push: function(Dec: PGstAudioDecoder; buffer: PPGstBuffer): TGstFlowReturn; cdecl;
    sink_event: function(Dec: PGstAudioDecoder; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(Dec: PGstAudioDecoder; event: PGstEvent): Tgboolean; cdecl;
    Open: function(Dec: PGstAudioDecoder): Tgboolean; cdecl;
    Close: function(Dec: PGstAudioDecoder): Tgboolean; cdecl;
    negotiate: function(Dec: PGstAudioDecoder): Tgboolean; cdecl;
    decide_allocation: function(Dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(Dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    sink_query: function(Dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    src_query: function(Dec: PGstAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    getcaps: function(Dec: PGstAudioDecoder; filter: PGstCaps): PGstCaps; cdecl;
    transform_meta: function(enc: PGstAudioDecoder; outbuf: PGstBuffer; meta: PGstMeta; inbuf: PGstBuffer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 4) - 1] of Tgpointer;
  end;

function _gst_audio_decoder_error(Dec: PGstAudioDecoder; weight: Tgint; domain: TGQuark; code: Tgint; txt: Pgchar;
  debug: Pgchar; file_: Pgchar; _function: Pgchar; line: Tgint): TGstFlowReturn; cdecl; external libgstaudio;

function gst_audio_decoder_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_decoder_set_output_format(Dec: PGstAudioDecoder; info: PGstAudioInfo): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_set_output_caps(Dec: PGstAudioDecoder; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_proxy_getcaps(decoder: PGstAudioDecoder; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl; external libgstaudio;
function gst_audio_decoder_negotiate(Dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
function gst_audio_decoder_finish_subframe(Dec: PGstAudioDecoder; buf: PGstBuffer): TGstFlowReturn; cdecl; external libgstaudio;
function gst_audio_decoder_finish_frame(Dec: PGstAudioDecoder; buf: PGstBuffer; frames: Tgint): TGstFlowReturn; cdecl; external libgstaudio;
function gst_audio_decoder_allocate_output_buffer(Dec: PGstAudioDecoder; size: Tgsize): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_decoder_get_audio_info(Dec: PGstAudioDecoder): PGstAudioInfo; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_plc_aware(Dec: PGstAudioDecoder; plc: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_plc_aware(Dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_estimate_rate(Dec: PGstAudioDecoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_estimate_rate(Dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
function gst_audio_decoder_get_delay(Dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_max_errors(Dec: PGstAudioDecoder; num: Tgint); cdecl; external libgstaudio;
function gst_audio_decoder_get_max_errors(Dec: PGstAudioDecoder): Tgint; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_latency(Dec: PGstAudioDecoder; min: TGstClockTime; max: TGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_decoder_get_latency(Dec: PGstAudioDecoder; min: PGstClockTime; max: PGstClockTime); cdecl; external libgstaudio;
procedure gst_audio_decoder_get_parse_state(Dec: PGstAudioDecoder; sync: Pgboolean; eos: Pgboolean); cdecl; external libgstaudio;
procedure gst_audio_decoder_set_allocation_caps(Dec: PGstAudioDecoder; allocation_caps: PGstCaps); cdecl; external libgstaudio;
procedure gst_audio_decoder_set_plc(Dec: PGstAudioDecoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_plc(Dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_min_latency(Dec: PGstAudioDecoder; num: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_decoder_get_min_latency(Dec: PGstAudioDecoder): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_tolerance(Dec: PGstAudioDecoder; tolerance: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_decoder_get_tolerance(Dec: PGstAudioDecoder): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_drainable(Dec: PGstAudioDecoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_drainable(Dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_set_needs_format(Dec: PGstAudioDecoder; Enabled: Tgboolean); cdecl; external libgstaudio;
function gst_audio_decoder_get_needs_format(Dec: PGstAudioDecoder): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_decoder_get_allocator(Dec: PGstAudioDecoder; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstaudio;
procedure gst_audio_decoder_merge_tags(Dec: PGstAudioDecoder; tags: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstaudio;
procedure gst_audio_decoder_set_use_default_pad_acceptcaps(decoder: PGstAudioDecoder; use: Tgboolean); cdecl; external libgstaudio;

function GST_AUDIO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
function GST_AUDIO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
procedure GST_AUDIO_DECODER_STREAM_LOCK(Dec: Pointer);
procedure GST_AUDIO_DECODER_STREAM_UNLOCK(Dec: Pointer);
function GST_AUDIO_DECODER_INPUT_SEGMENT(obj: Pointer): TGstSegment;
function GST_AUDIO_DECODER_OUTPUT_SEGMENT(obj: Pointer): TGstSegment;

function GST_AUDIO_DECODER_CAST(obj: Pointer): PGstAudioDecoder;


// === Konventiert am: 28-9-24 15:04:44 ===

function GST_TYPE_AUDIO_DECODER: TGType;
function GST_AUDIO_DECODER(obj: Pointer): PGstAudioDecoder;
function GST_AUDIO_DECODER_CLASS(klass: Pointer): PGstAudioDecoderClass;
function GST_IS_AUDIO_DECODER(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_DECODER_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_DECODER_GET_CLASS(klass: Pointer): PGstAudioDecoderClass;

{$ENDIF read_interface}


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

// ====

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
