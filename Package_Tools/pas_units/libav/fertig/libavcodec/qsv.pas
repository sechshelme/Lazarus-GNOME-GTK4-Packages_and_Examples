unit qsv;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVQSVContext = type Pointer;

function av_qsv_alloc_context: PAVQSVContext; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:14 ===


implementation



end.
