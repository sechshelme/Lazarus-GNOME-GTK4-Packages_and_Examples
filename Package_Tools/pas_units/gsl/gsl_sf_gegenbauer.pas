unit gsl_sf_gegenbauer;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_gegenpoly_1_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_2_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_3_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_1(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gegenpoly_2(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gegenpoly_3(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gegenpoly_n_e(n: longint; lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_n(n: longint; lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gegenpoly_array(nmax: longint; lambda: Tdouble; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:26 ===


implementation



end.
