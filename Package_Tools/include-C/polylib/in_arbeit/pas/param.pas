unit param;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function Read_ParamNames(in_: PFILE; m: longint): Ppchar; cdecl; external libpolylib;
procedure Free_ParamNames(params: PPchar; m: longint); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:13 ===


implementation



end.
