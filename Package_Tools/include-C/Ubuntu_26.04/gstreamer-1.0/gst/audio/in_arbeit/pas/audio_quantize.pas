unit audio_quantize;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, audio_format;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstAudioDitherMethod = ^TGstAudioDitherMethod;
  TGstAudioDitherMethod = longint;
const
  GST_AUDIO_DITHER_NONE = 0;
  GST_AUDIO_DITHER_RPDF = 1;
  GST_AUDIO_DITHER_TPDF = 2;
  GST_AUDIO_DITHER_TPDF_HF = 3;

type
  PGstAudioNoiseShapingMethod = ^TGstAudioNoiseShapingMethod;
  TGstAudioNoiseShapingMethod = longint;
const
  GST_AUDIO_NOISE_SHAPING_NONE = 0;
  GST_AUDIO_NOISE_SHAPING_ERROR_FEEDBACK = 1;
  GST_AUDIO_NOISE_SHAPING_SIMPLE = 2;
  GST_AUDIO_NOISE_SHAPING_MEDIUM = 3;
  GST_AUDIO_NOISE_SHAPING_HIGH = 4;

type
  PGstAudioQuantizeFlags = ^TGstAudioQuantizeFlags;
  TGstAudioQuantizeFlags = longint;
const
  GST_AUDIO_QUANTIZE_FLAG_NONE = 0;
  GST_AUDIO_QUANTIZE_FLAG_NON_INTERLEAVED = 1 shl 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstAudioQuantize = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_audio_quantize_new(dither: TGstAudioDitherMethod; ns: TGstAudioNoiseShapingMethod; flags: TGstAudioQuantizeFlags; format: TGstAudioFormat; channels: Tguint;
  quantizer: Tguint): PGstAudioQuantize; cdecl; external libgstaudio;
procedure gst_audio_quantize_free(quant: PGstAudioQuantize); cdecl; external libgstaudio;
procedure gst_audio_quantize_reset(quant: PGstAudioQuantize); cdecl; external libgstaudio;
procedure gst_audio_quantize_samples(quant: PGstAudioQuantize; in_: Pgpointer; out_: Pgpointer; samples: Tguint); cdecl; external libgstaudio;
{$ENDIF read_function}

// === Konventiert am: 16-7-26 15:10:22 ===


implementation



end.
