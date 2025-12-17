unit samplefmt;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVSampleFormat = longint;
  PAVSampleFormat = ^TAVSampleFormat;

const
  AV_SAMPLE_FMT_NONE = -(1);
  AV_SAMPLE_FMT_U8 = (-(1)) + 1;
  AV_SAMPLE_FMT_S16 = (-(1)) + 2;
  AV_SAMPLE_FMT_S32 = (-(1)) + 3;
  AV_SAMPLE_FMT_FLT = (-(1)) + 4;
  AV_SAMPLE_FMT_DBL = (-(1)) + 5;
  AV_SAMPLE_FMT_U8P = (-(1)) + 6;
  AV_SAMPLE_FMT_S16P = (-(1)) + 7;
  AV_SAMPLE_FMT_S32P = (-(1)) + 8;
  AV_SAMPLE_FMT_FLTP = (-(1)) + 9;
  AV_SAMPLE_FMT_DBLP = (-(1)) + 10;
  AV_SAMPLE_FMT_S64 = (-(1)) + 11;
  AV_SAMPLE_FMT_S64P = (-(1)) + 12;
  AV_SAMPLE_FMT_NB = (-(1)) + 13;

function av_get_sample_fmt_name(sample_fmt: TAVSampleFormat): pchar; cdecl; external libavutil;
function av_get_sample_fmt(name: pchar): TAVSampleFormat; cdecl; external libavutil;
function av_get_alt_sample_fmt(sample_fmt: TAVSampleFormat; planar: longint): TAVSampleFormat; cdecl; external libavutil;
function av_get_packed_sample_fmt(sample_fmt: TAVSampleFormat): TAVSampleFormat; cdecl; external libavutil;
function av_get_planar_sample_fmt(sample_fmt: TAVSampleFormat): TAVSampleFormat; cdecl; external libavutil;
function av_get_sample_fmt_string(buf: pchar; buf_size: longint; sample_fmt: TAVSampleFormat): pchar; cdecl; external libavutil;
function av_get_bytes_per_sample(sample_fmt: TAVSampleFormat): longint; cdecl; external libavutil;
function av_sample_fmt_is_planar(sample_fmt: TAVSampleFormat): longint; cdecl; external libavutil;
function av_samples_get_buffer_size(linesize: Plongint; nb_channels: longint; nb_samples: longint; sample_fmt: TAVSampleFormat; align: longint): longint; cdecl; external libavutil;
function av_samples_fill_arrays(audio_data: PPuint8_t; linesize: Plongint; buf: Puint8_t; nb_channels: longint; nb_samples: longint;
  sample_fmt: TAVSampleFormat; align: longint): longint; cdecl; external libavutil;
function av_samples_alloc(audio_data: PPuint8_t; linesize: Plongint; nb_channels: longint; nb_samples: longint; sample_fmt: TAVSampleFormat;
  align: longint): longint; cdecl; external libavutil;
function av_samples_alloc_array_and_samples(audio_data: PPPuint8_t; linesize: Plongint; nb_channels: longint; nb_samples: longint; sample_fmt: TAVSampleFormat;
  align: longint): longint; cdecl; external libavutil;
function av_samples_copy(dst: PPuint8_t; src: PPuint8_t; dst_offset: longint; src_offset: longint; nb_samples: longint;
  nb_channels: longint; sample_fmt: TAVSampleFormat): longint; cdecl; external libavutil;
function av_samples_set_silence(audio_data: PPuint8_t; offset: longint; nb_samples: longint; nb_channels: longint; sample_fmt: TAVSampleFormat): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:13 ===


implementation



end.
