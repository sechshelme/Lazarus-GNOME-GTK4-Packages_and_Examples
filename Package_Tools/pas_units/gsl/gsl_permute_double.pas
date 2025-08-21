unit gsl_permute_double;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_inverse(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:12 ===


implementation



end.
