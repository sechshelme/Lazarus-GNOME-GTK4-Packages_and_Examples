unit arb_poly;

interface

uses
  fp_flint;

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
{$ifndef ARB_POLY_H}
{$define ARB_POLY_H}
{ Memory management  }

procedure arb_poly_init(poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_init2(poly:Tarb_poly_t; len:Tslong);cdecl;external libflint;
procedure arb_poly_clear(poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_fit_length(poly:Tarb_poly_t; len:Tslong);cdecl;external libflint;
procedure _arb_poly_set_length(poly:Tarb_poly_t; len:Tslong);cdecl;external libflint;
procedure _arb_poly_normalise(poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_swap(poly1:Tarb_poly_t; poly2:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_set(poly:Tarb_poly_t; src:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_set_round(poly:Tarb_poly_t; src:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_set_trunc(res:Tarb_poly_t; poly:Tarb_poly_t; n:Tslong);cdecl;external libflint;
procedure arb_poly_set_trunc_round(res:Tarb_poly_t; poly:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
{ Basic manipulation  }
function arb_poly_length(poly:Tarb_poly_t):Tslong;cdecl;external libflint;
function arb_poly_degree(poly:Tarb_poly_t):Tslong;cdecl;external libflint;
function arb_poly_valuation(poly:Tarb_poly_t):Tslong;cdecl;external libflint;
function arb_poly_is_zero(z:Tarb_poly_t):longint;cdecl;external libflint;
function arb_poly_is_one(z:Tarb_poly_t):longint;cdecl;external libflint;
function arb_poly_is_x(z:Tarb_poly_t):longint;cdecl;external libflint;
procedure arb_poly_zero(poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_one(poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_set_coeff_si(poly:Tarb_poly_t; n:Tslong; x:Tslong);cdecl;external libflint;
procedure arb_poly_set_coeff_arb(poly:Tarb_poly_t; n:Tslong; x:Tarb_t);cdecl;external libflint;
procedure arb_poly_get_coeff_arb(x:Tarb_t; poly:Tarb_poly_t; n:Tslong);cdecl;external libflint;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_poly_get_coeff_ptr(poly,n : longint) : longint;

procedure _arb_poly_reverse(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure _arb_poly_shift_right(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure arb_poly_shift_right(res:Tarb_poly_t; poly:Tarb_poly_t; n:Tslong);cdecl;external libflint;
procedure _arb_poly_shift_left(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure arb_poly_shift_left(res:Tarb_poly_t; poly:Tarb_poly_t; n:Tslong);cdecl;external libflint;
procedure arb_poly_truncate(poly:Tarb_poly_t; newlen:Tslong);cdecl;external libflint;
{ Conversions  }
procedure arb_poly_set_fmpz_poly(poly:Tarb_poly_t; src:Tfmpz_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_set_fmpq_poly(poly:Tarb_poly_t; src:Tfmpq_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_set_arb(poly:Tarb_poly_t; c:Tarb_t);cdecl;external libflint;
procedure arb_poly_set_si(poly:Tarb_poly_t; c:Tslong);cdecl;external libflint;
function arb_poly_get_unique_fmpz_poly(res:Tfmpz_poly_t; src:Tarb_poly_t):longint;cdecl;external libflint;
{ Comparisons  }
function arb_poly_contains(poly1:Tarb_poly_t; poly2:Tarb_poly_t):longint;cdecl;external libflint;
function arb_poly_contains_fmpz_poly(poly1:Tarb_poly_t; poly2:Tfmpz_poly_t):longint;cdecl;external libflint;
function arb_poly_contains_fmpq_poly(poly1:Tarb_poly_t; poly2:Tfmpq_poly_t):longint;cdecl;external libflint;
function arb_poly_equal(A:Tarb_poly_t; B:Tarb_poly_t):longint;cdecl;external libflint;
function _arb_poly_overlaps(poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong):longint;cdecl;external libflint;
function arb_poly_overlaps(poly1:Tarb_poly_t; poly2:Tarb_poly_t):longint;cdecl;external libflint;
{ Bounds  }
procedure _arb_poly_majorant(res:Tarb_ptr; vec:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_majorant(res:Tarb_poly_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
{ IO  }
{$ifdef FLINT_HAVE_FILE}
procedure arb_poly_fprintd(file:PFILE; poly:Tarb_poly_t; digits:Tslong);cdecl;external libflint;
{$endif}

procedure arb_poly_printd(poly:Tarb_poly_t; digits:Tslong);cdecl;external libflint;
{ Random generation  }
procedure arb_poly_randtest(poly:Tarb_poly_t; state:Tflint_rand_t; len:Tslong; prec:Tslong; mag_bits:Tslong);cdecl;external libflint;
{ Arithmetic  }
procedure _arb_poly_add(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_add(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_add_si(res:Tarb_poly_t; poly:Tarb_poly_t; c:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sub(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sub(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_add_series(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sub_series(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_neg(res:Tarb_poly_t; poly:Tarb_poly_t);cdecl;external libflint;
procedure arb_poly_scalar_mul_2exp_si(res:Tarb_poly_t; poly:Tarb_poly_t; c:Tslong);cdecl;external libflint;
procedure arb_poly_scalar_mul(res:Tarb_poly_t; poly:Tarb_poly_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_scalar_div(res:Tarb_poly_t; poly:Tarb_poly_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mullow_ztrunc(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_mullow_ztrunc(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mullow_classical(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_mullow_classical(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mullow_block(C:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; lenB:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_mullow_block(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mullow(C:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; lenB:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_mullow(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mul(C:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_mul(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_mul_monic(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_inv_series(Qinv:Tarb_ptr; Q:Tarb_srcptr; Qlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_inv_series(Qinv:Tarb_poly_t; Q:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_div_series(Q:Tarb_ptr; A:Tarb_srcptr; Alen:Tslong; B:Tarb_srcptr; Blen:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_div_series(Q:Tarb_poly_t; A:Tarb_poly_t; B:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_div(Q:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_divrem(Q:Tarb_ptr; R:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; 
            lenB:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_rem(R:Tarb_ptr; A:Tarb_srcptr; lenA:Tslong; B:Tarb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
function arb_poly_divrem(Q:Tarb_poly_t; R:Tarb_poly_t; A:Tarb_poly_t; B:Tarb_poly_t; prec:Tslong):longint;cdecl;external libflint;
procedure _arb_poly_div_root(Q:Tarb_ptr; R:Tarb_t; A:Tarb_srcptr; len:Tslong; c:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
{ Product trees  }
procedure _arb_poly_product_roots(poly:Tarb_ptr; xs:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_product_roots(poly:Tarb_poly_t; xs:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_product_roots_complex(poly:Tarb_ptr; r:Tarb_srcptr; rn:Tslong; c:Tacb_srcptr; cn:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_product_roots_complex(poly:Tarb_poly_t; r:Tarb_srcptr; rn:Tslong; c:Tacb_srcptr; cn:Tslong; 
            prec:Tslong);cdecl;external libflint;
function _arb_poly_tree_alloc(len:Tslong):Parb_ptr;cdecl;external libflint;
procedure _arb_poly_tree_free(tree:Parb_ptr; len:Tslong);cdecl;external libflint;
procedure _arb_poly_tree_build(tree:Parb_ptr; roots:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
{ Composition  }
procedure _arb_poly_taylor_shift(poly:Tarb_ptr; c:Tarb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_taylor_shift(g:Tarb_poly_t; f:Tarb_poly_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_compose(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_compose(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_compose_series(res:Tarb_ptr; poly1:Tarb_srcptr; len1:Tslong; poly2:Tarb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_compose_series(res:Tarb_poly_t; poly1:Tarb_poly_t; poly2:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
{ Reversion  }
procedure _arb_poly_revert_series_lagrange(Qinv:Tarb_ptr; Q:Tarb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_revert_series_lagrange(Qinv:Tarb_poly_t; Q:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_revert_series_newton(Qinv:Tarb_ptr; Q:Tarb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_revert_series_newton(Qinv:Tarb_poly_t; Q:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_revert_series_lagrange_fast(Qinv:Tarb_ptr; Q:Tarb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_revert_series_lagrange_fast(Qinv:Tarb_poly_t; Q:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_revert_series(Qinv:Tarb_ptr; Q:Tarb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_revert_series(Qinv:Tarb_poly_t; Q:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
{ Evaluation and interpolation  }
procedure _arb_poly_evaluate_horner(res:Tarb_t; f:Tarb_srcptr; len:Tslong; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_horner(res:Tarb_t; f:Tarb_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_rectangular(y:Tarb_t; poly:Tarb_srcptr; len:Tslong; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_rectangular(res:Tarb_t; f:Tarb_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate(res:Tarb_t; f:Tarb_srcptr; len:Tslong; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate(res:Tarb_t; f:Tarb_poly_t; a:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2_horner(y:Tarb_t; z:Tarb_t; f:Tarb_srcptr; len:Tslong; x:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2_horner(y:Tarb_t; z:Tarb_t; f:Tarb_poly_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2_rectangular(y:Tarb_t; z:Tarb_t; f:Tarb_srcptr; len:Tslong; x:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2_rectangular(y:Tarb_t; z:Tarb_t; f:Tarb_poly_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2(y:Tarb_t; z:Tarb_t; f:Tarb_srcptr; len:Tslong; x:Tarb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2(y:Tarb_t; z:Tarb_t; f:Tarb_poly_t; x:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_vec_iter(ys:Tarb_ptr; poly:Tarb_srcptr; plen:Tslong; xs:Tarb_srcptr; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_vec_iter(ys:Tarb_ptr; poly:Tarb_poly_t; xs:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_vec_fast_precomp(vs:Tarb_ptr; poly:Tarb_srcptr; plen:Tslong; tree:Parb_ptr; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_vec_fast(ys:Tarb_ptr; poly:Tarb_srcptr; plen:Tslong; xs:Tarb_srcptr; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_vec_fast(ys:Tarb_ptr; poly:Tarb_poly_t; xs:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_interpolate_newton(poly:Tarb_ptr; xs:Tarb_srcptr; ys:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_interpolate_newton(poly:Tarb_poly_t; xs:Tarb_srcptr; ys:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_interpolate_barycentric(poly:Tarb_ptr; xs:Tarb_srcptr; ys:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_interpolate_barycentric(poly:Tarb_poly_t; xs:Tarb_srcptr; ys:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_interpolation_weights(w:Tarb_ptr; tree:Parb_ptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_interpolate_fast_precomp(poly:Tarb_ptr; ys:Tarb_srcptr; tree:Parb_ptr; weights:Tarb_srcptr; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_interpolate_fast(poly:Tarb_ptr; xs:Tarb_srcptr; ys:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_interpolate_fast(poly:Tarb_poly_t; xs:Tarb_srcptr; ys:Tarb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
{ Derivative and integral  }
procedure _arb_poly_derivative(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_derivative(res:Tarb_poly_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_nth_derivative(res:Tarb_ptr; poly:Tarb_srcptr; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_nth_derivative(res:Tarb_poly_t; poly:Tarb_poly_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_integral(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_integral(res:Tarb_poly_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
{ Transforms  }
procedure arb_poly_borel_transform(res:Tarb_poly_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_borel_transform(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_inv_borel_transform(res:Tarb_poly_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_inv_borel_transform(res:Tarb_ptr; poly:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_binomial_transform_basecase(b:Tarb_ptr; a:Tarb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_binomial_transform_basecase(b:Tarb_poly_t; a:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_binomial_transform_convolution(b:Tarb_ptr; a:Tarb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_binomial_transform_convolution(b:Tarb_poly_t; a:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_binomial_transform(b:Tarb_ptr; a:Tarb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_binomial_transform(b:Tarb_poly_t; a:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_graeffe_transform(b:Tarb_ptr; a:Tarb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_graeffe_transform(b:Tarb_poly_t; a:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
{ Special functions  }
procedure _arb_poly_pow_ui_trunc_binexp(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; exp:Tulong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_pow_ui_trunc_binexp(res:Tarb_poly_t; poly:Tarb_poly_t; exp:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_pow_ui(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; exp:Tulong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_pow_ui(res:Tarb_poly_t; poly:Tarb_poly_t; exp:Tulong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_pow_series(h:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; g:Tarb_srcptr; glen:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_pow_series(h:Tarb_poly_t; f:Tarb_poly_t; g:Tarb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_pow_arb_series(h:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; g:Tarb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_pow_arb_series(h:Tarb_poly_t; f:Tarb_poly_t; g:Tarb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_binomial_pow_arb_series(h:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; g:Tarb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_rsqrt_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_rsqrt_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sqrt_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sqrt_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_log_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_log_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_log1p_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_log1p_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_atan_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_atan_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_asin_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_asin_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_acos_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_acos_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_exp_series_basecase(f:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_exp_series_basecase(f:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_exp_series(f:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_exp_series(f:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinh_cosh_series_basecase(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinh_cosh_series_basecase(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinh_cosh_series_exponential(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinh_cosh_series_exponential(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinh_cosh_series(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinh_cosh_series(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinh_series(s:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinh_series(s:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_cosh_series(c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_cosh_series(c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sin_cos_series(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sin_cos_series(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sin_cos_pi_series(s:Tarb_ptr; c:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_sin_cos_pi_series(s:Tarb_poly_t; c:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sin_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sin_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_cos_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_cos_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sin_pi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sin_pi_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_cos_pi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_cos_pi_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_cot_pi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_cot_pi_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_tan_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_tan_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinc_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinc_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_sinc_pi_series(g:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_sinc_pi_series(g:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_acb_horner(res:Tacb_t; f:Tarb_srcptr; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_acb_horner(res:Tacb_t; f:Tarb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_acb_rectangular(y:Tacb_t; poly:Tarb_srcptr; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_acb_rectangular(res:Tacb_t; f:Tarb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate_acb(res:Tacb_t; f:Tarb_srcptr; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate_acb(res:Tacb_t; f:Tarb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2_acb_horner(y:Tacb_t; z:Tacb_t; f:Tarb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2_acb_horner(y:Tacb_t; z:Tacb_t; f:Tarb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2_acb_rectangular(y:Tacb_t; z:Tacb_t; f:Tarb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2_acb_rectangular(y:Tacb_t; z:Tacb_t; f:Tarb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_evaluate2_acb(y:Tacb_t; z:Tacb_t; f:Tarb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_evaluate2_acb(y:Tacb_t; z:Tacb_t; f:Tarb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_lambertw_series(res:Tarb_ptr; z:Tarb_srcptr; zlen:Tslong; flags:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_lambertw_series(res:Tarb_poly_t; z:Tarb_poly_t; flags:longint; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_gamma_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_gamma_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_rgamma_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_rgamma_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_lgamma_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_lgamma_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_digamma_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_digamma_series(res:Tarb_poly_t; f:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_rising_ui_series(res:Tarb_ptr; f:Tarb_srcptr; flen:Tslong; r:Tulong; trunc:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure arb_poly_rising_ui_series(res:Tarb_poly_t; f:Tarb_poly_t; r:Tulong; trunc:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_zeta_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; a:Tarb_t; deflate:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_zeta_series(res:Tarb_poly_t; f:Tarb_poly_t; a:Tarb_t; deflate:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _arb_poly_riemann_siegel_theta_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_riemann_siegel_theta_series(res:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_riemann_siegel_z_series(res:Tarb_ptr; h:Tarb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_riemann_siegel_z_series(res:Tarb_poly_t; h:Tarb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
function _arb_poly_swinnerton_dyer_ui_prec(n:Tulong):Tslong;cdecl;external libflint;
procedure _arb_poly_swinnerton_dyer_ui(T:Tarb_ptr; n:Tulong; trunc:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_poly_swinnerton_dyer_ui(poly:Tarb_poly_t; n:Tulong; prec:Tslong);cdecl;external libflint;
{ Root-finding  }
procedure _arb_poly_newton_convergence_factor(convergence_factor:Tarf_t; poly:Tarb_srcptr; len:Tslong; convergence_interval:Tarb_t; prec:Tslong);cdecl;external libflint;
function _arb_poly_newton_step(xnew:Tarb_t; poly:Tarb_srcptr; len:Tslong; x:Tarb_t; convergence_interval:Tarb_t; 
           convergence_factor:Tarf_t; prec:Tslong):longint;cdecl;external libflint;
procedure _arb_poly_newton_refine_root(r:Tarb_t; poly:Tarb_srcptr; len:Tslong; start:Tarb_t; convergence_interval:Tarb_t; 
            convergence_factor:Tarf_t; eval_extra_prec:Tslong; prec:Tslong);cdecl;external libflint;
procedure _arb_poly_root_bound_fujiwara(bound:Tmag_t; poly:Tarb_srcptr; len:Tslong);cdecl;external libflint;
procedure arb_poly_root_bound_fujiwara(bound:Tmag_t; poly:Tarb_poly_t);cdecl;external libflint;
function arb_poly_allocated_bytes(x:Tarb_poly_t):Tslong;cdecl;external libflint;
{ Macros  }
{ counts zero bits in the binary representation of e  }
function n_zerobits(e:Tmp_limb_t):longint;cdecl;external libflint;
{ Computes the length of the result when raising a polynomial of
   length *len* to the power *exp* and truncating to length *trunc*,
   without overflow. Assumes poly_len >= 1.  }
function poly_pow_length(poly_len:Tslong; exp:Tulong; trunc:Tslong):Tslong;cdecl;external libflint;

// === Konventiert am: 29-8-26 17:30:36 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_poly_get_coeff_ptr(poly,n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if poly^.length then
    if_local1:=(poly^.coeffs)+n
  else
    if_local1:=NULL;
  arb_poly_get_coeff_ptr:=n<(if_local1);
end;


end.
