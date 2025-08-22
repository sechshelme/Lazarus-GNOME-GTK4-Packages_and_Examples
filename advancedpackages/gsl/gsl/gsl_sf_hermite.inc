{$IFDEF read_interface}



function gsl_sf_hermite_prob_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_prob_deriv_e(m: longint; n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_deriv(m: longint; n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_deriv_e(m: longint; n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_deriv(m: longint; n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_func_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_func(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_func_fast_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_func_fast(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_prob_array(nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_array_deriv(m: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_deriv_array(mmax: longint; n: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_series_e(n: longint; x: Tdouble; a: Pdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_series(n: longint; x: Tdouble; a: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_array(nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_array_deriv(m: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_deriv_array(mmax: longint; n: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_series_e(n: longint; x: Tdouble; a: Pdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_series(n: longint; x: Tdouble; a: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_func_array(nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_hermite_func_series_e(n: longint; x: Tdouble; a: Pdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_func_series(n: longint; x: Tdouble; a: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_func_der_e(m: longint; n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_func_der(m: longint; n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_prob_zero_e(n: longint; s: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_prob_zero(n: longint; s: longint): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_zero_e(n: longint; s: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_zero(n: longint; s: longint): Tdouble; cdecl; external libgsl;
function gsl_sf_hermite_func_zero_e(n: longint; s: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hermite_func_zero(n: longint; s: longint): Tdouble; cdecl; external libgsl;

function gsl_sf_hermite_phys_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_der_e(m: longint; n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_der(m: longint; n: longint; x: Tdouble): Tdouble; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_array(nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_series_e(n: longint; x: Tdouble; a: Pdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_series(n: longint; x: Tdouble; a: Pdouble): Tdouble; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_array_der(m: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_der_array(mmax: longint; n: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_zero_e(n: longint; s: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_phys_zero(n: longint; s: longint): Tdouble; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_prob_array_der(m: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_prob_der_array(mmax: longint; n: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_prob_der_e(m: longint; n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_hermite_prob_der(m: longint; n: longint; x: Tdouble): Tdouble; cdecl; external libgsl; deprecated;

// === Konventiert am: 22-8-25 13:58:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
