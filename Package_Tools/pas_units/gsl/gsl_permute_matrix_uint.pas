unit gsl_permute_matrix_uint;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_uint(p: Pgsl_permutation; A: Pgsl_matrix_uint): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:07:04 ===


implementation



end.
