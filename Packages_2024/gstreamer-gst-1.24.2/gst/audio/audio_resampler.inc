
{$IFDEF read_interface}

const
  GST_AUDIO_RESAMPLER_OPT_CUTOFF = 'GstAudioResampler.cutoff';
  GST_AUDIO_RESAMPLER_OPT_STOP_ATTENUATION = 'GstAudioResampler.stop-attenutation';
  GST_AUDIO_RESAMPLER_OPT_TRANSITION_BANDWIDTH = 'GstAudioResampler.transition-bandwidth';
  GST_AUDIO_RESAMPLER_OPT_CUBIC_B = 'GstAudioResampler.cubic-b';
  GST_AUDIO_RESAMPLER_OPT_CUBIC_C = 'GstAudioResampler.cubic-c';
  GST_AUDIO_RESAMPLER_OPT_N_TAPS = 'GstAudioResampler.n-taps';

type
  PGstAudioResamplerFilterMode = ^TGstAudioResamplerFilterMode;
  TGstAudioResamplerFilterMode = longint;

const
  GST_AUDIO_RESAMPLER_FILTER_MODE_INTERPOLATED = 0;
  GST_AUDIO_RESAMPLER_FILTER_MODE_FULL = 1;
  GST_AUDIO_RESAMPLER_FILTER_MODE_AUTO = 2;

const
  GST_AUDIO_RESAMPLER_OPT_FILTER_MODE = 'GstAudioResampler.filter-mode';
  GST_AUDIO_RESAMPLER_OPT_FILTER_MODE_THRESHOLD = 'GstAudioResampler.filter-mode-threshold';

type
  PGstAudioResamplerFilterInterpolation = ^TGstAudioResamplerFilterInterpolation;
  TGstAudioResamplerFilterInterpolation = longint;

const
  GST_AUDIO_RESAMPLER_FILTER_INTERPOLATION_NONE = 0;
  GST_AUDIO_RESAMPLER_FILTER_INTERPOLATION_LINEAR = 1;
  GST_AUDIO_RESAMPLER_FILTER_INTERPOLATION_CUBIC = 2;

const
  GST_AUDIO_RESAMPLER_OPT_FILTER_INTERPOLATION = 'GstAudioResampler.filter-interpolation';
  GST_AUDIO_RESAMPLER_OPT_FILTER_OVERSAMPLE = 'GstAudioResampler.filter-oversample';
  GST_AUDIO_RESAMPLER_OPT_MAX_PHASE_ERROR = 'GstAudioResampler.max-phase-error';

type
  PGstAudioResamplerMethod = ^TGstAudioResamplerMethod;
  TGstAudioResamplerMethod = longint;

const
  GST_AUDIO_RESAMPLER_METHOD_NEAREST = 0;
  GST_AUDIO_RESAMPLER_METHOD_LINEAR = 1;
  GST_AUDIO_RESAMPLER_METHOD_CUBIC = 2;
  GST_AUDIO_RESAMPLER_METHOD_BLACKMAN_NUTTALL = 3;
  GST_AUDIO_RESAMPLER_METHOD_KAISER = 4;

type
  PGstAudioResamplerFlags = ^TGstAudioResamplerFlags;
  TGstAudioResamplerFlags = longint;

const
  GST_AUDIO_RESAMPLER_FLAG_NONE = 0;
  GST_AUDIO_RESAMPLER_FLAG_NON_INTERLEAVED_IN = 1 shl 0;
  GST_AUDIO_RESAMPLER_FLAG_NON_INTERLEAVED_OUT = 1 shl 1;
  GST_AUDIO_RESAMPLER_FLAG_VARIABLE_RATE = 1 shl 2;

const
  GST_AUDIO_RESAMPLER_QUALITY_MIN = 0;
  GST_AUDIO_RESAMPLER_QUALITY_MAX = 10;
  GST_AUDIO_RESAMPLER_QUALITY_DEFAULT = 4;

type
  TGstAudioResampler = record
  end;
  PGstAudioResampler = ^TGstAudioResampler;

procedure gst_audio_resampler_options_set_quality(method: TGstAudioResamplerMethod; quality: Tguint; in_rate: Tgint; out_rate: Tgint; options: PGstStructure); cdecl; external libgstaudio;
function gst_audio_resampler_new(method: TGstAudioResamplerMethod; flags: TGstAudioResamplerFlags; format: TGstAudioFormat; channels: Tgint; in_rate: Tgint;
  out_rate: Tgint; options: PGstStructure): PGstAudioResampler; cdecl; external libgstaudio;
procedure gst_audio_resampler_free(resampler: PGstAudioResampler); cdecl; external libgstaudio;
procedure gst_audio_resampler_reset(resampler: PGstAudioResampler); cdecl; external libgstaudio;
function gst_audio_resampler_update(resampler: PGstAudioResampler; in_rate: Tgint; out_rate: Tgint; options: PGstStructure): Tgboolean; cdecl; external libgstaudio;
function gst_audio_resampler_get_out_frames(resampler: PGstAudioResampler; in_frames: Tgsize): Tgsize; cdecl; external libgstaudio;
function gst_audio_resampler_get_in_frames(resampler: PGstAudioResampler; out_frames: Tgsize): Tgsize; cdecl; external libgstaudio;
function gst_audio_resampler_get_max_latency(resampler: PGstAudioResampler): Tgsize; cdecl; external libgstaudio;
procedure gst_audio_resampler_resample(resampler: PGstAudioResampler; in_: Pgpointer; in_frames: Tgsize; out_: Pgpointer; out_frames: Tgsize); cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 16:56:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
