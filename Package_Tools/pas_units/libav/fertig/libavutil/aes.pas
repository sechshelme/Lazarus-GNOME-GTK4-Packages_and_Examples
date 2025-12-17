unit aes;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  av_aes_size: longint; cvar;external libavutil;

type
  PAVAES = type Pointer;

function av_aes_alloc: PAVAES; cdecl; external libavutil;
function av_aes_init(a: PAVAES; key: Puint8_t; key_bits: longint; decrypt: longint): longint; cdecl; external libavutil;
procedure av_aes_crypt(a: PAVAES; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:33 ===


implementation



end.
