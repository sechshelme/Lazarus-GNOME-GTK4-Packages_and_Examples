unit common;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function av_log2(v: dword): longint; cdecl; external libavutil;
function av_log2_16bit(v: dword): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:16 ===


implementation



end.
