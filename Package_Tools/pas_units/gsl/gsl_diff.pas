unit gsl_diff;

interface

uses
  fp_gsl, gsl_math;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_diff_central(f: Pgsl_function; x: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_diff_backward(f: Pgsl_function; x: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_diff_forward(f: Pgsl_function; x: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;

// === Konventiert am: 21-8-25 16:52:10 ===


implementation



end.
