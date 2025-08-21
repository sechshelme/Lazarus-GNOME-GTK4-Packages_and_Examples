unit gsl_permute_matrix_complex_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_complex_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_complex(p: Pgsl_permutation; A: Pgsl_matrix_complex): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:39 ===


implementation



end.
