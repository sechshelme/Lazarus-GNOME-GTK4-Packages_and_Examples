unit gsl_permute_vector_complex_double;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_complex_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_complex(p: Pgsl_permutation; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_permute_vector_complex_inverse(p: Pgsl_permutation; v: Pgsl_vector_complex): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:12 ===


implementation



end.
