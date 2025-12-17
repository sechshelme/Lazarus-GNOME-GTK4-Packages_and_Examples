unit twofish;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


var
  av_twofish_size: longint; cvar;external libavutil;

type
  PAVTWOFISH = type Pointer;

function av_twofish_alloc: PAVTWOFISH; cdecl; external libavutil;
function av_twofish_init(ctx: PAVTWOFISH; key: Puint8_t; key_bits: longint): longint; cdecl; external libavutil;
procedure av_twofish_crypt(ctx: PAVTWOFISH; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:11 ===


implementation



end.
