unit gsl_permute_complex_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_complex(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_complex_inverse(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:04 ===


implementation



end.
