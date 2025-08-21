unit gsl_permute_matrix_short;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_short;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_short(p: Pgsl_permutation; A: Pgsl_matrix_short): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:06:59 ===


implementation



end.
