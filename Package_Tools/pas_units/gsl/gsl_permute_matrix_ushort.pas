unit gsl_permute_matrix_ushort;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_ushort;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_ushort(p: Pgsl_permutation; A: Pgsl_matrix_ushort): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:07:11 ===


implementation



end.
