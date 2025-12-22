unit buffersrc;

interface

uses
  fp_ffmpeg, avfilter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_BUFFERSRC_FLAG_NO_CHECK_FORMAT = 1;
  AV_BUFFERSRC_FLAG_PUSH = 4;
  AV_BUFFERSRC_FLAG_KEEP_REF = 8;

function av_buffersrc_get_nb_failed_requests(buffer_src: PAVFilterContext): dword; cdecl; external libavfilter;

type
  TAVBufferSrcParameters = record
    format: longint;
    time_base: TAVRational;
    width: longint;
    height: longint;
    sample_aspect_ratio: TAVRational;
    frame_rate: TAVRational;
    hw_frames_ctx: PAVBufferRef;
    sample_rate: longint;
    channel_layout: Tuint64_t;
    ch_layout: TAVChannelLayout;
  end;
  PAVBufferSrcParameters = ^TAVBufferSrcParameters;

function av_buffersrc_parameters_alloc: PAVBufferSrcParameters; cdecl; external libavfilter;
function av_buffersrc_parameters_set(ctx: PAVFilterContext; param: PAVBufferSrcParameters): longint; cdecl; external libavfilter;
function av_buffersrc_write_frame(ctx: PAVFilterContext; frame: PAVFrame): longint; cdecl; external libavfilter;
function av_buffersrc_add_frame(ctx: PAVFilterContext; frame: PAVFrame): longint; cdecl; external libavfilter;
function av_buffersrc_add_frame_flags(buffer_src: PAVFilterContext; frame: PAVFrame; flags: longint): longint; cdecl; external libavfilter;
function av_buffersrc_close(ctx: PAVFilterContext; pts: Tint64_t; flags: dword): longint; cdecl; external libavfilter;

// === Konventiert am: 21-12-25 19:36:12 ===


implementation



end.
