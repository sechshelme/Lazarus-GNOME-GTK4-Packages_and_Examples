unit qsastime;

interface

uses
  fp_plplot, plstrm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PQSASConfigStruct = type Pointer;

  TQSASConfigStruct = TQSASConfig;

procedure configqsas(scale: Tdouble; offset1: Tdouble; offset2: Tdouble; ccontrol: longint; ifbtime_offset: longint;
  year: longint; month: longint; day: longint; hour: longint; min: longint;
  sec: Tdouble; qsasconfig: PPQSASConfig); cdecl; external libplplot;
procedure closeqsas(qsasconfig: PPQSASConfig); cdecl; external libplplot;
function ctimeqsas(year: longint; month: longint; day: longint; hour: longint; min: longint;
  sec: Tdouble; ctime: Pdouble; qsasconfig: PQSASConfig): longint; cdecl; external libplplot;
procedure btimeqsas(year: Plongint; month: Plongint; day: Plongint; hour: Plongint; min: Plongint;
  sec: Pdouble; ctime: Tdouble; qsasconfig: PQSASConfig); cdecl; external libplplot;
function strfqsas(buf: pchar; len: Tsize_t; format: pchar; ctime: Tdouble; qsasconfig: PQSASConfig): Tsize_t; cdecl; external libplplot;

// === Konventiert am: 31-3-26 20:05:21 ===


implementation



end.
