unit gsl_permute_vector_char;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_char;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_char(p: Pgsl_permutation; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_permute_vector_char_inverse(p: Pgsl_permutation; v: Pgsl_vector_char): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:07 ===


implementation



end.
