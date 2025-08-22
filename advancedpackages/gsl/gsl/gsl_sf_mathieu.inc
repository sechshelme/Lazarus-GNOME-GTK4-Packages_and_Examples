{$IFDEF read_interface}



const
  GSL_SF_MATHIEU_COEFF = 100;

type
  Tgsl_sf_mathieu_workspace = record
    size: Tsize_t;
    even_order: Tsize_t;
    odd_order: Tsize_t;
    extra_values: longint;
    qa: Tdouble;
    qb: Tdouble;
    aa: Pdouble;
    bb: Pdouble;
    dd: Pdouble;
    ee: Pdouble;
    tt: Pdouble;
    e2: Pdouble;
    zz: Pdouble;
    eval: Pgsl_vector;
    evec: Pgsl_matrix;
    wmat: Pgsl_eigen_symmv_workspace;
  end;
  Pgsl_sf_mathieu_workspace = ^Tgsl_sf_mathieu_workspace;

function gsl_sf_mathieu_a_array(order_min: longint; order_max: longint; qq: Tdouble; work: Pgsl_sf_mathieu_workspace; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_b_array(order_min: longint; order_max: longint; qq: Tdouble; work: Pgsl_sf_mathieu_workspace; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_a_e(order: longint; qq: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_a(order: longint; qq: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_b_e(order: longint; qq: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_b(order: longint; qq: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_a_coeff(order: longint; qq: Tdouble; aa: Tdouble; coeff: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_b_coeff(order: longint; qq: Tdouble; aa: Tdouble; coeff: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_alloc(nn: Tsize_t; qq: Tdouble): Pgsl_sf_mathieu_workspace; cdecl; external libgsl;
procedure gsl_sf_mathieu_free(workspace: Pgsl_sf_mathieu_workspace); cdecl; external libgsl;
function gsl_sf_mathieu_ce_e(order: longint; qq: Tdouble; zz: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_ce(order: longint; qq: Tdouble; zz: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_se_e(order: longint; qq: Tdouble; zz: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_se(order: longint; qq: Tdouble; zz: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_ce_array(nmin: longint; nmax: longint; qq: Tdouble; zz: Tdouble; work: Pgsl_sf_mathieu_workspace;
  result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_se_array(nmin: longint; nmax: longint; qq: Tdouble; zz: Tdouble; work: Pgsl_sf_mathieu_workspace;
  result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_Mc_e(kind: longint; order: longint; qq: Tdouble; zz: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_Mc(kind: longint; order: longint; qq: Tdouble; zz: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_Ms_e(kind: longint; order: longint; qq: Tdouble; zz: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_mathieu_Ms(kind: longint; order: longint; qq: Tdouble; zz: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_mathieu_Mc_array(kind: longint; nmin: longint; nmax: longint; qq: Tdouble; zz: Tdouble;
  work: Pgsl_sf_mathieu_workspace; result_array: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_mathieu_Ms_array(kind: longint; nmin: longint; nmax: longint; qq: Tdouble; zz: Tdouble;
  work: Pgsl_sf_mathieu_workspace; result_array: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
