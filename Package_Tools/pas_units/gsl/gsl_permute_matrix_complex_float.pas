unit gsl_permute_matrix_complex_float;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_complex_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_complex_float(p: Pgsl_permutation; A: Pgsl_matrix_complex_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:42 ===


implementation



end.
