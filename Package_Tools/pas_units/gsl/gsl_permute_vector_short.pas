unit gsl_permute_vector_short;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_short;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_short(p: Pgsl_permutation; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_permute_vector_short_inverse(p: Pgsl_permutation; v: Pgsl_vector_short): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:32 ===


implementation



end.
