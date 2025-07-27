unit Log;

interface

uses
  fp_graphite2, Font;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGrLogMask = ^TGrLogMask;
  TGrLogMask = longint;

const
  GRLOG_NONE = $0;
  GRLOG_FACE = $01;
  GRLOG_SEGMENT = $02;
  GRLOG_PASS = $04;
  GRLOG_CACHE = $08;
  GRLOG_OPCODE = $80;
  GRLOG_ALL = $FF;

function gr_start_logging(face: Pgr_face; log_path: pchar): Boolean; cdecl; external libgraphite2;
procedure gr_stop_logging(face: Pgr_face); cdecl; external libgraphite2;
function graphite_start_logging(logFile: PFILE; mask: TGrLogMask): Boolean; cdecl; external libgraphite2;
procedure graphite_stop_logging; cdecl; external libgraphite2;

// === Konventiert am: 27-7-25 17:44:01 ===


implementation



end.
