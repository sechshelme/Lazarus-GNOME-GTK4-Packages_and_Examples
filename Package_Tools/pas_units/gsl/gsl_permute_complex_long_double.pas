unit gsl_permute_complex_long_double;

interface

uses
  fp_gsl, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_complex_long_double(p: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_complex_long_double_inverse(p: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:10 ===


implementation



end.
