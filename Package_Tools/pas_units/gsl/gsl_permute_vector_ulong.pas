unit gsl_permute_vector_ulong;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_ulong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_ulong(p: Pgsl_permutation; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_permute_vector_ulong_inverse(p: Pgsl_permutation; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:41 ===


implementation



end.
