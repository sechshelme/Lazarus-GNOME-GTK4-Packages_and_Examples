unit gsl_permute_matrix_long;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_long;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_long(p: Pgsl_permutation; A: Pgsl_matrix_long): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:54 ===


implementation



end.
