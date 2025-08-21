unit gsl_permute_matrix_int;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_int;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_int(p: Pgsl_permutation; A: Pgsl_matrix_int): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:52 ===


implementation



end.
