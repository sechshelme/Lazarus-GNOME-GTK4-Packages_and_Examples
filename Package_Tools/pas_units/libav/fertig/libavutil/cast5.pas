unit cast5;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  av_cast5_size: longint; cvar;external libavutil;

type
  PAVCAST5 = type Pointer;

function av_cast5_alloc: PAVCAST5; cdecl; external libavutil;
function av_cast5_init(ctx: PAVCAST5; key: Puint8_t; key_bits: longint): longint; cdecl; external libavutil;
procedure av_cast5_crypt(ctx: PAVCAST5; dst: Puint8_t; src: Puint8_t; count: longint; decrypt: longint); cdecl; external libavutil;
procedure av_cast5_crypt2(ctx: PAVCAST5; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 16:00:01 ===


implementation



end.
