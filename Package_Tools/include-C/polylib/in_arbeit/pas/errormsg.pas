unit errormsg;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure errormsg1(f: pchar; msgname: pchar; msg: pchar); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:50 ===


implementation



end.
