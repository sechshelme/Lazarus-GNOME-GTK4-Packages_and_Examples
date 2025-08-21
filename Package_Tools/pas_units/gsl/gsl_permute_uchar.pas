unit gsl_permute_uchar;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_uchar(p: Psize_t; data: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_uchar_inverse(p: Psize_t; data: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:28 ===


implementation



end.
