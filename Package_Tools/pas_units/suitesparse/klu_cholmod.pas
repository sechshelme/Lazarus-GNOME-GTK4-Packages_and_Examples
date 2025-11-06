unit klu_cholmod;

interface

uses
  fp_suitesparse, klu;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function klu_cholmod(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Perm: Pint32_t; para5: Pklu_common): Tint32_t; cdecl; external libklu_cholmod;
function klu_l_cholmod(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Perm: Pint64_t; para5: Pklu_l_common): Tint64_t; cdecl; external libklu_cholmod;

// === Konventiert am: 4-11-25 19:29:02 ===


implementation



end.
