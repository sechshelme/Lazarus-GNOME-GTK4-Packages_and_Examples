
unit tommath;
interface

{
  Automatically converted by H2Pas 1.0.0 from tommath.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tommath.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbool  = ^bool;
Pchar  = ^char;
PFILE  = ^FILE;
Plongint  = ^longint;
Pmp_digit  = ^mp_digit;
Pmp_endian  = ^mp_endian;
Pmp_err  = ^mp_err;
Pmp_hval  = ^mp_hval;
Pmp_int  = ^mp_int;
Pmp_ord  = ^mp_ord;
Pmp_order  = ^mp_order;
Pmp_sign  = ^mp_sign;
Psize_t  = ^size_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ LibTomMath, multiple-precision integer library -- Tom St Denis  }
{ SPDX-License-Identifier: Unlicense  }
{ some default configurations.
 *
 * A "mp_digit" must be able to hold MP_DIGIT_BIT + 1 bits
 * A "mp_word" must be able to hold 2*MP_DIGIT_BIT + 1 bits
 *
 * At the very least a mp_digit must be able to hold 7 bits
 * [any size beyond that is ok provided it doesn't overflow the data type]
  }
type
  Pmp_digit = ^Tmp_digit;
  Tmp_digit = Tuint64_t;

{ was #define dname def_expr }
function MP_MASK : longint; { return type might be wrong }

const
  MP_DIGIT_MAX = MP_MASK;  
{ Primality generation flags  }
{ BBS style prime  }
  MP_PRIME_BBS = $0001;  
{ Safe prime (p-1)/2 == prime  }
  MP_PRIME_SAFE = $0002;  
{ force 2nd MSB to 1  }
  MP_PRIME_2MSB_ON = $0008;  
{ positive  }
{ negative  }
type
  Pmp_sign = ^Tmp_sign;
  Tmp_sign =  Longint;
  Const
    MP_ZPOS = 0;
    MP_NEG = 1;
;
{ less than  }
{ equal  }
{ greater than  }
type
  Pmp_ord = ^Tmp_ord;
  Tmp_ord =  Longint;
  Const
    MP_LT = -(1);
    MP_EQ = 0;
    MP_GT = 1;
;
{ no error  }
{ unknown error  }
{ out of mem  }
{ invalid input  }
{ maximum iterations reached  }
{ buffer overflow, supplied buffer too small  }
{ mp_int overflow, too many digits  }
type
  Pmp_err = ^Tmp_err;
  Tmp_err =  Longint;
  Const
    MP_OKAY = 0;
    MP_ERR = -(1);
    MP_MEM = -(2);
    MP_VAL = -(3);
    MP_ITER = -(4);
    MP_BUF = -(5);
    MP_OVF = -(6);
;
type
  Pmp_order = ^Tmp_order;
  Tmp_order =  Longint;
  Const
    MP_LSB_FIRST = -(1);
    MP_MSB_FIRST = 1;
;
type
  Pmp_endian = ^Tmp_endian;
  Tmp_endian =  Longint;
  Const
    MP_LITTLE_ENDIAN = -(1);
    MP_NATIVE_ENDIAN = 0;
    MP_BIG_ENDIAN = 1;
;
{ tunable cutoffs  }
{$ifndef MP_FIXED_CUTOFFS}
  var
    MP_MUL_KARATSUBA_CUTOFF : longint;cvar;external;
{$endif}
{ the infamous mp_int structure  }
type
  Pmp_int = ^Tmp_int;
  Tmp_int = record
      used : longint;
      alloc : longint;
      sign : Tmp_sign;
      dp : Pmp_digit;
    end;
{ error code to char* string  }
(* Const before type ignored *)

function mp_error_to_string(code:Tmp_err):Pchar;cdecl;external;
{ ---> init and deinit bignum functions <---  }
{ init a bignum  }
function mp_init(a:Pmp_int):Tmp_err;cdecl;external;
{ free a bignum  }
procedure mp_clear(a:Pmp_int);cdecl;external;
{ init a null terminated series of arguments  }
function mp_init_multi(mp:Pmp_int; args:array of const):Tmp_err;cdecl;external;
function mp_init_multi(mp:Pmp_int):Tmp_err;cdecl;external;
{ clear a null terminated series of arguments  }
procedure mp_clear_multi(mp:Pmp_int; args:array of const);cdecl;external;
procedure mp_clear_multi(mp:Pmp_int);cdecl;external;
{ exchange two ints  }
procedure mp_exch(a:Pmp_int; b:Pmp_int);cdecl;external;
{ shrink ram required for a bignum  }
function mp_shrink(a:Pmp_int):Tmp_err;cdecl;external;
{ grow an int to a given size  }
function mp_grow(a:Pmp_int; size:longint):Tmp_err;cdecl;external;
{ init to a given number of digits  }
function mp_init_size(a:Pmp_int; size:longint):Tmp_err;cdecl;external;
{ ---> Basic Manipulations <---  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_iszero(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isone(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isneg(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_iseven(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isodd(a : longint) : longint;

{ set to zero  }
procedure mp_zero(a:Pmp_int);cdecl;external;
{ get and set doubles  }
(* Const before type ignored *)
function mp_get_double(a:Pmp_int):Tdouble;cdecl;external;
function mp_set_double(a:Pmp_int; b:Tdouble):Tmp_err;cdecl;external;
{ get integer, set integer and init with integer (int32_t)  }
(* Const before type ignored *)
function mp_get_i32(a:Pmp_int):Tint32_t;cdecl;external;
procedure mp_set_i32(a:Pmp_int; b:Tint32_t);cdecl;external;
function mp_init_i32(a:Pmp_int; b:Tint32_t):Tmp_err;cdecl;external;
{ get integer, set integer and init with integer, behaves like two complement for negative numbers (uint32_t)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_u32(a : longint) : Tuint32_t;

procedure mp_set_u32(a:Pmp_int; b:Tuint32_t);cdecl;external;
function mp_init_u32(a:Pmp_int; b:Tuint32_t):Tmp_err;cdecl;external;
{ get integer, set integer and init with integer (int64_t)  }
(* Const before type ignored *)
function mp_get_i64(a:Pmp_int):Tint64_t;cdecl;external;
procedure mp_set_i64(a:Pmp_int; b:Tint64_t);cdecl;external;
function mp_init_i64(a:Pmp_int; b:Tint64_t):Tmp_err;cdecl;external;
{ get integer, set integer and init with integer, behaves like two complement for negative numbers (uint64_t)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_u64(a : longint) : Tuint64_t;

procedure mp_set_u64(a:Pmp_int; b:Tuint64_t);cdecl;external;
function mp_init_u64(a:Pmp_int; b:Tuint64_t):Tmp_err;cdecl;external;
{ get magnitude  }
(* Const before type ignored *)
function mp_get_mag_u32(a:Pmp_int):Tuint32_t;cdecl;external;
(* Const before type ignored *)
function mp_get_mag_u64(a:Pmp_int):Tuint64_t;cdecl;external;
(* Const before type ignored *)
function mp_get_mag_ul(a:Pmp_int):dword;cdecl;external;
{ get integer, set integer (long)  }
(* Const before type ignored *)
function mp_get_l(a:Pmp_int):longint;cdecl;external;
procedure mp_set_l(a:Pmp_int; b:longint);cdecl;external;
function mp_init_l(a:Pmp_int; b:longint):Tmp_err;cdecl;external;
{ get integer, set integer (unsigned long)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_ul(a : longint) : dword;

procedure mp_set_ul(a:Pmp_int; b:dword);cdecl;external;
function mp_init_ul(a:Pmp_int; b:dword):Tmp_err;cdecl;external;
{ set to single unsigned digit, up to MP_DIGIT_MAX  }
procedure mp_set(a:Pmp_int; b:Tmp_digit);cdecl;external;
function mp_init_set(a:Pmp_int; b:Tmp_digit):Tmp_err;cdecl;external;
{ copy, b = a  }
(* Const before type ignored *)
function mp_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ inits and copies, a = b  }
(* Const before type ignored *)
function mp_init_copy(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ trim unused digits  }
procedure mp_clamp(a:Pmp_int);cdecl;external;
{ unpack binary data  }
(* Const before type ignored *)
function mp_unpack(rop:Pmp_int; count:Tsize_t; order:Tmp_order; size:Tsize_t; endian:Tmp_endian; 
           nails:Tsize_t; op:pointer):Tmp_err;cdecl;external;
{ pack binary data  }
(* Const before type ignored *)
function mp_pack_count(a:Pmp_int; nails:Tsize_t; size:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function mp_pack(rop:pointer; maxcount:Tsize_t; written:Psize_t; order:Tmp_order; size:Tsize_t; 
           endian:Tmp_endian; nails:Tsize_t; op:Pmp_int):Tmp_err;cdecl;external;
{ ---> digit manipulation <---  }
{ right shift by "b" digits  }
procedure mp_rshd(a:Pmp_int; b:longint);cdecl;external;
{ left shift by "b" digits  }
function mp_lshd(a:Pmp_int; b:longint):Tmp_err;cdecl;external;
{ c = a / 2**b, implemented as c = a >> b  }
(* Const before type ignored *)
function mp_div_2d(a:Pmp_int; b:longint; c:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ b = a/2  }
(* Const before type ignored *)
function mp_div_2(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ c = a * 2**b, implemented as c = a << b  }
(* Const before type ignored *)
function mp_mul_2d(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external;
{ b = a*2  }
(* Const before type ignored *)
function mp_mul_2(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ c = a mod 2**b  }
(* Const before type ignored *)
function mp_mod_2d(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external;
{ computes a = 2**b  }
function mp_2expt(a:Pmp_int; b:longint):Tmp_err;cdecl;external;
{ Counts the number of lsbs which are zero before the first zero bit  }
(* Const before type ignored *)
function mp_cnt_lsb(a:Pmp_int):longint;cdecl;external;
{ I Love Earth!  }
{ makes a pseudo-random mp_int of a given size  }
function mp_rand(a:Pmp_int; digits:longint):Tmp_err;cdecl;external;
{ use custom random data source instead of source provided the platform  }
procedure mp_rand_source(source:function (out:pointer; size:Tsize_t):Tmp_err);cdecl;external;
{ ---> binary operations <---  }
{ c = a XOR b (two complement)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_xor(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a OR b (two complement)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_or(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a AND b (two complement)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_and(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ b = ~a (bitwise not, two complement)  }
(* Const before type ignored *)
function mp_complement(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ right shift with sign extension  }
(* Const before type ignored *)
function mp_signed_rsh(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external;
{ ---> Basic arithmetic <---  }
{ b = -a  }
(* Const before type ignored *)
function mp_neg(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ b = |a|  }
(* Const before type ignored *)
function mp_abs(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ compare a to b  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_cmp(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external;
{ compare |a| to |b|  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_cmp_mag(a:Pmp_int; b:Pmp_int):Tmp_ord;cdecl;external;
{ c = a + b  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_add(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a - b  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_sub(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a * b  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_mul(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ b = a*a   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_sqr(a,b : longint) : longint;

{ a/b => cb + d == a  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_div(a:Pmp_int; b:Pmp_int; c:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ c = a mod b, 0 <= c < b   }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_mod(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ Increment "a" by one like "a++". Changes input!  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_incr(a : longint) : longint;

{ Decrement "a" by one like "a--". Changes input!  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_decr(a : longint) : longint;

{ ---> single digit functions <---  }
{ compare against a single digit  }
(* Const before type ignored *)
function mp_cmp_d(a:Pmp_int; b:Tmp_digit):Tmp_ord;cdecl;external;
{ c = a + b  }
(* Const before type ignored *)
function mp_add_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a - b  }
(* Const before type ignored *)
function mp_sub_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external;
{ c = a * b  }
(* Const before type ignored *)
function mp_mul_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int):Tmp_err;cdecl;external;
{ a/b => cb + d == a  }
(* Const before type ignored *)
function mp_div_d(a:Pmp_int; b:Tmp_digit; c:Pmp_int; d:Pmp_digit):Tmp_err;cdecl;external;
{ c = a mod b, 0 <= c < b   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_mod_d(a,b,c : longint) : longint;

{ ---> number theory <---  }
{ d = a + b (mod c)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mp_addmod(a:Pmp_int; b:Pmp_int; c:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ d = a - b (mod c)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mp_submod(a:Pmp_int; b:Pmp_int; c:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ d = a * b (mod c)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mp_mulmod(a:Pmp_int; b:Pmp_int; c:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ c = a * a (mod b)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_sqrmod(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = 1/a (mod b)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_invmod(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ c = (a, b)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_gcd(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ produces value such that U1*a + U2*b = U3  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_exteuclid(a:Pmp_int; b:Pmp_int; U1:Pmp_int; U2:Pmp_int; U3:Pmp_int):Tmp_err;cdecl;external;
{ c = [a, b] or (a*b)/(a, b)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_lcm(a:Pmp_int; b:Pmp_int; c:Pmp_int):Tmp_err;cdecl;external;
{ Integer logarithm to integer base  }
(* Const before type ignored *)
function mp_log_n(a:Pmp_int; base:longint; c:Plongint):Tmp_err;cdecl;external;
{ Integer logarithm to bigint base  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_log(a:Pmp_int; base:Pmp_int; c:Plongint):Tmp_err;cdecl;external;
{ c = a**b  }
(* Const before type ignored *)
function mp_expt_n(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external;
{ finds one of the b'th root of a, such that |c|**b <= |a|
 *
 * returns error if a < 0 and b is even
  }
(* Const before type ignored *)
function mp_root_n(a:Pmp_int; b:longint; c:Pmp_int):Tmp_err;cdecl;external;
{ special sqrt algo  }
(* Const before type ignored *)
function mp_sqrt(arg:Pmp_int; ret:Pmp_int):Tmp_err;cdecl;external;
{ special sqrt (mod prime)  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_sqrtmod_prime(n:Pmp_int; prime:Pmp_int; ret:Pmp_int):Tmp_err;cdecl;external;
{ is number a square?  }
(* Const before type ignored *)
function mp_is_square(arg:Pmp_int; ret:Pbool):Tmp_err;cdecl;external;
{ computes the Kronecker symbol c = (a | p) (like jacobi() but with a,p in Z  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_kronecker(a:Pmp_int; p:Pmp_int; c:Plongint):Tmp_err;cdecl;external;
{ used to setup the Barrett reduction for a given modulus b  }
(* Const before type ignored *)
function mp_reduce_setup(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ Barrett Reduction, computes a (mod b) with a precomputed value c
 *
 * Assumes that 0 < x <= m*m, note if 0 > x > -(m*m) then you can merely
 * compute the reduction as -1 * mp_reduce(mp_abs(x)) [pseudo code].
  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_reduce(x:Pmp_int; m:Pmp_int; mu:Pmp_int):Tmp_err;cdecl;external;
{ setups the montgomery reduction  }
(* Const before type ignored *)
function mp_montgomery_setup(n:Pmp_int; rho:Pmp_digit):Tmp_err;cdecl;external;
{ computes a = B**n mod b without division or multiplication useful for
 * normalizing numbers in a Montgomery system.
  }
(* Const before type ignored *)
function mp_montgomery_calc_normalization(a:Pmp_int; b:Pmp_int):Tmp_err;cdecl;external;
{ computes x/R == x (mod N) via Montgomery Reduction  }
(* Const before type ignored *)
function mp_montgomery_reduce(x:Pmp_int; n:Pmp_int; rho:Tmp_digit):Tmp_err;cdecl;external;
{ returns 1 if a is a valid DR modulus  }
(* Const before type ignored *)
function mp_dr_is_modulus(a:Pmp_int):Tbool;cdecl;external;
{ sets the value of "d" required for mp_dr_reduce  }
(* Const before type ignored *)
procedure mp_dr_setup(a:Pmp_int; d:Pmp_digit);cdecl;external;
{ reduces a modulo n using the Diminished Radix method  }
(* Const before type ignored *)
function mp_dr_reduce(x:Pmp_int; n:Pmp_int; k:Tmp_digit):Tmp_err;cdecl;external;
{ returns true if a can be reduced with mp_reduce_2k  }
(* Const before type ignored *)
function mp_reduce_is_2k(a:Pmp_int):Tbool;cdecl;external;
{ determines k value for 2k reduction  }
(* Const before type ignored *)
function mp_reduce_2k_setup(a:Pmp_int; d:Pmp_digit):Tmp_err;cdecl;external;
{ reduces a modulo b where b is of the form 2**p - k [0 <= a]  }
(* Const before type ignored *)
function mp_reduce_2k(a:Pmp_int; n:Pmp_int; d:Tmp_digit):Tmp_err;cdecl;external;
{ returns true if a can be reduced with mp_reduce_2k_l  }
(* Const before type ignored *)
function mp_reduce_is_2k_l(a:Pmp_int):Tbool;cdecl;external;
{ determines k value for 2k reduction  }
(* Const before type ignored *)
function mp_reduce_2k_setup_l(a:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ reduces a modulo b where b is of the form 2**p - k [0 <= a]  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_reduce_2k_l(a:Pmp_int; n:Pmp_int; d:Pmp_int):Tmp_err;cdecl;external;
{ Y = G**X (mod P)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mp_exptmod(G:Pmp_int; X:Pmp_int; P:Pmp_int; Y:Pmp_int):Tmp_err;cdecl;external;
{$if defined(MP_16BIT)}
type
  Pmp_hval = ^Tmp_hval;
  Tmp_hval = Tuint32_t;
{$else}
type
  Pmp_hval = ^Tmp_hval;
  Tmp_hval = Tuint64_t;
{$endif}
{ computes hash  }
(* Const before type ignored *)

function mp_hash(a:Pmp_int; hash:Pmp_hval):Tmp_err;cdecl;external;
{ ---> Primes <---  }
{ performs one Fermat test of "a" using base "b".
 * Sets result to 0 if composite or 1 if probable prime
  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_prime_fermat(a:Pmp_int; b:Pmp_int; result:Pbool):Tmp_err;cdecl;external;
{ performs one Miller-Rabin test of "a" using base "b".
 * Sets result to 0 if composite or 1 if probable prime
  }
(* Const before type ignored *)
(* Const before type ignored *)
function mp_prime_miller_rabin(a:Pmp_int; b:Pmp_int; result:Pbool):Tmp_err;cdecl;external;
{ This gives [for a given bit size] the number of trials required
 * such that Miller-Rabin gives a prob of failure lower than 2^-96
  }
function mp_prime_rabin_miller_trials(size:longint):longint;cdecl;external;
{ performs one strong Lucas-Selfridge test of "a".
 * Sets result to 0 if composite or 1 if probable prime
  }
(* Const before type ignored *)
function mp_prime_strong_lucas_selfridge(a:Pmp_int; result:Pbool):Tmp_err;cdecl;external;
{ performs one Frobenius test of "a" as described by Paul Underwood.
 * Sets result to 0 if composite or 1 if probable prime
  }
(* Const before type ignored *)
function mp_prime_frobenius_underwood(N:Pmp_int; result:Pbool):Tmp_err;cdecl;external;
{ performs t random rounds of Miller-Rabin on "a" additional to
 * bases 2 and 3.  Also performs an initial sieve of trial
 * division.  Determines if "a" is prime with probability
 * of error no more than (1/4)**t.
 * Both a strong Lucas-Selfridge to complete the BPSW test
 * and a separate Frobenius test are available at compile time.
 * With t<0 a deterministic test is run for primes up to
 * 318665857834031151167461. With t<13 (abs(t)-13) additional
 * tests with sequential small primes are run starting at 43.
 * Is Fips 186.4 compliant if called with t as computed by
 * mp_prime_rabin_miller_trials();
 *
 * Sets result to 1 if probably prime, 0 otherwise
  }
(* Const before type ignored *)
function mp_prime_is_prime(a:Pmp_int; t:longint; result:Pbool):Tmp_err;cdecl;external;
{ finds the next prime after the number "a" using "t" trials
 * of Miller-Rabin.
 *
 * bbs_style = true means the prime must be congruent to 3 mod 4
  }
function mp_prime_next_prime(a:Pmp_int; t:longint; bbs_style:Tbool):Tmp_err;cdecl;external;
{ makes a truly random prime of a given size (bits),
 *
 * Flags are as follows:
 *
 *   MP_PRIME_BBS      - make prime congruent to 3 mod 4
 *   MP_PRIME_SAFE     - make sure (p-1)/2 is prime as well (implies MP_PRIME_BBS)
 *   MP_PRIME_2MSB_ON  - make the 2nd highest bit one
 *
 * You have to supply a callback which fills in a buffer with random bytes.  "dat" is a parameter you can
 * have passed to the callback (e.g. a state or something).  This function doesn't use "dat" itself
 * so it can be NULL
 *
  }
function mp_prime_rand(a:Pmp_int; t:longint; size:longint; flags:longint):Tmp_err;cdecl;external;
{ ---> radix conversion <---  }
(* Const before type ignored *)
function mp_count_bits(a:Pmp_int):longint;cdecl;external;
(* Const before type ignored *)
function mp_ubin_size(a:Pmp_int):Tsize_t;cdecl;external;
(* Const before type ignored *)
function mp_from_ubin(a:Pmp_int; buf:Puint8_t; size:Tsize_t):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_to_ubin(a:Pmp_int; buf:Puint8_t; maxlen:Tsize_t; written:Psize_t):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_sbin_size(a:Pmp_int):Tsize_t;cdecl;external;
(* Const before type ignored *)
function mp_from_sbin(a:Pmp_int; buf:Puint8_t; size:Tsize_t):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_to_sbin(a:Pmp_int; buf:Puint8_t; maxlen:Tsize_t; written:Psize_t):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_read_radix(a:Pmp_int; str:Pchar; radix:longint):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_to_radix(a:Pmp_int; str:Pchar; maxlen:Tsize_t; written:Psize_t; radix:longint):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_radix_size(a:Pmp_int; radix:longint; size:Psize_t):Tmp_err;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mp_radix_size_overestimate(a:Pmp_int; radix:longint; size:Psize_t):Tmp_err;cdecl;external;
{$ifndef MP_NO_FILE}

function mp_fread(a:Pmp_int; radix:longint; stream:PFILE):Tmp_err;cdecl;external;
(* Const before type ignored *)
function mp_fwrite(a:Pmp_int; radix:longint; stream:PFILE):Tmp_err;cdecl;external;
{$endif}

function mp_warray_free:longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_binary(M,S,N : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_octal(M,S,N : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_decimal(M,S,N : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_hex(M,S,N : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function MP_MASK : longint; { return type might be wrong }
  begin
    MP_MASK:=((Tmp_digit(1)) shl (Tmp_digit(MP_DIGIT_BIT)))-(Tmp_digit(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_iszero(a : longint) : longint;
begin
  mp_iszero:=(a^.used)=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isone(a : longint) : longint;
begin
  mp_isone:=(((a^.sign)=MP_ZPOS) and (@((a^.used)=1))) and (@((a^.(dp[0]))=1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isneg(a : longint) : longint;
begin
  mp_isneg:=(a^.sign)=MP_NEG;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_iseven(a : longint) : longint;
begin
  mp_iseven:=((a^.used)=0) or (((a^.(dp[0])) and 1)=0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_isodd(a : longint) : longint;
begin
  mp_isodd:= not (mp_iseven(a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_u32(a : longint) : Tuint32_t;
begin
  mp_get_u32:=Tuint32_t(mp_get_i32(a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_u64(a : longint) : Tuint64_t;
begin
  mp_get_u64:=Tuint64_t(mp_get_i64(a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function mp_get_ul(a : longint) : dword;
begin
  mp_get_ul:=dword(mp_get_l(a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_sqr(a,b : longint) : longint;
begin
  mp_sqr:=mp_mul(a,a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_incr(a : longint) : longint;
begin
  mp_incr:=mp_add_d(a,1,a);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_decr(a : longint) : longint;
begin
  mp_decr:=mp_sub_d(a,1,a);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_mod_d(a,b,c : longint) : longint;
begin
  mp_mod_d:=mp_div_d(a,b,NULL,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_binary(M,S,N : longint) : longint;
begin
  mp_to_binary:=mp_to_radix(M,S,N,NULL,2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_octal(M,S,N : longint) : longint;
begin
  mp_to_octal:=mp_to_radix(M,S,N,NULL,8);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_decimal(M,S,N : longint) : longint;
begin
  mp_to_decimal:=mp_to_radix(M,S,N,NULL,10);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mp_to_hex(M,S,N : longint) : longint;
begin
  mp_to_hex:=mp_to_radix(M,S,N,NULL,16);
end;


end.
