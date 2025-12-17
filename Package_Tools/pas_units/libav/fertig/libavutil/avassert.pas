unit avassert;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure av_assert0_fpu; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:41 ===


implementation



end.
