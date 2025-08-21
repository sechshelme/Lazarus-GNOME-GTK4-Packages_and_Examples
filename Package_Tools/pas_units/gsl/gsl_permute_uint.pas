unit gsl_permute_uint;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_uint(p: Psize_t; data: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_uint_inverse(p: Psize_t; data: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:30 ===


implementation



end.
