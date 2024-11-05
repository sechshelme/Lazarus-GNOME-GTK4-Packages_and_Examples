/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_AUDIO_CONVERTER_OPT_RESAMPLER_METHOD = 'GstAudioConverter.resampler-method';
  GST_AUDIO_CONVERTER_OPT_DITHER_METHOD = 'GstAudioConverter.dither-method';
  GST_AUDIO_CONVERTER_OPT_NOISE_SHAPING_METHOD = 'GstAudioConverter.noise-shaping-method';
  GST_AUDIO_CONVERTER_OPT_QUANTIZATION = 'GstAudioConverter.quantization';
  GST_AUDIO_CONVERTER_OPT_MIX_MATRIX = 'GstAudioConverter.mix-matrix';
  GST_AUDIO_CONVERTER_OPT_DITHER_THRESHOLD = 'GstAudioConverter.dither-threshold';

type
  PGstAudioConverterFlags = ^TGstAudioConverterFlags;
  TGstAudioConverterFlags = longint;

const
  GST_AUDIO_CONVERTER_FLAG_NONE = 0;
  GST_AUDIO_CONVERTER_FLAG_IN_WRITABLE = 1 shl 0;
  GST_AUDIO_CONVERTER_FLAG_VARIABLE_RATE = 1 shl 1;

type
  TGstAudioConverter = record
  end;
  PGstAudioConverter = ^TGstAudioConverter;

function gst_audio_converter_new(flags: TGstAudioConverterFlags; in_info: PGstAudioInfo; out_info: PGstAudioInfo; config: PGstStructure): PGstAudioConverter; cdecl; external libgstaudio;
function gst_audio_converter_get_type: TGType; cdecl; external libgstaudio;
procedure gst_audio_converter_free(convert: PGstAudioConverter); cdecl; external libgstaudio;
procedure gst_audio_converter_reset(convert: PGstAudioConverter); cdecl; external libgstaudio;
function gst_audio_converter_update_config(convert: PGstAudioConverter; in_rate: Tgint; out_rate: Tgint; config: PGstStructure): Tgboolean; cdecl; external libgstaudio;
function gst_audio_converter_get_config(convert: PGstAudioConverter; in_rate: Pgint; out_rate: Pgint): PGstStructure; cdecl; external libgstaudio;
function gst_audio_converter_get_out_frames(convert: PGstAudioConverter; in_frames: Tgsize): Tgsize; cdecl; external libgstaudio;
function gst_audio_converter_get_in_frames(convert: PGstAudioConverter; out_frames: Tgsize): Tgsize; cdecl; external libgstaudio;
function gst_audio_converter_get_max_latency(convert: PGstAudioConverter): Tgsize; cdecl; external libgstaudio;
function gst_audio_converter_samples(convert: PGstAudioConverter; flags: TGstAudioConverterFlags; in_: Pgpointer; in_frames: Tgsize; out_: Pgpointer;
  out_frames: Tgsize): Tgboolean; cdecl; external libgstaudio;
function gst_audio_converter_supports_inplace(convert: PGstAudioConverter): Tgboolean; cdecl; external libgstaudio;
function gst_audio_converter_is_passthrough(convert: PGstAudioConverter): Tgboolean; cdecl; external libgstaudio;
function gst_audio_converter_convert(convert: PGstAudioConverter; flags: TGstAudioConverterFlags; in_: Tgpointer; in_size: Tgsize; out_: Pgpointer;
  out_size: Pgsize): Tgboolean; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 18:08:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
