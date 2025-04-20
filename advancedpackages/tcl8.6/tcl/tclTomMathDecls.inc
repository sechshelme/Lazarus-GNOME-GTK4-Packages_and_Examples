{$IFDEF read_interface}


const
  TCLTOMMATH_EPOCH = 0;
  TCLTOMMATH_REVISION = 0;

function TclBN_epoch: longint; cdecl; external libtclstub8_6;
function TclBN_revision: longint; cdecl; external libtclstub8_6;
function TclBN_mp_add(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_add_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_and(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_clamp(a: Pmp_int); cdecl; external libtclstub8_6;
procedure TclBN_mp_clear(a: Pmp_int); cdecl; external libtclstub8_6;
procedure TclBN_mp_clear_multi(a: Pmp_int; args: array of const); cdecl; external libtclstub8_6;
procedure TclBN_mp_clear_multi(a: Pmp_int); cdecl; external libtclstub8_6;
function TclBN_mp_cmp(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libtclstub8_6;
function TclBN_mp_cmp_d(a: Pmp_int; b: Tmp_digit): Tmp_ord; cdecl; external libtclstub8_6;
function TclBN_mp_cmp_mag(a: Pmp_int; b: Pmp_int): Tmp_ord; cdecl; external libtclstub8_6;
function TclBN_mp_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_count_bits(a: Pmp_int): longint; cdecl; external libtclstub8_6;
function TclBN_mp_div(a: Pmp_int; b: Pmp_int; q: Pmp_int; r: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_div_d(a: Pmp_int; b: Tmp_digit; q: Pmp_int; r: Pmp_digit): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_div_2(a: Pmp_int; q: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_div_2d(a: Pmp_int; b: longint; q: Pmp_int; r: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_div_3(a: Pmp_int; q: Pmp_int; r: Pmp_digit): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_exch(a: Pmp_int; b: Pmp_int); cdecl; external libtclstub8_6;
function TclBN_mp_expt_d(a: Pmp_int; b: dword; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_grow(a: Pmp_int; size: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init(a: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_copy(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_multi(a: Pmp_int; args: array of const): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_multi(a: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_set(a: Pmp_int; b: Tmp_digit): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_size(a: Pmp_int; size: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_lshd(a: Pmp_int; shift: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mod(a: Pmp_int; b: Pmp_int; r: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mod_2d(a: Pmp_int; b: longint; r: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mul(a: Pmp_int; b: Pmp_int; p: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mul_d(a: Pmp_int; b: Tmp_digit; p: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mul_2(a: Pmp_int; p: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_mul_2d(a: Pmp_int; d: longint; p: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_neg(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_or(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_radix_size(a: Pmp_int; radix: longint; size: Plongint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_read_radix(a: Pmp_int; str: pchar; radix: longint): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_rshd(a: Pmp_int; shift: longint); cdecl; external libtclstub8_6;
function TclBN_mp_shrink(a: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_set(a: Pmp_int; b: Tmp_digit); cdecl; external libtclstub8_6;
function TclBN_mp_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_sqrt(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_sub(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_sub_d(a: Pmp_int; b: Tmp_digit; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_to_unsigned_bin(a: Pmp_int; b: pbyte): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_to_unsigned_bin_n(a: Pmp_int; b: pbyte; outlen: Pdword): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_toradix_n(a: Pmp_int; str: pchar; radix: longint; maxlen: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_unsigned_bin_size(a: Pmp_int): Tsize_t; cdecl; external libtclstub8_6;
function TclBN_mp_xor(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_zero(a: Pmp_int); cdecl; external libtclstub8_6;
procedure TclBN_reverse(s: pbyte; len: longint); cdecl; external libtclstub8_6;
function TclBN_fast_s_mp_mul_digs(a: Pmp_int; b: Pmp_int; c: Pmp_int; digs: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_fast_s_mp_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_karatsuba_mul(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_karatsuba_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_toom_mul(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_toom_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_s_mp_add(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_s_mp_mul_digs(a: Pmp_int; b: Pmp_int; c: Pmp_int; digs: longint): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_s_mp_sqr(a: Pmp_int; b: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_s_mp_sub(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_init_set_int(a: Pmp_int; i: dword): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_set_int(a: Pmp_int; i: dword): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_cnt_lsb(a: Pmp_int): longint; cdecl; external libtclstub8_6;
function TclBNInitBignumFromLong(bignum: Pmp_int; initVal: longint): longint; cdecl; external libtclstub8_6;
function TclBNInitBignumFromWideInt(bignum: Pmp_int; initVal: TTcl_WideInt): longint; cdecl; external libtclstub8_6;
function TclBNInitBignumFromWideUInt(bignum: Pmp_int; initVal: TTcl_WideUInt): longint; cdecl; external libtclstub8_6;
function TclBN_mp_expt_d_ex(a: Pmp_int; b: Tmp_digit; c: Pmp_int; fast: longint): Tmp_err; cdecl; external libtclstub8_6;
procedure TclBN_mp_set_ull(a: Pmp_int; i: TTcl_WideUInt); cdecl; external libtclstub8_6;
function TclBN_mp_get_mag_ull(a: Pmp_int): TTcl_WideUInt; cdecl; external libtclstub8_6;
procedure TclBN_mp_set_ll(a: Pmp_int; i: TTcl_WideInt); cdecl; external libtclstub8_6;
function TclBN_mp_unpack(rop: Pmp_int; Count: Tsize_t; order: Tmp_order; size: Tsize_t; endian: Tmp_endian;
  nails: Tsize_t; op: pointer): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_pack(rop: pointer; maxcount: Tsize_t; written: Psize_t; order: Tmp_order; size: Tsize_t;
  endian: Tmp_endian; nails: Tsize_t; op: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_tc_and(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_tc_or(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_tc_xor(a: Pmp_int; b: Pmp_int; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_signed_rsh(a: Pmp_int; b: longint; c: Pmp_int): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_pack_count(a: Pmp_int; nails: Tsize_t; size: Tsize_t): Tsize_t; cdecl; external libtclstub8_6;
function TclBN_mp_to_ubin(a: Pmp_int; buf: pbyte; maxlen: Tsize_t; written: Psize_t): longint; cdecl; external libtclstub8_6;
function TclBN_mp_div_ld(a: Pmp_int; b: TTcl_WideUInt; q: Pmp_int; r: PTcl_WideUInt): Tmp_err; cdecl; external libtclstub8_6;
function TclBN_mp_to_radix(a: Pmp_int; str: pchar; maxlen: Tsize_t; written: Psize_t; radix: longint): longint; cdecl; external libtclstub8_6;

type
  PTclTomMathStubs = ^TTclTomMathStubs;
  TTclTomMathStubs = record
  end;

var
  tclTomMathStubsPtr: PTclTomMathStubs; cvar;external libtclstub8_6;


  // === Konventiert am: 15-4-25 13:26:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
