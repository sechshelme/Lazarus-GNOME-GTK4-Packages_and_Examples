unit gsl_permute_vector_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector(p: Pgsl_permutation; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_permute_vector_inverse(p: Pgsl_permutation; v: Pgsl_vector): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:19 ===


implementation



end.
