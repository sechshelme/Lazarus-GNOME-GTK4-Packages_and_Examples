unit buffersink;

interface

uses
  fp_ffmpeg, avfilter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function av_buffersink_get_frame_flags(ctx: PAVFilterContext; frame: PAVFrame; flags: longint): longint; cdecl; external libavfilter;

const
  AV_BUFFERSINK_FLAG_PEEK = 1;
  AV_BUFFERSINK_FLAG_NO_REQUEST = 2;

procedure av_buffersink_set_frame_size(ctx: PAVFilterContext; frame_size: dword); cdecl; external libavfilter;
function av_buffersink_get_type(ctx: PAVFilterContext): TAVMediaType; cdecl; external libavfilter;
function av_buffersink_get_time_base(ctx: PAVFilterContext): TAVRational; cdecl; external libavfilter;
function av_buffersink_get_format(ctx: PAVFilterContext): longint; cdecl; external libavfilter;
function av_buffersink_get_frame_rate(ctx: PAVFilterContext): TAVRational; cdecl; external libavfilter;
function av_buffersink_get_w(ctx: PAVFilterContext): longint; cdecl; external libavfilter;
function av_buffersink_get_h(ctx: PAVFilterContext): longint; cdecl; external libavfilter;
function av_buffersink_get_sample_aspect_ratio(ctx: PAVFilterContext): TAVRational; cdecl; external libavfilter;
function av_buffersink_get_channels(ctx: PAVFilterContext): longint; cdecl; external libavfilter;
function av_buffersink_get_channel_layout(ctx: PAVFilterContext): Tuint64_t; cdecl; external libavfilter; deprecated;
function av_buffersink_get_ch_layout(ctx: PAVFilterContext; ch_layout: PAVChannelLayout): longint; cdecl; external libavfilter;
function av_buffersink_get_sample_rate(ctx: PAVFilterContext): longint; cdecl; external libavfilter;
function av_buffersink_get_hw_frames_ctx(ctx: PAVFilterContext): PAVBufferRef; cdecl; external libavfilter;
function av_buffersink_get_frame(ctx: PAVFilterContext; frame: PAVFrame): longint; cdecl; external libavfilter;
function av_buffersink_get_samples(ctx: PAVFilterContext; frame: PAVFrame; nb_samples: longint): longint; cdecl; external libavfilter;

// === Konventiert am: 21-12-25 19:36:09 ===


implementation



end.
