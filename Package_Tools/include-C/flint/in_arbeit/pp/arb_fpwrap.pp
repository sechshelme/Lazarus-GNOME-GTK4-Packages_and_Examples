
unit arb_fpwrap;
interface

{
  Automatically converted by H2Pas 1.0.0 from arb_fpwrap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    arb_fpwrap.h
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
Pcomplex_double  = ^complex_double;
Pdouble  = ^double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2021 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ARB_FPWRAP_H}
{$define ARB_FPWRAP_H}

const
  FPWRAP_SUCCESS = 0;  
  FPWRAP_UNABLE = 1;  
  FPWRAP_ACCURATE_PARTS = 1;  
  FPWRAP_CORRECT_ROUNDING = 2;  
  FPWRAP_WORK_LIMIT = 65536;  
type
  Pcomplex_double = ^Tcomplex_double;
  Tcomplex_double = record
      real : Tdouble;
      imag : Tdouble;
    end;

function arb_fpwrap_double_exp(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_exp(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_expm1(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_expm1(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_log(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_log(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_log1p(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_log1p(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_pow(res:Pdouble; x:Tdouble; y:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_pow(res:Pcomplex_double; x:Tcomplex_double; y:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sqrt(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sqrt(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_rsqrt(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_rsqrt(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cbrt(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cbrt(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sin(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sin(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cos(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cos(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_tan(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_tan(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cot(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cot(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sec(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sec(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_csc(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_csc(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sinc(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sinc(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sin_pi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sin_pi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cos_pi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cos_pi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_tan_pi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_tan_pi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cot_pi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cot_pi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sinc_pi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sinc_pi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_asin(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_asin(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_acos(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_acos(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_atan(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_atan(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_atan2(res:Pdouble; x1:Tdouble; x2:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_asinh(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_asinh(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_acosh(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_acosh(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_atanh(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_atanh(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_lambertw(res:Pdouble; x:Tdouble; branch:Tslong; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_lambertw(res:Pcomplex_double; x:Tcomplex_double; branch:Tslong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_rising(res:Pdouble; x:Tdouble; n:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_rising(res:Pcomplex_double; x:Tcomplex_double; n:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_gamma(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_gamma(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_rgamma(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_rgamma(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_lgamma(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_lgamma(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_digamma(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_digamma(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_zeta(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_zeta(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hurwitz_zeta(res:Pdouble; s:Tdouble; z:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hurwitz_zeta(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_barnes_g(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_barnes_g(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_log_barnes_g(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_log_barnes_g(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_polygamma(res:Pdouble; s:Tdouble; z:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_polygamma(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_polylog(res:Pdouble; s:Tdouble; z:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_polylog(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_lerch_phi(res:Pdouble; z:Tdouble; s:Tdouble; a:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_lerch_phi(res:Pcomplex_double; z:Tcomplex_double; s:Tcomplex_double; a:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_dirichlet_eta(res:Pcomplex_double; s:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_riemann_xi(res:Pcomplex_double; s:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hardy_theta(res:Pcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hardy_z(res:Pcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_zeta_zero(res:Pcomplex_double; n:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_erf(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_erf(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_erfc(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_erfc(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_erfi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_erfi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_erfinv(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_erfcinv(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_fresnel_s(res:Pdouble; x:Tdouble; normalized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_fresnel_s(res:Pcomplex_double; x:Tcomplex_double; normalized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_fresnel_c(res:Pdouble; x:Tdouble; normalized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_fresnel_c(res:Pcomplex_double; x:Tcomplex_double; normalized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_gamma_upper(res:Pdouble; s:Tdouble; z:Tdouble; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_gamma_upper(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_gamma_lower(res:Pdouble; s:Tdouble; z:Tdouble; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_gamma_lower(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_beta_lower(res:Pdouble; a:Tdouble; b:Tdouble; z:Tdouble; regularized:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_beta_lower(res:Pcomplex_double; a:Tcomplex_double; b:Tcomplex_double; z:Tcomplex_double; regularized:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_exp_integral_e(res:Pdouble; s:Tdouble; z:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_exp_integral_e(res:Pcomplex_double; s:Tcomplex_double; z:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_exp_integral_ei(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_exp_integral_ei(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sin_integral(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sin_integral(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cos_integral(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cos_integral(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_sinh_integral(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_sinh_integral(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_cosh_integral(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_cosh_integral(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_log_integral(res:Pdouble; x:Tdouble; offset:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_log_integral(res:Pcomplex_double; x:Tcomplex_double; offset:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_dilog(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_dilog(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_bessel_j(res:Pdouble; nu:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_bessel_j(res:Pcomplex_double; nu:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_bessel_y(res:Pdouble; nu:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_bessel_y(res:Pcomplex_double; nu:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_bessel_i(res:Pdouble; nu:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_bessel_i(res:Pcomplex_double; nu:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_bessel_k(res:Pdouble; nu:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_bessel_k(res:Pcomplex_double; nu:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_bessel_k_scaled(res:Pdouble; nu:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_bessel_k_scaled(res:Pcomplex_double; nu:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_ai(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_airy_ai(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_ai_prime(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_airy_ai_prime(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_bi(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_airy_bi(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_bi_prime(res:Pdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_airy_bi_prime(res:Pcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_ai_zero(res:Pdouble; n:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_ai_prime_zero(res:Pdouble; n:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_bi_zero(res:Pdouble; n:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_airy_bi_prime_zero(res:Pdouble; n:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_coulomb_f(res:Pdouble; l:Tdouble; eta:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_coulomb_f(res:Pcomplex_double; l:Tcomplex_double; eta:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_coulomb_g(res:Pdouble; l:Tdouble; eta:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_coulomb_g(res:Pcomplex_double; l:Tcomplex_double; eta:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_coulomb_hpos(res:Pcomplex_double; l:Tcomplex_double; eta:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_coulomb_hneg(res:Pcomplex_double; l:Tcomplex_double; eta:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_chebyshev_t(res:Pdouble; n:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_chebyshev_t(res:Pcomplex_double; n:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_chebyshev_u(res:Pdouble; n:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_chebyshev_u(res:Pcomplex_double; n:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_jacobi_p(res:Pdouble; n:Tdouble; a:Tdouble; b:Tdouble; x:Tdouble; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_jacobi_p(res:Pcomplex_double; n:Tcomplex_double; a:Tcomplex_double; b:Tcomplex_double; x:Tcomplex_double; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_gegenbauer_c(res:Pdouble; n:Tdouble; m:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_gegenbauer_c(res:Pcomplex_double; n:Tcomplex_double; m:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_laguerre_l(res:Pdouble; n:Tdouble; m:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_laguerre_l(res:Pcomplex_double; n:Tcomplex_double; m:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hermite_h(res:Pdouble; n:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hermite_h(res:Pcomplex_double; n:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_legendre_p(res:Pdouble; n:Tdouble; m:Tdouble; x:Tdouble; _type:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_legendre_p(res:Pcomplex_double; n:Tcomplex_double; m:Tcomplex_double; x:Tcomplex_double; _type:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_legendre_q(res:Pdouble; n:Tdouble; m:Tdouble; x:Tdouble; _type:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_legendre_q(res:Pcomplex_double; n:Tcomplex_double; m:Tcomplex_double; x:Tcomplex_double; _type:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_legendre_root(res1:Pdouble; res2:Pdouble; n:Tulong; k:Tulong; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_spherical_y(res:Pcomplex_double; n:Tslong; m:Tslong; x1:Tcomplex_double; x2:Tcomplex_double; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hypgeom_0f1(res:Pdouble; a:Tdouble; x:Tdouble; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hypgeom_0f1(res:Pcomplex_double; a:Tcomplex_double; x:Tcomplex_double; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hypgeom_1f1(res:Pdouble; a:Tdouble; b:Tdouble; x:Tdouble; regularized:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hypgeom_1f1(res:Pcomplex_double; a:Tcomplex_double; b:Tcomplex_double; x:Tcomplex_double; regularized:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hypgeom_u(res:Pdouble; a:Tdouble; b:Tdouble; x:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hypgeom_u(res:Pcomplex_double; a:Tcomplex_double; b:Tcomplex_double; x:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_hypgeom_2f1(res:Pdouble; a:Tdouble; b:Tdouble; c:Tdouble; x:Tdouble; 
           regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_hypgeom_2f1(res:Pcomplex_double; a:Tcomplex_double; b:Tcomplex_double; c:Tcomplex_double; x:Tcomplex_double; 
           regularized:longint; flags:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_fpwrap_double_hypgeom_pfq(res:Pdouble; a:Pdouble; p:Tslong; b:Pdouble; q:Tslong; 
           z:Tdouble; regularized:longint; flags:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arb_fpwrap_cdouble_hypgeom_pfq(res:Pcomplex_double; a:Pcomplex_double; p:Tslong; b:Pcomplex_double; q:Tslong; 
           z:Tcomplex_double; regularized:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_double_agm(res:Pdouble; x:Tdouble; y:Tdouble; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_agm(res:Pcomplex_double; x:Tcomplex_double; y:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_k(res:Pcomplex_double; m:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_e(res:Pcomplex_double; m:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_pi(res:Pcomplex_double; n:Tcomplex_double; m:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_f(res:Pcomplex_double; phi:Tcomplex_double; m:Tcomplex_double; pi:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_e_inc(res:Pcomplex_double; phi:Tcomplex_double; m:Tcomplex_double; pi:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_pi_inc(res:Pcomplex_double; n:Tcomplex_double; phi:Tcomplex_double; m:Tcomplex_double; pi:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_rf(res:Pcomplex_double; x:Tcomplex_double; y:Tcomplex_double; z:Tcomplex_double; option:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_rg(res:Pcomplex_double; x:Tcomplex_double; y:Tcomplex_double; z:Tcomplex_double; option:longint; 
           flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_rj(res:Pcomplex_double; x:Tcomplex_double; y:Tcomplex_double; z:Tcomplex_double; w:Tcomplex_double; 
           option:longint; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_p(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_p_prime(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_inv_p(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_zeta(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_elliptic_sigma(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_jacobi_theta_1(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_jacobi_theta_2(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_jacobi_theta_3(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_jacobi_theta_4(res:Pcomplex_double; z:Tcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_dedekind_eta(res:Pcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_modular_j(res:Pcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_modular_lambda(res:Pcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
function arb_fpwrap_cdouble_modular_delta(res:Pcomplex_double; tau:Tcomplex_double; flags:longint):longint;cdecl;external;
{$endif}

implementation


end.
