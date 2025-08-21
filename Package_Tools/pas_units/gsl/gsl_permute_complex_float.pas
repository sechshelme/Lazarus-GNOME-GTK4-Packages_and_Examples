unit gsl_permute_complex_float;

interface

uses
  fp_gsl, gsl_permutation, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_complex_float(p: Psize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_complex_float_inverse(p: Psize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:57:18 ===


implementation



end.
