unit time;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function av_gettime: Tint64_t; cdecl; external libavutil;
function av_gettime_relative: Tint64_t; cdecl; external libavutil;
function av_gettime_relative_is_monotonic: longint; cdecl; external libavutil;
function av_usleep(usec: dword): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:21 ===


implementation



end.
