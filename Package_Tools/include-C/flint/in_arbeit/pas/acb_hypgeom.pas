unit acb_hypgeom;

interface

uses
  fp_flint;

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
{$ifndef ACB_HYPGEOM_H}
{$define ACB_HYPGEOM_H}
{$include "acb_types.h"}
{ C++ extern C conditionnal removed }

procedure acb_hypgeom_rising_ui_forward(res:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_rs(res:Tacb_t; x:Tacb_t; n:Tulong; m:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_bs(res:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_rec(res:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui(y:Tacb_t; x:Tacb_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising(y:Tacb_t; x:Tacb_t; n:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_jet_powsum(res:Tacb_ptr; x:Tacb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_jet_rs(res:Tacb_ptr; x:Tacb_t; n:Tulong; m:Tulong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_jet_bs(res:Tacb_ptr; x:Tacb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rising_ui_jet(res:Tacb_ptr; x:Tacb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_log_rising_ui_jet(res:Tacb_ptr; z:Tacb_t; r:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_log_rising_ui(res:Tacb_ptr; z:Tacb_t; r:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_stirling_sum_horner(s:Tacb_t; z:Tacb_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_stirling_sum_improved(s:Tacb_t; z:Tacb_t; N:Tslong; K:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_stirling(res:Tacb_t; x:Tacb_t; reciprocal:longint; prec:Tslong);cdecl;external libflint;
function acb_hypgeom_gamma_taylor(res:Tacb_t; x:Tacb_t; reciprocal:longint; prec:Tslong):longint;cdecl;external libflint;
procedure acb_hypgeom_gamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_rgamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_lgamma(y:Tacb_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_bound_factor(C:Tmag_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; q:Tslong; 
            z:Tacb_t; n:Tulong);cdecl;external libflint;
function acb_hypgeom_pfq_choose_n(a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; q:Tslong; z:Tacb_t; 
           prec:Tslong):Tslong;cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_forward(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_rs(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_bs(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_fme(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_bs_invz(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_sum_invz(s:Tacb_t; t:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; 
            q:Tslong; z:Tacb_t; zinv:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_direct(res:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; q:Tslong; 
            z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
function acb_hypgeom_pfq_series_choose_n(a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; q:Tslong; z:Tacb_poly_t; 
           len:Tslong; prec:Tslong):Tslong;cdecl;external libflint;
procedure acb_hypgeom_pfq_series_sum_forward(s:Tacb_poly_t; t:Tacb_poly_t; a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; 
            q:Tslong; z:Tacb_poly_t; regularized:longint; n:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_series_sum_bs(s:Tacb_poly_t; t:Tacb_poly_t; a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; 
            q:Tslong; z:Tacb_poly_t; regularized:longint; n:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_series_sum_rs(s:Tacb_poly_t; t:Tacb_poly_t; a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; 
            q:Tslong; z:Tacb_poly_t; regularized:longint; n:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_series_sum(s:Tacb_poly_t; t:Tacb_poly_t; a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; 
            q:Tslong; z:Tacb_poly_t; regularized:longint; n:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq_series_direct(res:Tacb_poly_t; a:Pacb_poly_struct; p:Tslong; b:Pacb_poly_struct; q:Tslong; 
            z:Tacb_poly_t; regularized:longint; n:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_pfq(res:Tacb_t; a:Tacb_srcptr; p:Tslong; b:Tacb_srcptr; q:Tslong; 
            z:Tacb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_u_asymp(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_u_1f1_series(res:Tacb_poly_t; a:Tacb_poly_t; b:Tacb_poly_t; z:Tacb_poly_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_u_1f1(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_u(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
function acb_hypgeom_u_use_asymp(z:Tacb_t; prec:Tslong):longint;cdecl;external libflint;
procedure acb_hypgeom_m_asymp(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_m_1f1(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_m(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_1f1(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_j_0f1(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_j_asymp(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_j(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_i_0f1(res:Tacb_t; nu:Tacb_t; z:Tacb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_i_asymp(res:Tacb_t; nu:Tacb_t; z:Tacb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_i(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_i_scaled(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_k_0f1(res:Tacb_t; nu:Tacb_t; z:Tacb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_k_0f1_series(res:Tacb_poly_t; n:Tacb_poly_t; z:Tacb_poly_t; scaled:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_k_asymp(res:Tacb_t; nu:Tacb_t; z:Tacb_t; scaled:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_k(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_k_scaled(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_y(res:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_bessel_jy(res1:Tacb_t; res2:Tacb_t; nu:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_0f1_asymp(res:Tacb_t; a:Tacb_t; z:Tacb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_0f1_direct(res:Tacb_t; a:Tacb_t; z:Tacb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_0f1(res:Tacb_t; a:Tacb_t; z:Tacb_t; regularized:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_airy_bound(ai:Tmag_t; aip:Tmag_t; bi:Tmag_t; bip:Tmag_t; z:Tacb_t);cdecl;external libflint;
procedure acb_hypgeom_airy_asymp(ai:Tacb_t; aip:Tacb_t; bi:Tacb_t; bip:Tacb_t; z:Tacb_t; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_airy_direct(ai:Tacb_t; aip:Tacb_t; bi:Tacb_t; bip:Tacb_t; z:Tacb_t; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_airy(ai:Tacb_t; aip:Tacb_t; bi:Tacb_t; bip:Tacb_t; z:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_airy_jet(ai:Tacb_ptr; bi:Tacb_ptr; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_airy_series(ai:Tacb_ptr; ai_prime:Tacb_ptr; bi:Tacb_ptr; bi_prime:Tacb_ptr; z:Tacb_srcptr; 
            zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_airy_series(ai:Tacb_poly_t; ai_prime:Tacb_poly_t; bi:Tacb_poly_t; bi_prime:Tacb_poly_t; z:Tacb_poly_t; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_coulomb(F:Tacb_t; G:Tacb_t; Hpos:Tacb_t; Hneg:Tacb_t; l:Tacb_t; 
            eta:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_coulomb_jet(F:Tacb_ptr; G:Tacb_ptr; Hpos:Tacb_ptr; Hneg:Tacb_ptr; l:Tacb_t; 
            eta:Tacb_t; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_coulomb_series(F:Tacb_ptr; G:Tacb_ptr; Hpos:Tacb_ptr; Hneg:Tacb_ptr; l:Tacb_t; 
            eta:Tacb_t; z:Tacb_srcptr; zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_coulomb_series(F:Tacb_poly_t; G:Tacb_poly_t; Hpos:Tacb_poly_t; Hneg:Tacb_poly_t; l:Tacb_t; 
            eta:Tacb_t; z:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper_asymp(res:Tacb_t; s:Tacb_t; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper_1f1a(res:Tacb_t; s:Tacb_t; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper_1f1b(res:Tacb_t; s:Tacb_t; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper_singular(res:Tacb_t; s:Tslong; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper(res:Tacb_t; s:Tacb_t; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_gamma_upper_series(g:Tacb_ptr; s:Tacb_t; h:Tacb_srcptr; hlen:Tslong; regularized:longint; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_upper_series(g:Tacb_poly_t; s:Tacb_t; h:Tacb_poly_t; regularized:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_lower(res:Tacb_t; s:Tacb_t; z:Tacb_t; modified:longint; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_gamma_lower_series(g:Tacb_ptr; s:Tacb_t; h:Tacb_srcptr; hlen:Tslong; regularized:longint; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gamma_lower_series(g:Tacb_poly_t; s:Tacb_t; h:Tacb_poly_t; regularized:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_beta_lower(res:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; regularized:longint; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_beta_lower_series(res:Tacb_ptr; a:Tacb_t; b:Tacb_t; z:Tacb_srcptr; zlen:Tslong; 
            regularized:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_beta_lower_series(res:Tacb_poly_t; a:Tacb_t; b:Tacb_t; z:Tacb_poly_t; regularized:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_expint(res:Tacb_t; s:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erf_propagated_error(re:Tmag_t; im:Tmag_t; z:Tacb_t);cdecl;external libflint;
procedure acb_hypgeom_erf_1f1a(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erf_1f1b(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erf_asymp(res:Tacb_t; z:Tacb_t; complementary:longint; prec:Tslong; prec2:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erf(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_erf_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erf_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erfc(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_erfc_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erfc_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erfi(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_erfi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_erfi_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_fresnel(res1:Tacb_t; res2:Tacb_t; z:Tacb_t; normalized:longint; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_fresnel_series(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; normalized:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_fresnel_series(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; normalized:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ei_asymp(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ei_2f2(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ei(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_ei_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ei_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_si_asymp(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_si_1f2(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_si(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_si_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_si_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ci_asymp(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ci_2f3(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ci(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_ci_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_ci_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_shi(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_shi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_shi_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chi_asymp(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chi_2f3(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chi(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_chi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chi_series(g:Tacb_poly_t; h:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_li(res:Tacb_t; z:Tacb_t; offset:longint; prec:Tslong);cdecl;external libflint;
procedure _acb_hypgeom_li_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; offset:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_li_series(g:Tacb_poly_t; h:Tacb_poly_t; offset:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_continuation(res0:Tacb_t; res1:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; 
            z0:Tacb_t; z1:Tacb_t; f0:Tacb_t; f1:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_series_direct(res:Tacb_poly_t; a:Tacb_poly_t; b:Tacb_poly_t; c:Tacb_poly_t; z:Tacb_poly_t; 
            regularized:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_direct(res:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; z:Tacb_t; 
            regularized:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_transform(res:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; z:Tacb_t; 
            regularized:longint; which:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_transform_limit(res:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; z:Tacb_t; 
            regularized:longint; which:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_2f1_corner(res:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; z:Tacb_t; 
            regularized:longint; prec:Tslong);cdecl;external libflint;
function acb_hypgeom_2f1_choose(z:Tacb_t):longint;cdecl;external libflint;
procedure acb_hypgeom_2f1(res:Tacb_t; a:Tacb_t; b:Tacb_t; c:Tacb_t; z:Tacb_t; 
            regularized:longint; prec:Tslong);cdecl;external libflint;
const
  ACB_HYPGEOM_2F1_REGULARIZED = 1;  
{ a-b integer  }
  ACB_HYPGEOM_2F1_AB = 2;  
{ a-c integer  }
  ACB_HYPGEOM_2F1_AC = 4;  
{ b-c integer  }
  ACB_HYPGEOM_2F1_BC = 8;  
{ a+b-c integer  }
  ACB_HYPGEOM_2F1_ABC = 16;  

procedure acb_hypgeom_legendre_p_uiui_rec(res:Tacb_t; n:Tulong; m:Tulong; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_legendre_p(res:Tacb_t; n:Tacb_t; m:Tacb_t; z:Tacb_t; _type:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_legendre_q(res:Tacb_t; n:Tacb_t; m:Tacb_t; z:Tacb_t; _type:longint; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_jacobi_p(res:Tacb_t; n:Tacb_t; a:Tacb_t; b:Tacb_t; z:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_gegenbauer_c(res:Tacb_t; n:Tacb_t; m:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_laguerre_l(res:Tacb_t; n:Tacb_t; m:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_hermite_h(res:Tacb_t; n:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chebyshev_t(res:Tacb_t; n:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_chebyshev_u(res:Tacb_t; n:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_spherical_y(res:Tacb_t; n:Tslong; m:Tslong; theta:Tacb_t; phi:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_bernoulli(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_continuation(res:Tacb_t; a:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_bitburst(res:Tacb_t; z0:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_transform(res:Tacb_t; z:Tacb_t; algorithm:longint; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_zero_taylor(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog_zero(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_hypgeom_dilog(res:Tacb_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:12:41 ===


implementation



end.
