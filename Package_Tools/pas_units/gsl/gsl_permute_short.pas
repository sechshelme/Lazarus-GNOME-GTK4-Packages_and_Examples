unit gsl_permute_short;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_short(p: Psize_t; data: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_short_inverse(p: Psize_t; data: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:26 ===


implementation



end.
