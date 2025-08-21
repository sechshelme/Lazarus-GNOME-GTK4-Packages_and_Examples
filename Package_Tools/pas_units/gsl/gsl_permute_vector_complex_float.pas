unit gsl_permute_vector_complex_float;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_complex_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_complex_float(p: Pgsl_permutation; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_permute_vector_complex_float_inverse(p: Pgsl_permutation; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:14 ===


implementation



end.
