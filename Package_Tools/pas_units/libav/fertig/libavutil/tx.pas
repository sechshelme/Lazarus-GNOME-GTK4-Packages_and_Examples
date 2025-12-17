unit tx;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVTXContext = type Pointer;
  PPAVTXContext = ^PAVTXContext;

  TAVComplexFloat = record
    re: single;
    im: single;
  end;
  PAVComplexFloat = ^TAVComplexFloat;

  TAVComplexDouble = record
    re: double;
    im: double;
  end;
  PAVComplexDouble = ^TAVComplexDouble;

  TAVComplexInt32 = record
    re: Tint32_t;
    im: Tint32_t;
  end;
  PAVComplexInt32 = ^TAVComplexInt32;

type
  TAVTXType = longint;

const
  AV_TX_FLOAT_FFT = 0;
  AV_TX_DOUBLE_FFT = 2;
  AV_TX_INT32_FFT = 4;
  AV_TX_FLOAT_MDCT = 1;
  AV_TX_DOUBLE_MDCT = 3;
  AV_TX_INT32_MDCT = 5;
  AV_TX_FLOAT_RDFT = 6;
  AV_TX_DOUBLE_RDFT = 7;
  AV_TX_INT32_RDFT = 8;
  AV_TX_FLOAT_DCT = 9;
  AV_TX_DOUBLE_DCT = 10;
  AV_TX_INT32_DCT = 11;
  AV_TX_FLOAT_DCT_I = 12;
  AV_TX_DOUBLE_DCT_I = 13;
  AV_TX_INT32_DCT_I = 14;
  AV_TX_FLOAT_DST_I = 15;
  AV_TX_DOUBLE_DST_I = 16;
  AV_TX_INT32_DST_I = 17;
  AV_TX_NB = 18;

type
  Tav_tx_fn = procedure(s: PAVTXContext; out_: pointer; in_: pointer; stride: Tptrdiff_t); cdecl;
  Pav_tx_fn = ^Tav_tx_fn;

type
  TAVTXFlags = longint;

const
  AV_TX_INPLACE = 1 shl 0;
  AV_TX_UNALIGNED = 1 shl 1;
  AV_TX_FULL_IMDCT = 1 shl 2;
  AV_TX_REAL_TO_REAL = 1 shl 3;
  AV_TX_REAL_TO_IMAGINARY = 1 shl 4;

function av_tx_init(ctx: PPAVTXContext; tx: Pav_tx_fn; _type: TAVTXType; inv: longint; len: longint; scale: pointer; flags: Tuint64_t): longint; cdecl; external libavutil;
procedure av_tx_uninit(ctx: PPAVTXContext); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:08 ===


implementation



end.
