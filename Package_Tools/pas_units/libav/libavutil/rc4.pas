unit rc4;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVRC4 = record
    state: array[0..255] of Tuint8_t;
    x: longint;
    y: longint;
  end;
  PAVRC4 = ^TAVRC4;

function av_rc4_alloc: PAVRC4; cdecl; external libavutil;
function av_rc4_init(d: PAVRC4; key: Puint8_t; key_bits: longint; decrypt: longint): longint; cdecl; external libavutil;
procedure av_rc4_crypt(d: PAVRC4; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t;
  decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:06 ===


implementation



end.
