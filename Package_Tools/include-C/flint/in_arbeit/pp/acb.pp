
unit acb;
interface

{
  Automatically converted by H2Pas 1.0.0 from acb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    acb.h
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
PFILE  = ^FILE;
Pfmpz  = ^fmpz;
Pslong  = ^slong;
Pulong  = ^ulong;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }

procedure acb_init(x:Tacb_t);cdecl;external;
procedure acb_clear(x:Tacb_t);cdecl;external;
function _acb_vec_init(n:Tslong):Tacb_ptr;cdecl;external;
procedure _acb_vec_clear(v:Tacb_ptr; n:Tslong);cdecl;external;
function acb_real_ptr(z:Tacb_t):Tarb_ptr;cdecl;external;
function acb_imag_ptr(z:Tacb_t):Tarb_ptr;cdecl;external;
(* Const before type ignored *)
procedure acb_get_real(re:Tarb_t; z:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_get_imag(im:Tarb_t; z:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_get_mid(res:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
function acb_is_zero(z:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_is_one(z:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_is_exact(z:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_is_int(z:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_is_int_2exp_si(z:Tacb_t; e:Tslong):longint;cdecl;external;
procedure acb_zero(z:Tacb_t);cdecl;external;
procedure acb_one(z:Tacb_t);cdecl;external;
procedure acb_onei(z:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_set(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_set_round(z:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_neg_round(z:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
procedure acb_swap(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_equal(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_equal_si(x:Tacb_t; y:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_eq(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_ne(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_overlaps(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_contains_zero(x:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_contains_fmpq(x:Tacb_t; y:Tfmpq_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_contains_fmpz(x:Tacb_t; y:Tfmpz_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_contains(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_contains_interior(x:Tacb_t; y:Tacb_t):longint;cdecl;external;
procedure acb_set_ui(z:Tacb_t; c:Tulong);cdecl;external;
procedure acb_set_d(z:Tacb_t; c:Tdouble);cdecl;external;
procedure acb_set_si(z:Tacb_t; c:Tslong);cdecl;external;
procedure acb_set_si_si(z:Tacb_t; x:Tslong; y:Tslong);cdecl;external;
procedure acb_set_d_d(z:Tacb_t; x:Tdouble; y:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure acb_set_fmpz(z:Tacb_t; c:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_set_fmpz_fmpz(z:Tacb_t; x:Tfmpz_t; y:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure acb_set_round_fmpz(z:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_contains_int(x:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_get_unique_fmpz(z:Tfmpz_t; x:Tacb_t):longint;cdecl;external;
(* Const before type ignored *)
procedure acb_set_fmpq(z:Tacb_t; c:Tfmpq_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_set_arb(z:Tacb_t; c:Tarb_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_set_arb_arb(z:Tacb_t; x:Tarb_t; y:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_set_round_arb(z:Tacb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_trim(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_add_error_arf(x:Tacb_t; err:Tarf_t);cdecl;external;
(* Const before type ignored *)
procedure acb_add_error_mag(x:Tacb_t; err:Tmag_t);cdecl;external;
(* Const before type ignored *)
procedure acb_add_error_arb(x:Tacb_t; err:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_get_mag(z:Tmag_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_get_mag_lower(z:Tmag_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_get_abs_ubound_arf(u:Tarf_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_get_abs_lbound_arf(u:Tarf_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_get_rad_ubound_arf(u:Tarf_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_union(res:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_arg(r:Tarb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sgn(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_csgn(res:Tarb_t; z:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_real_abs(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_real_sgn(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_real_heaviside(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_real_floor(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_real_ceil(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_real_max(res:Tacb_t; x:Tacb_t; y:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_real_min(res:Tacb_t; x:Tacb_t; y:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_real_sqrtpos(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sqrt_analytic(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rsqrt_analytic(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_log_analytic(res:Tacb_t; z:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_pow_analytic(res:Tacb_t; z:Tacb_t; w:Tacb_t; analytic:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_add(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_sub(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_add_si(z:Tacb_t; x:Tacb_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_add_ui(z:Tacb_t; x:Tacb_t; c:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sub_si(z:Tacb_t; x:Tacb_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sub_ui(z:Tacb_t; x:Tacb_t; c:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_add_fmpz(z:Tacb_t; x:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_add_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_sub_fmpz(z:Tacb_t; x:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_sub_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_neg(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_conj(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_abs(u:Tarb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mul_ui(z:Tacb_t; x:Tacb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mul_si(z:Tacb_t; x:Tacb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mul_fmpz(z:Tacb_t; x:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mul_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mul_onei(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_div_onei(z:Tacb_t; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mul(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mul_naive(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mul_2exp_si(z:Tacb_t; x:Tacb_t; e:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mul_2exp_fmpz(z:Tacb_t; x:Tacb_t; c:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_addmul(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_submul(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_addmul_ui(z:Tacb_t; x:Tacb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_addmul_si(z:Tacb_t; x:Tacb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_submul_ui(z:Tacb_t; x:Tacb_t; y:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_submul_si(z:Tacb_t; x:Tacb_t; y:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_addmul_fmpz(z:Tacb_t; x:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_submul_fmpz(z:Tacb_t; x:Tacb_t; y:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_addmul_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_submul_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dot_simple(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Tacb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dot_precise(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Tacb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dot(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Tacb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_approx_dot(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Tacb_srcptr; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dot_ui(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dot_si(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Pslong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dot_uiui(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dot_siui(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Pulong; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dot_fmpz(res:Tacb_t; initial:Tacb_t; subtract:longint; x:Tacb_srcptr; xstep:Tslong; 
            y:Pfmpz; ystep:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_inv(z:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_div(z:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_div_ui(z:Tacb_t; x:Tacb_t; c:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_div_si(z:Tacb_t; x:Tacb_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_div_arb(z:Tacb_t; x:Tacb_t; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_div_fmpz(z:Tacb_t; x:Tacb_t; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cube(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_pow_fmpz(y:Tacb_t; b:Tacb_t; e:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_pow_ui(y:Tacb_t; b:Tacb_t; e:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_pow_si(y:Tacb_t; b:Tacb_t; e:Tslong; prec:Tslong);cdecl;external;
procedure acb_const_pi(x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_log(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_log1p(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_exp(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_exp_pi_i(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_exp_invexp(r:Tacb_t; s:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_expm1(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sin(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cos(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sin_cos(s:Tacb_t; c:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_tan(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cot(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_asin(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_acos(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_atan(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_asinh(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_acosh(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_atanh(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sinh(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cosh(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sinh_cosh(y:Tacb_t; z:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_tanh(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_coth(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sech(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_csch(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sec(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_csc(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sin_pi(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cos_pi(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sin_cos_pi(s:Tacb_t; c:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_tan_pi(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_cot_pi(r:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_csc_pi(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sinc(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sinc_pi(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_pow_arb(z:Tacb_t; x:Tacb_t; y:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_pow(r:Tacb_t; x:Tacb_t; y:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sqrt(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rsqrt(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_root_ui(y:Tacb_t; x:Tacb_t; k:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_quadratic_roots_fmpz(r1:Tacb_t; r2:Tacb_t; a:Tfmpz_t; b:Tfmpz_t; c:Tfmpz_t; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_chebyshev_t_ui(a:Tacb_t; n:Tulong; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_chebyshev_t2_ui(a:Tacb_t; b:Tacb_t; n:Tulong; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_chebyshev_u_ui(a:Tacb_t; n:Tulong; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_chebyshev_u2_ui(a:Tacb_t; b:Tacb_t; n:Tulong; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rising_ui(z:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_rising(z:Tacb_t; x:Tacb_t; n:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rising2_ui(u:Tacb_t; v:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rising_ui_get_mag(bound:Tmag_t; s:Tacb_t; n:Tulong);cdecl;external;
(* Const before type ignored *)
procedure acb_gamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_rgamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_lgamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_log_sin_pi(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_digamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_zeta(z:Tacb_t; s:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_hurwitz_zeta(z:Tacb_t; s:Tacb_t; a:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_polygamma(res:Tacb_t; s:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_bernoulli_poly_ui(res:Tacb_t; n:Tulong; x:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_log_barnes_g(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_barnes_g(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_polylog(w:Tacb_t; s:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_polylog_si(w:Tacb_t; s:Tslong; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_agm1(m:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_agm1_cpx(m:Tacb_ptr; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_agm(res:Tacb_t; a:Tacb_t; b:Tacb_t; prec:Tslong);cdecl;external;
const
  ACB_LAMBERTW_LEFT = 2;  
  ACB_LAMBERTW_MIDDLE = 4;  
(* Const before type ignored *)
(* Const before type ignored *)

procedure acb_lambertw_asymp(res:Tacb_t; z:Tacb_t; k:Tfmpz_t; L:Tslong; M:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_lambertw_check_branch(w:Tacb_t; k:Tfmpz_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_lambertw_bound_deriv(res:Tmag_t; z:Tacb_t; ez1:Tacb_t; k:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_lambertw(res:Tacb_t; z:Tacb_t; k:Tfmpz_t; flags:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_sqr(res:Tacb_t; val:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_is_finite(x:Tacb_t):longint;cdecl;external;
procedure acb_indeterminate(x:Tacb_t);cdecl;external;
function _acb_vec_entry_ptr(vec:Tacb_ptr; i:Tslong):Tacb_ptr;cdecl;external;
procedure _acb_vec_zero(A:Tacb_ptr; n:Tslong);cdecl;external;
function _acb_vec_is_zero(vec:Tacb_srcptr; len:Tslong):longint;cdecl;external;
procedure _acb_vec_set(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong);cdecl;external;
procedure _acb_vec_set_round(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external;
procedure _acb_vec_swap(res:Tacb_ptr; vec:Tacb_ptr; len:Tslong);cdecl;external;
procedure _acb_vec_neg(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong);cdecl;external;
procedure _acb_vec_add(res:Tacb_ptr; vec1:Tacb_srcptr; vec2:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external;
procedure _acb_vec_sub(res:Tacb_ptr; vec1:Tacb_srcptr; vec2:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_submul(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_addmul(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_mul(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tacb_t; prec:Tslong);cdecl;external;
procedure _acb_vec_scalar_mul_ui(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tulong; prec:Tslong);cdecl;external;
procedure _acb_vec_scalar_mul_2exp_si(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tslong);cdecl;external;
procedure _acb_vec_scalar_mul_onei(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong);cdecl;external;
procedure _acb_vec_scalar_div_ui(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_div(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_mul_arb(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_div_arb(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_mul_fmpz(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_scalar_div_fmpz(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_fprint(file:PFILE; x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_fprintd(file:PFILE; z:Tacb_t; digits:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_fprintn(fp:PFILE; z:Tacb_t; digits:Tslong; flags:Tulong);cdecl;external;
(* Const before type ignored *)
procedure acb_print(x:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_printd(z:Tacb_t; digits:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_printn(x:Tacb_t; digits:Tslong; flags:Tulong);cdecl;external;
procedure _acb_vec_printn(vec:Tacb_srcptr; len:Tslong; ndigits:Tslong; flags:Tulong);cdecl;external;
procedure acb_randtest(z:Tacb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure acb_randtest_special(z:Tacb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure acb_randtest_precise(z:Tacb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure acb_randtest_param(z:Tacb_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_rel_error_bits(x:Tacb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_rel_accuracy_bits(x:Tacb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_rel_one_accuracy_bits(x:Tacb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_bits(x:Tacb_t):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_is_real(x:Tacb_t):longint;cdecl;external;
function _acb_vec_is_real(v:Tacb_srcptr; len:Tslong):longint;cdecl;external;
function _acb_vec_is_finite(vec:Tacb_srcptr; len:Tslong):longint;cdecl;external;
function _acb_vec_bits(vec:Tacb_srcptr; len:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
procedure _acb_vec_set_powers(xs:Tacb_ptr; x:Tacb_t; len:Tslong; prec:Tslong);cdecl;external;
procedure _acb_vec_add_error_arf_vec(res:Tacb_ptr; err:Tarf_srcptr; len:Tslong);cdecl;external;
procedure _acb_vec_add_error_mag_vec(res:Tacb_ptr; err:Tmag_srcptr; len:Tslong);cdecl;external;
procedure _acb_vec_indeterminate(vec:Tacb_ptr; len:Tslong);cdecl;external;
procedure _acb_vec_trim(res:Tacb_ptr; vec:Tacb_srcptr; len:Tslong);cdecl;external;
function _acb_vec_get_unique_fmpz_vec(res:Pfmpz; vec:Tacb_srcptr; len:Tslong):longint;cdecl;external;
{ sort complex numbers in a nice-to-display order  }
procedure _acb_vec_sort_pretty(vec:Tacb_ptr; len:Tslong);cdecl;external;
{ roots of unity  }
procedure acb_unit_root(res:Tacb_t; order:Tulong; prec:Tslong);cdecl;external;
procedure _acb_vec_unit_roots(z:Tacb_ptr; order:Tslong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_allocated_bytes(x:Tacb_t):Tslong;cdecl;external;
function _acb_vec_allocated_bytes(vec:Tacb_srcptr; len:Tslong):Tslong;cdecl;external;
function _acb_vec_estimate_allocated_bytes(len:Tslong; prec:Tslong):Tdouble;cdecl;external;

implementation


end.
