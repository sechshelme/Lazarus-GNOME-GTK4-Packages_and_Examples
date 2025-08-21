unit gsl_permute_vector_long;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_long;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_long(p: Pgsl_permutation; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_permute_vector_long_inverse(p: Pgsl_permutation; v: Pgsl_vector_long): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:27 ===


implementation



end.
