unit adts_parser;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_AAC_ADTS_HEADER_SIZE = 7;

function av_adts_header_parse(buf: Puint8_t; samples: Puint32_t; frames: Puint8_t): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:09:53 ===


implementation



end.
