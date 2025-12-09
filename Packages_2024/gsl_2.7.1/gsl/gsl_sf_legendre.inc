{$IFDEF read_interface}



function gsl_sf_legendre_Pl_e(l: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Pl(l: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Pl_array(lmax: longint; x: double; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_Pl_deriv_array(lmax: longint; x: double; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_P1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P2_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P3_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P1(x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_P2(x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_P3(x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Q0_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Q0(x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Q1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Q1(x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Ql_e(l: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Ql(l: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Plm_e(l: longint; m: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Plm(l: longint; m: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_Plm_array(lmax: longint; m: longint; x: double; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_Plm_deriv_array(lmax: longint; m: longint; x: double; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_e(l: longint; m: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm(l: longint; m: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_array(lmax: longint; m: longint; x: double; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_deriv_array(lmax: longint; m: longint; x: double; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_size(lmax: longint; m: longint): longint; cdecl; external libgsl;
function gsl_sf_conicalP_half_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_half(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_conicalP_mhalf_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_mhalf(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_conicalP_0_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_0(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_conicalP_1_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_1(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_conicalP_sph_reg_e(l: longint; lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_sph_reg(l: longint; lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_conicalP_cyl_reg_e(m: longint; lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_cyl_reg(m: longint; lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_legendre_H3d_0_e(lambda: double; eta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d_0(lambda: double; eta: double): double; cdecl; external libgsl;
function gsl_sf_legendre_H3d_1_e(lambda: double; eta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d_1(lambda: double; eta: double): double; cdecl; external libgsl;
function gsl_sf_legendre_H3d_e(l: longint; lambda: double; eta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d(l: longint; lambda: double; eta: double): double; cdecl; external libgsl;
function gsl_sf_legendre_H3d_array(lmax: longint; lambda: double; eta: double; result_array: Pdouble): longint; cdecl; external libgsl;

type
  Pgsl_sf_legendre_t = ^Tgsl_sf_legendre_t;
  Tgsl_sf_legendre_t = longint;

const
  GSL_SF_LEGENDRE_SCHMIDT = 0;
  GSL_SF_LEGENDRE_SPHARM = 1;
  GSL_SF_LEGENDRE_FULL = 2;
  GSL_SF_LEGENDRE_NONE = 3;

function gsl_sf_legendre_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; csphase: double; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; csphase: double; result_array: Pdouble;
  result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_alt_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_alt_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; csphase: double; result_array: Pdouble;
  result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; result_array: Pdouble; result_deriv_array: Pdouble;
  result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; csphase: double; result_array: Pdouble;
  result_deriv_array: Pdouble; result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_alt_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; result_array: Pdouble; result_deriv_array: Pdouble;
  result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_alt_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: double; csphase: double; result_array: Pdouble;
  result_deriv_array: Pdouble; result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_n(lmax: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_sf_legendre_nlm(lmax: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_sf_legendre_array_index(l: Tsize_t; m: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
