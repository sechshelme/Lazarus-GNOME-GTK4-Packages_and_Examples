unit fp_mpfr;

interface

uses
  fp_gmp;

const
  {$IFDEF Linux}
  libmpfr = 'mpfr';
  {$ENDIF}

  {$IFDEF Windows}
  libmpfr = 'libmpfr-6.dll'; 
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  Tsize_t = SizeUInt;
  Tintmax_t = SizeInt;
  Tuintmax_t = SizeUInt;

  TDecimal64 = packed record  // ?????
    b0, b1, b2, b3, b4, b5, b6, b7: byte;
  end;

  TDecimal128 = packed record // ?????
    b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15: byte;
  end;

  TFloat128 = packed record // ?????
    b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15: byte;
  end;


const
  MPFR_VERSION_MAJOR = 4;
  MPFR_VERSION_MINOR = 2;
  MPFR_VERSION_PATCHLEVEL = 1;
  MPFR_VERSION_STRING = '4.2.1';

function MPFR_VERSION_NUM(a, b, c: longint): longint;
function MPFR_VERSION: longint;

type
  Pmpfr_void = ^Tmpfr_void;
  Tmpfr_void = pointer;

  Pmpfr_int = ^Tmpfr_int;
  Tmpfr_int = int32;

  Pmpfr_uint = ^Tmpfr_uint;
  Tmpfr_uint = uint32;

  Pmpfr_long = ^Tmpfr_long;
  Tmpfr_long = Tclong;

  Pmpfr_ulong = ^Tmpfr_ulong;
  Tmpfr_ulong = Tculong;

  Pmpfr_size_t = ^Tmpfr_size_t;
  Tmpfr_size_t = Tsize_t;

  Pmpfr_flags_t = ^Tmpfr_flags_t;
  Tmpfr_flags_t = int32;

const
  MPFR_FLAGS_UNDERFLOW = 1;
  MPFR_FLAGS_OVERFLOW = 2;
  MPFR_FLAGS_NAN = 4;
  MPFR_FLAGS_INEXACT = 8;
  MPFR_FLAGS_ERANGE = 16;
  MPFR_FLAGS_DIVBY0 = 32;
  MPFR_FLAGS_ALL = MPFR_FLAGS_UNDERFLOW or MPFR_FLAGS_OVERFLOW or MPFR_FLAGS_NAN or MPFR_FLAGS_INEXACT or MPFR_FLAGS_ERANGE or MPFR_FLAGS_DIVBY0;

type
  Pmpfr_rnd_t = ^Tmpfr_rnd_t;
  Tmpfr_rnd_t = longint;

const
  MPFR_RNDN = 0;
  MPFR_RNDZ = 1;
  MPFR_RNDU = 2;
  MPFR_RNDD = 3;
  MPFR_RNDA = 4;
  MPFR_RNDF = 5;
  MPFR_RNDNA = -(1);

const
  GMP_RNDN = MPFR_RNDN;
  GMP_RNDZ = MPFR_RNDZ;
  GMP_RNDU = MPFR_RNDU;
  GMP_RNDD = MPFR_RNDD;

type
  Pmpfr_prec_t = ^Tmpfr_prec_t;
  Tmpfr_prec_t = Tculong;

  Pmpfr_uprec_t = ^Tmpfr_uprec_t;
  Tmpfr_uprec_t = Tculong;

const
  MPFR_PREC_MIN = 1;
  MPFR_PREC_MAX = Tmpfr_prec_t(((Tmpfr_uprec_t(-(1))) shr 1) - 256);

type
  Pmpfr_sign_t = ^Tmpfr_sign_t;
  Tmpfr_sign_t = longint;

type
  Pmpfr_exp_t = ^Tmpfr_exp_t;
  Tmpfr_exp_t = Tclong;

  Pmpfr_uexp_t = ^Tmpfr_uexp_t;
  Tmpfr_uexp_t = Tculong;

const
  MPFR_EMAX_DEFAULT = Tmpfr_exp_t(((Tmpfr_ulong(1)) shl 30) - 1);
  MPFR_EMIN_DEFAULT = -(MPFR_EMAX_DEFAULT);

type
  Tmp_rnd_t = Tmpfr_rnd_t;
  Tmp_prec_t = Tmpfr_prec_t;

type
  Tmpfr = record
    _mpfr_prec: Tmpfr_prec_t;
    _mpfr_sign: Tmpfr_sign_t;
    _mpfr_exp: Tmpfr_exp_t;
    _mpfr_d: Pmp_limb_t;
  end;
  Pmpfr = ^Tmpfr;
  PPmpfr = ^Pmpfr;

type
  Pmpfr_kind_t = ^Tmpfr_kind_t;
  Tmpfr_kind_t = longint;

const
  MPFR_NAN_KIND = 0;
  MPFR_INF_KIND = 1;
  MPFR_ZERO_KIND = 2;
  MPFR_REGULAR_KIND = 3;

type
  Pmpfr_free_cache_t = ^Tmpfr_free_cache_t;
  Tmpfr_free_cache_t = longint;

const
  MPFR_FREE_LOCAL_CACHE = 1;
  MPFR_FREE_GLOBAL_CACHE = 2;

function mpfr_get_version: pchar; cdecl; external libmpfr;
function mpfr_get_patches: pchar; cdecl; external libmpfr;

function mpfr_buildopt_tls_p: longint; cdecl; external libmpfr;
function mpfr_buildopt_float128_p: longint; cdecl; external libmpfr;
function mpfr_buildopt_decimal_p: longint; cdecl; external libmpfr;
function mpfr_buildopt_gmpinternals_p: longint; cdecl; external libmpfr;
function mpfr_buildopt_sharedcache_p: longint; cdecl; external libmpfr;
function mpfr_buildopt_tune_case: pchar; cdecl; external libmpfr;

function mpfr_get_emin: Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_set_emin(para1: Tmpfr_exp_t): longint; cdecl; external libmpfr;
function mpfr_get_emin_min: Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_get_emin_max: Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_get_emax: Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_set_emax(para1: Tmpfr_exp_t): longint; cdecl; external libmpfr;
function mpfr_get_emax_min: Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_get_emax_max: Tmpfr_exp_t; cdecl; external libmpfr;

procedure mpfr_set_default_rounding_mode(para1: Tmpfr_rnd_t); cdecl; external libmpfr;
function mpfr_get_default_rounding_mode: Tmpfr_rnd_t; cdecl; external libmpfr;
function mpfr_print_rnd_mode(para1: Tmpfr_rnd_t): pchar; cdecl; external libmpfr;

procedure mpfr_clear_flags; cdecl; external libmpfr;
procedure mpfr_clear_underflow; cdecl; external libmpfr;
procedure mpfr_clear_overflow; cdecl; external libmpfr;
procedure mpfr_clear_divby0; cdecl; external libmpfr;
procedure mpfr_clear_nanflag; cdecl; external libmpfr;
procedure mpfr_clear_inexflag; cdecl; external libmpfr;
procedure mpfr_clear_erangeflag; cdecl; external libmpfr;

procedure mpfr_set_underflow; cdecl; external libmpfr;
procedure mpfr_set_overflow; cdecl; external libmpfr;
procedure mpfr_set_divby0; cdecl; external libmpfr;
procedure mpfr_set_nanflag; cdecl; external libmpfr;
procedure mpfr_set_inexflag; cdecl; external libmpfr;
procedure mpfr_set_erangeflag; cdecl; external libmpfr;

function mpfr_underflow_p: longint; cdecl; external libmpfr;
function mpfr_overflow_p: longint; cdecl; external libmpfr;
function mpfr_divby0_p: longint; cdecl; external libmpfr;
function mpfr_nanflag_p: longint; cdecl; external libmpfr;
function mpfr_inexflag_p: longint; cdecl; external libmpfr;
function mpfr_erangeflag_p: longint; cdecl; external libmpfr;

procedure mpfr_flags_clear(para1: Tmpfr_flags_t); cdecl; external libmpfr;
procedure mpfr_flags_set(para1: Tmpfr_flags_t); cdecl; external libmpfr;
function mpfr_flags_test(para1: Tmpfr_flags_t): Tmpfr_flags_t; cdecl; external libmpfr;
function mpfr_flags_save: Tmpfr_flags_t; cdecl; external libmpfr;
procedure mpfr_flags_restore(para1: Tmpfr_flags_t; para2: Tmpfr_flags_t); cdecl; external libmpfr;

function mpfr_check_range(para1: Pmpfr; para2: longint; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

procedure mpfr_init2(para1: Pmpfr; para2: Tmpfr_prec_t); cdecl; external libmpfr;
procedure mpfr_init(para1: Pmpfr); cdecl; external libmpfr;
procedure mpfr_clear(para1: Pmpfr); cdecl; external libmpfr;

procedure mpfr_inits2(para1: Tmpfr_prec_t; para2: Pmpfr); cdecl; varargs external libmpfr;
procedure mpfr_inits(para1: Pmpfr); cdecl; varargs external libmpfr;
procedure mpfr_clears(para1: Pmpfr); cdecl; varargs external libmpfr;

function mpfr_prec_round(para1: Pmpfr; para2: Tmpfr_prec_t; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_can_round(para1: Pmpfr; para2: Tmpfr_exp_t; para3: Tmpfr_rnd_t; para4: Tmpfr_rnd_t; para5: Tmpfr_prec_t): longint; cdecl; external libmpfr;
function mpfr_min_prec(para1: Pmpfr): Tmpfr_prec_t; cdecl; external libmpfr;

function mpfr_get_exp(para1: Pmpfr): Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_set_exp(para1: Pmpfr; para2: Tmpfr_exp_t): longint; cdecl; external libmpfr;
function mpfr_get_prec(para1: Pmpfr): Tmpfr_prec_t; cdecl; external libmpfr;
procedure mpfr_set_prec(para1: Pmpfr; para2: Tmpfr_prec_t); cdecl; external libmpfr;
procedure mpfr_set_prec_raw(para1: Pmpfr; para2: Tmpfr_prec_t); cdecl; external libmpfr;
procedure mpfr_set_default_prec(para1: Tmpfr_prec_t); cdecl; external libmpfr;
function mpfr_get_default_prec: Tmpfr_prec_t; cdecl; external libmpfr;

function mpfr_set_d(para1: Pmpfr; para2: double; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_flt(para1: Pmpfr; para2: single; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_set_decimal64(para1: Pmpfr; para2: TDecimal64; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_decimal128(para1: Pmpfr; para2: TDecimal128; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_set_ld(para1: Pmpfr; para2: Tlong_double; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_set_float128(para1: Pmpfr; para2: TFloat128; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_get_float128(para1: Pmpfr; para2: Tmpfr_rnd_t): TFloat128; cdecl; external libmpfr;

function mpfr_set_z(para1: Pmpfr; para2: Pmpz; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_z_2exp(para1: Pmpfr; para2: Pmpz; para3: Tmpfr_exp_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
procedure mpfr_set_nan(para1: Pmpfr); cdecl; external libmpfr;
procedure mpfr_set_inf(para1: Pmpfr; para2: longint); cdecl; external libmpfr;
procedure mpfr_set_zero(para1: Pmpfr; para2: longint); cdecl; external libmpfr;

function mpfr_set_f(para1: Pmpfr; para2: Pmpf; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cmp_f(para1: Pmpfr; para2: Pmpf): longint; cdecl; external libmpfr;
function mpfr_get_f(para1: Pmpf; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_set_si(para1: Pmpfr; para2: Tclong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_ui(para1: Pmpfr; para2: Tculong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_si_2exp(para1: Pmpfr; para2: Tclong; para3: Tmpfr_exp_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set_ui_2exp(para1: Pmpfr; para2: Tculong; para3: Tmpfr_exp_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_set_q(para1: Pmpfr; para2: Pmpq; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_q(para1: Pmpfr; para2: Pmpq; para3: Pmpq; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_q(para1: Pmpfr; para2: Pmpq; para3: Pmpq; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_add_q(para1: Pmpfr; para2: Pmpq; para3: Pmpq; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub_q(para1: Pmpfr; para2: Pmpq; para3: Pmpq; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cmp_q(para1: Pmpfr; para2: Pmpq): longint; cdecl; external libmpfr;
procedure mpfr_get_q(q: Pmpq; f: Pmpfr); cdecl; external libmpfr;

function mpfr_set_str(para1: Pmpfr; para2: pchar; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_init_set_str(para1: Pmpfr; para2: pchar; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set4(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t; para4: longint): longint; cdecl; external libmpfr;
function mpfr_abs(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_set(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_neg(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_signbit(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_setsign(para1: Pmpfr; para2: Pmpfr; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_copysign(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_get_z_2exp(para1: Pmpz; para2: Pmpfr): Tmpfr_exp_t; cdecl; external libmpfr;
function mpfr_get_flt(para1: Pmpfr; para2: Tmpfr_rnd_t): single; cdecl; external libmpfr;
function mpfr_get_d(para1: Pmpfr; para2: Tmpfr_rnd_t): double; cdecl; external libmpfr;

function mpfr_get_decimal64(para1: Pmpfr; para2: Tmpfr_rnd_t): TDecimal64; cdecl; external libmpfr;
function mpfr_get_decimal128(para1: Pmpfr; para2: Tmpfr_rnd_t): TDecimal128; cdecl; external libmpfr;

function mpfr_get_ld(para1: Pmpfr; para2: Tmpfr_rnd_t): Tlong_double; cdecl; external libmpfr;
function mpfr_get_d1(para1: Pmpfr): double; cdecl; external libmpfr;
function mpfr_get_d_2exp(para1: Pclong; para2: Pmpfr; para3: Tmpfr_rnd_t): double; cdecl; external libmpfr;
function mpfr_get_ld_2exp(para1: Pclong; para2: Pmpfr; para3: Tmpfr_rnd_t): Tlong_double; cdecl; external libmpfr;
function mpfr_frexp(para1: Pmpfr_exp_t; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_get_si(para1: Pmpfr; para2: Tmpfr_rnd_t): Tclong; cdecl; external libmpfr;
function mpfr_get_ui(para1: Pmpfr; para2: Tmpfr_rnd_t): Tculong; cdecl; external libmpfr;
function mpfr_get_str_ndigits(para1: longint; para2: Tmpfr_prec_t): Tsize_t; cdecl; external libmpfr;
function mpfr_get_str(para1: pchar; para2: Pmpfr_exp_t; para3: longint; para4: Tsize_t; para5: Pmpfr;
  para6: Tmpfr_rnd_t): pchar; cdecl; external libmpfr;
function mpfr_get_z(z: Pmpz; f: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
procedure mpfr_free_str(para1: pchar); cdecl; external libmpfr;
function mpfr_urandom(para1: Pmpfr; para2: Tgmp_randstate; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_grandom(para1: Pmpfr; para2: Pmpfr; para3: Tgmp_randstate; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_nrandom(para1: Pmpfr; para2: Tgmp_randstate; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_erandom(para1: Pmpfr; para2: Tgmp_randstate; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_urandomb(para1: Pmpfr; para2: Tgmp_randstate): longint; cdecl; external libmpfr;
procedure mpfr_nextabove(para1: Pmpfr); cdecl; external libmpfr;
procedure mpfr_nextbelow(para1: Pmpfr); cdecl; external libmpfr;
procedure mpfr_nexttoward(para1: Pmpfr; para2: Pmpfr); cdecl; external libmpfr;

function mpfr_printf(para1: pchar): longint; cdecl; varargs external libmpfr;
function mpfr_asprintf(para1: PPchar; para2: pchar): longint; cdecl; varargs external libmpfr;
function mpfr_sprintf(para1: pchar; para2: pchar): longint; cdecl; varargs external libmpfr;
function mpfr_snprintf(para1: pchar; para2: Tsize_t; para3: pchar): longint; cdecl; varargs external libmpfr;

function mpfr_pow(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_powr(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_pow_si(para1: Pmpfr; para2: Pmpfr; para3: Tclong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_compound_si(para1: Pmpfr; para2: Pmpfr; para3: Tclong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_pow_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_ui_pow_ui(para1: Pmpfr; para2: Tculong; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_ui_pow(para1: Pmpfr; para2: Tculong; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_pow_z(para1: Pmpfr; para2: Pmpfr; para3: Pmpz; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sqrt(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sqrt_ui(para1: Pmpfr; para2: Tculong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rec_sqrt(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_add(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_add_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_ui_sub(para1: Pmpfr; para2: Tculong; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_ui_div(para1: Pmpfr; para2: Tculong; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_add_si(para1: Pmpfr; para2: Pmpfr; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub_si(para1: Pmpfr; para2: Pmpfr; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_si_sub(para1: Pmpfr; para2: longint; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_si(para1: Pmpfr; para2: Pmpfr; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_si(para1: Pmpfr; para2: Pmpfr; para3: longint; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_si_div(para1: Pmpfr; para2: longint; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_add_d(para1: Pmpfr; para2: Pmpfr; para3: double; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub_d(para1: Pmpfr; para2: Pmpfr; para3: double; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_d_sub(para1: Pmpfr; para2: double; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_d(para1: Pmpfr; para2: Pmpfr; para3: double; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_d(para1: Pmpfr; para2: Pmpfr; para3: double; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_d_div(para1: Pmpfr; para2: double; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_sqr(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_const_pi(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_const_log2(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_const_euler(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_const_catalan(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_agm(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_log(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log2(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log10(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log1p(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log2p1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log10p1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_log_ui(para1: Pmpfr; para2: Tculong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_exp(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_exp2(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_exp10(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_expm1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_exp2m1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_exp10m1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_eint(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_li2(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_cmp(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_cmp3(para1: Pmpfr; para2: Pmpfr; para3: longint): longint; cdecl; external libmpfr;
function mpfr_cmp_d(para1: Pmpfr; para2: double): longint; cdecl; external libmpfr;
function mpfr_cmp_ld(para1: Pmpfr; para2: Tlong_double): longint; cdecl; external libmpfr;
function mpfr_cmp_ui(para1: Pmpfr; para2: Tculong): longint; cdecl; external libmpfr;
function mpfr_cmp_si(para1: Pmpfr; para2: Tclong): longint; cdecl; external libmpfr;
function mpfr_cmp_ui_2exp(para1: Pmpfr; para2: Tculong; para3: Tmpfr_exp_t): longint; cdecl; external libmpfr;
function mpfr_cmp_si_2exp(para1: Pmpfr; para2: Tclong; para3: Tmpfr_exp_t): longint; cdecl; external libmpfr;
function mpfr_cmpabs(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_cmpabs_ui(para1: Pmpfr; para2: Tculong): longint; cdecl; external libmpfr;
procedure mpfr_reldiff(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t); cdecl; external libmpfr;
function mpfr_eq(para1: Pmpfr; para2: Pmpfr; para3: Tculong): longint; cdecl; external libmpfr;
function mpfr_sgn(para1: Pmpfr): longint; cdecl; external libmpfr;

function mpfr_mul_2exp(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_2exp(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_2ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_2ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_mul_2si(para1: Pmpfr; para2: Pmpfr; para3: Tclong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_2si(para1: Pmpfr; para2: Pmpfr; para3: Tclong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_rint(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_roundeven(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_round(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_trunc(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_ceil(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_floor(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_rint_roundeven(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rint_round(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rint_trunc(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rint_ceil(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rint_floor(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_frac(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_modf(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_remquo(para1: Pmpfr; para2: Pclong; para3: Pmpfr; para4: Pmpfr; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_remainder(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fmod(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fmod_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fmodquo(para1: Pmpfr; para2: Pclong; para3: Pmpfr; para4: Pmpfr; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_fits_ulong_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_slong_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_uint_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_sint_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_ushort_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_sshort_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_uintmax_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fits_intmax_p(para1: Pmpfr; para2: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

procedure mpfr_extract(para1: Pmpz; para2: Pmpfr; para3: dword); cdecl; external libmpfr;
procedure mpfr_swap(para1: Pmpfr; para2: Pmpfr); cdecl; external libmpfr;
procedure mpfr_dump(para1: Pmpfr); cdecl; external libmpfr;

function mpfr_nan_p(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_inf_p(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_number_p(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_integer_p(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_zero_p(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_regular_p(para1: Pmpfr): longint; cdecl; external libmpfr;

function mpfr_greater_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_greaterequal_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_less_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_lessequal_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_lessgreater_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_equal_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_unordered_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;

function mpfr_atanh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_acosh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_asinh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cosh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sinh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_tanh(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sinh_cosh(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_sech(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_csch(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_coth(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_acos(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_asin(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atan(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sin(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sin_cos(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cos(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_tan(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atan2(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sec(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_csc(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cot(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_sinu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cosu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_tanu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_acosu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_asinu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atanu(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atan2u(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tculong; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_acospi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_asinpi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atanpi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_atan2pi(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_sinpi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cospi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_tanpi(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_hypot(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_erf(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_erfc(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cbrt(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_root(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rootn_ui(para1: Pmpfr; para2: Pmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_rootn_si(para1: Pmpfr; para2: Pmpfr; para3: Tclong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_gamma(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_gamma_inc(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_beta(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_lngamma(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_lgamma(para1: Pmpfr; para2: Plongint; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_digamma(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_zeta(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_zeta_ui(para1: Pmpfr; para2: Tculong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fac_ui(para1: Pmpfr; para2: Tculong; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_j0(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_j1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_jn(para1: Pmpfr; para2: Tclong; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_y0(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_y1(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_yn(para1: Pmpfr; para2: Tclong; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_ai(para1: Pmpfr; para2: Pmpfr; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_min(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_max(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_dim(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_mul_z(para1: Pmpfr; para2: Pmpfr; para3: Pmpz; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_div_z(para1: Pmpfr; para2: Pmpfr; para3: Pmpz; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_add_z(para1: Pmpfr; para2: Pmpfr; para3: Pmpz; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sub_z(para1: Pmpfr; para2: Pmpfr; para3: Pmpz; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_z_sub(para1: Pmpfr; para2: Pmpz; para3: Pmpfr; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_cmp_z(para1: Pmpfr; para2: Pmpz): longint; cdecl; external libmpfr;

function mpfr_fma(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Pmpfr; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fms(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Pmpfr; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fmma(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Pmpfr; para5: Pmpfr;
  para6: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_fmms(para1: Pmpfr; para2: Pmpfr; para3: Pmpfr; para4: Pmpfr; para5: Pmpfr;
  para6: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_sum(para1: Pmpfr; para2: PPmpfr; para3: Tculong; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr;
function mpfr_dot(para1: Pmpfr; para2: PPmpfr; para3: PPmpfr; para4: Tculong; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

procedure mpfr_free_cache; cdecl; external libmpfr;
procedure mpfr_free_cache2(para1: Tmpfr_free_cache_t); cdecl; external libmpfr;
procedure mpfr_free_pool; cdecl; external libmpfr;
function mpfr_mp_memory_cleanup: longint; cdecl; external libmpfr;

function mpfr_subnormalize(para1: Pmpfr; para2: longint; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

function mpfr_strtofr(para1: Pmpfr; para2: pchar; para3: PPchar; para4: longint; para5: Tmpfr_rnd_t): longint; cdecl; external libmpfr;

procedure mpfr_round_nearest_away_begin(para1: Pmpfr); cdecl; external libmpfr;
function mpfr_round_nearest_away_end(para1: Pmpfr; para2: longint): longint; cdecl; external libmpfr;

function mpfr_custom_get_size(para1: Tmpfr_prec_t): Tsize_t; cdecl; external libmpfr;
procedure mpfr_custom_init(para1: pointer; para2: Tmpfr_prec_t); cdecl; external libmpfr;
function mpfr_custom_get_significand(para1: Pmpfr): pointer; cdecl; external libmpfr;
function mpfr_custom_get_exp(para1: Pmpfr): Tmpfr_exp_t; cdecl; external libmpfr;
procedure mpfr_custom_move(para1: Pmpfr; para2: pointer); cdecl; external libmpfr;
procedure mpfr_custom_init_set(para1: Pmpfr; para2: longint; para3: Tmpfr_exp_t; para4: Tmpfr_prec_t; para5: pointer); cdecl; external libmpfr;
function mpfr_custom_get_kind(para1: Pmpfr): longint; cdecl; external libmpfr;
function mpfr_total_order_p(para1: Pmpfr; para2: Pmpfr): longint; cdecl; external libmpfr;

function mpfr_set_sj(para1: Pmpfr; para2: Tintmax_t; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_set_sj';
function mpfr_set_sj_2exp(para1: Pmpfr; para2: Tintmax_t; para3: Tintmax_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_set_sj_2exp';
function mpfr_set_uj(para1: Pmpfr; para2: Tuintmax_t; para3: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_set_uj';
function mpfr_set_uj_2exp(para1: Pmpfr; para2: Tuintmax_t; para3: Tintmax_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_set_uj_2exp';
function mpfr_get_sj(para1: Pmpfr; para2: Tmpfr_rnd_t): Tintmax_t; cdecl; external libmpfr name '__gmpfr_get_sj';
function mpfr_get_uj(para1: Pmpfr; para2: Tmpfr_rnd_t): Tuintmax_t; cdecl; external libmpfr name '__gmpfr_get_uj';
function mpfr_pow_uj(para1: Pmpfr; para2: Pmpfr; para3: Tuintmax_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_pow_uj';
function mpfr_pow_sj(para1: Pmpfr; para2: Pmpfr; para3: Tintmax_t; para4: Tmpfr_rnd_t): longint; cdecl; external libmpfr name '__gmpfr_pow_sj';

function mpfr_inp_str(para1: Pmpfr; para2: PFILE; para3: longint; para4: Tmpfr_rnd_t): Tsize_t; cdecl; external libmpfr name '__gmpfr_inp_str';
function mpfr_out_str(para1: PFILE; para2: longint; para3: Tsize_t; para4: Pmpfr; para5: Tmpfr_rnd_t): Tsize_t; cdecl; external libmpfr name '__gmpfr_out_str';

function mpfr_fprintf(para1: PFILE; para2: pchar): longint; cdecl; varargs external libmpfr name '__gmpfr_fprintf';

function mpfr_fpif_export(para1: PFILE; para2: Pmpfr): longint; cdecl; external libmpfr name '__gmpfr_fpif_export';
function mpfr_fpif_import(para1: Pmpfr; para2: PFILE): longint; cdecl; external libmpfr name '__gmpfr_fpif_import';

function mpfr_vprintf(para1: pchar; para2: Tva_list): longint; cdecl; external libmpfr name '__gmpfr_vprintf';
function mpfr_vasprintf(para1: PPchar; para2: pchar; para3: Tva_list): longint; cdecl; external libmpfr name '__gmpfr_vasprintf';
function mpfr_vsprintf(para1: pchar; para2: pchar; para3: Tva_list): longint; cdecl; external libmpfr name '__gmpfr_vsprintf';
function mpfr_vsnprintf(para1: pchar; para2: Tsize_t; para3: pchar; para4: Tva_list): longint; cdecl; external libmpfr name '__gmpfr_vsnprintf';

function mpfr_vfprintf(para1: PFILE; para2: pchar; para3: Tva_list): longint; cdecl; external libmpfr name '__gmpfr_vfprintf';

// === Konventiert am: 12-11-25 19:47:53 ===


implementation


function MPFR_VERSION_NUM(a, b, c: longint): longint;
begin
  MPFR_VERSION_NUM := ((a shl 16) or (b shl 8)) or c;
end;

function MPFR_VERSION: longint;
begin
  MPFR_VERSION := MPFR_VERSION_NUM(MPFR_VERSION_MAJOR, MPFR_VERSION_MINOR, MPFR_VERSION_PATCHLEVEL);
end;


end.
