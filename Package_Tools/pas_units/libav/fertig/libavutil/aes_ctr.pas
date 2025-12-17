unit aes_ctr;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AES_CTR_KEY_SIZE = 16;
  AES_CTR_IV_SIZE = 8;

type
  PAVAESCTR = type Pointer;

function av_aes_ctr_alloc: PAVAESCTR; cdecl; external libavutil;
function av_aes_ctr_init(a: PAVAESCTR; key: Puint8_t): longint; cdecl; external libavutil;
procedure av_aes_ctr_free(a: PAVAESCTR); cdecl; external libavutil;
procedure av_aes_ctr_crypt(a: PAVAESCTR; dst: Puint8_t; src: Puint8_t; size: longint); cdecl; external libavutil;
function av_aes_ctr_get_iv(a: PAVAESCTR): Puint8_t; cdecl; external libavutil;
procedure av_aes_ctr_set_random_iv(a: PAVAESCTR); cdecl; external libavutil;
procedure av_aes_ctr_set_iv(a: PAVAESCTR; iv: Puint8_t); cdecl; external libavutil;
procedure av_aes_ctr_set_full_iv(a: PAVAESCTR; iv: Puint8_t); cdecl; external libavutil;
procedure av_aes_ctr_increment_iv(a: PAVAESCTR); cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:35 ===


implementation



end.
