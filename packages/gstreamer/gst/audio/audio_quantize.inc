/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

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

type
  TGstAudioQuantize = record
  end;
  PGstAudioQuantize = ^TGstAudioQuantize;

function gst_audio_quantize_new(dither: TGstAudioDitherMethod; ns: TGstAudioNoiseShapingMethod; flags: TGstAudioQuantizeFlags; format: TGstAudioFormat; channels: Tguint;
  quantizer: Tguint): PGstAudioQuantize; cdecl; external libgstaudio;
procedure gst_audio_quantize_free(quant: PGstAudioQuantize); cdecl; external libgstaudio;
procedure gst_audio_quantize_reset(quant: PGstAudioQuantize); cdecl; external libgstaudio;
procedure gst_audio_quantize_samples(quant: PGstAudioQuantize; in_: Pgpointer; out_: Pgpointer; samples: Tguint); cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:49:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
