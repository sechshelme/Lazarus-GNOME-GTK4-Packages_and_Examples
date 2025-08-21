unit gsl_permute_ushort;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_ushort(p: Psize_t; data: Pword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_ushort_inverse(p: Psize_t; data: Pword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:41 ===


implementation



end.
