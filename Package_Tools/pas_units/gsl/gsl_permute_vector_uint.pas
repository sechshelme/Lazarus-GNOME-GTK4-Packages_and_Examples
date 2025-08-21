unit gsl_permute_vector_uint;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_uint(p: Pgsl_permutation; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_permute_vector_uint_inverse(p: Pgsl_permutation; v: Pgsl_vector_uint): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:38 ===


implementation



end.
