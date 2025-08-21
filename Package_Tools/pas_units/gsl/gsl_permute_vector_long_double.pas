unit gsl_permute_vector_long_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_long_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_long_double(p: Pgsl_permutation; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_permute_vector_long_double_inverse(p: Pgsl_permutation; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:29 ===


implementation



end.
