unit pixelutils;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tav_pixelutils_sad_fn = function(src1: Puint8_t; stride1: Tptrdiff_t; src2: Puint8_t; stride2: Tptrdiff_t): longint; cdecl;

function av_pixelutils_get_sad_fn(w_bits: longint; h_bits: longint; aligned: longint; log_ctx: pointer): Tav_pixelutils_sad_fn; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:36:55 ===


implementation



end.
