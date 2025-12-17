unit blowfish;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  AV_BF_ROUNDS = 16;

type
  TAVBlowfish = record
    p: array[0..(AV_BF_ROUNDS + 2) - 1] of Tuint32_t;
    s: array[0..3] of array[0..255] of Tuint32_t;
  end;
  PAVBlowfish = ^TAVBlowfish;

function av_blowfish_alloc: PAVBlowfish; cdecl; external libavutil;
procedure av_blowfish_init(ctx: PAVBlowfish; key: Puint8_t; key_len: longint); cdecl; external libavutil;
procedure av_blowfish_crypt_ecb(ctx: PAVBlowfish; xl: Puint32_t; xr: Puint32_t; decrypt: longint); cdecl; external libavutil;
procedure av_blowfish_crypt(ctx: PAVBlowfish; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:50 ===


implementation



end.
