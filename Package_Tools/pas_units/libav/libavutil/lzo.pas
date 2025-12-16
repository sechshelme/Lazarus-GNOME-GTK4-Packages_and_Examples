unit lzo;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_LZO_INPUT_DEPLETED = 1;
  AV_LZO_OUTPUT_FULL = 2;
  AV_LZO_INVALID_BACKPTR = 4;
  AV_LZO_ERROR = 8;
  AV_LZO_INPUT_PADDING = 8;
  AV_LZO_OUTPUT_PADDING = 12;

function av_lzo1x_decode(out_: pointer; outlen: Plongint; in_: pointer; inlen: Plongint): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:18 ===


implementation



end.
