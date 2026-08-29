unit arb_hypgeom;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2016 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ARB_HYPGEOM_H}
{$define ARB_HYPGEOM_H}
{$include "arb.h"}
{ C++ extern C conditionnal removed }

procedure _arb_hypgeom_rising_coeffs_1(c:Pulong; k:Tulong; l:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_rising_coeffs_2(c:Pulong; k:Tulong; l:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_rising_coeffs_fmpz(c:Pfmpz; k:Tulong; l:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_forward(res:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_rs(res:Tarb_t; x:Tarb_t; n:Tulong; m:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_bs(res:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_rec(res:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui(y:Tarb_t; x:Tarb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising(y:Tarb_t; x:Tarb_t; n:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_jet_powsum(res:Tarb_ptr; x:Tarb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_jet_rs(res:Tarb_ptr; x:Tarb_t; n:Tulong; m:Tulong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_jet_bs(res:Tarb_ptr; x:Tarb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rising_ui_jet(res:Tarb_ptr; x:Tarb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_gamma_stirling_term_bounds(bound:Pslong; zinv:Tmag_t; N:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_stirling_sum_horner(s:Tarb_t; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_stirling_sum_improved(s:Tarb_t; z:Tarb_t; N:Tslong; K:Tslong; prec:Tslong);cdecl;external libflint;
const
  ARB_HYPGEOM_GAMMA_TAB_NUM = 536;  
  ARB_HYPGEOM_GAMMA_TAB_PREC = 3456;  
type
  Parb_hypgeom_gamma_coeff_t = ^Tarb_hypgeom_gamma_coeff_t;
  Tarb_hypgeom_gamma_coeff_t = record
      exp : smallint;
      tab_pos : smallint;
      nlimbs : char;
      negative : char;
    end;
  var
    arb_hypgeom_gamma_coeffs : array[0..(ARB_HYPGEOM_GAMMA_TAB_NUM)-1] of Tarb_hypgeom_gamma_coeff_t;cvar;external libflint;

function _arb_hypgeom_gamma_coeff_shallow(c:Tarf_t; err:Tmag_t; i:Tslong; prec:Tslong):longint;cdecl;external libflint;
procedure arb_hypgeom_gamma_stirling(res:Tarb_t; x:Tarb_t; reciprocal:longint; prec:Tslong);cdecl;external libflint;
function arb_hypgeom_gamma_taylor(res:Tarb_t; x:Tarb_t; reciprocal:longint; prec:Tslong):longint;cdecl;external libflint;
procedure arb_hypgeom_gamma(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_rgamma(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_lgamma(y:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_fmpq(y:Tarb_t; x:Tfmpq_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_fmpz(y:Tarb_t; x:Tfmpz_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_pfq(res:Tarb_t; a:Tarb_srcptr; p:Tslong; b:Tarb_srcptr; q:Tslong; 
            z:Tarb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_0f1(res:Tarb_t; a:Tarb_t; z:Tarb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_m(res:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_1f1(res:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_u(res:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_2f1(res:Tarb_t; a:Tarb_t; b:Tarb_t; c:Tarb_t; z:Tarb_t; 
            regularized:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_1f1_integration(res:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_u_integration(res:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_2f1_integration(res:Tarb_t; a:Tarb_t; b:Tarb_t; c:Tarb_t; z:Tarb_t; 
            regularized:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erf(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_erf_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erf_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfc(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_erfc_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfc_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfi(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_erfi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfi_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfinv(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_erfcinv(res:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_fresnel(res1:Tarb_t; res2:Tarb_t; z:Tarb_t; normalized:longint; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_fresnel_series(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; normalized:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_fresnel_series(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; normalized:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_ei(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_ei_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_ei_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_si_asymp(res:Tarb_t; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_si_1f2(res:Tarb_t; z:Tarb_t; N:Tslong; wp:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_si(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_si_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_si_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_ci_asymp(res:Tarb_t; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_ci_2f3(res:Tarb_t; z:Tarb_t; N:Tslong; wp:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_ci(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_ci_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_ci_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_shi(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_shi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_shi_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_chi(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_chi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_chi_series(g:Tarb_poly_t; h:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_li(res:Tarb_t; z:Tarb_t; offset:longint; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_li_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; offset:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_li_series(g:Tarb_poly_t; h:Tarb_poly_t; offset:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_j(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_y(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_jy(res1:Tarb_t; res2:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_i(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_k(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_i_scaled(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_k_scaled(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_i_integration(res:Tarb_t; nu:Tarb_t; z:Tarb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_bessel_k_integration(res:Tarb_t; nu:Tarb_t; z:Tarb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_airy(ai:Tarb_t; aip:Tarb_t; bi:Tarb_t; bip:Tarb_t; z:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_airy_jet(ai:Tarb_ptr; bi:Tarb_ptr; z:Tarb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_airy_series(ai:Tarb_poly_t; ai_prime:Tarb_poly_t; bi:Tarb_poly_t; bi_prime:Tarb_poly_t; z:Tarb_poly_t; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_airy_series(ai:Tarb_ptr; ai_prime:Tarb_ptr; bi:Tarb_ptr; bi_prime:Tarb_ptr; z:Tarb_srcptr; 
            zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_airy_zero(ai:Tarb_t; aip:Tarb_t; bi:Tarb_t; bip:Tarb_t; n:Tfmpz_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_coulomb(F:Tarb_t; G:Tarb_t; l:Tarb_t; eta:Tarb_t; z:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_coulomb_jet(F:Tarb_ptr; G:Tarb_ptr; l:Tarb_t; eta:Tarb_t; z:Tarb_t; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_coulomb_series(F:Tarb_ptr; G:Tarb_ptr; l:Tarb_t; eta:Tarb_t; z:Tarb_srcptr; 
            zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_coulomb_series(F:Tarb_poly_t; G:Tarb_poly_t; l:Tarb_t; eta:Tarb_t; z:Tarb_poly_t; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_expint(res:Tarb_t; s:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_lower(res:Tarb_t; s:Tarb_t; z:Tarb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_gamma_lower_series(g:Tarb_ptr; s:Tarb_t; h:Tarb_srcptr; hlen:Tslong; regularized:longint; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_lower_series(g:Tarb_poly_t; s:Tarb_t; h:Tarb_poly_t; regularized:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_upper(res:Tarb_t; s:Tarb_t; z:Tarb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_gamma_upper_series(g:Tarb_ptr; s:Tarb_t; h:Tarb_srcptr; hlen:Tslong; regularized:longint; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_upper_series(g:Tarb_poly_t; s:Tarb_t; h:Tarb_poly_t; regularized:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gamma_upper_integration(res:Tarb_t; s:Tarb_t; z:Tarb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_beta_lower(res:Tarb_t; a:Tarb_t; c:Tarb_t; z:Tarb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_beta_lower_series(res:Tarb_poly_t; a:Tarb_t; b:Tarb_t; z:Tarb_poly_t; regularized:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_beta_lower_series(res:Tarb_ptr; a:Tarb_t; b:Tarb_t; z:Tarb_srcptr; zlen:Tslong; 
            regularized:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_chebyshev_t(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_chebyshev_u(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_jacobi_p(res:Tarb_t; n:Tarb_t; a:Tarb_t; b:Tarb_t; z:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_gegenbauer_c(res:Tarb_t; n:Tarb_t; m:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_laguerre_l(res:Tarb_t; n:Tarb_t; m:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_hermite_h(res:Tarb_t; nu:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p(res:Tarb_t; n:Tarb_t; m:Tarb_t; z:Tarb_t; _type:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_q(res:Tarb_t; n:Tarb_t; m:Tarb_t; z:Tarb_t; _type:longint; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_deriv_bound(dp:Tmag_t; dp2:Tmag_t; n:Tulong; x:Tarb_t; x2sub1:Tarb_t);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_rec(res:Tarb_t; res_prime:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_asymp(res:Tarb_t; res2:Tarb_t; n:Tulong; x:Tarb_t; K:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_one(res:Tarb_t; res2:Tarb_t; n:Tulong; x:Tarb_t; K:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_zero(res:Tarb_t; res2:Tarb_t; n:Tulong; x:Tarb_t; K:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui(res:Tarb_t; res_prime:Tarb_t; n:Tulong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_legendre_p_ui_root(res:Tarb_t; weight:Tarb_t; n:Tulong; k:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_central_bin_ui(res:Tarb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_dilog(res:Tarb_t; z:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_gamma_lower_sum_rs_1(res:Tarb_t; p:Tulong; q:Tulong; z:Tarb_t; N:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_hypgeom_gamma_upper_sum_rs_1(res:Tarb_t; p:Tulong; q:Tulong; z:Tarb_t; N:Tslong; 
            prec:Tslong);cdecl;external libflint;
function _arb_hypgeom_gamma_upper_fmpq_inf_choose_N(err:Tmag_t; a:Tfmpq_t; z:Tarb_t; abs_tol:Tmag_t):Tslong;cdecl;external libflint;
procedure _arb_hypgeom_gamma_upper_fmpq_inf_bsplit(res:Tarb_t; a:Tfmpq_t; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
function _arb_hypgeom_gamma_lower_fmpq_0_choose_N(err:Tmag_t; a:Tfmpq_t; z:Tarb_t; abs_tol:Tmag_t):Tslong;cdecl;external libflint;
procedure _arb_hypgeom_gamma_lower_fmpq_0_bsplit(res:Tarb_t; a:Tfmpq_t; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_gamma_upper_fmpq_step_bsplit(Gz1:Tarb_t; a:Tfmpq_t; z0:Tarb_t; z1:Tarb_t; Gz0:Tarb_t; 
            expmz0:Tarb_t; abs_tol:Tmag_t; prec:Tslong);cdecl;external libflint;
function _arb_hypgeom_gamma_upper_singular_si_choose_N(err:Tmag_t; n:Tslong; z:Tarb_t; abs_tol:Tmag_t):Tslong;cdecl;external libflint;
procedure _arb_hypgeom_gamma_upper_singular_si_bsplit(res:Tarb_t; n:Tslong; z:Tarb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
function arb_hypgeom_erf_bb(res:Tarb_t; z:Tarb_t; complementary:longint; prec:Tslong):longint;cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_arb_forward(res:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; blen:Tslong; 
            z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_arb_rs(res:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; blen:Tslong; 
            z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_arb_bs(res:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; blen:Tslong; 
            z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_arb(res:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; blen:Tslong; 
            z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_imag_arb_forward(res1:Tarb_t; res2:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; 
            blen:Tslong; z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_imag_arb_rs(res1:Tarb_t; res2:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; 
            blen:Tslong; z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_imag_arb_bs(res_real:Tarb_t; res_imag:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; 
            blen:Tslong; z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_hypgeom_sum_fmpq_imag_arb(res1:Tarb_t; res2:Tarb_t; a:Pfmpq; alen:Tslong; b:Pfmpq; 
            blen:Tslong; z:Tarb_t; reciprocal:longint; N:Tslong; prec:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 17:30:45 ===


implementation



end.
