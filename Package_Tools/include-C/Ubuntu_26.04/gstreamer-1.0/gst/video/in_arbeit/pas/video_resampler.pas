unit video_resampler;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
type
  PGstVideoResamplerMethod = ^TGstVideoResamplerMethod;
  TGstVideoResamplerMethod = longint;
const
  GST_VIDEO_RESAMPLER_METHOD_NEAREST = 0;
  GST_VIDEO_RESAMPLER_METHOD_LINEAR = 1;
  GST_VIDEO_RESAMPLER_METHOD_CUBIC = 2;
  GST_VIDEO_RESAMPLER_METHOD_SINC = 3;
  GST_VIDEO_RESAMPLER_METHOD_LANCZOS = 4;

type
  PGstVideoResamplerFlags = ^TGstVideoResamplerFlags;
  TGstVideoResamplerFlags = longint;
const
  GST_VIDEO_RESAMPLER_FLAG_NONE = 0;
  GST_VIDEO_RESAMPLER_FLAG_HALF_TAPS = 1 shl 0;

const
  GST_VIDEO_RESAMPLER_OPT_CUBIC_B = 'GstVideoResampler.cubic-b';
  GST_VIDEO_RESAMPLER_OPT_CUBIC_C = 'GstVideoResampler.cubic-c';
  GST_VIDEO_RESAMPLER_OPT_ENVELOPE = 'GstVideoResampler.envelope';
  GST_VIDEO_RESAMPLER_OPT_SHARPNESS = 'GstVideoResampler.sharpness';
  GST_VIDEO_RESAMPLER_OPT_SHARPEN = 'GstVideoResampler.sharpen';
  GST_VIDEO_RESAMPLER_OPT_MAX_TAPS = 'GstVideoResampler.max-taps';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoResampler = ^TGstVideoResampler;
  TGstVideoResampler = record
    in_size: Tgint;
    out_size: Tgint;
    max_taps: Tguint;
    n_phases: Tguint;
    offset: Pguint32;
    phase: Pguint32;
    n_taps: Pguint32;
    taps: Pgdouble;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_resampler_init(resampler: PGstVideoResampler; method: TGstVideoResamplerMethod; flags: TGstVideoResamplerFlags; n_phases: Tguint; n_taps: Tguint;
  shift: Tgdouble; in_size: Tguint; out_size: Tguint; options: PGstStructure): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_resampler_clear(resampler: PGstVideoResampler); cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:39:09 ===


implementation



end.
