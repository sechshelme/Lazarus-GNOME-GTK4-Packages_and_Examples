unit gsl_sf_legendre;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_sf_legendre_Pl_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Pl(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Pl_array(lmax: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_Pl_deriv_array(lmax: longint; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_P1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P3_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_P1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_P2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_P3(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Q0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Q0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Q1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Q1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Ql_e(l: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Ql(l: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Plm_e(l: longint; m: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_Plm(l: longint; m: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_Plm_array(lmax: longint; m: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_Plm_deriv_array(lmax: longint; m: longint; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_e(l: longint; m: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm(l: longint; m: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_array(lmax: longint; m: longint; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_sphPlm_deriv_array(lmax: longint; m: longint; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_size(lmax: longint; m: longint): longint; cdecl; external libgsl;
function gsl_sf_conicalP_half_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_half(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_conicalP_mhalf_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_mhalf(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_conicalP_0_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_0(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_conicalP_1_e(lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_1(lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_conicalP_sph_reg_e(l: longint; lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_sph_reg(l: longint; lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_conicalP_cyl_reg_e(m: longint; lambda: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_conicalP_cyl_reg(m: longint; lambda: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_H3d_0_e(lambda: Tdouble; eta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d_0(lambda: Tdouble; eta: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_H3d_1_e(lambda: Tdouble; eta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d_1(lambda: Tdouble; eta: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_H3d_e(l: longint; lambda: Tdouble; eta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_legendre_H3d(l: longint; lambda: Tdouble; eta: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_legendre_H3d_array(lmax: longint; lambda: Tdouble; eta: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;

type
  Pgsl_sf_legendre_t = ^Tgsl_sf_legendre_t;
  Tgsl_sf_legendre_t = longint;

const
  GSL_SF_LEGENDRE_SCHMIDT = 0;
  GSL_SF_LEGENDRE_SPHARM = 1;
  GSL_SF_LEGENDRE_FULL = 2;
  GSL_SF_LEGENDRE_NONE = 3;

function gsl_sf_legendre_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; csphase: Tdouble; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; csphase: Tdouble; result_array: Pdouble;
  result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_alt_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv_alt_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; csphase: Tdouble; result_array: Pdouble;
  result_deriv_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble;
  result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; csphase: Tdouble; result_array: Pdouble;
  result_deriv_array: Pdouble; result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_alt_array(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; result_array: Pdouble; result_deriv_array: Pdouble;
  result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_deriv2_alt_array_e(norm: Tgsl_sf_legendre_t; lmax: Tsize_t; x: Tdouble; csphase: Tdouble; result_array: Pdouble;
  result_deriv_array: Pdouble; result_deriv2_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_legendre_array_n(lmax: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_sf_legendre_nlm(lmax: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_sf_legendre_array_index(l: Tsize_t; m: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:38 ===


implementation



end.
