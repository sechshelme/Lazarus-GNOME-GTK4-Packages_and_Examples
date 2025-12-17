unit hmac;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVHMACType = longint;

const
  AV_HMAC_MD5 = 0;
  AV_HMAC_SHA1 = 1;
  AV_HMAC_SHA224 = 2;
  AV_HMAC_SHA256 = 3;
  AV_HMAC_SHA384 = 4;
  AV_HMAC_SHA512 = 5;

type
  PAVHMAC = type Pointer;

function av_hmac_alloc(_type: TAVHMACType): PAVHMAC; cdecl; external libavutil;
procedure av_hmac_free(ctx: PAVHMAC); cdecl; external libavutil;
procedure av_hmac_init(ctx: PAVHMAC; key: Puint8_t; keylen: dword); cdecl; external libavutil;
procedure av_hmac_update(ctx: PAVHMAC; data: Puint8_t; len: dword); cdecl; external libavutil;
function av_hmac_final(ctx: PAVHMAC; out_: Puint8_t; outlen: dword): longint; cdecl; external libavutil;
function av_hmac_calc(ctx: PAVHMAC; data: Puint8_t; len: dword; key: Puint8_t; keylen: dword; out_: Puint8_t; outlen: dword): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:19 ===


implementation



end.
