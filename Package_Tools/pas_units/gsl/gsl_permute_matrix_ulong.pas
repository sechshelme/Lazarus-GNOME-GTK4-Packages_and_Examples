unit gsl_permute_matrix_ulong;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_ulong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_ulong(p: Pgsl_permutation; A: Pgsl_matrix_ulong): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:07:08 ===


implementation



end.
