unit gsl_heapsort;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_comparison_fn_t = function(para1: pointer; para2: pointer): longint; cdecl;

procedure gsl_heapsort(arr: pointer; count: Tsize_t; size: Tsize_t; compare: Tgsl_comparison_fn_t); cdecl; external libgsl;
function gsl_heapsort_index(p: Psize_t; arr: pointer; count: Tsize_t; size: Tsize_t; compare: Tgsl_comparison_fn_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:49 ===


implementation



end.
