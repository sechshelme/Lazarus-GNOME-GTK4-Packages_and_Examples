unit sha512;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  av_sha512_size: longint; cvar;external libavutil;

type
  PAVSHA512 = type Pointer;

function av_sha512_alloc: PAVSHA512; cdecl; external libavutil;
function av_sha512_init(context: PAVSHA512; bits: longint): longint; cdecl; external libavutil;
procedure av_sha512_update(context: PAVSHA512; data: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_sha512_final(context: PAVSHA512; digest: Puint8_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:17 ===


implementation



end.
