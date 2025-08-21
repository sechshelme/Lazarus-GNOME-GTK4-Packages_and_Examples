unit gsl_permute_matrix_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix(p: Pgsl_permutation; A: Pgsl_matrix): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:47 ===


implementation



end.
