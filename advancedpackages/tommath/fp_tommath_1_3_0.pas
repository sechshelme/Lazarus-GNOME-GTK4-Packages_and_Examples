unit fp_tommath_1_3_0;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libttommath = 'libtommath';
  {$ENDIF}

  {$IFDEF mswindows}
  libttommath = 'libtommath.dll';
  {$ENDIF}

  // Version: 1.3.0



  // ======================

type
  Tbool = boolean;
  Pbool = PBoolean;

  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;

  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;

  Tint64_t = int64;
  Pint64 = ^Tint64_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;

  Tsize_t = SizeInt;
  Psize_t = ^Tsize_t;

  PFILE = Pointer;

  // ==============

type
  Pmp_digit = ^Tmp_digit;
  Tmp_digit = Tuint64_t;

const
  MP_DIGIT_BIT = 60;
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
  Pmp_err = ^Tmp_err;
  Tmp_err = longint;

const
  MP_OKAY = 0;
  MP_ERR = -(1);
  MP_MEM = -(2);
  MP_VAL = -(3);
  MP_ITER = -(4);
  MP_BUF = -(5);
  MP_OVF = -(6);

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
  MP_MUL_KARATSUBA_CUTOFF: longint; cvar;external libttommath;

type
  Pmp_int = ^Tmp_int;

  Tmp_int = record
    used: longint;
    alloc: longint;
    sign: Tmp_sign;
    dp: Pmp_digit;
  end;

function mp_error_to_string(code: Tmp_err): pchar; cdecl; external libttommath;
function mp_init(a: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_clear(a: Pmp_int); cdecl; external libttommath;
function mp_init_multi(mp: Pmp_int): Tmp_err; cdecl; varargs; external libttommath;
procedure mp_clear_multi(mp: Pmp_int); cdecl; varargs; external libttommath;
procedure mp_exch(a: Pmp_int; b: Pmp_int); cdecl; external libttommath;
function mp_shrink(a: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_grow(a: Pmp_int; size: longint): Tmp_err; cdecl; external libttommath;
function mp_init_size(a: Pmp_int; size: longint): Tmp_err; cdecl; external libttommath;

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
function mp_get_mag_ul(a: Pmp_int): dword; cdecl; external libttommath;
function mp_get_l(a: Pmp_int): longint; cdecl; external libttommath;
procedure mp_set_l(a: Pmp_int; b: longint); cdecl; external libttommath;
function mp_init_l(a: Pmp_int; b: longint): Tmp_err; cdecl; external libttommath;

procedure mp_set_ul(a: Pmp_int; b: dword); cdecl; external libttommath;
function mp_init_ul(a: Pmp_int; b: dword): Tmp_err; cdecl; external libttommath;
procedure mp_set(a: Pmp_int; b: Tmp_digit); cdecl; external libttommath;
function mp_init_set(a: Pmp_int; b: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_init_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_clamp(a: Pmp_int); cdecl; external libttommath;
function mp_unpack(rop: Pmp_int; Count: Tsize_t; order: Tmp_order; size: Tsize_t; endian: Tmp_endian;
  nails: Tsize_t; op: pointer): Tmp_err; cdecl; external libttommath;
function mp_pack_count(a: Pmp_int; nails: Tsize_t; size: Tsize_t): Tsize_t; cdecl; external libttommath;
function mp_pack(rop: pointer; maxcount: Tsize_t; written: Psize_t; order: Tmp_order; size: Tsize_t;
  endian: Tmp_endian; nails: Tsize_t; op: Pmp_int): Tmp_err; cdecl; external libttommath;
procedure mp_rshd(a: Pmp_int; b: longint); cdecl; external libttommath;
function mp_lshd(a: Pmp_int; b: longint): Tmp_err; cdecl; external libttommath;
function mp_div_2d(a: Pmp_int; b: longint; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div_2(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul_2d(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul_2(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mod_2d(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_2expt(a: Pmp_int; b: longint): Tmp_err; cdecl; external libttommath;
function mp_cnt_lsb(a: Pmp_int): longint; cdecl; external libttommath;
function mp_rand(a: Pmp_int; digits: longint): Tmp_err; cdecl; external libttommath;

type
  Trand_source = function(out_: pointer; size: Tsize_t): Tmp_err;


procedure mp_rand_source(Source: Trand_source); cdecl; external libttommath;
function mp_xor(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_or(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_and(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_complement(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_signed_rsh(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_neg(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_abs(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_cmp(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libttommath;
function mp_cmp_mag(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libttommath;
function mp_add(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sub(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;

function mp_div(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;

function mp_cmp_d(a: Pmp_int; b: Tmp_digit): Tmp_ord; cdecl; external libttommath;
function mp_add_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sub_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mul_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_div_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int; d: Pmp_digit): Tmp_err; cdecl; external libttommath;

function mp_addmod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_submod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_mulmod(a: Pmp_int; b: Pmp_int; c: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqrmod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_invmod(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_gcd(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_exteuclid(a: Pmp_int; b: Pmp_int; U1: Pmp_int; U2: Pmp_int; U3: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_lcm(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_log_n(a: Pmp_int; base: longint; c: Plongint): Tmp_err; cdecl; external libttommath;
function mp_log(a: Pmp_int; base: Pmp_int; c: Plongint): Tmp_err; cdecl; external libttommath;
function mp_expt_n(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_root_n(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqrt(arg: Pmp_int; ret: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_sqrtmod_prime(n: Pmp_int; prime: Pmp_int; ret: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_is_square(arg: Pmp_int; ret: Pbool): Tmp_err; cdecl; external libttommath;
function mp_kronecker(a: Pmp_int; p: Pmp_int; c: Plongint): Tmp_err; cdecl; external libttommath;
function mp_reduce_setup(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_reduce(x: Pmp_int; m: Pmp_int; mu: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_montgomery_setup(n: Pmp_int; rho: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_montgomery_calc_normalization(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_montgomery_reduce(x: Pmp_int; n: Pmp_int; rho: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_dr_is_modulus(a: Pmp_int): Tbool; cdecl; external libttommath;
procedure mp_dr_setup(a: Pmp_int; d: Pmp_digit); cdecl; external libttommath;
function mp_dr_reduce(x: Pmp_int; n: Pmp_int; k: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_is_2k(a: Pmp_int): Tbool; cdecl; external libttommath;
function mp_reduce_2k_setup(a: Pmp_int; d: Pmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_2k(a: Pmp_int; n: Pmp_int; d: Tmp_digit): Tmp_err; cdecl; external libttommath;
function mp_reduce_is_2k_l(a: Pmp_int): Tbool; cdecl; external libttommath;
function mp_reduce_2k_setup_l(a: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_reduce_2k_l(a: Pmp_int; n: Pmp_int; d: Pmp_int): Tmp_err; cdecl; external libttommath;
function mp_exptmod(G: Pmp_int; X: Pmp_int; P: Pmp_int; Y: Pmp_int): Tmp_err; cdecl; external libttommath;

type
  Pmp_hval = ^Tmp_hval;
  Tmp_hval = Tuint64_t;

function mp_hash(a: Pmp_int; hash: Pmp_hval): Tmp_err; cdecl; external libttommath;
function mp_prime_fermat(a: Pmp_int; b: Pmp_int; Result: Pbool): Tmp_err; cdecl; external libttommath;
function mp_prime_miller_rabin(a: Pmp_int; b: Pmp_int; Result: Pbool): Tmp_err; cdecl; external libttommath;
function mp_prime_rabin_miller_trials(size: longint): longint; cdecl; external libttommath;
function mp_prime_strong_lucas_selfridge(a: Pmp_int; Result: Pbool): Tmp_err; cdecl; external libttommath;
function mp_prime_frobenius_underwood(N: Pmp_int; Result: Pbool): Tmp_err; cdecl; external libttommath;
function mp_prime_is_prime(a: Pmp_int; t: longint; Result: Pbool): Tmp_err; cdecl; external libttommath;
function mp_prime_next_prime(a: Pmp_int; t: longint; bbs_style: Tbool): Tmp_err; cdecl; external libttommath;
function mp_prime_rand(a: Pmp_int; t: longint; size: longint; flags: longint): Tmp_err; cdecl; external libttommath;
function mp_count_bits(a: Pmp_int): longint; cdecl; external libttommath;
function mp_ubin_size(a: Pmp_int): Tsize_t; cdecl; external libttommath;
function mp_from_ubin(a: Pmp_int; buf: Puint8_t; size: Tsize_t): Tmp_err; cdecl; external libttommath;
function mp_to_ubin(a: Pmp_int; buf: Puint8_t; maxlen: Tsize_t; written: Psize_t): Tmp_err; cdecl; external libttommath;
function mp_sbin_size(a: Pmp_int): Tsize_t; cdecl; external libttommath;
function mp_from_sbin(a: Pmp_int; buf: Puint8_t; size: Tsize_t): Tmp_err; cdecl; external libttommath;
function mp_to_sbin(a: Pmp_int; buf: Puint8_t; maxlen: Tsize_t; written: Psize_t): Tmp_err; cdecl; external libttommath;
function mp_read_radix(a: Pmp_int; str: pchar; radix: longint): Tmp_err; cdecl; external libttommath;
function mp_to_radix(a: Pmp_int; str: pchar; maxlen: Tsize_t; written: Psize_t; radix: longint): Tmp_err; cdecl; external libttommath;
function mp_radix_size(a: Pmp_int; radix: longint; size: Psize_t): Tmp_err; cdecl; external libttommath;
function mp_radix_size_overestimate(a: Pmp_int; radix: longint; size: Psize_t): Tmp_err; cdecl; external libttommath;

function mp_fread(a: Pmp_int; radix: longint; stream: PFILE): Tmp_err; cdecl; external libttommath;
function mp_fwrite(a: Pmp_int; radix: longint; stream: PFILE): Tmp_err; cdecl; external libttommath;

function mp_warray_free: longint; cdecl; external libttommath;

function mp_iszero(a: Pmp_int): boolean;
function mp_isone(a: Pmp_int): boolean;
function mp_isneg(a: Pmp_int): boolean;
function mp_iseven(a: Pmp_int): boolean;
function mp_isodd(a: Pmp_int): boolean;
function mp_get_u32(a: Pmp_int): Tuint32_t;
function mp_get_u64(a: Pmp_int): Tuint64_t;
function mp_get_ul(a: Pmp_int): dword;
function mp_sqr(a, b: Pmp_int): Tmp_err;
function mp_incr(a: Pmp_int): Tmp_err;
function mp_decr(a: Pmp_int): Tmp_err;
function mp_mod_d(a: Pmp_int; b: Tmp_digit; c: Pmp_digit): Tmp_err;
function mp_to_binary(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
function mp_to_octal(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
function mp_to_decimal(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
function mp_to_hex(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;


// === Konventiert am: 25-4-25 17:24:02 ===


implementation


function mp_iszero(a: Pmp_int): boolean;
begin
  mp_iszero := a^.used = 0;
end;

function mp_isone(a: Pmp_int): boolean;
begin
  mp_isone := (a^.sign = MP_ZPOS) and (a^.used = 1) and (a^.dp[0] = 1);
end;

function mp_isneg(a: Pmp_int): boolean;
begin
  mp_isneg := (a^.sign) = MP_NEG_;
end;

function mp_iseven(a: Pmp_int): boolean;
begin
  mp_iseven := (a^.used = 0) or (a^.dp[0] and 1 = 0);
end;

function mp_isodd(a: Pmp_int): boolean;
begin
  mp_isodd := not (mp_iseven(a));
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

function mp_sqr(a, b: Pmp_int): Tmp_err;
begin
  mp_sqr := mp_mul(a, a, b);
end;

function mp_incr(a: Pmp_int): Tmp_err;
begin
  mp_incr := mp_add_d(a, 1, a);
end;

function mp_decr(a: Pmp_int): Tmp_err;
begin
  mp_decr := mp_sub_d(a, 1, a);
end;

function mp_mod_d(a: Pmp_int; b: Tmp_digit; c: Pmp_digit): Tmp_err;
begin
  mp_mod_d := mp_div_d(a, b, nil, c);
end;

function mp_to_binary(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
begin
  mp_to_binary := mp_to_radix(M, S, N, nil, 2);
end;

function mp_to_octal(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
begin
  mp_to_octal := mp_to_radix(M, S, N, nil, 8);
end;

function mp_to_decimal(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
begin
  mp_to_decimal := mp_to_radix(M, S, N, nil, 10);
end;

function mp_to_hex(M: Pmp_int; S: pchar; N: Tsize_t): Tmp_err;
begin
  mp_to_hex := mp_to_radix(M, S, N, nil, 16);
end;


end.
