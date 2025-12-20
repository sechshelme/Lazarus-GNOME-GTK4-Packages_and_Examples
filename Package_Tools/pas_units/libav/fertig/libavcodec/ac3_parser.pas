unit ac3_parser;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function av_ac3_parse_header(buf: Puint8_t; size: Tsize_t; bitstream_id: Puint8_t; frame_size: Puint16_t): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:09:50 ===


implementation



end.
