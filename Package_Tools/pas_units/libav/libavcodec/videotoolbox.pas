unit videotoolbox;

interface

uses
  fp_ffmpeg, vdpau;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVVideotoolboxContext = type Pointer;

function av_videotoolbox_alloc_context: PAVVideotoolboxContext; cdecl; external libavcodec;
function av_videotoolbox_default_init(avctx: PAVCodecContext): longint; cdecl; external libavcodec;
function av_videotoolbox_default_init2(avctx: PAVCodecContext; vtctx: PAVVideotoolboxContext): longint; cdecl; external libavcodec;
procedure av_videotoolbox_default_free(avctx: PAVCodecContext); cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:24 ===


implementation



end.
