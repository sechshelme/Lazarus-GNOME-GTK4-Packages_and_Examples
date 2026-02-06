unit SolveDio;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function SolveDiophantine(M: PMatrix; U: PPMatrix; X: PPVector): longint; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:22 ===


implementation



end.
