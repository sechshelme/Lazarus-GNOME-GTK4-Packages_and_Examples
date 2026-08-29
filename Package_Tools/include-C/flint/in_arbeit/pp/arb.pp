
unit arb;
interface

{
  Automatically converted by H2Pas 1.0.0 from arb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    arb.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Pflint_bitcnt_t  = ^flint_bitcnt_t;
Pfmpz  = ^fmpz;
Plongint  = ^longint;
Pmp_limb_t  = ^mp_limb_t;
Pslong  = ^slong;
Pulong  = ^ulong;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2014 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }

const
  __ARB_VERSION = 2;  
  __ARB_VERSION_MINOR = 23;  
  __ARB_VERSION_PATCHLEVEL = 0;  
  ARB_VERSION = '2.23.0';  
{xxxxxxxxxxx
#define __ARB_RELEASE (__ARB_VERSION * 10000 + \
                         __ARB_VERSION_MINOR * 100 + \
                         __ARB_VERSION_PATCHLEVEL)
 }
(* Const before type ignored *)
  var
    arb_version : Pchar;cvar;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function arb_midref(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_radref(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARB_IS_LAGOM(x : longint) : longint;

const
  ARB_RND = ARF_RND_DOWN;  

procedure arb_init(x:Tarb_t);cdecl;external;
procedure arb_clear(x:Tarb_t);cdecl;external;
function _arb_vec_init(n:Tslong):Tarb_ptr;cdecl;external;
procedure _arb_vec_clear(v:Tarb_ptr; n:Tslong);cdecl;external;
function arb_mid_ptr(z:Tarb_t):Tarf_ptr;cdecl;external;
function arb_rad_ptr(z:Tarb_t):Tmag_ptr;cdecl;external;
(* Const before type ignored *)
function arb_is_exact(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_equal(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_equal_si(x:Tarb_t; y:Tslong):longint;cdecl;external;
{ implementations are in arb/richcmp.c  }
(* Const before type ignored *)
(* Const before type ignored *)
function arb_eq(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_ne(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_lt(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_le(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_gt(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_ge(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
procedure arb_zero(x:Tarb_t);cdecl;external;
(* Const before type ignored *)
function arb_is_zero(x:Tarb_t):longint;cdecl;external;
procedure arb_pos_inf(x:Tarb_t);cdecl;external;
procedure arb_neg_inf(x:Tarb_t);cdecl;external;
procedure arb_zero_pm_inf(x:Tarb_t);cdecl;external;
procedure arb_zero_pm_one(x:Tarb_t);cdecl;external;
procedure arb_unit_interval(x:Tarb_t);cdecl;external;
procedure arb_indeterminate(x:Tarb_t);cdecl;external;
(* Const before type ignored *)
function arb_is_finite(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_set(x:Tarb_t; y:Tarb_t);cdecl;external;
procedure arb_swap(x:Tarb_t; y:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_set_round(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_trim(y:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_neg(y:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_neg_round(x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_abs(y:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_nonnegative_abs(y:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_sgn(res:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
function arb_sgn_nonzero(x:Tarb_t):longint;cdecl;external;
procedure _arb_digits_round_inplace(s:Pchar; shift:Pflint_bitcnt_t; error:Tfmpz_t; n:Tslong; rnd:Tarf_rnd_t);cdecl;external;
(* Const before type ignored *)
function arb_set_str(res:Tarb_t; inp:Pchar; prec:Tslong):longint;cdecl;external;
{ was #define dname def_expr }
function ARB_STR_MORE : longint; { return type might be wrong }

{ was #define dname def_expr }
function ARB_STR_NO_RADIUS : longint; { return type might be wrong }

{ was #define dname def_expr }
function ARB_STR_CONDENSE : longint; { return type might be wrong }

(* Const before type ignored *)
function arb_get_str(x:Tarb_t; n:Tslong; flags:Tulong):Pchar;cdecl;external;
(* Const before type ignored *)
procedure arb_set_arf(x:Tarb_t; y:Tarf_t);cdecl;external;
procedure arb_set_si(x:Tarb_t; y:Tslong);cdecl;external;
procedure arb_set_ui(x:Tarb_t; y:Tulong);cdecl;external;
procedure arb_set_d(x:Tarb_t; y:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure arb_set_fmpz(x:Tarb_t; y:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_set_fmpz_2exp(x:Tarb_t; y:Tfmpz_t; exp:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_set_round_fmpz_2exp(y:Tarb_t; x:Tfmpz_t; exp:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_set_round_fmpz(y:Tarb_t; x:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function arb_is_one(f:Tarb_t):longint;cdecl;external;
procedure arb_one(f:Tarb_t);cdecl;external;
{$ifdef FLINT_HAVE_FILE}
(* Const before type ignored *)
procedure arb_fprint(file:PFILE; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_fprintd(file:PFILE; x:Tarb_t; digits:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_fprintn(file:PFILE; x:Tarb_t; digits:Tslong; flags:Tulong);cdecl;external;
{$endif}
(* Const before type ignored *)

procedure arb_print(x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_printd(x:Tarb_t; digits:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_printn(x:Tarb_t; digits:Tslong; flags:Tulong);cdecl;external;
(* Const before type ignored *)
procedure arb_mul_2exp_si(y:Tarb_t; x:Tarb_t; e:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_mul_2exp_fmpz(y:Tarb_t; x:Tarb_t; e:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
function arb_is_int(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_int_2exp_si(x:Tarb_t; e:Tslong):longint;cdecl;external;
{ implementations are in arb/richcmp.c  }
(* Const before type ignored *)
function arb_contains_zero(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_nonzero(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_positive(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_nonnegative(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_negative(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_is_nonpositive(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_negative(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_nonpositive(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_positive(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_nonnegative(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_get_mag_lower(z:Tmag_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_get_mag_lower_nonnegative(z:Tmag_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_get_mag(z:Tmag_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_get_mid_arb(z:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_get_rad_arb(z:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_get_abs_ubound_arf(u:Tarf_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_get_abs_lbound_arf(u:Tarf_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_get_ubound_arf(u:Tarf_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_get_lbound_arf(u:Tarf_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_nonnegative_part(res:Tarb_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
function arb_rel_error_bits(x:Tarb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function arb_rel_accuracy_bits(x:Tarb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function arb_rel_one_accuracy_bits(x:Tarb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function arb_bits(x:Tarb_t):Tslong;cdecl;external;
procedure arb_randtest_exact(x:Tarb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure arb_randtest_wide(x:Tarb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure arb_randtest_precise(x:Tarb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure arb_randtest(x:Tarb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure arb_randtest_special(x:Tarb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure arb_urandom(x:Tarb_t; state:Tflint_rand_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_add_error_arf(x:Tarb_t; err:Tarf_t);cdecl;external;
procedure arb_add_error_2exp_si(x:Tarb_t; err:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_add_error_2exp_fmpz(x:Tarb_t; err:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure arb_add_error(x:Tarb_t; error:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure arb_add_error_mag(x:Tarb_t; err:Tmag_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains_arf(x:Tarb_t; y:Tarf_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains_fmpq(x:Tarb_t; y:Tfmpq_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains_fmpz(x:Tarb_t; y:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_si(x:Tarb_t; y:Tslong):longint;cdecl;external;
{$ifdef __MPFR_H}
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains_mpfr(x:Tarb_t; y:Tmpfr_t):longint;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function arb_overlaps(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_contains_interior(x:Tarb_t; y:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
function arb_contains_int(x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_get_interval_fmpz_2exp(a:Tfmpz_t; b:Tfmpz_t; exp:Tfmpz_t; x:Tarb_t);cdecl;external;
(* Const before type ignored *)
function arb_get_unique_fmpz(z:Tfmpz_t; x:Tarb_t):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_get_fmpz_mid_rad_10exp(mid:Tfmpz_t; rad:Tfmpz_t; exp:Tfmpz_t; x:Tarb_t; n:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_floor(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_ceil(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_nint(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_trunc(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_set_interval_arf(x:Tarb_t; a:Tarf_t; b:Tarf_t; prec:Tslong);cdecl;external;
{$ifdef __MPFR_H}
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_set_interval_mpfr(x:Tarb_t; a:Tmpfr_t; b:Tmpfr_t; prec:Tslong);cdecl;external;
{$endif}
(* Const before type ignored *)

procedure arb_get_interval_arf(a:Tarf_t; b:Tarf_t; x:Tarb_t; prec:Tslong);cdecl;external;
{$ifdef __MPFR_H}
(* Const before type ignored *)
procedure arb_get_interval_mpfr(a:Tmpfr_t; b:Tmpfr_t; x:Tarb_t);cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

procedure arb_set_interval_mag(res:Tarb_t; a:Tmag_t; b:Tmag_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_set_interval_neg_pos_mag(res:Tarb_t; a:Tmag_t; b:Tmag_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_union(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_intersection(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_get_rand_fmpq(q:Tfmpq_t; state:Tflint_rand_t; x:Tarb_t; bits:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_min(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_max(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_minmax(z1:Tarb_t; z2:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function arb_can_round_arf(x:Tarb_t; prec:Tslong; rnd:Tarf_rnd_t):longint;cdecl;external;
{$ifdef __MPFR_H}
(* Const before type ignored *)
function arb_can_round_mpfr(x:Tarb_t; prec:Tslong; rnd:Tmpfr_rnd_t):longint;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

procedure arb_add(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_add_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_add_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_add_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_add_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_add_fmpz_2exp(z:Tarb_t; x:Tarb_t; man:Tfmpz_t; exp:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_sub(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_sub_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sub_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sub_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_sub_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_mul(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_mul_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_mul_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_mul_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_mul_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_addmul(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_addmul_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_addmul_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_addmul_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_addmul_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_submul(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_submul_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_submul_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_submul_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_submul_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fma(res:Tarb_t; x:Tarb_t; y:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fma_arf(res:Tarb_t; x:Tarb_t; y:Tarf_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fma_si(res:Tarb_t; x:Tarb_t; y:Tslong; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fma_ui(res:Tarb_t; x:Tarb_t; y:Tulong; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fma_fmpz(res:Tarb_t; x:Tarb_t; y:Tfmpz_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_dot_simple(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Tarb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_dot_precise(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Tarb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_dot(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Tarb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_approx_dot(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Tarb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_dot_ui(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_dot_si(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Pslong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_dot_uiui(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_dot_siui(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_dot_fmpz(res:Tarb_t; initial:Tarb_t; subtract:longint; x:Tarb_srcptr; xstep:Tslong; 
            y:Pfmpz; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_div(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_div_arf(z:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_div_si(z:Tarb_t; x:Tarb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_div_ui(z:Tarb_t; x:Tarb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_div_fmpz(z:Tarb_t; x:Tarb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fmpz_div_fmpz(z:Tarb_t; x:Tfmpz_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_ui_div(z:Tarb_t; x:Tulong; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_div_arf_newton(res:Tarb_t; x:Tarb_t; y:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_div_newton(res:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_fmpz_divapprox(res:Tfmpz_t; x:Tfmpz_t; y:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure arb_inv(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_set_fmpq(y:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt_arf(z:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt_fmpz(z:Tarb_t; x:Tfmpz_t; prec:Tslong);cdecl;external;
procedure arb_sqrt_ui(z:Tarb_t; x:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrtpos(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_hypot(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rsqrt(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_rsqrt_ui(z:Tarb_t; x:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt1pm1(r:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rsqrt_arf_newton(res:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt_arf_newton(res:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqrt_newton(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_pow_fmpz_binexp(y:Tarb_t; b:Tarb_t; e:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_pow_fmpz(y:Tarb_t; b:Tarb_t; e:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_pow_ui(y:Tarb_t; b:Tarb_t; e:Tulong; prec:Tslong);cdecl;external;
procedure arb_ui_pow_ui(y:Tarb_t; b:Tulong; e:Tulong; prec:Tslong);cdecl;external;
procedure arb_si_pow_ui(y:Tarb_t; b:Tslong; e:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_pow_fmpq(y:Tarb_t; x:Tarb_t; a:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_div_2expm1_ui(z:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_pow(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_root_ui(z:Tarb_t; x:Tarb_t; k:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_root(z:Tarb_t; x:Tarb_t; k:Tulong; prec:Tslong);cdecl;external;
{ back compat  }
(* Const before type ignored *)
procedure arb_log(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_log_arf(z:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
procedure arb_log_ui(z:Tarb_t; x:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_log_fmpz(z:Tarb_t; x:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_log1p(r:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_log_base_ui(res:Tarb_t; x:Tarb_t; b:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_log_hypot(res:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_exp(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_expm1(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_exp_invexp(z:Tarb_t; w:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin(s:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cos(c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos(s:Tarb_t; c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_pi(s:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cos_pi(c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_pi(s:Tarb_t; c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_tan(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cot(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_tan_pi(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cot_pi(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
procedure _arb_sin_pi_fmpq_algebraic(s:Tarb_t; p:Tulong; q:Tulong; prec:Tslong);cdecl;external;
procedure _arb_cos_pi_fmpq_algebraic(c:Tarb_t; p:Tulong; q:Tulong; prec:Tslong);cdecl;external;
procedure _arb_sin_cos_pi_fmpq_algebraic(s:Tarb_t; c:Tarb_t; p:Tulong; q:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_pi_fmpq(s:Tarb_t; c:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_pi_fmpq(s:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cos_pi_fmpq(c:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sinc(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sinc_pi(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sinh(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_cosh(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sinh_cosh(s:Tarb_t; c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_tanh(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_coth(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_atan_arf(z:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_atan(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_atan2(z:Tarb_t; b:Tarb_t; a:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_asin(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_acos(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_atanh(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_asinh(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_acosh(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sec(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_csc(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_csc_pi(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sech(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_csch(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_fac_ui(z:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_doublefac_ui(z:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_bin_ui(z:Tarb_t; n:Tarb_t; k:Tulong; prec:Tslong);cdecl;external;
procedure arb_bin_uiui(z:Tarb_t; n:Tulong; k:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_fib_fmpz(z:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
procedure arb_fib_ui(z:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_const_pi(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_sqrt_pi(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_log_sqrt2pi(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_log2(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_log10(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_euler(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_catalan(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_e(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_khinchin(z:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_const_glaisher(z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_agm(z:Tarb_t; x:Tarb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_lgamma(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rgamma(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_gamma(z:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_gamma_fmpq(z:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_gamma_fmpz(z:Tarb_t; x:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_digamma(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_zeta(z:Tarb_t; s:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_hurwitz_zeta(z:Tarb_t; s:Tarb_t; a:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rising_ui(z:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rising_fmpq_ui(y:Tarb_t; x:Tfmpq_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_rising(z:Tarb_t; x:Tarb_t; n:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_rising2_ui(u:Tarb_t; v:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_log_ui_from_prev(s:Tarb_t; k:Tulong; log_prev:Tarb_t; prev:Tulong; prec:Tslong);cdecl;external;
procedure arb_const_apery(s:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_asymp(x:Tarb_t; s:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_borwein_bsplit(x:Tarb_t; s:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_euler_product(z:Tarb_t; s:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_bernoulli(x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_vec_borwein(z:Tarb_ptr; start:Tulong; num:Tslong; step:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui(x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_vec_even(x:Tarb_ptr; start:Tulong; num:Tslong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_vec_odd(x:Tarb_ptr; start:Tulong; num:Tslong; prec:Tslong);cdecl;external;
procedure arb_zeta_ui_vec(x:Tarb_ptr; start:Tulong; num:Tslong; prec:Tslong);cdecl;external;
procedure arb_bernoulli_ui(b:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_bernoulli_ui_zeta(b:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_bernoulli_fmpz(b:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_bernoulli_poly_ui(res:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_polylog(w:Tarb_t; s:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_polylog_si(w:Tarb_t; s:Tslong; z:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_chebyshev_t_ui(a:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_chebyshev_t2_ui(a:Tarb_t; b:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_chebyshev_u_ui(a:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_chebyshev_u2_ui(a:Tarb_t; b:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_power_sum_vec(res:Tarb_ptr; a:Tarb_t; b:Tarb_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_bell_sum_taylor(res:Tarb_t; n:Tfmpz_t; a:Tfmpz_t; b:Tfmpz_t; mmag:Tfmpz_t; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_bell_sum_bsplit(res:Tarb_t; n:Tfmpz_t; a:Tfmpz_t; b:Tfmpz_t; mmag:Tfmpz_t; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_bell_fmpz(res:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
procedure arb_bell_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_euler_number_fmpz(res:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
procedure arb_euler_number_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_fmpz_euler_number_ui_multi_mod(res:Tfmpz_t; n:Tulong; alpha:Tdouble);cdecl;external;
procedure arb_fmpz_euler_number_ui(res:Tfmpz_t; n:Tulong);cdecl;external;
(* Const before type ignored *)
procedure arb_partitions_fmpz(res:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
procedure arb_partitions_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_primorial_nth_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
procedure arb_primorial_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_lambertw(res:Tarb_t; x:Tarb_t; flags:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sqr(res:Tarb_t; val:Tarb_t; prec:Tslong);cdecl;external;
{ vector functions  }
function _arb_vec_entry_ptr(vec:Tarb_ptr; i:Tslong):Tarb_ptr;cdecl;external;
procedure _arb_vec_printn(vec:Tarb_srcptr; len:Tslong; ndigits:Tslong; flags:Tulong);cdecl;external;
procedure _arb_vec_zero(A:Tarb_ptr; n:Tslong);cdecl;external;
function _arb_vec_is_zero(vec:Tarb_srcptr; len:Tslong):longint;cdecl;external;
function _arb_vec_is_finite(x:Tarb_srcptr; len:Tslong):longint;cdecl;external;
procedure _arb_vec_set(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong);cdecl;external;
procedure _arb_vec_set_round(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external;
procedure _arb_vec_swap(res:Tarb_ptr; vec:Tarb_ptr; len:Tslong);cdecl;external;
procedure _arb_vec_neg(B:Tarb_ptr; A:Tarb_srcptr; n:Tslong);cdecl;external;
procedure _arb_vec_sub(C:Tarb_ptr; A:Tarb_srcptr; B:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external;
procedure _arb_vec_add(C:Tarb_ptr; A:Tarb_srcptr; B:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_vec_scalar_mul(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_vec_scalar_div(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_vec_scalar_mul_fmpz(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; c:Tfmpz_t; prec:Tslong);cdecl;external;
procedure _arb_vec_scalar_mul_2exp_si(res:Tarb_ptr; src:Tarb_srcptr; len:Tslong; c:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_vec_scalar_addmul(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; c:Tarb_t; prec:Tslong);cdecl;external;
procedure _arb_vec_get_mag(bound:Tmag_t; vec:Tarb_srcptr; len:Tslong);cdecl;external;
function _arb_vec_bits(x:Tarb_srcptr; len:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
procedure _arb_vec_set_powers(xs:Tarb_ptr; x:Tarb_t; len:Tslong; prec:Tslong);cdecl;external;
procedure _arb_vec_add_error_arf_vec(res:Tarb_ptr; err:Tarf_srcptr; len:Tslong);cdecl;external;
procedure _arb_vec_add_error_mag_vec(res:Tarb_ptr; err:Tmag_srcptr; len:Tslong);cdecl;external;
procedure _arb_vec_indeterminate(vec:Tarb_ptr; len:Tslong);cdecl;external;
procedure _arb_vec_trim(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong);cdecl;external;
function _arb_vec_get_unique_fmpz_vec(res:Pfmpz; vec:Tarb_srcptr; len:Tslong):longint;cdecl;external;
{ arctangent implementation  }
const
  ARB_ATAN_TAB1_BITS = 8;  
  ARB_ATAN_TAB1_PREC = 512;  
  ARB_ATAN_TAB1_LIMBS = ARB_ATAN_TAB1_PREC/FLINT_BITS;  
  ARB_ATAN_TAB21_BITS = 5;  
  ARB_ATAN_TAB22_BITS = 5;  
  ARB_ATAN_TAB2_PREC = 4608;  
  ARB_ATAN_TAB2_LIMBS = ARB_ATAN_TAB2_PREC/FLINT_BITS;  
(* Const before type ignored *)
  var
    arb_atan_tab1 : array[0..(1 shl ARB_ATAN_TAB1_BITS)-1] of array[0..(ARB_ATAN_TAB1_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_atan_tab21 : array[0..(1 shl ARB_ATAN_TAB21_BITS)-1] of array[0..(ARB_ATAN_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_atan_tab22 : array[0..(1 shl ARB_ATAN_TAB22_BITS)-1] of array[0..(ARB_ATAN_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_atan_pi2_minus_one : array[0..(ARB_ATAN_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;

procedure _arb_atan_taylor_naive(y:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; N:Tulong; 
            alternating:longint);cdecl;external;
procedure _arb_atan_taylor_rs(y:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; N:Tulong; 
            alternating:longint);cdecl;external;
const
  ARB_ATAN_NEWTON_PREC = 3400;  
(* Const before type ignored *)

procedure arb_atan_newton(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_atan_arf_newton(res:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
{ logarithm implementation  }
const
  ARB_LOG_TAB11_BITS = 7;  
  ARB_LOG_TAB12_BITS = 7;  
  ARB_LOG_TAB1_PREC = 512;  
  ARB_LOG_TAB1_LIMBS = ARB_LOG_TAB1_PREC/FLINT_BITS;  
  ARB_LOG_TAB21_BITS = 5;  
  ARB_LOG_TAB22_BITS = 5;  
  ARB_LOG_TAB2_PREC = 4608;  
  ARB_LOG_TAB2_LIMBS = ARB_LOG_TAB2_PREC/FLINT_BITS;  
(* Const before type ignored *)
  var
    arb_log_tab11 : array[0..(1 shl ARB_LOG_TAB11_BITS)-1] of array[0..(ARB_LOG_TAB1_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_log_tab12 : array[0..(1 shl ARB_LOG_TAB12_BITS)-1] of array[0..(ARB_LOG_TAB1_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_log_tab21 : array[0..(1 shl ARB_LOG_TAB21_BITS)-1] of array[0..(ARB_LOG_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_log_tab22 : array[0..(1 shl ARB_LOG_TAB22_BITS)-1] of array[0..(ARB_LOG_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_log_log2_tab : Tmp_srcptr;cvar;external;
(* Const before type ignored *)

procedure arb_log_newton(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_log_arf_newton(res:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
{ logarithms of primes  }
const
  ARB_LOG_PRIME_CACHE_NUM = 13;  
(* Const before type ignored *)
  var
    arb_log_p_tab : array[0..(ARB_LOG_PRIME_CACHE_NUM)-1] of array[0..(ARB_LOG_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;

procedure arb_log_primes_vec_bsplit(res:Tarb_ptr; n:Tslong; prec:Tslong);cdecl;external;
procedure _arb_log_p_ensure_cached(prec:Tslong);cdecl;external;
function _arb_log_p_cache_vec:Tarb_srcptr;cdecl;external;
{ exponential implementation  }
{ only goes up to log(2) * 256  }
const
  ARB_EXP_TAB1_NUM = 178;  
  ARB_EXP_TAB1_BITS = 8;  
  ARB_EXP_TAB1_PREC = 512;  
  ARB_EXP_TAB1_LIMBS = ARB_EXP_TAB1_PREC/FLINT_BITS;  
{ only goes up to log(2) * 32  }
  ARB_EXP_TAB21_NUM = 23;  
  ARB_EXP_TAB21_BITS = 5;  
  ARB_EXP_TAB22_NUM = 1 shl ARB_EXP_TAB22_BITS;  
  ARB_EXP_TAB22_BITS = 5;  
  ARB_EXP_TAB2_PREC = 4608;  
  ARB_EXP_TAB2_LIMBS = ARB_EXP_TAB2_PREC/FLINT_BITS;  
(* Const before type ignored *)
  var
    arb_exp_tab1 : array[0..(ARB_EXP_TAB1_NUM)-1] of array[0..(ARB_EXP_TAB1_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_exp_tab21 : array[0..(ARB_EXP_TAB21_NUM)-1] of array[0..(ARB_EXP_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_exp_tab22 : array[0..(ARB_EXP_TAB22_NUM)-1] of array[0..(ARB_EXP_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;

procedure _arb_exp_taylor_naive(y:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; N:Tulong);cdecl;external;
procedure _arb_exp_taylor_rs(y:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; N:Tulong);cdecl;external;
(* Const before type ignored *)
procedure arb_exp_arf_bb(z:Tarb_t; x:Tarf_t; prec:Tslong; minus_one:longint);cdecl;external;
(* Const before type ignored *)
procedure arb_exp_arf_rs_generic(res:Tarb_t; x:Tarf_t; prec:Tslong; minus_one:longint);cdecl;external;
(* Const before type ignored *)
function _arb_get_mpn_fixed_mod_log2(w:Tmp_ptr; q:Tfmpz_t; error:Pmp_limb_t; x:Tarf_t; wn:Tmp_size_t):longint;cdecl;external;
function _arb_exp_taylor_bound(mag:Tslong; prec:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
procedure _arb_exp_sum_bs_powtab(T:Tfmpz_t; Q:Tfmpz_t; Qexp:Pflint_bitcnt_t; x:Tfmpz_t; r:Tflint_bitcnt_t; 
            N:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_exp_sum_bs_simple(T:Tfmpz_t; Q:Tfmpz_t; Qexp:Pflint_bitcnt_t; x:Tfmpz_t; r:Tflint_bitcnt_t; 
            N:Tslong);cdecl;external;
const
  ARB_LOG_REDUCTION_DEFAULT_MAX_PREC = 4000000;  
  ARB_EXP_LOG_REDUCTION_PREC = 2240;  
  ARB_LOG_NEWTON_PREC = 2800;  
(* Const before type ignored *)

procedure arb_exp_arf_log_reduction(res:Tarb_t; x:Tarf_t; prec:Tslong; minus_one:longint);cdecl;external;
(* Const before type ignored *)
procedure arb_exp_arf_generic(z:Tarb_t; x:Tarf_t; prec:Tslong; minus_one:longint);cdecl;external;
(* Const before type ignored *)
procedure arb_exp_arf(z:Tarb_t; x:Tarf_t; prec:Tslong; minus_one:longint; maglim:Tslong);cdecl;external;
{ sin/cos implementation  }
{ only goes up to (pi/4) * 256  }
const
  ARB_SIN_COS_TAB1_NUM = 203;  
  ARB_SIN_COS_TAB1_BITS = 8;  
  ARB_SIN_COS_TAB1_PREC = 512;  
  ARB_SIN_COS_TAB1_LIMBS = ARB_SIN_COS_TAB1_PREC/FLINT_BITS;  
{ only goes up to (pi/4) * 32  }
  ARB_SIN_COS_TAB21_NUM = 26;  
  ARB_SIN_COS_TAB21_BITS = 5;  
  ARB_SIN_COS_TAB22_NUM = 1 shl ARB_SIN_COS_TAB22_BITS;  
  ARB_SIN_COS_TAB22_BITS = 5;  
  ARB_SIN_COS_TAB2_PREC = 4608;  
  ARB_SIN_COS_TAB2_LIMBS = ARB_SIN_COS_TAB2_PREC/FLINT_BITS;  
(* Const before type ignored *)
  var
    arb_sin_cos_tab1 : array[0..(2*ARB_SIN_COS_TAB1_NUM)-1] of array[0..(ARB_SIN_COS_TAB1_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_sin_cos_tab21 : array[0..(2*ARB_SIN_COS_TAB21_NUM)-1] of array[0..(ARB_SIN_COS_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;
(* Const before type ignored *)
    arb_sin_cos_tab22 : array[0..(2*ARB_SIN_COS_TAB22_NUM)-1] of array[0..(ARB_SIN_COS_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;

const
  ARB_PI4_TAB_LIMBS = 4608/FLINT_BITS;  
(* Const before type ignored *)
  var
    arb_pi4_tab : array[0..(ARB_PI4_TAB_LIMBS)-1] of Tmp_limb_t;cvar;external;

procedure _arb_sin_cos_taylor_naive(ysin:Tmp_ptr; ycos:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; 
            N:Tulong);cdecl;external;
procedure _arb_sin_cos_taylor_rs(ysin:Tmp_ptr; ycos:Tmp_ptr; error:Pmp_limb_t; x:Tmp_srcptr; xn:Tmp_size_t; 
            N:Tulong; sinonly:longint; alternating:longint);cdecl;external;
(* Const before type ignored *)
function _arb_get_mpn_fixed_mod_pi4(w:Tmp_ptr; q:Tfmpz_t; octant:Plongint; error:Pmp_limb_t; x:Tarf_t; 
           wn:Tmp_size_t):longint;cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_arf_bb(zsin:Tarb_t; zcos:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_arf_rs_generic(res_sin:Tarb_t; res_cos:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_arf_generic(res_sin:Tarb_t; res_cos:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _arb_sin_cos_wide(s:Tarb_t; c:Tarb_t; x:Tarf_t; r:Tmag_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_wide(s:Tarb_t; c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _arb_sin_cos_generic(s:Tarb_t; c:Tarb_t; x:Tarf_t; xrad:Tmag_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_generic(s:Tarb_t; c:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
procedure arb_atan_gauss_primes_vec_bsplit(res:Tarb_ptr; n:Tslong; prec:Tslong);cdecl;external;
const
  ARB_ATAN_GAUSS_PRIME_CACHE_NUM = 13;  
  ARB_SIN_COS_ATAN_REDUCTION_DEFAULT_MAX_PREC = 4000000;  
  ARB_SIN_COS_ATAN_REDUCTION_PREC = 2600;  
(* Const before type ignored *)
  var
    arb_atan_gauss_tab : array[0..(ARB_ATAN_GAUSS_PRIME_CACHE_NUM)-1] of array[0..(ARB_ATAN_TAB2_LIMBS)-1] of Tmp_limb_t;cvar;external;

procedure _arb_atan_gauss_p_ensure_cached(prec:Tslong);cdecl;external;
function _arb_atan_gauss_p_cache_vec:Tarb_srcptr;cdecl;external;
(* Const before type ignored *)
procedure arb_sin_cos_arf_atan_reduction(res1:Tarb_t; res2:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
function _arb_mpn_leading_zeros(d:Tmp_srcptr; n:Tmp_size_t):Tflint_bitcnt_t;cdecl;external;
(* Const before type ignored *)
procedure _arb_atan_sum_bs_simple(T:Tfmpz_t; Q:Tfmpz_t; Qexp:Pflint_bitcnt_t; x:Tfmpz_t; r:Tflint_bitcnt_t; 
            N:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _arb_atan_sum_bs_powtab(T:Tfmpz_t; Q:Tfmpz_t; Qexp:Pflint_bitcnt_t; x:Tfmpz_t; r:Tflint_bitcnt_t; 
            N:Tslong);cdecl;external;
(* Const before type ignored *)
procedure arb_atan_arf_bb(z:Tarb_t; x:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure arb_atan_frac_bsplit(s:Tarb_t; p:Tfmpz_t; q:Tfmpz_t; hyperbolic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function arb_allocated_bytes(x:Tarb_t):Tslong;cdecl;external;
function _arb_vec_allocated_bytes(vec:Tarb_srcptr; len:Tslong):Tslong;cdecl;external;
function _arb_vec_estimate_allocated_bytes(len:Tslong; prec:Tslong):Tdouble;cdecl;external;
(* Const before type ignored *)
function arb_load_str(res:Tarb_t; data:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function arb_dump_str(x:Tarb_t):Pchar;cdecl;external;
{$ifdef FLINT_HAVE_FILE}
function arb_load_file(res:Tarb_t; stream:PFILE):longint;cdecl;external;
(* Const before type ignored *)
function arb_dump_file(stream:PFILE; x:Tarb_t):longint;cdecl;external;
{$endif}
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_midref(x : longint) : longint;
begin
  arb_midref:=@(x^.mid);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_radref(x : longint) : longint;
begin
  arb_radref:=@(x^.rad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARB_IS_LAGOM(x : longint) : longint;
begin
  ARB_IS_LAGOM:=(ARF_IS_LAGOM(arb_midref(x))) and (@(MAG_IS_LAGOM(arb_radref(x))));
end;

{ was #define dname def_expr }
function ARB_STR_MORE : longint; { return type might be wrong }
  begin
    ARB_STR_MORE:=UWORD(1);
  end;

{ was #define dname def_expr }
function ARB_STR_NO_RADIUS : longint; { return type might be wrong }
  begin
    ARB_STR_NO_RADIUS:=UWORD(2);
  end;

{ was #define dname def_expr }
function ARB_STR_CONDENSE : longint; { return type might be wrong }
  begin
    ARB_STR_CONDENSE:=UWORD(16);
  end;


end.
