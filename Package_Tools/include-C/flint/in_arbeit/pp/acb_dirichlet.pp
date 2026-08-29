
unit acb_dirichlet;
interface

{
  Automatically converted by H2Pas 1.0.0 from acb_dirichlet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    acb_dirichlet.h
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
Pacb_dirichlet_hurwitz_precomp_struct  = ^acb_dirichlet_hurwitz_precomp_struct;
Pacb_dirichlet_hurwitz_precomp_t  = ^acb_dirichlet_hurwitz_precomp_t;
Pacb_dirichlet_platt_c_precomp_struct  = ^acb_dirichlet_platt_c_precomp_struct;
Pacb_dirichlet_platt_c_precomp_t  = ^acb_dirichlet_platt_c_precomp_t;
Pacb_dirichlet_platt_i_precomp_struct  = ^acb_dirichlet_platt_i_precomp_struct;
Pacb_dirichlet_platt_i_precomp_t  = ^acb_dirichlet_platt_i_precomp_t;
Pacb_dirichlet_platt_ws_precomp_struct  = ^acb_dirichlet_platt_ws_precomp_struct;
Pacb_dirichlet_platt_ws_precomp_t  = ^acb_dirichlet_platt_ws_precomp_t;
Pacb_dirichlet_roots_struct  = ^acb_dirichlet_roots_struct;
Pacb_dirichlet_roots_t  = ^acb_dirichlet_roots_t;
Pacb_ptr  = ^acb_ptr;
Pchar  = ^char;
Pslong  = ^slong;
Pulong  = ^ulong;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2015 Jonathan Bober
    Copyright (C) 2016 Fredrik Johansson
    Copyright (C) 2016 Pascal Molin

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ACB_DIRICHLET_H}
{$define ACB_DIRICHLET_H}
(* Const before type ignored *)

procedure acb_dirichlet_powsum_term(res:Tacb_ptr; log_prev:Tarb_t; prev:Pulong; s:Tacb_t; k:Tulong; 
            integer:longint; critical_line:longint; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_powsum_sieved(z:Tacb_ptr; s:Tacb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_powsum_smooth(z:Tacb_ptr; s:Tacb_t; n:Tulong; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_bound(res:Tmag_t; s:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_deriv_bound(der1:Tmag_t; der2:Tmag_t; s:Tacb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_rs_f_coeffs(c:Tacb_ptr; p:Tarb_t; N:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_rs_d_coeffs(d:Tarb_ptr; sigma:Tarb_t; k:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_rs_bound(err:Tmag_t; s:Tacb_t; K:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_rs_r(res:Tacb_t; s:Tacb_t; K:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_rs(res:Tacb_t; s:Tacb_t; K:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta(res:Tacb_t; s:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_jet_rs(res:Tacb_ptr; s:Tacb_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_jet(res:Tacb_t; s:Tacb_t; deflate:longint; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_hurwitz(res:Tacb_t; s:Tacb_t; a:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_lerch_phi_integral(res:Tacb_t; z:Tacb_t; s:Tacb_t; a:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_lerch_phi_direct(res:Tacb_t; z:Tacb_t; s:Tacb_t; a:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_lerch_phi(res:Tacb_t; z:Tacb_t; s:Tacb_t; a:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_stieltjes(res:Tacb_t; n:Tfmpz_t; a:Tacb_t; prec:Tslong);cdecl;external;
type
  Pacb_dirichlet_hurwitz_precomp_struct = ^Tacb_dirichlet_hurwitz_precomp_struct;
  Tacb_dirichlet_hurwitz_precomp_struct = record
      s : Tacb_struct;
      err : Tmag_struct;
      coeffs : Tacb_ptr;
      deflate : longint;
      A : Tslong;
      N : Tslong;
      K : Tslong;
    end;

  Pacb_dirichlet_hurwitz_precomp_t = ^Tacb_dirichlet_hurwitz_precomp_t;
  Tacb_dirichlet_hurwitz_precomp_t = array[0..0] of Tacb_dirichlet_hurwitz_precomp_struct;
(* Const before type ignored *)

procedure acb_dirichlet_hurwitz_precomp_init(pre:Tacb_dirichlet_hurwitz_precomp_t; s:Tacb_t; deflate:longint; A:Tslong; K:Tslong; 
            N:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hurwitz_precomp_init_num(pre:Tacb_dirichlet_hurwitz_precomp_t; s:Tacb_t; deflate:longint; num_eval:Tdouble; prec:Tslong);cdecl;external;
procedure acb_dirichlet_hurwitz_precomp_clear(pre:Tacb_dirichlet_hurwitz_precomp_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hurwitz_precomp_bound(res:Tmag_t; s:Tacb_t; A:Tslong; K:Tslong; N:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hurwitz_precomp_eval(res:Tacb_t; pre:Tacb_dirichlet_hurwitz_precomp_t; p:Tulong; q:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hurwitz_precomp_choose_param(A:Pulong; K:Pulong; N:Pulong; s:Tacb_t; num_eval:Tdouble; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_euler_product_real_ui(res:Tarb_t; s:Tulong; chi:Pchar; mod:longint; reciprocal:longint; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_eta(res:Tacb_t; s:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_xi(res:Tacb_t; s:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_pairing(res:Tacb_t; G:Tdirichlet_group_t; m:Tulong; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_pairing_char(res:Tacb_t; G:Tdirichlet_group_t; a:Tdirichlet_char_t; b:Tdirichlet_char_t; prec:Tslong);cdecl;external;
{ precompute roots of unity  }
type
  Pacb_dirichlet_roots_struct = ^Tacb_dirichlet_roots_struct;
  Tacb_dirichlet_roots_struct = record
      order : Tulong;
      reduced_order : Tulong;
      z : Tacb_t;
      size : Tslong;
      depth : Tslong;
      Z : Pacb_ptr;
      use_pow : longint;
    end;

  Pacb_dirichlet_roots_t = ^Tacb_dirichlet_roots_t;
  Tacb_dirichlet_roots_t = array[0..0] of Tacb_dirichlet_roots_struct;

procedure acb_dirichlet_roots_init(t:Tacb_dirichlet_roots_t; order:Tulong; num:Tslong; prec:Tslong);cdecl;external;
procedure acb_dirichlet_roots_clear(t:Tacb_dirichlet_roots_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_root(z:Tacb_t; t:Tacb_dirichlet_roots_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_chi(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; n:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_chi_vec(v:Tacb_ptr; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; nv:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_arb_quadratic_powers(v:Tarb_ptr; nv:Tslong; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_qseries_arb(res:Tacb_t; a:Tacb_srcptr; x:Tarb_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_qseries_arb_powers_naive(res:Tacb_t; x:Tarb_t; parity:longint; a:Pulong; z:Tacb_dirichlet_roots_t; 
            len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_qseries_arb_powers_smallorder(res:Tacb_t; x:Tarb_t; parity:longint; a:Pulong; z:Tacb_dirichlet_roots_t; 
            len:Tslong; prec:Tslong);cdecl;external;
function acb_dirichlet_theta_length_d(q:Tulong; x:Tdouble; prec:Tslong):Tulong;cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_theta_length(q:Tulong; x:Tarb_t; prec:Tslong):Tulong;cdecl;external;
(* Const before type ignored *)
procedure mag_tail_kexpk2_arb(res:Tmag_t; a:Tarb_t; n:Tulong);cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_theta_argument_at_arb(xt:Tarb_t; q:Tulong; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_theta_arb(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_ui_theta_arb(res:Tacb_t; G:Tdirichlet_group_t; a:Tulong; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gauss_sum_naive(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gauss_sum_factor(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gauss_sum_order2(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gauss_sum_theta(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gauss_sum(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_root_number_theta(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_root_number(res:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_si_poly_evaluate(res:Tacb_t; v:Pslong; len:Tslong; z:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_jacobi_sum_naive(res:Tacb_t; G:Tdirichlet_group_t; chi1:Tdirichlet_char_t; chi2:Tdirichlet_char_t; prec:Tslong);cdecl;external;
function jacobi_one_prime(p:Tulong; e:Tulong; pe:Tulong; cond:Tulong):Tulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_jacobi_sum_factor(res:Tacb_t; G:Tdirichlet_group_t; chi1:Tdirichlet_char_t; chi2:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_jacobi_sum_gauss(res:Tacb_t; G:Tdirichlet_group_t; chi1:Tdirichlet_char_t; chi2:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_jacobi_sum(res:Tacb_t; G:Tdirichlet_group_t; chi1:Tdirichlet_char_t; chi2:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_jacobi_sum_ui(res:Tacb_t; G:Tdirichlet_group_t; a:Tulong; b:Tulong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_euler_product(res:Tacb_t; s:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_hurwitz(res:Tacb_t; s:Tacb_t; precomp:Tacb_dirichlet_hurwitz_precomp_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l(res:Tacb_t; s:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_vec_hurwitz(res:Tacb_ptr; s:Tacb_t; precomp:Tacb_dirichlet_hurwitz_precomp_t; G:Tdirichlet_group_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_jet(res:Tacb_ptr; s:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; deflate:longint; 
            len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_fmpq_afe(res:Tacb_t; s:Tfmpq_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_fmpq(res:Tacb_t; s:Tfmpq_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _acb_dirichlet_l_series(res:Tacb_ptr; s:Tacb_srcptr; slen:Tslong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; 
            deflate:longint; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_l_series(res:Tacb_poly_t; s:Tacb_poly_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; deflate:longint; 
            len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_hardy_theta(res:Tacb_ptr; t:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; len:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_hardy_z(res:Tacb_ptr; t:Tacb_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; len:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _acb_dirichlet_hardy_theta_series(res:Tacb_ptr; s:Tacb_srcptr; slen:Tslong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; 
            len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_hardy_theta_series(res:Tacb_poly_t; s:Tacb_poly_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; len:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _acb_dirichlet_hardy_z_series(res:Tacb_ptr; s:Tacb_srcptr; slen:Tslong; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; 
            len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_hardy_z_series(res:Tacb_poly_t; s:Tacb_poly_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; len:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_gram_point(res:Tarb_t; n:Tfmpz_t; G:Tdirichlet_group_t; chi:Tdirichlet_char_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_turing_method_bound(p:Tfmpz_t):Tulong;cdecl;external;
(* Const before type ignored *)
function _acb_dirichlet_definite_hardy_z(res:Tarb_t; t:Tarf_t; pprec:Pslong):longint;cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_isolate_gram_hardy_z_zero(a:Tarf_t; b:Tarf_t; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_isolate_rosser_hardy_z_zero(a:Tarf_t; b:Tarf_t; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_isolate_turing_hardy_z_zero(a:Tarf_t; b:Tarf_t; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_isolate_hardy_z_zero(a:Tarf_t; b:Tarf_t; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _acb_dirichlet_refine_hardy_z_zero(res:Tarb_t; a:Tarf_t; b:Tarf_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hardy_z_zeros(res:Tarb_ptr; n:Tfmpz_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_zeros(res:Tacb_ptr; n:Tfmpz_t; len:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_platt_zeta_zeros(res:Tacb_ptr; n:Tfmpz_t; len:Tslong; prec:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
procedure _acb_dirichlet_exact_zeta_nzeros(res:Tfmpz_t; t:Tarf_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_nzeros(res:Tarb_t; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_backlund_s(res:Tarb_t; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_backlund_s_bound(res:Tmag_t; t:Tarb_t);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_nzeros_gram(res:Tfmpz_t; n:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_backlund_s_gram(n:Tfmpz_t):Tslong;cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_hardy_z_zero(res:Tarb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_zeta_zero(res:Tacb_t; n:Tfmpz_t; prec:Tslong);cdecl;external;
{ Platt zeta zeros  }
type
  Pacb_dirichlet_platt_c_precomp_struct = ^Tacb_dirichlet_platt_c_precomp_struct;
  Tacb_dirichlet_platt_c_precomp_struct = record
      len : Tslong;
      p : Tarb_ptr;
      Xa : Tarb_struct;
      Xb : Tarb_struct;
    end;

  Pacb_dirichlet_platt_c_precomp_t = ^Tacb_dirichlet_platt_c_precomp_t;
  Tacb_dirichlet_platt_c_precomp_t = array[0..0] of Tacb_dirichlet_platt_c_precomp_struct;

  Pacb_dirichlet_platt_i_precomp_struct = ^Tacb_dirichlet_platt_i_precomp_struct;
  Tacb_dirichlet_platt_i_precomp_struct = record
      c1 : Tarb_struct;
      c2 : Tarb_struct;
    end;

  Pacb_dirichlet_platt_i_precomp_t = ^Tacb_dirichlet_platt_i_precomp_t;
  Tacb_dirichlet_platt_i_precomp_t = array[0..0] of Tacb_dirichlet_platt_i_precomp_struct;

  Pacb_dirichlet_platt_ws_precomp_struct = ^Tacb_dirichlet_platt_ws_precomp_struct;
  Tacb_dirichlet_platt_ws_precomp_struct = record
      pre_c : Tacb_dirichlet_platt_c_precomp_struct;
      pre_i : Tacb_dirichlet_platt_i_precomp_struct;
    end;

  Pacb_dirichlet_platt_ws_precomp_t = ^Tacb_dirichlet_platt_ws_precomp_t;
  Tacb_dirichlet_platt_ws_precomp_t = array[0..0] of Tacb_dirichlet_platt_ws_precomp_struct;
{ Platt C bound  }
(* Const before type ignored *)

procedure acb_dirichlet_platt_c_precomp_init(pre:Tacb_dirichlet_platt_c_precomp_t; sigma:Tslong; h:Tarb_t; k:Tulong; prec:Tslong);cdecl;external;
procedure acb_dirichlet_platt_c_precomp_clear(pre:Tacb_dirichlet_platt_c_precomp_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_c_bound_precomp(res:Tarb_t; pre:Tacb_dirichlet_platt_c_precomp_t; sigma:Tslong; t0:Tarb_t; h:Tarb_t; 
            k:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_c_bound(res:Tarb_t; sigma:Tslong; t0:Tarb_t; h:Tarb_t; k:Tslong; 
            prec:Tslong);cdecl;external;
{ Platt I bound  }
(* Const before type ignored *)
procedure acb_dirichlet_platt_i_precomp_init(pre:Tacb_dirichlet_platt_i_precomp_t; A:Tslong; H:Tarb_t; sigma:Tslong; prec:Tslong);cdecl;external;
procedure acb_dirichlet_platt_i_precomp_clear(pre:Tacb_dirichlet_platt_i_precomp_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_i_bound_precomp(res:Tarb_t; pre_i:Tacb_dirichlet_platt_i_precomp_t; pre_c:Tacb_dirichlet_platt_c_precomp_t; t0:Tarb_t; A:Tslong; 
            H:Tarb_t; sigma:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_i_bound(res:Tarb_t; t0:Tarb_t; A:Tslong; H:Tarb_t; sigma:Tslong; 
            prec:Tslong);cdecl;external;
{ Platt Gaussian-windowed Whittaker-Shannon interpolation  }
(* Const before type ignored *)
procedure acb_dirichlet_platt_ws_precomp_init(pre:Tacb_dirichlet_platt_ws_precomp_t; A:Tslong; H:Tarb_t; sigma:Tslong; prec:Tslong);cdecl;external;
procedure acb_dirichlet_platt_ws_precomp_clear(pre:Tacb_dirichlet_platt_ws_precomp_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_ws_interpolation_precomp(res:Tarb_t; deriv:Tarf_t; pre:Tacb_dirichlet_platt_ws_precomp_t; t0:Tarb_t; p:Tarb_srcptr; 
            T:Tfmpz_t; A:Tslong; B:Tslong; Ns_max:Tslong; H:Tarb_t; 
            sigma:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_ws_interpolation(res:Tarb_t; deriv:Tarf_t; t0:Tarb_t; p:Tarb_srcptr; T:Tfmpz_t; 
            A:Tslong; B:Tslong; Ns_max:Tslong; H:Tarb_t; sigma:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_bound_C3(res:Tarb_t; t0:Tarb_t; A:Tslong; H:Tarb_t; Ns:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_platt_scaled_lambda(res:Tarb_t; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_platt_scaled_lambda_vec(res:Tarb_ptr; T:Tfmpz_t; A:Tslong; B:Tslong; prec:Tslong);cdecl;external;
{ Platt lemma bounds of errors in the DFT grid evaluation of scaled Lambda  }
(* Const before type ignored *)
procedure acb_dirichlet_platt_beta(res:Tarb_t; t:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_32(out:Tarb_t; h:Tarb_t; t0:Tarb_t; x:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_A5(out:Tarb_t; B:Tslong; h:Tarb_t; k:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_A7(out:Tarb_t; sigma:Tslong; t0:Tarb_t; h:Tarb_t; k:Tslong; 
            A:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_A9(out:Tarb_t; sigma:Tslong; t0:Tarb_t; h:Tarb_t; A:Tslong; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_A11(out:Tarb_t; t0:Tarb_t; h:Tarb_t; B:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_B1(out:Tarb_t; sigma:Tslong; t0:Tarb_t; h:Tarb_t; J:Tfmpz_t; 
            prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_lemma_B2(out:Tarb_t; K:Tslong; h:Tarb_t; xi:Tarb_t; prec:Tslong);cdecl;external;
{ Platt DFT grid evaluation of scaled Lambda  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_multieval(out:Tarb_ptr; T:Tfmpz_t; A:Tslong; B:Tslong; h:Tarb_t; 
            J:Tfmpz_t; K:Tslong; sigma:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_dirichlet_platt_multieval_threaded(out:Tarb_ptr; T:Tfmpz_t; A:Tslong; B:Tslong; h:Tarb_t; 
            J:Tfmpz_t; K:Tslong; sigma:Tslong; prec:Tslong);cdecl;external;
{ Platt Hardy Z zeros  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function _acb_dirichlet_platt_local_hardy_z_zeros(res:Tarb_ptr; n:Tfmpz_t; len:Tslong; T:Tfmpz_t; A:Tslong; 
           B:Tslong; h:Tarb_t; J:Tfmpz_t; K:Tslong; sigma_grid:Tslong; 
           Ns_max:Tslong; H:Tarb_t; sigma_interp:Tslong; prec:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_platt_local_hardy_z_zeros(res:Tarb_ptr; n:Tfmpz_t; len:Tslong; prec:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
function acb_dirichlet_platt_hardy_z_zeros(res:Tarb_ptr; n:Tfmpz_t; len:Tslong; prec:Tslong):Tslong;cdecl;external;
{ Discrete Fourier Transform  }
(* Const before type ignored *)
procedure acb_dirichlet_dft_index(w:Tacb_ptr; v:Tacb_srcptr; G:Tdirichlet_group_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_dirichlet_dft(w:Tacb_ptr; v:Tacb_srcptr; G:Tdirichlet_group_t; prec:Tslong);cdecl;external;
{ utils  }
procedure acb_vec_printd(vec:Tacb_srcptr; len:Tslong; digits:Tslong);cdecl;external;
{$endif}

implementation


end.
