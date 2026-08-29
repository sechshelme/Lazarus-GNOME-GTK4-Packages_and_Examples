unit acb_modular;

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
type
  Ppsl2z_struct = ^Tpsl2z_struct;
  Tpsl2z_struct = record
      a : Tfmpz;
      b : Tfmpz;
      c : Tfmpz;
      d : Tfmpz;
    end;

  Ppsl2z_t = ^Tpsl2z_t;
  Tpsl2z_t = array[0..0] of Tpsl2z_struct;

procedure psl2z_init(g:Tpsl2z_t);cdecl;external libflint;
procedure psl2z_clear(g:Tpsl2z_t);cdecl;external libflint;
procedure psl2z_swap(f:Tpsl2z_t; g:Tpsl2z_t);cdecl;external libflint;
procedure psl2z_set(h:Tpsl2z_t; g:Tpsl2z_t);cdecl;external libflint;
procedure psl2z_one(g:Tpsl2z_t);cdecl;external libflint;
{$ifdef FLINT_HAVE_FILE}
procedure psl2z_fprint(file:PFILE; g:Tpsl2z_t);cdecl;external libflint;
{$endif}

procedure psl2z_print(g:Tpsl2z_t);cdecl;external libflint;
function psl2z_equal(f:Tpsl2z_t; g:Tpsl2z_t):longint;cdecl;external libflint;
procedure psl2z_mul(h:Tpsl2z_t; f:Tpsl2z_t; g:Tpsl2z_t);cdecl;external libflint;
procedure psl2z_inv(h:Tpsl2z_t; g:Tpsl2z_t);cdecl;external libflint;
function psl2z_is_one(g:Tpsl2z_t):longint;cdecl;external libflint;
function psl2z_is_correct(g:Tpsl2z_t):longint;cdecl;external libflint;
procedure psl2z_randtest(g:Tpsl2z_t; state:Tflint_rand_t; bits:Tslong);cdecl;external libflint;
procedure acb_modular_transform(w:Tacb_t; g:Tpsl2z_t; z:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_fundamental_domain_approx_d(g:Tpsl2z_t; x:Tdouble; y:Tdouble; one_minus_eps:Tdouble);cdecl;external libflint;
procedure acb_modular_fundamental_domain_approx_arf(g:Tpsl2z_t; xx:Tarf_t; yy:Tarf_t; one_minus_eps:Tarf_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_fundamental_domain_approx(w:Tacb_t; g:Tpsl2z_t; z:Tacb_t; one_minus_eps:Tarf_t; prec:Tslong);cdecl;external libflint;
function acb_modular_is_in_fundamental_domain(z:Tacb_t; tol:Tarf_t; prec:Tslong):longint;cdecl;external libflint;
procedure acb_modular_addseq_theta(exponents:Pslong; aindex:Pslong; bindex:Pslong; num:Tslong);cdecl;external libflint;
procedure acb_modular_addseq_eta(exponents:Pslong; aindex:Pslong; bindex:Pslong; num:Tslong);cdecl;external libflint;
procedure acb_modular_fill_addseq(tab:Pslong; len:Tslong);cdecl;external libflint;
procedure acb_modular_theta_transform(R:Plongint; S:Plongint; C:Plongint; g:Tpsl2z_t);cdecl;external libflint;
procedure acb_modular_theta_const_sum(theta2:Tacb_t; theta3:Tacb_t; theta4:Tacb_t; q:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_const_sum_basecase(theta2:Tacb_t; theta3:Tacb_t; theta4:Tacb_t; q:Tacb_t; N:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_const_sum_rs(theta2:Tacb_t; theta3:Tacb_t; theta4:Tacb_t; q:Tacb_t; N:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_sum(theta1:Tacb_ptr; theta2:Tacb_ptr; theta3:Tacb_ptr; theta4:Tacb_ptr; w:Tacb_t; 
            w_is_unit:longint; q:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_notransform(theta1:Tacb_t; theta2:Tacb_t; theta3:Tacb_t; theta4:Tacb_t; z:Tacb_t; 
            tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta(theta1:Tacb_t; theta2:Tacb_t; theta3:Tacb_t; theta4:Tacb_t; z:Tacb_t; 
            tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_jet_notransform(theta1:Tacb_ptr; theta2:Tacb_ptr; theta3:Tacb_ptr; theta4:Tacb_ptr; z:Tacb_t; 
            tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_jet(theta1:Tacb_ptr; theta2:Tacb_ptr; theta3:Tacb_ptr; theta4:Tacb_ptr; z:Tacb_t; 
            tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_modular_theta_series(theta1:Tacb_ptr; theta2:Tacb_ptr; theta3:Tacb_ptr; theta4:Tacb_ptr; z:Tacb_srcptr; 
            zlen:Tslong; tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_theta_series(theta1:Tacb_poly_t; theta2:Tacb_poly_t; theta3:Tacb_poly_t; theta4:Tacb_poly_t; z:Tacb_poly_t; 
            tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_j(z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
function acb_modular_epsilon_arg(g:Tpsl2z_t):longint;cdecl;external libflint;
procedure acb_modular_eta_sum(eta:Tacb_t; q:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_eta(z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_lambda(r:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_delta(r:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_eisenstein(r:Tacb_ptr; tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_elliptic_p(r:Tacb_t; z:Tacb_t; tau:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_elliptic_p_zpx(r:Tacb_ptr; z:Tacb_t; tau:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_elliptic_k(k:Tacb_t; m:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_elliptic_k_cpx(w:Tacb_ptr; m:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_modular_elliptic_e(res:Tacb_t; m:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_modular_hilbert_class_poly(res:Tfmpz_poly_t; D:Tslong);cdecl;external libflint;
{ this is a performance hack until the main arb/acb functions improve  }
procedure _acb_modular_mul(z:Tacb_t; tmp1:Tacb_t; tmp2:Tacb_t; x:Tacb_t; y:Tacb_t; 
            wprec:Tslong; prec:Tslong);cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:12:36 ===


implementation



end.
