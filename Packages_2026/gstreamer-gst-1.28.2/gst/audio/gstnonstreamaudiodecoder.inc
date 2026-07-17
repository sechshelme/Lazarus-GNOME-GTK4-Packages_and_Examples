

  {$IFDEF read_enum}
type
  PGstNonstreamAudioOutputMode = ^TGstNonstreamAudioOutputMode;
  TGstNonstreamAudioOutputMode = longint;
const
  GST_NONSTREAM_AUDIO_OUTPUT_MODE_LOOPING = 0;
  GST_NONSTREAM_AUDIO_OUTPUT_MODE_STEADY = 1;

type
  PGstNonstreamAudioSubsongMode = ^TGstNonstreamAudioSubsongMode;
  TGstNonstreamAudioSubsongMode = longint;
const
  GST_NONSTREAM_AUDIO_SUBSONG_MODE_SINGLE = 0;
  GST_NONSTREAM_AUDIO_SUBSONG_MODE_ALL = 1;
  GST_NONSTREAM_AUDIO_SUBSONG_MODE_DECODER_DEFAULT = 2;

const
  GST_NONSTREAM_AUDIO_DECODER_SINK_NAME = 'sink';
  GST_NONSTREAM_AUDIO_DECODER_SRC_NAME = 'src';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstNonstreamAudioDecoder = ^TGstNonstreamAudioDecoder;
  TGstNonstreamAudioDecoder = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    upstream_size: Tgint64;
    loaded_mode: Tgboolean;
    input_data_adapter: PGstAdapter;
    current_subsong: Tguint;
    subsong_mode: TGstNonstreamAudioSubsongMode;
    subsong_duration: TGstClockTime;
    output_mode: TGstNonstreamAudioOutputMode;
    num_loops: Tgint;
    output_format_changed: Tgboolean;
    output_audio_info: TGstAudioInfo;
    cur_pos_in_samples: Tguint64;
    num_decoded_samples: Tguint64;
    cur_segment: TGstSegment;
    discont: Tgboolean;
    toc: PGstToc;
    allocator: PGstAllocator;
    allocation_params: TGstAllocationParams;
    mutex: TGMutex;
  end;

  PGstNonstreamAudioDecoderClass = ^TGstNonstreamAudioDecoderClass;
  TGstNonstreamAudioDecoderClass = record
    element_class: TGstElementClass;
    loads_from_sinkpad: Tgboolean;
    seek: function(dec: PGstNonstreamAudioDecoder; new_position: PGstClockTime): Tgboolean; cdecl;
    tell: function(dec: PGstNonstreamAudioDecoder): TGstClockTime; cdecl;
    load_from_buffer: function(dec: PGstNonstreamAudioDecoder; source_data: PGstBuffer; initial_subsong: Tguint; initial_subsong_mode: TGstNonstreamAudioSubsongMode; initial_position: PGstClockTime;
      initial_output_mode: PGstNonstreamAudioOutputMode; initial_num_loops: Pgint): Tgboolean; cdecl;
    load_from_custom: function(dec: PGstNonstreamAudioDecoder; initial_subsong: Tguint; initial_subsong_mode: TGstNonstreamAudioSubsongMode; initial_position: PGstClockTime; initial_output_mode: PGstNonstreamAudioOutputMode;
      initial_num_loops: Pgint): Tgboolean; cdecl;
    get_main_tags: function(dec: PGstNonstreamAudioDecoder): PGstTagList; cdecl;
    set_current_subsong: function(dec: PGstNonstreamAudioDecoder; subsong: Tguint; initial_position: PGstClockTime): Tgboolean; cdecl;
    get_current_subsong: function(dec: PGstNonstreamAudioDecoder): Tguint; cdecl;
    get_num_subsongs: function(dec: PGstNonstreamAudioDecoder): Tguint; cdecl;
    get_subsong_duration: function(dec: PGstNonstreamAudioDecoder; subsong: Tguint): TGstClockTime; cdecl;
    get_subsong_tags: function(dec: PGstNonstreamAudioDecoder; subsong: Tguint): PGstTagList; cdecl;
    set_subsong_mode: function(dec: PGstNonstreamAudioDecoder; mode: TGstNonstreamAudioSubsongMode; initial_position: PGstClockTime): Tgboolean; cdecl;
    set_num_loops: function(dec: PGstNonstreamAudioDecoder; num_loops: Tgint): Tgboolean; cdecl;
    get_num_loops: function(dec: PGstNonstreamAudioDecoder): Tgint; cdecl;
    get_supported_output_modes: function(dec: PGstNonstreamAudioDecoder): Tguint; cdecl;
    set_output_mode: function(dec: PGstNonstreamAudioDecoder; mode: TGstNonstreamAudioOutputMode; current_position: PGstClockTime): Tgboolean; cdecl;
    decode: function(dec: PGstNonstreamAudioDecoder; buffer: PPGstBuffer; num_samples: Pguint): Tgboolean; cdecl;
    negotiate: function(dec: PGstNonstreamAudioDecoder): Tgboolean; cdecl;
    decide_allocation: function(dec: PGstNonstreamAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(dec: PGstNonstreamAudioDecoder; query: PGstQuery): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_nonstream_audio_decoder_get_type: TGType; cdecl; external libgstaudio;
procedure gst_nonstream_audio_decoder_handle_loop(dec: PGstNonstreamAudioDecoder; new_position: TGstClockTime); cdecl; external libgstaudio;
function gst_nonstream_audio_decoder_set_output_format(dec: PGstNonstreamAudioDecoder; audio_info: PGstAudioInfo): Tgboolean; cdecl; external libgstaudio;
function gst_nonstream_audio_decoder_set_output_format_simple(dec: PGstNonstreamAudioDecoder; sample_rate: Tguint; sample_format: TGstAudioFormat; num_channels: Tguint): Tgboolean; cdecl; external libgstaudio;
procedure gst_nonstream_audio_decoder_get_downstream_info(dec: PGstNonstreamAudioDecoder; format: PGstAudioFormat; sample_rate: Pgint; num_channels: Pgint); cdecl; external libgstaudio;
function gst_nonstream_audio_decoder_allocate_output_buffer(dec: PGstNonstreamAudioDecoder; size: Tgsize): PGstBuffer; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:25:47 ===

function GST_NONSTREAM_AUDIO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
function GST_NONSTREAM_AUDIO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
procedure GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX(obj: Pointer);
procedure GST_NONSTREAM_AUDIO_DECODER_UNLOCK_MUTEX(obj: Pointer);

function GST_NONSTREAM_AUDIO_DECODER_CAST(obj: Pointer): PGstNonstreamAudioDecoder;
function GST_TYPE_NONSTREAM_AUDIO_DECODER: TGType;
function GST_NONSTREAM_AUDIO_DECODER(obj: Pointer): PGstNonstreamAudioDecoder;
function GST_NONSTREAM_AUDIO_DECODER_CLASS(klass: Pointer): PGstNonstreamAudioDecoderClass;
function GST_IS_NONSTREAM_AUDIO_DECODER(obj: Pointer): Tgboolean;
function GST_IS_NONSTREAM_AUDIO_DECODER_CLASS(klass: Pointer): Tgboolean;
function GST_NONSTREAM_AUDIO_DECODER_GET_CLASS(obj: Pointer): PGstNonstreamAudioDecoderClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_NONSTREAM_AUDIO_DECODER: TGType;
begin
  GST_TYPE_NONSTREAM_AUDIO_DECODER := gst_nonstream_audio_decoder_get_type;
end;

function GST_NONSTREAM_AUDIO_DECODER(obj: Pointer): PGstNonstreamAudioDecoder;
begin
  Result := PGstNonstreamAudioDecoder(g_type_check_instance_cast(obj, GST_TYPE_NONSTREAM_AUDIO_DECODER));
end;

function GST_NONSTREAM_AUDIO_DECODER_CLASS(klass: Pointer): PGstNonstreamAudioDecoderClass;
begin
  Result := PGstNonstreamAudioDecoderClass(g_type_check_class_cast(klass, GST_TYPE_NONSTREAM_AUDIO_DECODER));
end;

function GST_IS_NONSTREAM_AUDIO_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_NONSTREAM_AUDIO_DECODER);
end;

function GST_IS_NONSTREAM_AUDIO_DECODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_NONSTREAM_AUDIO_DECODER);
end;

function GST_NONSTREAM_AUDIO_DECODER_GET_CLASS(obj: Pointer): PGstNonstreamAudioDecoderClass;
begin
  Result := PGstNonstreamAudioDecoderClass(PGTypeInstance(obj)^.g_class);
end;


function GST_NONSTREAM_AUDIO_DECODER_CAST(obj: Pointer): PGstNonstreamAudioDecoder;
begin
  GST_NONSTREAM_AUDIO_DECODER_CAST := PGstNonstreamAudioDecoder(obj);
end;

function GST_NONSTREAM_AUDIO_DECODER_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_NONSTREAM_AUDIO_DECODER_SINK_PAD := (PGstNonstreamAudioDecoder(obj))^.sinkpad;
end;

function GST_NONSTREAM_AUDIO_DECODER_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_NONSTREAM_AUDIO_DECODER_SRC_PAD := (PGstNonstreamAudioDecoder(obj))^.srcpad;
end;

procedure GST_NONSTREAM_AUDIO_DECODER_LOCK_MUTEX(obj: Pointer);
begin
  g_mutex_lock(@((PGstNonstreamAudioDecoder(obj))^.mutex));
end;

procedure GST_NONSTREAM_AUDIO_DECODER_UNLOCK_MUTEX(obj: Pointer);
begin
  g_mutex_unlock(@((PGstNonstreamAudioDecoder(obj))^.mutex));
end;

{$ENDIF read_implementation}
