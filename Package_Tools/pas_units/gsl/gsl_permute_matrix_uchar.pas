unit gsl_permute_matrix_uchar;

interface

uses
  fp_gsl, gsl_permutation, gsl_matrix_uchar;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_matrix_uchar(p: Pgsl_permutation; A: Pgsl_matrix_uchar): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:07:02 ===


implementation



end.
