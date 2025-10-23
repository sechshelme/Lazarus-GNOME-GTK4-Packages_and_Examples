
{$IFDEF read_interface}

type
  PGstVideoResamplerMethod = ^TGstVideoResamplerMethod;
  TGstVideoResamplerMethod = longint;

const
  GST_VIDEO_RESAMPLER_METHOD_NEAREST = 0;
  GST_VIDEO_RESAMPLER_METHOD_LINEAR = 1;
  GST_VIDEO_RESAMPLER_METHOD_CUBIC = 2;
  GST_VIDEO_RESAMPLER_METHOD_SINC = 3;
  GST_VIDEO_RESAMPLER_METHOD_LANCZOS = 4;

const
  GST_VIDEO_RESAMPLER_OPT_CUBIC_B = 'GstVideoResampler.cubic-b';
  GST_VIDEO_RESAMPLER_OPT_CUBIC_C = 'GstVideoResampler.cubic-c';
  GST_VIDEO_RESAMPLER_OPT_ENVELOPE = 'GstVideoResampler.envelope';
  GST_VIDEO_RESAMPLER_OPT_SHARPNESS = 'GstVideoResampler.sharpness';
  GST_VIDEO_RESAMPLER_OPT_SHARPEN = 'GstVideoResampler.sharpen';
  GST_VIDEO_RESAMPLER_OPT_MAX_TAPS = 'GstVideoResampler.max-taps';

type
  PGstVideoResamplerFlags = ^TGstVideoResamplerFlags;
  TGstVideoResamplerFlags = longint;

const
  GST_VIDEO_RESAMPLER_FLAG_NONE = 0;
  GST_VIDEO_RESAMPLER_FLAG_HALF_TAPS = 1 shl 0;

type
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
  PGstVideoResampler = ^TGstVideoResampler;


function gst_video_resampler_init(resampler: PGstVideoResampler; method: TGstVideoResamplerMethod; flags: TGstVideoResamplerFlags; n_phases: Tguint; n_taps: Tguint;
  shift: Tgdouble; in_size: Tguint; out_size: Tguint; options: PGstStructure): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_resampler_clear(resampler: PGstVideoResampler); cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 17:31:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
