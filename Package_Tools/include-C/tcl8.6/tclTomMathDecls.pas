unit tclTomMathDecls;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 *----------------------------------------------------------------------
 *
 * tclTomMathDecls.h --
 *
 *	This file contains the declarations for the 'libtommath'
 *	functions that are exported by the Tcl library.
 *
 * Copyright (c) 2005 by Kevin B. Kenny.  All rights reserved.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES.
  }
{$ifndef _TCLTOMMATHDECLS}
{$define _TCLTOMMATHDECLS}
{$include "tcl.h"}
{$ifndef BN_H_}
{$include "tclTomMath.h"}
{$endif}
{
 * Define the version of the Stubs table that's exported for tommath
  }

const
  TCLTOMMATH_EPOCH = 0;  
  TCLTOMMATH_REVISION = 0;  
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

{ Rename the global symbols in libtommath to avoid linkage conflicts  }
const
  bn_reverse = TclBN_reverse;  
  mp_add = TclBN_mp_add;  
  mp_add_d = TclBN_mp_add_d;  
  mp_and = TclBN_mp_and;  
  mp_clamp = TclBN_mp_clamp;  
  mp_clear = TclBN_mp_clear;  
  mp_clear_multi = TclBN_mp_clear_multi;  
  mp_cmp = TclBN_mp_cmp;  
  mp_cmp_d = TclBN_mp_cmp_d;  
  mp_cmp_mag = TclBN_mp_cmp_mag;  
  mp_cnt_lsb = TclBN_mp_cnt_lsb;  
  mp_copy = TclBN_mp_copy;  
  mp_count_bits = TclBN_mp_count_bits;  
  mp_div = TclBN_mp_div;  
  mp_div_2 = TclBN_mp_div_2;  
  mp_div_2d = TclBN_mp_div_2d;  
  mp_div_3 = TclBN_mp_div_3;  
  mp_div_d = TclBN_mp_div_d;  
  mp_exch = TclBN_mp_exch;  
  mp_expt_d = TclBN_mp_expt_d;  
  mp_expt_d_ex = TclBN_mp_expt_d_ex;  
  mp_expt_u32 = TclBN_mp_expt_d;  
  mp_get_mag_ull = TclBN_mp_get_mag_ull;  
  mp_grow = TclBN_mp_grow;  
  mp_init = TclBN_mp_init;  
  mp_init_copy = TclBN_mp_init_copy;  
  mp_init_multi = TclBN_mp_init_multi;  
  mp_init_set = TclBN_mp_init_set;  
  mp_init_set_int = TclBN_mp_init_set_int;  
  mp_init_size = TclBN_mp_init_size;  
  mp_lshd = TclBN_mp_lshd;  
  mp_mod = TclBN_mp_mod;  
  mp_mod_2d = TclBN_mp_mod_2d;  
  mp_mul = TclBN_mp_mul;  
  mp_mul_2 = TclBN_mp_mul_2;  
  mp_mul_2d = TclBN_mp_mul_2d;  
  mp_mul_d = TclBN_mp_mul_d;  
  mp_neg = TclBN_mp_neg;  
  mp_or = TclBN_mp_or;  
  mp_pack = TclBN_mp_pack;  
  mp_pack_count = TclBN_mp_pack_count;  
  mp_radix_size = TclBN_mp_radix_size;  
  mp_read_radix = TclBN_mp_read_radix;  
  mp_rshd = TclBN_mp_rshd;  
  mp_set = TclBN_mp_set;  
{#define mp_set_int(a,b) (TclBN_mp_set_int(a,(unsigned int)(b)),MP_OKAY) }
  mp_set_ll = TclBN_mp_set_ll;  
{#define mp_set_long(a,b) (TclBN_mp_set_int(a,b),MP_OKAY) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function mp_set_ul(a,b : longint) : pointer;

const
  mp_set_ull = TclBN_mp_set_ull;  
  mp_set_u64 = TclBN_mp_set_ull;  
  mp_shrink = TclBN_mp_shrink;  
  mp_sqr = TclBN_mp_sqr;  
  mp_sqrt = TclBN_mp_sqrt;  
  mp_sub = TclBN_mp_sub;  
  mp_sub_d = TclBN_mp_sub_d;  
  mp_signed_rsh = TclBN_mp_signed_rsh;  
  mp_tc_and = TclBN_mp_and;  
  mp_tc_div_2d = TclBN_mp_signed_rsh;  
  mp_tc_or = TclBN_mp_or;  
  mp_tc_xor = TclBN_mp_xor;  
  mp_to_unsigned_bin = TclBN_mp_to_unsigned_bin;  
  mp_to_unsigned_bin_n = TclBN_mp_to_unsigned_bin_n;  
  mp_toradix_n = TclBN_mp_toradix_n;  
  mp_to_radix = TclBN_mp_to_radix;  
  mp_to_ubin = TclBN_mp_to_ubin;  
  mp_unpack = TclBN_mp_unpack;  
  mp_ubin_size = TclBN_mp_unsigned_bin_size;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function mp_unsigned_bin_size(a : longint) : longint;

const
  mp_xor = TclBN_mp_xor;  
  mp_zero = TclBN_mp_zero;  
  s_mp_add = TclBN_s_mp_add;  
  s_mp_balance_mul = TclBN_mp_balance_mul;  
  s_mp_karatsuba_mul = TclBN_mp_karatsuba_mul;  
  s_mp_karatsuba_sqr = TclBN_mp_karatsuba_sqr;  
  s_mp_mul_digs = TclBN_s_mp_mul_digs;  
  s_mp_mul_digs_fast = TclBN_fast_s_mp_mul_digs;  
  s_mp_reverse = TclBN_s_mp_reverse;  
  s_mp_sqr = TclBN_s_mp_sqr;  
  s_mp_sqr_fast = TclBN_fast_s_mp_sqr;  
  s_mp_sub = TclBN_s_mp_sub;  
  s_mp_toom_mul = TclBN_mp_toom_mul;  
  s_mp_toom_sqr = TclBN_mp_toom_sqr;  
{
 * WARNING: This file is automatically generated by the tools/genStubs.tcl
 * script.  Any modifications to the function declarations below should be made
 * in the generic/tclInt.decls script.
  }
{ !BEGIN!: Do not edit below this line.  }
{ C++ extern C conditionnal removed }
{
 * Exported function declarations:
  }
{ 0  }

function TclBN_epoch:longint;cdecl;external libtclstub8_6;
{ 1  }
function TclBN_revision:longint;cdecl;external libtclstub8_6;
{ 2  }
function TclBN_mp_add(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 3  }
function TclBN_mp_add_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 4  }
function TclBN_mp_and(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 5  }
procedure TclBN_mp_clamp(a:Pmp_int);cdecl;external libtclstub8_6;
{ 6  }
procedure TclBN_mp_clear(a:Pmp_int);cdecl;external libtclstub8_6;
{ 7  }
procedure TclBN_mp_clear_multi(a:Pmp_int; args:array of const);cdecl;external libtclstub8_6;
procedure TclBN_mp_clear_multi(a:Pmp_int);cdecl;external libtclstub8_6;
{ 8  }
function TclBN_mp_cmp(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external libtclstub8_6;
{ 9  }
function TclBN_mp_cmp_d(a:Pmp_int; b:Tmp_digit):Tmp_ord;cdecl;external libtclstub8_6;
{ 10  }
function TclBN_mp_cmp_mag(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external libtclstub8_6;
{ 11  }
function TclBN_mp_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 12  }
function TclBN_mp_count_bits(a:Pmp_int):longint;cdecl;external libtclstub8_6;
{ 13  }
function TclBN_mp_div(a:Pmp_int; b:Pmp_int; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 14  }
function TclBN_mp_div_d(a:Pmp_int; b:Tmp_digit; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;external libtclstub8_6;
{ 15  }
function TclBN_mp_div_2(a:Pmp_int; q:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 16  }
function TclBN_mp_div_2d(a:Pmp_int; b:longint; q:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 17  }
function TclBN_mp_div_3(a:Pmp_int; q:Pmp_int; r:Pmp_digit):Tmp_err;cdecl;external libtclstub8_6;
{ 18  }
procedure TclBN_mp_exch(a:Pmp_int; b:Pmp_int);cdecl;external libtclstub8_6;
{ 19  }
function TclBN_mp_expt_d(a:Pmp_int; b:dword; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 20  }
function TclBN_mp_grow(a:Pmp_int; size:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 21  }
function TclBN_mp_init(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 22  }
function TclBN_mp_init_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 23  }
function TclBN_mp_init_multi(a:Pmp_int; args:array of const):Tmp_err;cdecl;external libtclstub8_6;
function TclBN_mp_init_multi(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 24  }
function TclBN_mp_init_set(a:Pmp_int; b:Tmp_digit):Tmp_err;cdecl;external libtclstub8_6;
{ 25  }
function TclBN_mp_init_size(a:Pmp_int; size:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 26  }
function TclBN_mp_lshd(a:Pmp_int; shift:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 27  }
function TclBN_mp_mod(a:Pmp_int; b:Pmp_int; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 28  }
function TclBN_mp_mod_2d(a:Pmp_int; b:longint; r:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 29  }
function TclBN_mp_mul(a:Pmp_int; b:Pmp_int; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 30  }
function TclBN_mp_mul_d(a:Pmp_int; b:Tmp_digit; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 31  }
function TclBN_mp_mul_2(a:Pmp_int; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 32  }
function TclBN_mp_mul_2d(a:Pmp_int; d:longint; p:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 33  }
function TclBN_mp_neg(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 34  }
function TclBN_mp_or(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 35  }
function TclBN_mp_radix_size(a:Pmp_int; radix:longint; size:Plongint):Tmp_err;cdecl;external libtclstub8_6;
{ 36  }
function TclBN_mp_read_radix(a:Pmp_int; str:Pchar; radix:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 37  }
procedure TclBN_mp_rshd(a:Pmp_int; shift:longint);cdecl;external libtclstub8_6;
{ 38  }
function TclBN_mp_shrink(a:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 39  }
procedure TclBN_mp_set(a:Pmp_int; b:Tmp_digit);cdecl;external libtclstub8_6;
{ 40  }
function TclBN_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 41  }
function TclBN_mp_sqrt(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 42  }
function TclBN_mp_sub(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 43  }
function TclBN_mp_sub_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 44  }
function TclBN_mp_to_unsigned_bin(a:Pmp_int; b:Pbyte):Tmp_err;cdecl;external libtclstub8_6;
{ 45  }
function TclBN_mp_to_unsigned_bin_n(a:Pmp_int; b:Pbyte; outlen:Pdword):Tmp_err;cdecl;external libtclstub8_6;
{ 46  }
function TclBN_mp_toradix_n(a:Pmp_int; str:Pchar; radix:longint; maxlen:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 47  }
function TclBN_mp_unsigned_bin_size(a:Pmp_int):Tsize_t;cdecl;external libtclstub8_6;
{ 48  }
function TclBN_mp_xor(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 49  }
procedure TclBN_mp_zero(a:Pmp_int);cdecl;external libtclstub8_6;
{ 50  }
procedure TclBN_reverse(s:Pbyte; len:longint);cdecl;external libtclstub8_6;
{ 51  }
function TclBN_fast_s_mp_mul_digs(a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 52  }
function TclBN_fast_s_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 53  }
function TclBN_mp_karatsuba_mul(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 54  }
function TclBN_mp_karatsuba_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 55  }
function TclBN_mp_toom_mul(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 56  }
function TclBN_mp_toom_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 57  }
function TclBN_s_mp_add(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 58  }
function TclBN_s_mp_mul_digs(a:Pmp_int; b:Pmp_int; c:Pmp_int; digs:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 59  }
function TclBN_s_mp_sqr(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 60  }
function TclBN_s_mp_sub(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 61  }
function TclBN_mp_init_set_int(a:Pmp_int; i:dword):Tmp_err;cdecl;external libtclstub8_6;
{ 62  }
function TclBN_mp_set_int(a:Pmp_int; i:dword):Tmp_err;cdecl;external libtclstub8_6;
{ 63  }
function TclBN_mp_cnt_lsb(a:Pmp_int):longint;cdecl;external libtclstub8_6;
{ 64  }
function TclBNInitBignumFromLong(bignum:Pmp_int; initVal:longint):longint;cdecl;external libtclstub8_6;
{ 65  }
function TclBNInitBignumFromWideInt(bignum:Pmp_int; initVal:TTcl_WideInt):longint;cdecl;external libtclstub8_6;
{ 66  }
function TclBNInitBignumFromWideUInt(bignum:Pmp_int; initVal:TTcl_WideUInt):longint;cdecl;external libtclstub8_6;
{ 67  }
function TclBN_mp_expt_d_ex(a:Pmp_int; b:Tmp_digit; c:Pmp_int; fast:longint):Tmp_err;cdecl;external libtclstub8_6;
{ 68  }
procedure TclBN_mp_set_ull(a:Pmp_int; i:TTcl_WideUInt);cdecl;external libtclstub8_6;
{ 69  }
function TclBN_mp_get_mag_ull(a:Pmp_int):TTcl_WideUInt;cdecl;external libtclstub8_6;
{ 70  }
procedure TclBN_mp_set_ll(a:Pmp_int; i:TTcl_WideInt);cdecl;external libtclstub8_6;
{ 71  }
function TclBN_mp_unpack(rop:Pmp_int; count:Tsize_t; order:Tmp_order; size:Tsize_t; endian:Tmp_endian; 
           nails:Tsize_t; op:pointer):Tmp_err;cdecl;external libtclstub8_6;
{ 72  }
function TclBN_mp_pack(rop:pointer; maxcount:Tsize_t; written:Psize_t; order:Tmp_order; size:Tsize_t; 
           endian:Tmp_endian; nails:Tsize_t; op:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 73  }
function TclBN_mp_tc_and(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 74  }
function TclBN_mp_tc_or(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 75  }
function TclBN_mp_tc_xor(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 76  }
function TclBN_mp_signed_rsh(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external libtclstub8_6;
{ 77  }
function TclBN_mp_pack_count(a:Pmp_int; nails:Tsize_t; size:Tsize_t):Tsize_t;cdecl;external libtclstub8_6;
{ 78  }
function TclBN_mp_to_ubin(a:Pmp_int; buf:Pbyte; maxlen:Tsize_t; written:Psize_t):longint;cdecl;external libtclstub8_6;
{ 79  }
function TclBN_mp_div_ld(a:Pmp_int; b:TTcl_WideUInt; q:Pmp_int; r:PTcl_WideUInt):Tmp_err;cdecl;external libtclstub8_6;
{ 80  }
function TclBN_mp_to_radix(a:Pmp_int; str:Pchar; maxlen:Tsize_t; written:Psize_t; radix:longint):longint;cdecl;external libtclstub8_6;
{ 0  }
{ 1  }
{ 2  }
{ 3  }
{ 4  }
{ 5  }
{ 6  }
{ 7  }
{ 8  }
{ 9  }
{ 10  }
{ 11  }
{ 12  }
{ 13  }
{ 14  }
{ 15  }
{ 16  }
{ 17  }
{ 18  }
{ 19  }
{ 20  }
{ 21  }
{ 22  }
{ 23  }
{ 24  }
{ 25  }
{ 26  }
{ 27  }
{ 28  }
{ 29  }
{ 30  }
{ 31  }
{ 32  }
{ 33  }
{ 34  }
{ 35  }
{ 36  }
{ 37  }
{ 38  }
{ 39  }
{ 40  }
{ 41  }
{ 42  }
{ 43  }
{ 44  }
{ 45  }
{ 46  }
{ 47  }
{ 48  }
{ 49  }
{ 50  }
{ 51  }
{ 52  }
{ 53  }
{ 54  }
{ 55  }
{ 56  }
{ 57  }
{ 58  }
{ 59  }
{ 60  }
{ 61  }
{ 62  }
{ 63  }
{ 64  }
{ 65  }
{ 66  }
{ 67  }
{ 68  }
{ 69  }
{ 70  }
{ 71  }
{ 72  }
{ 73  }
{ 74  }
{ 75  }
{ 76  }
{ 77  }
{ 78  }
{ 79  }
{ 80  }
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
