{$IFDEF read_interface}


function gsl_sf_bessel_J0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_J0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_J1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_J1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Jn_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Jn(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Jn_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_Y0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Y0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Y1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Y1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Yn_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Yn(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Yn_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_I0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_I0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_I1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_I1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_In_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_In(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_In_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_I0_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_I0_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_I1_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_I1_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_In_scaled_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_In_scaled(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_In_scaled_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_K0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_K0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_K1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_K1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Kn_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Kn(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Kn_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_K0_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_K0_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_K1_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_K1_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Kn_scaled_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Kn_scaled(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Kn_scaled_array(nmin: longint; nmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

//function gsl_sf_bessel_j0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_j0(x: Tdouble): Tdouble; cdecl; external libgsl;
//function gsl_sf_bessel_j1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_j1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_j0_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_j0_e';
function gsl_sf_bessel_j0_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_j0';
function gsl_sf_bessel_j1_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_j1_e';
function gsl_sf_bessel_j1_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_j1';


function gsl_sf_bessel_j2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_j2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_jl_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_jl(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_jl_array(lmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_jl_steed_array(lmax: longint; x: Tdouble; jl_x_array: Pdouble): longint; cdecl; external libgsl;

//function gsl_sf_bessel_y0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_y0(x: Tdouble): Tdouble; cdecl; external libgsl;
//function gsl_sf_bessel_y1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_y1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_y0_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_y0_e';
function gsl_sf_bessel_y0_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_y0';
function gsl_sf_bessel_y1_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_y1_e';
function gsl_sf_bessel_y1_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_y1';

function gsl_sf_bessel_y2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_y2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_yl_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_yl(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_yl_array(lmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

//function gsl_sf_bessel_i0_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_i0_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
//function gsl_sf_bessel_i1_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_i1_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_i0_scaled_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_i0_scaled_e';
function gsl_sf_bessel_i0_scaled_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_i0_scaled';
function gsl_sf_bessel_i1_scaled_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_i1_scaled_e';
function gsl_sf_bessel_i1_scaled_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_i1_scaled';

function gsl_sf_bessel_i2_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_i2_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_il_scaled_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_il_scaled(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_il_scaled_array(lmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

//function gsl_sf_bessel_k0_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_k0_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
//function gsl_sf_bessel_k1_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
//function gsl_sf_bessel_k1_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_k0_scaled_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_k0_scaled_e';
function gsl_sf_bessel_k0_scaled_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_k0_scaled';
function gsl_sf_bessel_k1_scaled_e_(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl name 'gsl_sf_bessel_k1_scaled_e';
function gsl_sf_bessel_k1_scaled_(x: Tdouble): Tdouble; cdecl; external libgsl name 'gsl_sf_bessel_k1_scaled';

function gsl_sf_bessel_k2_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_k2_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_kl_scaled_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_kl_scaled(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_kl_scaled_array(lmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

function gsl_sf_bessel_Jnu_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Jnu(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Ynu_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Ynu(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_sequence_Jnu_e(nu: Tdouble; mode: Tgsl_mode_t; size: Tsize_t; v: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_bessel_Inu_scaled_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Inu_scaled(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Inu_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Inu(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Knu_scaled_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Knu_scaled(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_Knu_scaled_e10_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_bessel_Knu_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_Knu(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_lnKnu_e(nu: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_lnKnu(nu: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_zero_J0_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_zero_J0(s: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_zero_J1_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_zero_J1(s: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_bessel_zero_Jnu_e(nu: Tdouble; s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_bessel_zero_Jnu(nu: Tdouble; s: dword): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
