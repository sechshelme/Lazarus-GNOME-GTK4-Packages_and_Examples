unit gsl_permute_matrix_float;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_float(p: Pgsl_permutation; A: Pgsl_matrix_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:49 ===


implementation



end.
