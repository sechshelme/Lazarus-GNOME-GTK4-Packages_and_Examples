unit adler32;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVAdler = ^TAVAdler;
  TAVAdler = Tuint32_t;

function av_adler32_update(adler: TAVAdler; buf: Puint8_t; len: Tsize_t): TAVAdler; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:30 ===


implementation



end.
