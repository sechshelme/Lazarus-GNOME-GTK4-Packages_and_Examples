unit mediacodec;

interface

uses
  fp_ffmpeg, vdpau;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVMediaCodecContext = record
    surface: pointer;
  end;
  PAVMediaCodecContext = ^TAVMediaCodecContext;

function av_mediacodec_alloc_context: PAVMediaCodecContext; cdecl; external libavcodec;
function av_mediacodec_default_init(avctx: PAVCodecContext; ctx: PAVMediaCodecContext; surface: pointer): longint; cdecl; external libavcodec;
procedure av_mediacodec_default_free(avctx: PAVCodecContext); cdecl; external libavcodec;

type
  PAVMediaCodecBuffer = type Pointer;

function av_mediacodec_release_buffer(buffer: PAVMediaCodecBuffer; render: longint): longint; cdecl; external libavcodec;
function av_mediacodec_render_buffer_at_time(buffer: PAVMediaCodecBuffer; time: Tint64_t): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:09 ===


implementation



end.
