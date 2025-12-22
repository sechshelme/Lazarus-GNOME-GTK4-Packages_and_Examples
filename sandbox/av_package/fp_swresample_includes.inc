  {$IFDEF read_interface}

const
  LIBSWRESAMPLE_VERSION_MINOR = 12;
  LIBSWRESAMPLE_VERSION_MICRO = 100;

const
  LIBSWRESAMPLE_VERSION_MAJOR = 4;

  // =======

const
  SWR_FLAG_RESAMPLE = 1;

type
  TSwrDitherType = longint;

const
  SWR_DITHER_NONE = 0;
  SWR_DITHER_RECTANGULAR = 1;
  SWR_DITHER_TRIANGULAR = 2;
  SWR_DITHER_TRIANGULAR_HIGHPASS = 3;
  SWR_DITHER_NS = 64;
  SWR_DITHER_NS_LIPSHITZ = 65;
  SWR_DITHER_NS_F_WEIGHTED = 66;
  SWR_DITHER_NS_MODIFIED_E_WEIGHTED = 67;
  SWR_DITHER_NS_IMPROVED_E_WEIGHTED = 68;
  SWR_DITHER_NS_SHIBATA = 69;
  SWR_DITHER_NS_LOW_SHIBATA = 70;
  SWR_DITHER_NS_HIGH_SHIBATA = 71;
  SWR_DITHER_NB = 72;

type
  TSwrEngine = longint;

const
  SWR_ENGINE_SWR = 0;
  SWR_ENGINE_SOXR = 1;
  SWR_ENGINE_NB = 2;

type
  TSwrFilterType = longint;

const
  SWR_FILTER_TYPE_CUBIC = 0;
  SWR_FILTER_TYPE_BLACKMAN_NUTTALL = 1;
  SWR_FILTER_TYPE_KAISER = 2;

type
  PSwrContext = type Pointer;
  PPSwrContext = ^PSwrContext;

function swr_get_class: PAVClass; cdecl; external libswresample;
function swr_alloc: PSwrContext; cdecl; external libswresample;
function swr_init(s: PSwrContext): longint; cdecl; external libswresample;
function swr_is_initialized(s: PSwrContext): longint; cdecl; external libswresample;
function swr_alloc_set_opts(s: PSwrContext; out_ch_layout: Tint64_t; out_sample_fmt: TAVSampleFormat; out_sample_rate: longint; in_ch_layout: Tint64_t;
  in_sample_fmt: TAVSampleFormat; in_sample_rate: longint; log_offset: longint; log_ctx: pointer): PSwrContext; cdecl; external libswresample; deprecated;
function swr_alloc_set_opts2(ps: PPSwrContext; out_ch_layout: PAVChannelLayout; out_sample_fmt: TAVSampleFormat; out_sample_rate: longint; in_ch_layout: PAVChannelLayout;
  in_sample_fmt: TAVSampleFormat; in_sample_rate: longint; log_offset: longint; log_ctx: pointer): longint; cdecl; external libswresample;
procedure swr_free(s: PPSwrContext); cdecl; external libswresample;
procedure swr_close(s: PSwrContext); cdecl; external libswresample;
function swr_convert(s: PSwrContext; out_: PPuint8_t; out_count: longint; in_: PPuint8_t; in_count: longint): longint; cdecl; external libswresample;
function swr_next_pts(s: PSwrContext; pts: Tint64_t): Tint64_t; cdecl; external libswresample;
function swr_set_compensation(s: PSwrContext; sample_delta: longint; compensation_distance: longint): longint; cdecl; external libswresample;
function swr_set_channel_mapping(s: PSwrContext; channel_map: Plongint): longint; cdecl; external libswresample;
function swr_build_matrix(in_layout: Tuint64_t; out_layout: Tuint64_t; center_mix_level: double; surround_mix_level: double; lfe_mix_level: double;
  rematrix_maxval: double; rematrix_volume: double; matrix: Pdouble; stride: longint; matrix_encoding: TAVMatrixEncoding;
  log_ctx: pointer): longint; cdecl; external libswresample; deprecated;
function swr_build_matrix2(in_layout: PAVChannelLayout; out_layout: PAVChannelLayout; center_mix_level: double; surround_mix_level: double; lfe_mix_level: double;
  maxval: double; rematrix_volume: double; matrix: Pdouble; stride: Tptrdiff_t; matrix_encoding: TAVMatrixEncoding;
  log_context: pointer): longint; cdecl; external libswresample;
function swr_set_matrix(s: PSwrContext; matrix: Pdouble; stride: longint): longint; cdecl; external libswresample;
function swr_drop_output(s: PSwrContext; count: longint): longint; cdecl; external libswresample;
function swr_inject_silence(s: PSwrContext; count: longint): longint; cdecl; external libswresample;
function swr_get_delay(s: PSwrContext; base: Tint64_t): Tint64_t; cdecl; external libswresample;
function swr_get_out_samples(s: PSwrContext; in_samples: longint): longint; cdecl; external libswresample;
function swresample_version: dword; cdecl; external libswresample;
function swresample_configuration: pchar; cdecl; external libswresample;
function swresample_license: pchar; cdecl; external libswresample;
function swr_convert_frame(swr: PSwrContext; output: PAVFrame; input: PAVFrame): longint; cdecl; external libswresample;
function swr_config_frame(swr: PSwrContext; out_: PAVFrame; in_: PAVFrame): longint; cdecl; external libswresample;

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
