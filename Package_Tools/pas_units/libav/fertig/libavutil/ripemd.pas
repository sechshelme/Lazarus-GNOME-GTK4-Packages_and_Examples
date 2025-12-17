unit ripemd;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  av_ripemd_size: longint; cvar;external libavutil;

type
  PAVRIPEMD = type Pointer;

function av_ripemd_alloc: PAVRIPEMD; cdecl; external libavutil;
function av_ripemd_init(context: PAVRIPEMD; bits: longint): longint; cdecl; external libavutil;
procedure av_ripemd_update(context: PAVRIPEMD; data: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_ripemd_final(context: PAVRIPEMD; digest: Puint8_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:11 ===


implementation



end.
