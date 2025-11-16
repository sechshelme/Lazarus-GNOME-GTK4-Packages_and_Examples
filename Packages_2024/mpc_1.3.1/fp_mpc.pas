unit fp_mpc;

interface

uses
  fp_gmp, fp_mpfr;

const
  {$IFDEF Linux}
  libmpc = 'mpc';
  {$ENDIF}

  {$IFDEF Windows}
  libmpc = 'libmpc.dll'; // ?????????????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tdouble_Complex = record
    r, i: double;
  end;

  {$IFDEF Linux}
  Tlong_double_Complex = record
    r, i: extended;
  end;
  {$ENDIF}

  {$IFDEF Windows}
  Tlong_double_Complex = record
    r, i: double;
  end;
  {$ENDIF}

  // ===========================

const
  MPC_VERSION_MAJOR = 1;
  MPC_VERSION_MINOR = 3;
  MPC_VERSION_PATCHLEVEL = 1;
  MPC_VERSION_STRING = '1.3.1';

const
  _MPC_H_HAVE_INTMAX_T = 1;

type
  Pmpc_rnd_t = ^Tmpc_rnd_t;
  Tmpc_rnd_t = longint;

const
  MPC_RNDNN = 0;
  MPC_RNDNZ = 16;
  MPC_RNDNU = 32;
  MPC_RNDND = 48;
  MPC_RNDNA = 64;

  MPC_RNDZN = 1;
  MPC_RNDZZ = 17;
  MPC_RNDZU = 33;
  MPC_RNDZD = 49;
  MPC_RNDZA = 65;

  MPC_RNDUN = 2;
  MPC_RNDUZ = 18;
  MPC_RNDUU = 34;
  MPC_RNDUD = 50;
  MPC_RNDUA = 66;

  MPC_RNDDN = 3;
  MPC_RNDDZ = 19;
  MPC_RNDDU = 35;
  MPC_RNDDD = 51;
  MPC_RNDDA = 67;

  MPC_RNDAN = 4;
  MPC_RNDAZ = 20;
  MPC_RNDAU = 36;
  MPC_RNDAD = 52;
  MPC_RNDAA = 68;


type
  Tmpc = record
    re: Pmpfr;
    im: Pmpfr;
  end;
  Pmpc = ^Tmpc;
  PPmpc = ^Pmpc;

  Tmpcr = record
    mant: int64;
    exp: int64;
  end;
  Pmpcr = ^Tmpcr;
  PPmpcr = ^Pmpcr;

  Tmpcb = record
    c: Pmpc;
    r: Pmpcr;
  end;
  Pmpcb = ^Tmpcb;
  PPmpcb = ^Pmpcb;

function mpc_add(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_add_fr(para1: Pmpc; para2: Pmpc; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_add_si(para1: Pmpc; para2: Pmpc; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_add_ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sub(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sub_fr(para1: Pmpc; para2: Pmpc; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_fr_sub(para1: Pmpc; para2: Pmpfr; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sub_ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_ui_ui_sub(para1: Pmpc; para2: Tculong; para3: Tculong; para4: Pmpc; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_fr(para1: Pmpc; para2: Pmpc; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_si(para1: Pmpc; para2: Pmpc; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_i(para1: Pmpc; para2: Pmpc; para3: longint; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sqr(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_div(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_fr(para1: Pmpc; para2: Pmpc; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_ld(para1: Pmpc; para2: Pmpc; para3: Tlong_double; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_d(para1: Pmpc; para2: Pmpc; para3: double; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_si(para1: Pmpc; para2: Pmpc; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_pow_z(para1: Pmpc; para2: Pmpc; para3: Pmpz; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_div_fr(para1: Pmpc; para2: Pmpc; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_fr_div(para1: Pmpc; para2: Pmpfr; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_div_ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_ui_div(para1: Pmpc; para2: Tculong; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_div_2ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_2ui(para1: Pmpc; para2: Pmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_div_2si(para1: Pmpc; para2: Pmpc; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_mul_2si(para1: Pmpc; para2: Pmpc; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_conj(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_neg(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sum(para1: Pmpc; para2: PPmpc; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_dot(para1: Pmpc; para2: PPmpc; para3: PPmpc; para4: Tculong; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_norm(para1: Pmpfr; para2: Pmpc; para3: Tmpfr_rnd_t): longint; cdecl; external libmpc;
function mpc_abs(para1: Pmpfr; para2: Pmpc; para3: Tmpfr_rnd_t): longint; cdecl; external libmpc;
function mpc_sqrt(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_d(para1: Pmpc; para2: double; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_d_d(para1: Pmpc; para2: double; para3: double; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_ld(para1: Pmpc; para2: Tlong_double; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_ld_ld(para1: Pmpc; para2: Tlong_double; para3: Tlong_double; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_f(para1: Pmpc; para2: Pmpf; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_f_f(para1: Pmpc; para2: Pmpf; para3: Pmpf; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_fr(para1: Pmpc; para2: Pmpfr; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_fr_fr(para1: Pmpc; para2: Pmpfr; para3: Pmpfr; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_q(para1: Pmpc; para2: Pmpq; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_q_q(para1: Pmpc; para2: Pmpq; para3: Pmpq; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_si(para1: Pmpc; para2: Tclong; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_si_si(para1: Pmpc; para2: Tclong; para3: Tclong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_ui(para1: Pmpc; para2: Tculong; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_ui_ui(para1: Pmpc; para2: Tculong; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_z(para1: Pmpc; para2: Pmpz; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_z_z(para1: Pmpc; para2: Pmpz; para3: Pmpz; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
procedure mpc_swap(para1: Pmpc; para2: Pmpc); cdecl; external libmpc;
function mpc_fma(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Pmpc; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;

procedure mpc_set_nan(para1: Pmpc); cdecl; external libmpc;

function mpc_real(para1: Pmpfr; para2: Pmpc; para3: Tmpfr_rnd_t): longint; cdecl; external libmpc;
function mpc_imag(para1: Pmpfr; para2: Pmpc; para3: Tmpfr_rnd_t): longint; cdecl; external libmpc;
function mpc_arg(para1: Pmpfr; para2: Pmpc; para3: Tmpfr_rnd_t): longint; cdecl; external libmpc;
function mpc_proj(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_cmp(para1: Pmpc; para2: Pmpc): longint; cdecl; external libmpc;
function mpc_cmp_si_si(para1: Pmpc; para2: Tclong; para3: Tclong): longint; cdecl; external libmpc;
function mpc_cmp_abs(para1: Pmpc; para2: Pmpc): longint; cdecl; external libmpc;
function mpc_exp(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_log(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_log10(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_agm(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sin(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_cos(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sin_cos(para1: Pmpc; para2: Pmpc; para3: Pmpc; para4: Tmpc_rnd_t; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_tan(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_sinh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_cosh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_tanh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_asin(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_acos(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_atan(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_asinh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_acosh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_atanh(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_rootofunity(para1: Pmpc; para2: Tculong; para3: Tculong; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
procedure mpc_clear(para1: Pmpc); cdecl; external libmpc;
function mpc_urandom(para1: Pmpc; para2: Tgmp_randstate): longint; cdecl; external libmpc;
procedure mpc_init2(para1: Pmpc; para2: Tmpfr_prec_t); cdecl; external libmpc;
procedure mpc_init3(para1: Pmpc; para2: Tmpfr_prec_t; para3: Tmpfr_prec_t); cdecl; external libmpc;
function mpc_get_prec(x: Pmpc): Tmpfr_prec_t; cdecl; external libmpc;
procedure mpc_get_prec2(pr: Pmpfr_prec_t; pi: Pmpfr_prec_t; x: Pmpc); cdecl; external libmpc;
procedure mpc_set_prec(para1: Pmpc; para2: Tmpfr_prec_t); cdecl; external libmpc;
function mpc_get_version: pchar; cdecl; external libmpc;

function mpc_strtoc(para1: Pmpc; para2: pchar; para3: PPchar; para4: longint; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_str(para1: Pmpc; para2: pchar; para3: longint; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_get_str(para1: longint; para2: Tsize_t; para3: Pmpc; para4: Tmpc_rnd_t): pchar; cdecl; external libmpc;
procedure mpc_free_str(para1: pchar); cdecl; external libmpc;

function mpc_set_sj(para1: Pmpc; para2: Tintmax_t; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_uj(para1: Pmpc; para2: Tuintmax_t; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_sj_sj(para1: Pmpc; para2: Tintmax_t; para3: Tintmax_t; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_uj_uj(para1: Pmpc; para2: Tuintmax_t; para3: Tuintmax_t; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;

function mpc_set_dc(para1: Pmpc; para2: Tdouble_Complex; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_set_ldc(para1: Pmpc; para2: Tlong_double_Complex; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_get_dc(para1: Pmpc; para2: Tmpc_rnd_t): Tdouble_Complex; cdecl; external libmpc;
function mpc_get_ldc(para1: Pmpc; para2: Tmpc_rnd_t): Tlong_double_Complex; cdecl; external libmpc;

function mpc_inp_str(para1: Pmpc; para2: PFILE; para3: Psize_t; para4: longint; para5: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_out_str(para1: PFILE; para2: longint; para3: Tsize_t; para4: Pmpc; para5: Tmpc_rnd_t): Tsize_t; cdecl; external libmpc;
procedure mpcb_out_str(f: PFILE; para2: Pmpcb); cdecl; external libmpc;
procedure mpcr_out_str(f: PFILE; r: Pmpcr); cdecl; external libmpc;

function mpcr_inf_p(r: Pmpcr): longint; cdecl; external libmpc;
function mpcr_zero_p(r: Pmpcr): longint; cdecl; external libmpc;
function mpcr_lt_half_p(r: Pmpcr): longint; cdecl; external libmpc;
function mpcr_cmp(r: Pmpcr; s: Pmpcr): longint; cdecl; external libmpc;
procedure mpcr_set_inf(r: Pmpcr); cdecl; external libmpc;
procedure mpcr_set_zero(r: Pmpcr); cdecl; external libmpc;
procedure mpcr_set_one(r: Pmpcr); cdecl; external libmpc;
procedure mpcr_set(r: Pmpcr; s: Pmpcr); cdecl; external libmpc;
procedure mpcr_set_ui64_2si64(r: Pmpcr; mant: uint64; exp: int64); cdecl; external libmpc;
procedure mpcr_max(r: Pmpcr; s: Pmpcr; t: Pmpcr); cdecl; external libmpc;
function mpcr_get_exp(r: Pmpcr): int64; cdecl; external libmpc;
procedure mpcr_mul(r: Pmpcr; s: Pmpcr; t: Pmpcr); cdecl; external libmpc;
procedure mpcr_mul_2ui(r: Pmpcr; s: Pmpcr; e: Tculong); cdecl; external libmpc;
procedure mpcr_sqr(r: Pmpcr; s: Pmpcr); cdecl; external libmpc;
procedure mpcr_add(r: Pmpcr; s: Pmpcr; t: Pmpcr); cdecl; external libmpc;
procedure mpcr_sub(r: Pmpcr; s: Pmpcr; t: Pmpcr); cdecl; external libmpc;
procedure mpcr_sub_rnd(r: Pmpcr; s: Pmpcr; t: Pmpcr; rnd: Tmpfr_rnd_t); cdecl; external libmpc;
procedure mpcr_div(r: Pmpcr; s: Pmpcr; t: Pmpcr); cdecl; external libmpc;
procedure mpcr_div_2ui(r: Pmpcr; s: Pmpcr; e: Tculong); cdecl; external libmpc;
function sqrt_int64(n: int64): int64; cdecl; external libmpc;
procedure mpcr_sqrt(r: Pmpcr; s: Pmpcr); cdecl; external libmpc;
procedure mpcr_add_rounding_error(r: Pmpcr; p: Tmpfr_prec_t; rnd: Tmpfr_rnd_t); cdecl; external libmpc;
procedure mpcr_c_abs_rnd(r: Pmpcr; z: Pmpc; rnd: Tmpfr_rnd_t); cdecl; external libmpc;
procedure mpcb_init(para1: Pmpcb); cdecl; external libmpc;
procedure mpcb_clear(para1: Pmpcb); cdecl; external libmpc;
function mpcb_get_prec(para1: Pmpcb): Tmpfr_prec_t; cdecl; external libmpc;
procedure mpcb_set_prec(para1: Pmpcb; para2: Tmpfr_prec_t); cdecl; external libmpc;
procedure mpcb_set(para1: Pmpcb; para2: Pmpcb); cdecl; external libmpc;
procedure mpcb_set_inf(para1: Pmpcb); cdecl; external libmpc;
procedure mpcb_set_c(para1: Pmpcb; para2: Pmpc; para3: Tmpfr_prec_t; para4: Tculong; para5: Tculong); cdecl; external libmpc;
procedure mpcb_set_ui_ui(para1: Pmpcb; para2: Tculong; para3: Tculong; para4: Tmpfr_prec_t); cdecl; external libmpc;
procedure mpcb_neg(para1: Pmpcb; para2: Pmpcb); cdecl; external libmpc;
procedure mpcb_mul(para1: Pmpcb; para2: Pmpcb; para3: Pmpcb); cdecl; external libmpc;
procedure mpcb_sqr(para1: Pmpcb; para2: Pmpcb); cdecl; external libmpc;
procedure mpcb_pow_ui(para1: Pmpcb; para2: Pmpcb; para3: Tculong); cdecl; external libmpc;
procedure mpcb_add(para1: Pmpcb; para2: Pmpcb; para3: Pmpcb); cdecl; external libmpc;
procedure mpcb_sqrt(para1: Pmpcb; para2: Pmpcb); cdecl; external libmpc;
procedure mpcb_div(para1: Pmpcb; para2: Pmpcb; para3: Pmpcb); cdecl; external libmpc;
procedure mpcb_div_2ui(para1: Pmpcb; para2: Pmpcb; para3: Tculong); cdecl; external libmpc;
function mpcb_can_round(para1: Pmpcb; para2: Tmpfr_prec_t; para3: Tmpfr_prec_t; para4: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpcb_round(para1: Pmpc; para2: Pmpcb; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;
function mpc_eta_fund(para1: Pmpc; para2: Pmpc; para3: Tmpc_rnd_t): longint; cdecl; external libmpc;

// === Konventiert am: 14-11-25 17:24:48 ===


implementation


end.
