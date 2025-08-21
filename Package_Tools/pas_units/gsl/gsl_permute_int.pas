unit gsl_permute_int;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_int(p: Psize_t; data: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_int_inverse(p: Psize_t; data: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:18 ===


implementation



end.
