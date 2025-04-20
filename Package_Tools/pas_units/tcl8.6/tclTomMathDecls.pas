unit tclTomMathDecls;

interface

uses
  ctypes, tk_tcl_common, tcl, tclTomMath;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  TCLTOMMATH_EPOCH = 0;  
  TCLTOMMATH_REVISION = 0;  

function TclBN_epoch:longint;cdecl;external libtclstub8_6;
function TclBN_revision:longint;cdecl;external libtclstub8_6;
function TclBN_mp_add(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_add_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_and(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_clamp(a:Pmp_int);cdecl;external libtclstub8_6;
procedure TclBN_mp_clear(a:Pmp_int);cdecl;external libtclstub8_6;
procedure TclBN_mp_clear_multi(a:Pmp_int; args:array of const);cdecl;external libtclstub8_6;
procedure TclBN_mp_clear_multi(a:Pmp_int);cdecl;external libtclstub8_6;
function TclBN_mp_cmp(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external libtclstub8_6;
function TclBN_mp_cmp_d(a:Pmp_int; b:Tmp_digit):Tmp_ord;cdecl;external libtclstub8_6;
function TclBN_mp_cmp_mag(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external libtclstub8_6;
function TclBN_mp_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_count_bits(a:Pmp_int):longint;cdecl;external libtclstub8_6;
function TclBN_mp_div(a:Pmp_int; b:Pmp_int; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_div_d(a:Pmp_int; b:Tmp_digit; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_div_2(a:Pmp_int; q:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_div_2d(a:Pmp_int; b:longint; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_div_3(a:Pmp_int; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_exch(a:Pmp_int; b:Pmp_int);cdecl;external libtclstub8_6;
function TclBN_mp_expt_d(a:Pmp_int; b:dword; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_grow(a:Pmp_int; size:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_multi(a:Pmp_int; args:array of const):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_multi(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_set(a:Pmp_int; b:Tmp_digit):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_size(a:Pmp_int; size:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_lshd(a:Pmp_int; shift:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mod(a:Pmp_int; b:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mod_2d(a:Pmp_int; b:longint; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mul(a:Pmp_int; b:Pmp_int; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mul_d(a:Pmp_int; b:Tmp_digit; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mul_2(a:Pmp_int; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_mul_2d(a:Pmp_int; d:longint; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_neg(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_or(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_radix_size(a:Pmp_int; radix:longint; size:Plongint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_read_radix(a:Pmp_int; str:Pchar; radix:longint):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_rshd(a:Pmp_int; shift:longint);cdecl;external libtclstub8_6;
function TclBN_mp_shrink(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_set(a:Pmp_int; b:Tmp_digit);cdecl;external libtclstub8_6;
function TclBN_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_sqrt(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_sub(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_sub_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_to_unsigned_bin(a:Pmp_int; b:Pbyte):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_to_unsigned_bin_n(a:Pmp_int; b:Pbyte; outlen:Pdword):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_toradix_n(a:Pmp_int; str:Pchar; radix:longint; maxlen:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_unsigned_bin_size(a:Pmp_int):Tsize_t;cdecl;external libtclstub8_6;
function TclBN_mp_xor(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_zero(a:Pmp_int);cdecl;external libtclstub8_6;
procedure TclBN_reverse(s:Pbyte; len:longint);cdecl;external libtclstub8_6;
function TclBN_fast_s_mp_mul_digs(a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_fast_s_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_karatsuba_mul(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_karatsuba_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_toom_mul(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_toom_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_s_mp_add(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_s_mp_mul_digs(a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_s_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_s_mp_sub(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_set_int(a:Pmp_int; i:dword):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_set_int(a:Pmp_int; i:dword):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_cnt_lsb(a:Pmp_int):longint;cdecl;external libtclstub8_6;
function TclBNInitBignumFromLong(bignum:Pmp_int; initVal:longint):longint;cdecl;external libtclstub8_6;
function TclBNInitBignumFromWideInt(bignum:Pmp_int; initVal:TTcl_WideInt):longint;cdecl;external libtclstub8_6;
function TclBNInitBignumFromWideUInt(bignum:Pmp_int; initVal:TTcl_WideUInt):longint;cdecl;external libtclstub8_6;
function TclBN_mp_expt_d_ex(a:Pmp_int; b:Tmp_digit; c:Pmp_int; fast:longint):Tmp_err;cdecl;external libtclstub8_6;
procedure TclBN_mp_set_ull(a:Pmp_int; i:TTcl_WideUInt);cdecl;external libtclstub8_6;
function TclBN_mp_get_mag_ull(a:Pmp_int):TTcl_WideUInt;cdecl;external libtclstub8_6;
procedure TclBN_mp_set_ll(a:Pmp_int; i:TTcl_WideInt);cdecl;external libtclstub8_6;
function TclBN_mp_unpack(rop:Pmp_int; count:Tsize_t; order:Tmp_order; size:Tsize_t; endian:Tmp_endian;
           nails:Tsize_t; op:pointer):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_pack(rop:pointer; maxcount:Tsize_t; written:Psize_t; order:Tmp_order; size:Tsize_t;
           endian:Tmp_endian; nails:Tsize_t; op:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_tc_and(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_tc_or(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_tc_xor(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_signed_rsh(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_pack_count(a:Pmp_int; nails:Tsize_t; size:Tsize_t):Tsize_t;cdecl;external libtclstub8_6;
function TclBN_mp_to_ubin(a:Pmp_int; buf:Pbyte; maxlen:Tsize_t; written:Psize_t):longint;cdecl;external libtclstub8_6;
function TclBN_mp_div_ld(a:Pmp_int; b:TTcl_WideUInt; q:Pmp_int; r:PTcl_WideUInt):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_to_radix(a:Pmp_int; str:Pchar; maxlen:Tsize_t; written:Psize_t; radix:longint):longint;cdecl;external libtclstub8_6;
type
  PTclTomMathStubs = ^TTclTomMathStubs;
  TTclTomMathStubs = record
      magic : longint;
      hooks : pointer;
      tclBN_epoch : function :longint;cdecl;
      tclBN_revision : function :longint;cdecl;
      tclBN_mp_add : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_add_d : function (a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_and : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_clamp : procedure (a:Pmp_int);cdecl;
      tclBN_mp_clear : procedure (a:Pmp_int);cdecl;
      tclBN_mp_clear_multi : procedure (a:Pmp_int; args:array of const);cdecl;
      tclBN_mp_cmp : function (a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;
      tclBN_mp_cmp_d : function (a:Pmp_int; b:Tmp_digit):Tmp_ord;cdecl;
      tclBN_mp_cmp_mag : function (a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;
      tclBN_mp_copy : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_count_bits : function (a:Pmp_int):longint;cdecl;
      tclBN_mp_div : function (a:Pmp_int; b:Pmp_int; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_div_d : function (a:Pmp_int; b:Tmp_digit; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;
      tclBN_mp_div_2 : function (a:Pmp_int; q:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_div_2d : function (a:Pmp_int; b:longint; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_div_3 : function (a:Pmp_int; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;
      tclBN_mp_exch : procedure (a:Pmp_int; b:Pmp_int);cdecl;
      tclBN_mp_expt_d : function (a:Pmp_int; b:dword; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_grow : function (a:Pmp_int; size:longint):Tmp_err;cdecl;
      tclBN_mp_init : function (a:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_init_copy : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_init_multi : function (a:Pmp_int; args:array of const):Tmp_err;cdecl;
      tclBN_mp_init_set : function (a:Pmp_int; b:Tmp_digit):Tmp_err;cdecl;
      tclBN_mp_init_size : function (a:Pmp_int; size:longint):Tmp_err;cdecl;
      tclBN_mp_lshd : function (a:Pmp_int; shift:longint):Tmp_err;cdecl;
      tclBN_mp_mod : function (a:Pmp_int; b:Pmp_int; r:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_mod_2d : function (a:Pmp_int; b:longint; r:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_mul : function (a:Pmp_int; b:Pmp_int; p:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_mul_d : function (a:Pmp_int; b:Tmp_digit; p:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_mul_2 : function (a:Pmp_int; p:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_mul_2d : function (a:Pmp_int; d:longint; p:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_neg : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_or : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_radix_size : function (a:Pmp_int; radix:longint; size:Plongint):Tmp_err;cdecl;
      tclBN_mp_read_radix : function (a:Pmp_int; str:Pchar; radix:longint):Tmp_err;cdecl;
      tclBN_mp_rshd : procedure (a:Pmp_int; shift:longint);cdecl;
      tclBN_mp_shrink : function (a:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_set : procedure (a:Pmp_int; b:Tmp_digit);cdecl;
      tclBN_mp_sqr : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_sqrt : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_sub : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_sub_d : function (a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_to_unsigned_bin : function (a:Pmp_int; b:Pbyte):Tmp_err;cdecl;
      tclBN_mp_to_unsigned_bin_n : function (a:Pmp_int; b:Pbyte; outlen:Pdword):Tmp_err;cdecl;
      tclBN_mp_toradix_n : function (a:Pmp_int; str:Pchar; radix:longint; maxlen:longint):Tmp_err;cdecl;
      tclBN_mp_unsigned_bin_size : function (a:Pmp_int):Tsize_t;cdecl;
      tclBN_mp_xor : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_zero : procedure (a:Pmp_int);cdecl;
      tclBN_reverse : procedure (s:Pbyte; len:longint);cdecl;
      tclBN_fast_s_mp_mul_digs : function (a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;
      tclBN_fast_s_mp_sqr : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_karatsuba_mul : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_karatsuba_sqr : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_toom_mul : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_toom_sqr : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_s_mp_add : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_s_mp_mul_digs : function (a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;
      tclBN_s_mp_sqr : function (a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;
      tclBN_s_mp_sub : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_init_set_int : function (a:Pmp_int; i:dword):Tmp_err;cdecl;
      tclBN_mp_set_int : function (a:Pmp_int; i:dword):Tmp_err;cdecl;
      tclBN_mp_cnt_lsb : function (a:Pmp_int):longint;cdecl;
      tclBNInitBignumFromLong : function (bignum:Pmp_int; initVal:longint):longint;cdecl;
      tclBNInitBignumFromWideInt : function (bignum:Pmp_int; initVal:TTcl_WideInt):longint;cdecl;
      tclBNInitBignumFromWideUInt : function (bignum:Pmp_int; initVal:TTcl_WideUInt):longint;cdecl;
      tclBN_mp_expt_d_ex : function (a:Pmp_int; b:Tmp_digit; c:Pmp_int; fast:longint):Tmp_err;cdecl;
      tclBN_mp_set_ull : procedure (a:Pmp_int; i:TTcl_WideUInt);cdecl;
      tclBN_mp_get_mag_ull : function (a:Pmp_int):TTcl_WideUInt;cdecl;
      tclBN_mp_set_ll : procedure (a:Pmp_int; i:TTcl_WideInt);cdecl;
      tclBN_mp_unpack : function (rop:Pmp_int; count:Tsize_t; order:Tmp_order; size:Tsize_t; endian:Tmp_endian; 
                   nails:Tsize_t; op:pointer):Tmp_err;cdecl;
      tclBN_mp_pack : function (rop:pointer; maxcount:Tsize_t; written:Psize_t; order:Tmp_order; size:Tsize_t; 
                   endian:Tmp_endian; nails:Tsize_t; op:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_tc_and : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_tc_or : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_tc_xor : function (a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_signed_rsh : function (a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;
      tclBN_mp_pack_count : function (a:Pmp_int; nails:Tsize_t; size:Tsize_t):Tsize_t;cdecl;
      tclBN_mp_to_ubin : function (a:Pmp_int; buf:Pbyte; maxlen:Tsize_t; written:Psize_t):longint;cdecl;
      tclBN_mp_div_ld : function (a:Pmp_int; b:TTcl_WideUInt; q:Pmp_int; r:PTcl_WideUInt):Tmp_err;cdecl;
      tclBN_mp_to_radix : function (a:Pmp_int; str:Pchar; maxlen:Tsize_t; written:Psize_t; radix:longint):longint;cdecl;
    end;
  var
    tclTomMathStubsPtr : PTclTomMathStubs;cvar;external libtclstub8_6;
{ C++ end of extern C conditionnal removed }
{$if defined(USE_TCL_STUBS)}
{
 * Inline function declarations:
  }
{ 0  }

const
  TclBN_epoch = tclTomMathStubsPtr^.tclBN_epoch;  
{ 1  }
  TclBN_revision = tclTomMathStubsPtr^.tclBN_revision;  
{ 2  }
  TclBN_mp_add = tclTomMathStubsPtr^.tclBN_mp_add;  
{ 3  }
  TclBN_mp_add_d = tclTomMathStubsPtr^.tclBN_mp_add_d;  
{ 4  }
  TclBN_mp_and = tclTomMathStubsPtr^.tclBN_mp_and;  
{ 5  }
  TclBN_mp_clamp = tclTomMathStubsPtr^.tclBN_mp_clamp;  
{ 6  }
  TclBN_mp_clear = tclTomMathStubsPtr^.tclBN_mp_clear;  
{ 7  }
  TclBN_mp_clear_multi = tclTomMathStubsPtr^.tclBN_mp_clear_multi;  
{ 8  }
  TclBN_mp_cmp = tclTomMathStubsPtr^.tclBN_mp_cmp;  
{ 9  }
  TclBN_mp_cmp_d = tclTomMathStubsPtr^.tclBN_mp_cmp_d;  
{ 10  }
  TclBN_mp_cmp_mag = tclTomMathStubsPtr^.tclBN_mp_cmp_mag;  
{ 11  }
  TclBN_mp_copy = tclTomMathStubsPtr^.tclBN_mp_copy;  
{ 12  }
  TclBN_mp_count_bits = tclTomMathStubsPtr^.tclBN_mp_count_bits;  
{ 13  }
  TclBN_mp_div = tclTomMathStubsPtr^.tclBN_mp_div;  
{ 14  }
  TclBN_mp_div_d = tclTomMathStubsPtr^.tclBN_mp_div_d;  
{ 15  }
  TclBN_mp_div_2 = tclTomMathStubsPtr^.tclBN_mp_div_2;  
{ 16  }
  TclBN_mp_div_2d = tclTomMathStubsPtr^.tclBN_mp_div_2d;  
{ 17  }
  TclBN_mp_div_3 = tclTomMathStubsPtr^.tclBN_mp_div_3;  
{ 18  }
  TclBN_mp_exch = tclTomMathStubsPtr^.tclBN_mp_exch;  
{ 19  }
  TclBN_mp_expt_d = tclTomMathStubsPtr^.tclBN_mp_expt_d;  
{ 20  }
  TclBN_mp_grow = tclTomMathStubsPtr^.tclBN_mp_grow;  
{ 21  }
  TclBN_mp_init = tclTomMathStubsPtr^.tclBN_mp_init;  
{ 22  }
  TclBN_mp_init_copy = tclTomMathStubsPtr^.tclBN_mp_init_copy;  
{ 23  }
  TclBN_mp_init_multi = tclTomMathStubsPtr^.tclBN_mp_init_multi;  
{ 24  }
  TclBN_mp_init_set = tclTomMathStubsPtr^.tclBN_mp_init_set;  
{ 25  }
  TclBN_mp_init_size = tclTomMathStubsPtr^.tclBN_mp_init_size;  
{ 26  }
  TclBN_mp_lshd = tclTomMathStubsPtr^.tclBN_mp_lshd;  
{ 27  }
  TclBN_mp_mod = tclTomMathStubsPtr^.tclBN_mp_mod;  
{ 28  }
  TclBN_mp_mod_2d = tclTomMathStubsPtr^.tclBN_mp_mod_2d;  
{ 29  }
  TclBN_mp_mul = tclTomMathStubsPtr^.tclBN_mp_mul;  
{ 30  }
  TclBN_mp_mul_d = tclTomMathStubsPtr^.tclBN_mp_mul_d;  
{ 31  }
  TclBN_mp_mul_2 = tclTomMathStubsPtr^.tclBN_mp_mul_2;  
{ 32  }
  TclBN_mp_mul_2d = tclTomMathStubsPtr^.tclBN_mp_mul_2d;  
{ 33  }
  TclBN_mp_neg = tclTomMathStubsPtr^.tclBN_mp_neg;  
{ 34  }
  TclBN_mp_or = tclTomMathStubsPtr^.tclBN_mp_or;  
{ 35  }
  TclBN_mp_radix_size = tclTomMathStubsPtr^.tclBN_mp_radix_size;  
{ 36  }
  TclBN_mp_read_radix = tclTomMathStubsPtr^.tclBN_mp_read_radix;  
{ 37  }
  TclBN_mp_rshd = tclTomMathStubsPtr^.tclBN_mp_rshd;  
{ 38  }
  TclBN_mp_shrink = tclTomMathStubsPtr^.tclBN_mp_shrink;  
{ 39  }
  TclBN_mp_set = tclTomMathStubsPtr^.tclBN_mp_set;  
{ 40  }
  TclBN_mp_sqr = tclTomMathStubsPtr^.tclBN_mp_sqr;  
{ 41  }
  TclBN_mp_sqrt = tclTomMathStubsPtr^.tclBN_mp_sqrt;  
{ 42  }
  TclBN_mp_sub = tclTomMathStubsPtr^.tclBN_mp_sub;  
{ 43  }
  TclBN_mp_sub_d = tclTomMathStubsPtr^.tclBN_mp_sub_d;  
{ 44  }
  TclBN_mp_to_unsigned_bin = tclTomMathStubsPtr^.tclBN_mp_to_unsigned_bin;  
{ 45  }
  TclBN_mp_to_unsigned_bin_n = tclTomMathStubsPtr^.tclBN_mp_to_unsigned_bin_n;  
{ 46  }
  TclBN_mp_toradix_n = tclTomMathStubsPtr^.tclBN_mp_toradix_n;  
{ 47  }
  TclBN_mp_unsigned_bin_size = tclTomMathStubsPtr^.tclBN_mp_unsigned_bin_size;  
{ 48  }
  TclBN_mp_xor = tclTomMathStubsPtr^.tclBN_mp_xor;  
{ 49  }
  TclBN_mp_zero = tclTomMathStubsPtr^.tclBN_mp_zero;  
{ 50  }
  TclBN_reverse = tclTomMathStubsPtr^.tclBN_reverse;  
{ 51  }
  TclBN_fast_s_mp_mul_digs = tclTomMathStubsPtr^.tclBN_fast_s_mp_mul_digs;  
{ 52  }
  TclBN_fast_s_mp_sqr = tclTomMathStubsPtr^.tclBN_fast_s_mp_sqr;  
{ 53  }
  TclBN_mp_karatsuba_mul = tclTomMathStubsPtr^.tclBN_mp_karatsuba_mul;  
{ 54  }
  TclBN_mp_karatsuba_sqr = tclTomMathStubsPtr^.tclBN_mp_karatsuba_sqr;  
{ 55  }
  TclBN_mp_toom_mul = tclTomMathStubsPtr^.tclBN_mp_toom_mul;  
{ 56  }
  TclBN_mp_toom_sqr = tclTomMathStubsPtr^.tclBN_mp_toom_sqr;  
{ 57  }
  TclBN_s_mp_add = tclTomMathStubsPtr^.tclBN_s_mp_add;  
{ 58  }
  TclBN_s_mp_mul_digs = tclTomMathStubsPtr^.tclBN_s_mp_mul_digs;  
{ 59  }
  TclBN_s_mp_sqr = tclTomMathStubsPtr^.tclBN_s_mp_sqr;  
{ 60  }
  TclBN_s_mp_sub = tclTomMathStubsPtr^.tclBN_s_mp_sub;  
{ 61  }
  TclBN_mp_init_set_int = tclTomMathStubsPtr^.tclBN_mp_init_set_int;  
{ 62  }
  TclBN_mp_set_int = tclTomMathStubsPtr^.tclBN_mp_set_int;  
{ 63  }
  TclBN_mp_cnt_lsb = tclTomMathStubsPtr^.tclBN_mp_cnt_lsb;  
{ 64  }
  TclBNInitBignumFromLong = tclTomMathStubsPtr^.tclBNInitBignumFromLong;  
{ 65  }
  TclBNInitBignumFromWideInt = tclTomMathStubsPtr^.tclBNInitBignumFromWideInt;  
{ 66  }
  TclBNInitBignumFromWideUInt = tclTomMathStubsPtr^.tclBNInitBignumFromWideUInt;  
{ 67  }
  TclBN_mp_expt_d_ex = tclTomMathStubsPtr^.tclBN_mp_expt_d_ex;  
{ 68  }
  TclBN_mp_set_ull = tclTomMathStubsPtr^.tclBN_mp_set_ull;  
{ 69  }
  TclBN_mp_get_mag_ull = tclTomMathStubsPtr^.tclBN_mp_get_mag_ull;  
{ 70  }
  TclBN_mp_set_ll = tclTomMathStubsPtr^.tclBN_mp_set_ll;  
{ 71  }
  TclBN_mp_unpack = tclTomMathStubsPtr^.tclBN_mp_unpack;  
{ 72  }
  TclBN_mp_pack = tclTomMathStubsPtr^.tclBN_mp_pack;  
{ 73  }
  TclBN_mp_tc_and = tclTomMathStubsPtr^.tclBN_mp_tc_and;  
{ 74  }
  TclBN_mp_tc_or = tclTomMathStubsPtr^.tclBN_mp_tc_or;  
{ 75  }
  TclBN_mp_tc_xor = tclTomMathStubsPtr^.tclBN_mp_tc_xor;  
{ 76  }
  TclBN_mp_signed_rsh = tclTomMathStubsPtr^.tclBN_mp_signed_rsh;  
{ 77  }
  TclBN_mp_pack_count = tclTomMathStubsPtr^.tclBN_mp_pack_count;  
{ 78  }
  TclBN_mp_to_ubin = tclTomMathStubsPtr^.tclBN_mp_to_ubin;  
{ 79  }
  TclBN_mp_div_ld = tclTomMathStubsPtr^.tclBN_mp_div_ld;  
{ 80  }
  TclBN_mp_to_radix = tclTomMathStubsPtr^.tclBN_mp_to_radix;  
{$endif}
{ defined(USE_TCL_STUBS)  }
{ !END!: Do not edit above this line.  }
{$undef TCL_STORAGE_CLASS}

const
  TCL_STORAGE_CLASS = DLLIMPORT;  
{$ifdef USE_TCL_STUBS}
{$undef TclBNInitBignumFromLong}
{$endif}
{ USE_TCL_STUBS  }
{$endif}
{ _TCLINTDECLS  }


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }

function Tcl_TomMath_InitStubs(interp,version : longint) : longint;

{ Define custom memory allocation for libtommath  }
{ MODULE_SCOPE void* TclBNAlloc( size_t );  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function TclBNAlloc(s : longint) : pointer;

{ MODULE_SCOPE void* TclBNCalloc( size_t, size_t );  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function TclBNCalloc(m,s : longint) : longint;

{ MODULE_SCOPE void* TclBNRealloc( void*, size_t );  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function TclBNRealloc(x,s : longint) : pointer;

{ MODULE_SCOPE void  TclBNFree( void* );  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function TclBNFree(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function MP_MALLOC(size : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function MP_CALLOC(nmemb,size : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function MP_REALLOC(mem,oldsize,newsize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function MP_FREE(mem,size : longint) : longint;

{#define mp_set_long(a,b) (TclBN_mp_set_int(a,b),MP_OKAY) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function mp_set_ul(a,b : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function mp_unsigned_bin_size(a : longint) : longint;







// === Konventiert am: 15-4-25 13:26:41 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tcl_TomMath_InitStubs(interp,version : longint) : longint;
begin
  Tcl_TomMath_InitStubs:=TclTomMathInitializeStubs(interp,version,TCLTOMMATH_EPOCH,TCLTOMMATH_REVISION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function TclBNAlloc(s : longint) : pointer;
begin
  TclBNAlloc:=pointer(ckalloc(Tsize_t(s)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TclBNCalloc(m,s : longint) : longint;
begin
  TclBNCalloc:=memset(ckalloc((Tsize_t(m))*(Tsize_t(s))),0,(Tsize_t(m))*(Tsize_t(s)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function TclBNRealloc(x,s : longint) : pointer;
begin
  TclBNRealloc:=pointer(ckrealloc(Pchar(x),Tsize_t(s)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TclBNFree(x : longint) : longint;
begin
  TclBNFree:=ckfree(Pchar(x));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MP_MALLOC(size : longint) : longint;
begin
  MP_MALLOC:=TclBNAlloc(size);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MP_CALLOC(nmemb,size : longint) : longint;
begin
  MP_CALLOC:=TclBNCalloc(nmemb,size);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MP_REALLOC(mem,oldsize,newsize : longint) : longint;
begin
  MP_REALLOC:=TclBNRealloc(mem,newsize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MP_FREE(mem,size : longint) : longint;
begin
  MP_FREE:=TclBNFree(mem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_set_ul(a,b : longint) : pointer;
begin
  mp_set_ul:=pointer(TclBN_mp_set_int(a,b));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_unsigned_bin_size(a : longint) : longint;
begin
  mp_unsigned_bin_size:=longint(TclBN_mp_unsigned_bin_size(a));
end;


end.
