unit gsl_deriv;

interface

uses
  fp_gsl, gsl_math;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_deriv_central(f: Pgsl_function; x: Tdouble; h: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_deriv_backward(f: Pgsl_function; x: Tdouble; h: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_deriv_forward(f: Pgsl_function; x: Tdouble; h: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:59 ===


implementation



end.
