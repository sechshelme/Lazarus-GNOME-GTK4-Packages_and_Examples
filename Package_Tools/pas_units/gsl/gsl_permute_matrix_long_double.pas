unit gsl_permute_matrix_long_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_long_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_long_double(p: Pgsl_permutation; A: Pgsl_matrix_long_double): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:57 ===


implementation



end.
