unit fp_mpfi;

interface

uses
  ctypes, fp_gmp, fp_mpfr;

const
  {$IFDEF Linux}
  libmpfi = 'mpfi';
  {$ENDIF}

  {$IFDEF Windows}
  libmpfi = 'libmpfi.dll'; // ?????????????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ===================== /usr/include/mpfi.h

const
  MPFI_VERSION_MAJOR = 1;
  MPFI_VERSION_MINOR = 5;
  MPFI_VERSION_PATCHLEVEL = 3;
  MPFI_VERSION_STRING = '1.5.3';

type
  Tmpfi = record
    left: Tmpfr;
    right: Tmpfr;
  end;
  Pmpfi = ^Tmpfi;
  PPmpfi = ^Pmpfi;

function mpfi_round_prec(para1: Pmpfi; prec: Tmp_prec_t): longint; cdecl; external libmpfi;

procedure mpfi_init(para1: Pmpfi); cdecl; external libmpfi;
procedure mpfi_init2(para1: Pmpfi; para2: Tmp_prec_t); cdecl; external libmpfi;

procedure mpfi_clear(para1: Pmpfi); cdecl; external libmpfi;

function mpfi_get_prec(para1: Pmpfi): Tmp_prec_t; cdecl; external libmpfi;
procedure mpfi_set_prec(para1: Pmpfi; para2: Tmp_prec_t); cdecl; external libmpfi;

function mpfi_set(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_set_si(para1: Pmpfi; para2: Tclong): longint; cdecl; external libmpfi;
function mpfi_set_ui(para1: Pmpfi; para2: Tculong): longint; cdecl; external libmpfi;
function mpfi_set_d(para1: Pmpfi; para2: double): longint; cdecl; external libmpfi;
function mpfi_set_z(para1: Pmpfi; para2: Pmpz): longint; cdecl; external libmpfi;
function mpfi_set_q(para1: Pmpfi; para2: Pmpq): longint; cdecl; external libmpfi;
function mpfi_set_fr(para1: Pmpfi; para2: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_set_str(para1: Pmpfi; para2: pchar; para3: longint): longint; cdecl; external libmpfi;

function mpfi_init_set(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_init_set_si(para1: Pmpfi; para2: Tclong): longint; cdecl; external libmpfi;
function mpfi_init_set_ui(para1: Pmpfi; para2: Tculong): longint; cdecl; external libmpfi;
function mpfi_init_set_d(para1: Pmpfi; para2: double): longint; cdecl; external libmpfi;
function mpfi_init_set_z(para1: Pmpfi; para2: Pmpz): longint; cdecl; external libmpfi;
function mpfi_init_set_q(para1: Pmpfi; para2: Pmpq): longint; cdecl; external libmpfi;
function mpfi_init_set_fr(para1: Pmpfi; para2: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_init_set_str(para1: Pmpfi; para2: pchar; para3: longint): longint; cdecl; external libmpfi;

procedure mpfi_swap(para1: Pmpfi; para2: Pmpfi); cdecl; external libmpfi;
function mpfi_diam_abs(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_diam_rel(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_diam(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mag(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mig(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mid(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;

procedure mpfi_alea(para1: Pmpfr; para2: Pmpfi); cdecl; external libmpfi;
procedure mpfi_urandom(para1: Pmpfr; para2: Pmpfi; para3: Tgmp_randstate); cdecl; external libmpfi;

function mpfi_get_d(para1: Pmpfi): double; cdecl; external libmpfi;
procedure mpfi_get_fr(para1: Pmpfr; para2: Pmpfi); cdecl; external libmpfi;

function mpfi_add(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sub(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_div(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_d(para1: Pmpfi; para2: Pmpfi; para3: double): longint; cdecl; external libmpfi;
function mpfi_sub_d(para1: Pmpfi; para2: Pmpfi; para3: double): longint; cdecl; external libmpfi;
function mpfi_d_sub(para1: Pmpfi; para2: double; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_d(para1: Pmpfi; para2: Pmpfi; para3: double): longint; cdecl; external libmpfi;
function mpfi_div_d(para1: Pmpfi; para2: Pmpfi; para3: double): longint; cdecl; external libmpfi;
function mpfi_d_div(para1: Pmpfi; para2: double; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_sub_ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_ui_sub(para1: Pmpfi; para2: Tculong; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_div_ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_ui_div(para1: Pmpfi; para2: Tculong; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_sub_si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_si_sub(para1: Pmpfi; para2: Tclong; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_div_si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_si_div(para1: Pmpfi; para2: Tclong; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_z(para1: Pmpfi; para2: Pmpfi; para3: Pmpz): longint; cdecl; external libmpfi;
function mpfi_sub_z(para1: Pmpfi; para2: Pmpfi; para3: Pmpz): longint; cdecl; external libmpfi;
function mpfi_z_sub(para1: Pmpfi; para2: Pmpz; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_z(para1: Pmpfi; para2: Pmpfi; para3: Pmpz): longint; cdecl; external libmpfi;
function mpfi_div_z(para1: Pmpfi; para2: Pmpfi; para3: Pmpz): longint; cdecl; external libmpfi;
function mpfi_z_div(para1: Pmpfi; para2: Pmpz; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_q(para1: Pmpfi; para2: Pmpfi; para3: Pmpq): longint; cdecl; external libmpfi;
function mpfi_sub_q(para1: Pmpfi; para2: Pmpfi; para3: Pmpq): longint; cdecl; external libmpfi;
function mpfi_q_sub(para1: Pmpfi; para2: Pmpq; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_q(para1: Pmpfi; para2: Pmpfi; para3: Pmpq): longint; cdecl; external libmpfi;
function mpfi_div_q(para1: Pmpfi; para2: Pmpfi; para3: Pmpq): longint; cdecl; external libmpfi;
function mpfi_q_div(para1: Pmpfi; para2: Pmpq; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_add_fr(para1: Pmpfi; para2: Pmpfi; para3: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_sub_fr(para1: Pmpfi; para2: Pmpfi; para3: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_fr_sub(para1: Pmpfi; para2: Pmpfr; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_mul_fr(para1: Pmpfi; para2: Pmpfi; para3: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_div_fr(para1: Pmpfi; para2: Pmpfi; para3: Pmpfr): longint; cdecl; external libmpfi;
function mpfi_fr_div(para1: Pmpfi; para2: Pmpfr; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_neg(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sqr(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_inv(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_sqrt(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_cbrt(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_abs(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_mul_2exp(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_mul_2ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_mul_2si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_div_2exp(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_div_2ui(para1: Pmpfi; para2: Pmpfi; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_div_2si(para1: Pmpfi; para2: Pmpfi; para3: Tclong): longint; cdecl; external libmpfi;

function mpfi_log(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_exp(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_exp2(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_cos(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sin(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_tan(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_acos(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_asin(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_atan(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_atan2(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sec(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_csc(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_cot(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_cosh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sinh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_tanh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_acosh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_asinh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_atanh(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_sech(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_csch(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_coth(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_log1p(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_expm1(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_log2(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_log10(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_hypot(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_const_log2(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_const_pi(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_const_euler(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_const_catalan(para1: Pmpfi): longint; cdecl; external libmpfi;

var
  mpfi_cmp: function(para1: Pmpfi; para2: Pmpfi): longint; cvar;external libmpfi;
  mpfi_cmp_d: function(para1: Pmpfi; para2: double): longint; cvar;external libmpfi;
  mpfi_cmp_ui: function(para1: Pmpfi; para2: Tculong): longint; cvar;external libmpfi;
  mpfi_cmp_si: function(para1: Pmpfi; para2: Tclong): longint; cvar;external libmpfi;
  mpfi_cmp_z: function(para1: Pmpfi; para2: Pmpz): longint; cvar;external libmpfi;
  mpfi_cmp_q: function(para1: Pmpfi; para2: Pmpq): longint; cvar;external libmpfi;
  mpfi_cmp_fr: function(para1: Pmpfi; para2: Pmpfr): longint; cvar;external libmpfi;
  mpfi_is_pos: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_nonneg: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_neg: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_nonpos: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_zero: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_strictly_pos: function(para1: Pmpfi): longint; cvar;external libmpfi;
  mpfi_is_strictly_neg: function(para1: Pmpfi): longint; cvar;external libmpfi;

function mpfi_has_zero(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_nan_p(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_inf_p(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_bounded_p(para1: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_get_left(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_get_right(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_revert_if_needed(para1: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_put(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_put_d(para1: Pmpfi; para2: double): longint; cdecl; external libmpfi;
function mpfi_put_si(para1: Pmpfi; para2: Tclong): longint; cdecl; external libmpfi;
function mpfi_put_ui(para1: Pmpfi; para2: Tculong): longint; cdecl; external libmpfi;
function mpfi_put_z(para1: Pmpfi; para2: Pmpz): longint; cdecl; external libmpfi;
function mpfi_put_q(para1: Pmpfi; para2: Pmpq): longint; cdecl; external libmpfi;
function mpfi_put_fr(para1: Pmpfi; para2: Pmpfr): longint; cdecl; external libmpfi;

function mpfi_interv_d(para1: Pmpfi; para2: double; para3: double): longint; cdecl; external libmpfi;
function mpfi_interv_si(para1: Pmpfi; para2: Tclong; para3: Tclong): longint; cdecl; external libmpfi;
function mpfi_interv_ui(para1: Pmpfi; para2: Tculong; para3: Tculong): longint; cdecl; external libmpfi;
function mpfi_interv_z(para1: Pmpfi; para2: Pmpz; para3: Pmpz): longint; cdecl; external libmpfi;
function mpfi_interv_q(para1: Pmpfi; para2: Pmpq; para3: Pmpq): longint; cdecl; external libmpfi;
function mpfi_interv_fr(para1: Pmpfi; para2: Pmpfr; para3: Pmpfr): longint; cdecl; external libmpfi;

function mpfi_is_strictly_inside(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside(para1: Pmpfi; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_d(para1: double; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_ui(para1: Tculong; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_si(para1: Tclong; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_z(para1: Pmpz; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_q(para1: Pmpq; para2: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_is_inside_fr(para1: Pmpfr; para2: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_is_empty(para1: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_intersect(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;
function mpfi_union(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_increase(para1: Pmpfi; para2: Pmpfr): longint; cdecl; external libmpfi;

function mpfi_blow(para1: Pmpfi; para2: Pmpfi; para3: double): longint; cdecl; external libmpfi;

function mpfi_bisect(para1: Pmpfi; para2: Pmpfi; para3: Pmpfi): longint; cdecl; external libmpfi;

function mpfi_get_version: pchar; cdecl; external libmpfi;

var
  mpfi_error: longint; cvar;external libmpfi;

procedure mpfi_reset_error; cdecl; external libmpfi;
procedure mpfi_set_error(para1: longint); cdecl; external libmpfi;
function mpfi_is_error: longint; cdecl; external libmpfi;

const
  MPFI_FLAGS_BOTH_ENDPOINTS_EXACT = 0;
  MPFI_FLAGS_LEFT_ENDPOINT_INEXACT = 1;
  MPFI_FLAGS_RIGHT_ENDPOINT_INEXACT = 2;
  MPFI_FLAGS_BOTH_ENDPOINTS_INEXACT = 3;

  // ===================== /usr/include/mpfi_io.h

function mpfi_out_str(stream: PFILE; base: longint; n_digits: Tsize_t; op: Pmpfi): Tsize_t; cdecl; external libmpfi;
function mpfi_inp_str(x: Pmpfi; stream: PFILE; base: longint): Tsize_t; cdecl; external libmpfi;
procedure mpfi_print_binary(para1: Pmpfi); cdecl; external libmpfi;


// === Konventiert am: 14-11-25 16:34:00 ===


implementation



end.
