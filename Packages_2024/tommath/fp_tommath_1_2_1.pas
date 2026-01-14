unit fp_tommath_1_2_1;

interface

// =============== Version: 1.2.1-2build1


const
  {$IFDEF Linux}
  libttommath = 'libtommath';
  {$ENDIF}

  {$IFDEF mswindows}
  libttommath = 'libtommath-1.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;


  // ======================

type
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  Tint64_t = int64;
  Pint64 = ^Tint64_t;

  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  PFILE = Pointer;

// ======================

type
  Pmp_digit = ^Tmp_digit;
  Tmp_digit = Tuint32_t;

const
  MP_DIGIT_BIT = 28;

  MP_MASK = ((Tmp_digit(1)) shl (Tmp_digit(MP_DIGIT_BIT))) - (Tmp_digit(1));

const
  MP_DIGIT_MAX = MP_MASK;
  MP_PRIME_BBS = $0001;
  MP_PRIME_SAFE = $0002;
  MP_PRIME_2MSB_ON = $0008;

type
  Pmp_sign = ^Tmp_sign;
  Tmp_sign = longint;

const
  MP_ZPOS = 0;
  MP_NEG_ = 1;

type
  Pmp_ord = ^Tmp_ord;
  Tmp_ord = longint;

const
  MP_LT = -(1);
  MP_EQ = 0;
  MP_GT = 1;

type
  Pmp_bool = ^Tmp_bool;
  Tmp_bool = longint;

const
  MP_NO = 0;
  MP_YES = 1;

type
  Pmp_err = ^Tmp_err;
  Tmp_err = longint;

const
  MP_OKAY = 0;
  MP_ERR = -(1);
  MP_MEM = -(2);
  MP_VAL = -(3);
  MP_ITER = -(4);
  MP_BUF = -(5);

type
  Pmp_order = ^Tmp_order;
  Tmp_order = longint;

const
  MP_LSB_FIRST = -(1);
  MP_MSB_FIRST = 1;

type
  Pmp_endian = ^Tmp_endian;
  Tmp_endian = longint;

const
  MP_LITTLE_ENDIAN = -(1);
  MP_NATIVE_ENDIAN = 0;
  MP_BIG_ENDIAN = 1;

var
  KARATSUBA_MUL_CUTOFF: longint; cvar;external libttommath;
  KARATSUBA_SQR_CUTOFF: longint; cvar;external libttommath;
  TOOM_MUL_CUTOFF: longint; cvar;external libttommath;
  TOOM_SQR_CUTOFF: longint; cvar;external libttommath;

const
  PRIVATE_MP_PREC = 32;

type
  Tmp_int = record
    used: longint;
    alloc: longint;
    sign: Tmp_sign;
    dp: Pmp_digit;
  end;
  Pmp_int = ^Tmp_int;

  Tprivate_mp_prime_callback = function(dst: pbyte; len: longint; dat: pointer): longint; cdecl;

function mp_error_to_string(code: Tmp_err): pchar; cdecl; external libttommath;
function mp_init(a: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_clear(a: Pmp_int); cdecl; external libttommath;
function mp_init_multi(mp: Pmp_int): Tmp_err; varargs; cdecl; external libttommath;
procedure mp_clear_multi(mp: Pmp_int); varargs; cdecl; external libttommath;
procedure mp_exch(a: Pmp_int; b: Pmp_int); cdecl; external libttommath;
function mp_shrink(a: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_grow(a: Pmp_int; size: longint): Tmp_err; cdecl; external libttommath;
function mp_init_size(a: Pmp_int; size: longint): Tmp_err; cdecl; external libttommath;
function mp_iseven(a: Pmp_int): Tmp_bool; cdecl; external libttommath;
function mp_isodd(a: Pmp_int): Tmp_bool; cdecl; external libttommath;

procedure mp_zero(a: Pmp_int); cdecl; external libttommath;
function mp_get_double(a: Pmp_int): double; cdecl; external libttommath;
function mp_set_double(a: Pmp_int; b: double): Tmp_err; cdecl; external libttommath;
function mp_get_i32(a: Pmp_int): Tint32_t; cdecl; external libttommath;
procedure mp_set_i32(a: Pmp_int; b: Tint32_t); cdecl; external libttommath;
function mp_init_i32(a: Pmp_int; b: Tint32_t): Tmp_err; cdecl; external libttommath;

procedure mp_set_u32(a: Pmp_int; b: Tuint32_t); cdecl; external libttommath;
function mp_init_u32(a: Pmp_int; b: Tuint32_t): Tmp_err; cdecl; external libttommath;
function mp_get_i64(a: Pmp_int): Tint64_t; cdecl; external libttommath;
procedure mp_set_i64(a: Pmp_int; b: Tint64_t); cdecl; external libttommath;
function mp_init_i64(a: Pmp_int; b: Tint64_t): Tmp_err; cdecl; external libttommath;

procedure mp_set_u64(a: Pmp_int; b: Tuint64_t); cdecl; external libttommath;
function mp_init_u64(a: Pmp_int; b: Tuint64_t): Tmp_err; cdecl; external libttommath;
function mp_get_mag_u32(a: Pmp_int): Tuint32_t; cdecl; external libttommath;
function mp_get_mag_u64(a: Pmp_int): Tuint64_t; cdecl; external libttommath;
function mp_get_mag_ul(a: Pmp_int): Tclong; cdecl; external libttommath;
function mp_get_mag_ull(a: Pmp_int): qword; cdecl; external libttommath;
function mp_get_l(a: Pmp_int): Tclong; cdecl; external libttommath;
procedure mp_set_l(a: Pmp_int; b: Tclong); cdecl; external libttommath;
function mp_init_l(a: Pmp_int; b: Tclong): Tmp_err; cdecl; external libttommath;

procedure mp_set_ul(a: Pmp_int; b: Tculong); cdecl; external libttommath;
function mp_init_ul(a: Pmp_int; b: Tculong): Tmp_err; cdecl; external libttommath;
function mp_get_ll(a: Pmp_int): int64; cdecl; external libttommath;
procedure mp_set_ll(a: Pmp_int; b: int64); cdecl; external libttommath;
function mp_init_ll(a: Pmp_int; b: int64): Tmp_err; cdecl; external libttommath;

procedure mp_set_ull(a: Pmp_int; b: qword); cdecl; external libttommath;
function mp_init_ull(a: Pmp_int; b: qword): Tmp_err; cdecl; external libttommath;
procedure mp_set(a: Pmp_int; b: Tmp_digit); cdecl; external libttommath;
function mp_init_set(a: Pmp_int; b: Tmp_digit): Tmp_err; cdecl; external libttommath;

function mp_get_int(a: Pmp_int): Tculong; cdecl; external libttommath; deprecated;
function mp_get_long(a: Pmp_int): Tculong; cdecl; external libttommath; deprecated;
function mp_get_long_long(a: Pmp_int): qword; cdecl; external libttommath; deprecated;
function mp_set_int(a: Pmp_int; b: Tculong): Tmp_err; cdecl; external libttommath; deprecated;
function mp_set_long(a: Pmp_int; b: Tculong): Tmp_err; cdecl; external libttommath; deprecated;
function mp_set_long_long(a: Pmp_int; b: qword): Tmp_err; cdecl; external libttommath; deprecated;
function mp_init_set_int(a: Pmp_int; b: Tculong): Tmp_err; cdecl; external libttommath; deprecated;

function mp_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_init_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_clamp(a: Pmp_int); cdecl; external libttommath;

function mp_export(rop: pointer; countp: Psize_t; order: longint; size: Tsize_t; endian: longint; nails: Tsize_t; op: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_import(rop: Pmp_int; Count: Tsize_t; order: longint; size: Tsize_t; endian: longint; nails: Tsize_t; op: pointer): Tmp_err; cdecl; external libttommath; deprecated;

function mp_unpack(rop: Pmp_int; Count: Tsize_t; order: Tmp_order; size: Tsize_t; endian: Tmp_endian;
  nails: Tsize_t; op: pointer): Tmp_err; cdecl; external libttommath;
function mp_pack_count(a: Pmp_int; nails: Tsize_t; size: Tsize_t): Tsize_t; cdecl; external libttommath;
function mp_pack(rop: pointer; maxcount: Tsize_t; written: Psize_t; order: Tmp_order; size: Tsize_t;
  endian: Tmp_endian; nails: Tsize_t; op: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_rshd(a: Pmp_int; b: longint); cdecl; external libttommath;
function mp_lshd(a: Pmp_int; b: longint): Tmp_err; cdecl; external libttommath;
function mp_div_2d(a: Pmp_int; b: longint; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div_2(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div_3(a: Pmp_int; c: Pmp_int; d: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_mul_2d(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul_2(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mod_2d(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_2expt(a: Pmp_int; b: longint): Tmp_err; cdecl; external libttommath;
function mp_cnt_lsb(a: Pmp_int): longint; cdecl; external libttommath;
function mp_rand(a: Pmp_int; digits: longint): Tmp_err; cdecl; external libttommath;

function mp_rand_digit(r: Pmp_digit): Tmp_err; cdecl; external libttommath; deprecated;

type
  Trand_source = function(out_: pointer; size: Tsize_t): Tmp_err; cdecl;

procedure mp_rand_source(Source: Trand_source); cdecl; external libttommath;

var
  ltm_rng: function(out_: pbyte; outlen: Tculong; callback: TProcedure): Tculong; cvar;external libttommath;
  ltm_rng_callback: procedure; cvar;external libttommath;

function mp_get_bit(a: Pmp_int; b: longint): longint; cdecl; external libttommath; deprecated;
function mp_tc_xor(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_xor(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_tc_or(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_or(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_tc_and(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_and(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_complement(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_tc_div_2d(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_signed_rsh(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_neg(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_abs(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_cmp(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libttommath;
function mp_cmp_mag(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libttommath;
function mp_add(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sub(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_incr(a: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_decr(a: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_cmp_d(a: Pmp_int; b: Tmp_digit): Tmp_ord; cdecl; external libttommath;
function mp_add_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sub_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int; d: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_mod_d(a: Pmp_int; b: Tmp_digit; c: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_addmod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_submod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mulmod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqrmod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_invmod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_gcd(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_exteuclid(a: Pmp_int; b: Pmp_int; U1: Pmp_int; U2: Pmp_int; U3: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_lcm(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;

function mp_root_u32(a: Pmp_int; b: Tuint32_t; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_n_root(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_n_root_ex(a: Pmp_int; b: Tmp_digit; c: Pmp_int; fast: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_sqrt(arg: Pmp_int; ret: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqrtmod_prime(n: Pmp_int; prime: Pmp_int; ret: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_is_square(arg: Pmp_int; ret: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_jacobi(a: Pmp_int; n: Pmp_int; c: Plongint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_kronecker(a: Pmp_int; p: Pmp_int; c: Plongint): Tmp_err; cdecl; external libttommath;
function mp_reduce_setup(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_reduce(x: Pmp_int; m: Pmp_int; mu: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_montgomery_setup(n: Pmp_int; rho: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_montgomery_calc_normalization(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_montgomery_reduce(x: Pmp_int; n: Pmp_int; rho: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_dr_is_modulus(a: Pmp_int): Tmp_bool; cdecl; external libttommath;
procedure mp_dr_setup(a: Pmp_int; d: Pmp_digit); cdecl; external libttommath;
function mp_dr_reduce(x: Pmp_int; n: Pmp_int; k: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_is_2k(a: Pmp_int): Tmp_bool; cdecl; external libttommath;
function mp_reduce_2k_setup(a: Pmp_int; d: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_2k(a: Pmp_int; n: Pmp_int; d: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_is_2k_l(a: Pmp_int): Tmp_bool; cdecl; external libttommath;
function mp_reduce_2k_setup_l(a: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_reduce_2k_l(a: Pmp_int; n: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_exptmod(G: Pmp_int; X: Pmp_int; P: Pmp_int; Y: Pmp_int): Tmp_err; cdecl; external libttommath;

const
  PRIVATE_MP_PRIME_TAB_SIZE = 256; // deprecated;

var
  ltm_prime_tab: array[0..(PRIVATE_MP_PRIME_TAB_SIZE) - 1] of Tmp_digit; cvar;external libttommath; // deprecated;

function mp_prime_is_divisible(a: Pmp_int; Result: Pmp_bool): Tmp_err; cdecl; external libttommath; deprecated;

function mp_prime_fermat(a: Pmp_int; b: Pmp_int; Result: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_prime_miller_rabin(a: Pmp_int; b: Pmp_int; Result: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_prime_rabin_miller_trials(size: longint): longint; cdecl; external libttommath;
function mp_prime_strong_lucas_selfridge(a: Pmp_int; Result: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_prime_frobenius_underwood(N: Pmp_int; Result: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_prime_is_prime(a: Pmp_int; t: longint; Result: Pmp_bool): Tmp_err; cdecl; external libttommath;
function mp_prime_next_prime(a: Pmp_int; t: longint; bbs_style: longint): Tmp_err; cdecl; external libttommath;
function mp_prime_random_ex(a: Pmp_int; t: longint; size: longint; flags: longint; cb: Tprivate_mp_prime_callback; dat: pointer): Tmp_err; cdecl; external libttommath; deprecated;
function mp_prime_rand(a: Pmp_int; t: longint; size: longint; flags: longint): Tmp_err; cdecl; external libttommath;
function mp_log_u32(a: Pmp_int; base: Tuint32_t; c: Puint32_t): Tmp_err; cdecl; external libttommath;
function mp_expt_u32(a: Pmp_int; b: Tuint32_t; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_expt_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath; deprecated;
function mp_expt_d_ex(a: Pmp_int; b: Tmp_digit; c: Pmp_int; fast: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_count_bits(a: Pmp_int): longint; cdecl; external libttommath;

function mp_unsigned_bin_size(a: Pmp_int): longint; cdecl; external libttommath; deprecated;
function mp_read_unsigned_bin(a: Pmp_int; b: pbyte; c: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_to_unsigned_bin(a: Pmp_int; b: pbyte): Tmp_err; cdecl; external libttommath; deprecated;
function mp_to_unsigned_bin_n(a: Pmp_int; b: pbyte; outlen: Pculong): Tmp_err; cdecl; external libttommath; deprecated;
function mp_signed_bin_size(a: Pmp_int): longint; cdecl; external libttommath; deprecated;
function mp_read_signed_bin(a: Pmp_int; b: pbyte; c: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_to_signed_bin(a: Pmp_int; b: pbyte): Tmp_err; cdecl; external libttommath; deprecated;
function mp_to_signed_bin_n(a: Pmp_int; b: pbyte; outlen: Pculong): Tmp_err; cdecl; external libttommath; deprecated;

function mp_ubin_size(a: Pmp_int): Tsize_t; cdecl; external libttommath;
function mp_from_ubin(a: Pmp_int; buf: pbyte; size: Tsize_t): Tmp_err; cdecl; external libttommath;
function mp_to_ubin(a: Pmp_int; buf: pbyte; maxlen: Tsize_t; written: Psize_t): Tmp_err; cdecl; external libttommath;
function mp_sbin_size(a: Pmp_int): Tsize_t; cdecl; external libttommath;
function mp_from_sbin(a: Pmp_int; buf: pbyte; size: Tsize_t): Tmp_err; cdecl; external libttommath;
function mp_to_sbin(a: Pmp_int; buf: pbyte; maxlen: Tsize_t; written: Psize_t): Tmp_err; cdecl; external libttommath;
function mp_read_radix(a: Pmp_int; str: pchar; radix: longint): Tmp_err; cdecl; external libttommath;
function mp_toradix(a: Pmp_int; str: pchar; radix: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_toradix_n(a: Pmp_int; str: pchar; radix: longint; maxlen: longint): Tmp_err; cdecl; external libttommath; deprecated;
function mp_to_radix(a: Pmp_int; str: pchar; maxlen: Tsize_t; written: Psize_t; radix: longint): Tmp_err; cdecl; external libttommath;
function mp_radix_size(a: Pmp_int; radix: longint; size: Plongint): Tmp_err; cdecl; external libttommath;
function mp_fread(a: Pmp_int; radix: longint; stream: PFILE): Tmp_err; cdecl; external libttommath;
function mp_fwrite(a: Pmp_int; radix: longint; stream: PFILE): Tmp_err; cdecl; external libttommath;

function mp_iszero(a: Pmp_int): longint;
function mp_isneg(a: Pmp_int): longint;
function mp_get_ul(a: Pmp_int): dword;
function mp_get_u32(a: Pmp_int): Tuint32_t;
function mp_get_u64(a: Pmp_int): Tuint64_t;
function mp_get_ull(a: Pmp_int): qword;


function mp_to_binary(M: Pmp_int; S: pchar; N: Tsize_t): longint;
function mp_to_octal(M: Pmp_int; S: pchar; N: Tsize_t): longint;
function mp_to_decimal(M: Pmp_int; S: pchar; N: Tsize_t): longint;
function mp_to_hex(M: Pmp_int; S: pchar; N: Tsize_t): longint;


// === Konventiert am: 20-4-25 19:12:25 ===


implementation



function mp_iszero(a: Pmp_int): longint;
begin
  if (a^.used) = 0 then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

function mp_isneg(a: Pmp_int): longint;
begin
  if (a^.sign) <> MP_ZPOS then begin
    Result := MP_YES;
  end else begin
    Result := MP_NO;
  end;
end;

function mp_get_u32(a: Pmp_int): Tuint32_t;
begin
  mp_get_u32 := Tuint32_t(mp_get_i32(a));
end;

function mp_get_u64(a: Pmp_int): Tuint64_t;
begin
  mp_get_u64 := Tuint64_t(mp_get_i64(a));
end;

function mp_get_ul(a: Pmp_int): dword;
begin
  mp_get_ul := dword(mp_get_l(a));
end;

function mp_get_ull(a: Pmp_int): qword;
begin
  mp_get_ull := qword(mp_get_ll(a));
end;

function mp_to_binary(M: Pmp_int; S: pchar; N: Tsize_t): longint;
begin
  mp_to_binary := mp_to_radix(M, S, N, nil, 2);
end;

function mp_to_octal(M: Pmp_int; S: pchar; N: Tsize_t): longint;
begin
  mp_to_octal := mp_to_radix(M, S, N, nil, 8);
end;

function mp_to_decimal(M: Pmp_int; S: pchar; N: Tsize_t): longint;
begin
  mp_to_decimal := mp_to_radix(M, S, N, nil, 10);
end;

function mp_to_hex(M: Pmp_int; S: pchar; N: Tsize_t): longint;
begin
  mp_to_hex := mp_to_radix(M, S, N, nil, 16);
end;


end.
