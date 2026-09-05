{$IFDEF read_interface}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{ Memory management  }

procedure acb_poly_init(poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_init2(poly:Tacb_poly_t; len:Tslong);cdecl;external libflint;
procedure acb_poly_clear(poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_fit_length(poly:Tacb_poly_t; len:Tslong);cdecl;external libflint;
procedure _acb_poly_set_length(poly:Tacb_poly_t; len:Tslong);cdecl;external libflint;
procedure _acb_poly_normalise(poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_swap(poly1:Tacb_poly_t; poly2:Tacb_poly_t);cdecl;external libflint;
function acb_poly_length(poly:Tacb_poly_t):Tslong;cdecl;external libflint;
function acb_poly_degree(poly:Tacb_poly_t):Tslong;cdecl;external libflint;
function acb_poly_valuation(poly:Tacb_poly_t):Tslong;cdecl;external libflint;
function acb_poly_is_zero(z:Tacb_poly_t):longint;cdecl;external libflint;
function acb_poly_is_one(z:Tacb_poly_t):longint;cdecl;external libflint;
function acb_poly_is_x(z:Tacb_poly_t):longint;cdecl;external libflint;
procedure acb_poly_zero(poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_one(poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_set_coeff_si(poly:Tacb_poly_t; n:Tslong; x:Tslong);cdecl;external libflint;
procedure acb_poly_set_coeff_acb(poly:Tacb_poly_t; n:Tslong; x:Tacb_t);cdecl;external libflint;
procedure acb_poly_get_coeff_acb(x:Tacb_t; poly:Tacb_poly_t; n:Tslong);cdecl;external libflint;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_poly_get_coeff_ptr(poly,n : longint) : longint;

procedure _acb_poly_shift_right(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure acb_poly_shift_right(res:Tacb_poly_t; poly:Tacb_poly_t; n:Tslong);cdecl;external libflint;
procedure _acb_poly_shift_left(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure acb_poly_shift_left(res:Tacb_poly_t; poly:Tacb_poly_t; n:Tslong);cdecl;external libflint;
procedure acb_poly_truncate(poly:Tacb_poly_t; newlen:Tslong);cdecl;external libflint;
procedure _acb_poly_majorant(res:Tarb_ptr; vec:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_majorant(res:Tarb_poly_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
{$ifdef FLINT_HAVE_FILE}
procedure acb_poly_fprintd(file:PFILE; poly:Tacb_poly_t; digits:Tslong);cdecl;external libflint;
{$endif}

procedure acb_poly_printd(poly:Tacb_poly_t; digits:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate_horner(res:Tacb_t; f:Tacb_srcptr; len:Tslong; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate_horner(res:Tacb_t; f:Tacb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate_rectangular(y:Tacb_t; poly:Tacb_srcptr; len:Tslong; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate_rectangular(res:Tacb_t; f:Tacb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate(res:Tacb_t; f:Tacb_srcptr; len:Tslong; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate(res:Tacb_t; f:Tacb_poly_t; a:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate2_horner(y:Tacb_t; z:Tacb_t; f:Tacb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate2_horner(y:Tacb_t; z:Tacb_t; f:Tacb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate2_rectangular(y:Tacb_t; z:Tacb_t; f:Tacb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate2_rectangular(y:Tacb_t; z:Tacb_t; f:Tacb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate2(y:Tacb_t; z:Tacb_t; f:Tacb_srcptr; len:Tslong; x:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate2(y:Tacb_t; z:Tacb_t; f:Tacb_poly_t; x:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_derivative(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_derivative(res:Tacb_poly_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_nth_derivative(res:Tacb_ptr; poly:Tacb_srcptr; n:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_nth_derivative(res:Tacb_poly_t; poly:Tacb_poly_t; n:Tulong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_integral(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_integral(res:Tacb_poly_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
{ Transforms  }
procedure acb_poly_borel_transform(res:Tacb_poly_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_borel_transform(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_inv_borel_transform(res:Tacb_poly_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_inv_borel_transform(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_binomial_transform_basecase(b:Tacb_ptr; a:Tacb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_binomial_transform_basecase(b:Tacb_poly_t; a:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_binomial_transform_convolution(b:Tacb_ptr; a:Tacb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_binomial_transform_convolution(b:Tacb_poly_t; a:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_binomial_transform(b:Tacb_ptr; a:Tacb_srcptr; alen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_binomial_transform(b:Tacb_poly_t; a:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_graeffe_transform(b:Tacb_ptr; a:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_graeffe_transform(b:Tacb_poly_t; a:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set(dest:Tacb_poly_t; src:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_set_round(dest:Tacb_poly_t; src:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set_trunc(res:Tacb_poly_t; poly:Tacb_poly_t; n:Tslong);cdecl;external libflint;
procedure acb_poly_set_trunc_round(res:Tacb_poly_t; poly:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set_arb_poly(poly:Tacb_poly_t; re:Tarb_poly_t);cdecl;external libflint;
procedure acb_poly_set2_arb_poly(poly:Tacb_poly_t; re:Tarb_poly_t; im:Tarb_poly_t);cdecl;external libflint;
procedure acb_poly_set_fmpq_poly(poly:Tacb_poly_t; re:Tfmpq_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set2_fmpq_poly(poly:Tacb_poly_t; re:Tfmpq_poly_t; im:Tfmpq_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set_fmpz_poly(poly:Tacb_poly_t; src:Tfmpz_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_set2_fmpz_poly(poly:Tacb_poly_t; re:Tfmpz_poly_t; im:Tfmpz_poly_t; prec:Tslong);cdecl;external libflint;
function acb_poly_get_unique_fmpz_poly(res:Tfmpz_poly_t; src:Tacb_poly_t):longint;cdecl;external libflint;
procedure acb_poly_set_acb(poly:Tacb_poly_t; c:Tacb_t);cdecl;external libflint;
procedure acb_poly_set_si(poly:Tacb_poly_t; c:Tslong);cdecl;external libflint;
procedure acb_poly_randtest(poly:Tacb_poly_t; state:Tflint_rand_t; len:Tslong; prec:Tslong; mag_bits:Tslong);cdecl;external libflint;
function acb_poly_equal(A:Tacb_poly_t; B:Tacb_poly_t):longint;cdecl;external libflint;
function acb_poly_contains_fmpz_poly(poly1:Tacb_poly_t; poly2:Tfmpz_poly_t):longint;cdecl;external libflint;
function acb_poly_contains_fmpq_poly(poly1:Tacb_poly_t; poly2:Tfmpq_poly_t):longint;cdecl;external libflint;
function _acb_poly_overlaps(poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong):longint;cdecl;external libflint;
function acb_poly_overlaps(poly1:Tacb_poly_t; poly2:Tacb_poly_t):longint;cdecl;external libflint;
function acb_poly_contains(poly1:Tacb_poly_t; poly2:Tacb_poly_t):longint;cdecl;external libflint;
function acb_poly_is_real(poly:Tacb_poly_t):longint;cdecl;external libflint;
procedure _acb_poly_add(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_add(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_add_si(res:Tacb_poly_t; poly:Tacb_poly_t; c:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sub(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sub(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_add_series(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sub_series(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_neg(res:Tacb_poly_t; poly:Tacb_poly_t);cdecl;external libflint;
procedure acb_poly_scalar_mul_2exp_si(res:Tacb_poly_t; poly:Tacb_poly_t; c:Tslong);cdecl;external libflint;
procedure acb_poly_scalar_mul(res:Tacb_poly_t; poly:Tacb_poly_t; c:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_scalar_div(res:Tacb_poly_t; poly:Tacb_poly_t; c:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure acb_poly_mullow_classical(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mullow_classical(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mullow_transpose(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_mullow_transpose(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mullow_transpose_gauss(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_mullow_transpose_gauss(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mullow(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_mullow(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mul(C:Tacb_ptr; A:Tacb_srcptr; lenA:Tslong; B:Tacb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_mul(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_mul_monic(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_inv_series(Qinv:Tacb_ptr; Q:Tacb_srcptr; Qlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_inv_series(Qinv:Tacb_poly_t; Q:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_div_series(Q:Tacb_ptr; A:Tacb_srcptr; Alen:Tslong; B:Tacb_srcptr; Blen:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_div_series(Q:Tacb_poly_t; A:Tacb_poly_t; B:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_reverse(res:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; n:Tslong);cdecl;external libflint;
procedure _acb_poly_div(Q:Tacb_ptr; A:Tacb_srcptr; lenA:Tslong; B:Tacb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_divrem(Q:Tacb_ptr; R:Tacb_ptr; A:Tacb_srcptr; lenA:Tslong; B:Tacb_srcptr; 
            lenB:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_rem(R:Tacb_ptr; A:Tacb_srcptr; lenA:Tslong; B:Tacb_srcptr; lenB:Tslong; 
            prec:Tslong);cdecl;external libflint;
function acb_poly_divrem(Q:Tacb_poly_t; R:Tacb_poly_t; A:Tacb_poly_t; B:Tacb_poly_t; prec:Tslong):longint;cdecl;external libflint;
procedure _acb_poly_div_root(Q:Tacb_ptr; R:Tacb_t; A:Tacb_srcptr; len:Tslong; c:Tacb_t; 
            prec:Tslong);cdecl;external libflint;
{ Composition  }
procedure _acb_poly_taylor_shift(poly:Tacb_ptr; c:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_taylor_shift(g:Tacb_poly_t; f:Tacb_poly_t; c:Tacb_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_compose(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_compose(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_compose_series(res:Tacb_ptr; poly1:Tacb_srcptr; len1:Tslong; poly2:Tacb_srcptr; len2:Tslong; 
            n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_compose_series(res:Tacb_poly_t; poly1:Tacb_poly_t; poly2:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
{ Reversion  }
procedure _acb_poly_revert_series_lagrange(Qinv:Tacb_ptr; Q:Tacb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_revert_series_lagrange(Qinv:Tacb_poly_t; Q:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_revert_series_newton(Qinv:Tacb_ptr; Q:Tacb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_revert_series_newton(Qinv:Tacb_poly_t; Q:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_revert_series_lagrange_fast(Qinv:Tacb_ptr; Q:Tacb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_revert_series_lagrange_fast(Qinv:Tacb_poly_t; Q:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_revert_series(Qinv:Tacb_ptr; Q:Tacb_srcptr; Qlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_revert_series(Qinv:Tacb_poly_t; Q:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate_vec_fast_precomp(vs:Tacb_ptr; poly:Tacb_srcptr; plen:Tslong; tree:Pacb_ptr; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate_vec_fast(ys:Tacb_ptr; poly:Tacb_srcptr; plen:Tslong; xs:Tacb_srcptr; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate_vec_fast(ys:Tacb_ptr; poly:Tacb_poly_t; xs:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_evaluate_vec_iter(ys:Tacb_ptr; poly:Tacb_srcptr; plen:Tslong; xs:Tacb_srcptr; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_evaluate_vec_iter(ys:Tacb_ptr; poly:Tacb_poly_t; xs:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_interpolate_barycentric(poly:Tacb_ptr; xs:Tacb_srcptr; ys:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_interpolate_barycentric(poly:Tacb_poly_t; xs:Tacb_srcptr; ys:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_interpolation_weights(w:Tacb_ptr; tree:Pacb_ptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_interpolate_fast_precomp(poly:Tacb_ptr; ys:Tacb_srcptr; tree:Pacb_ptr; weights:Tacb_srcptr; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_interpolate_fast(poly:Tacb_ptr; xs:Tacb_srcptr; ys:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_interpolate_fast(poly:Tacb_poly_t; xs:Tacb_srcptr; ys:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_interpolate_newton(poly:Tacb_ptr; xs:Tacb_srcptr; ys:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_interpolate_newton(poly:Tacb_poly_t; xs:Tacb_srcptr; ys:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_product_roots(poly:Tacb_ptr; xs:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_product_roots(poly:Tacb_poly_t; xs:Tacb_srcptr; n:Tslong; prec:Tslong);cdecl;external libflint;
function _acb_poly_tree_alloc(len:Tslong):Pacb_ptr;cdecl;external libflint;
procedure _acb_poly_tree_free(tree:Pacb_ptr; len:Tslong);cdecl;external libflint;
procedure _acb_poly_tree_build(tree:Pacb_ptr; roots:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_root_inclusion(r:Tacb_t; m:Tacb_t; poly:Tacb_srcptr; polyder:Tacb_srcptr; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
function _acb_poly_validate_roots(roots:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong):Tslong;cdecl;external libflint;
procedure _acb_poly_refine_roots_durand_kerner(roots:Tacb_ptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong);cdecl;external libflint;
function _acb_poly_find_roots(roots:Tacb_ptr; poly:Tacb_srcptr; initial:Tacb_srcptr; len:Tslong; maxiter:Tslong; 
           prec:Tslong):Tslong;cdecl;external libflint;
function acb_poly_find_roots(roots:Tacb_ptr; poly:Tacb_poly_t; initial:Tacb_srcptr; maxiter:Tslong; prec:Tslong):Tslong;cdecl;external libflint;
procedure _acb_poly_root_bound_fujiwara(bound:Tmag_t; poly:Tacb_srcptr; len:Tslong);cdecl;external libflint;
procedure acb_poly_root_bound_fujiwara(bound:Tmag_t; poly:Tacb_poly_t);cdecl;external libflint;
function _acb_poly_validate_real_roots(roots:Tacb_srcptr; poly:Tacb_srcptr; len:Tslong; prec:Tslong):longint;cdecl;external libflint;
function acb_poly_validate_real_roots(roots:Tacb_srcptr; poly:Tacb_poly_t; prec:Tslong):longint;cdecl;external libflint;
{ Special functions  }
procedure _acb_poly_pow_ui_trunc_binexp(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; exp:Tulong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_pow_ui_trunc_binexp(res:Tacb_poly_t; poly:Tacb_poly_t; exp:Tulong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_pow_ui(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; exp:Tulong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_pow_ui(res:Tacb_poly_t; poly:Tacb_poly_t; exp:Tulong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_rsqrt_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_rsqrt_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sqrt_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sqrt_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_log_series(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_log_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_log1p_series(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_log1p_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_atan_series(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_atan_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_exp_series_basecase(f:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_exp_series_basecase(f:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_exp_series(f:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_exp_series(f:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_exp_pi_i_series(f:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_exp_pi_i_series(f:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sinh_cosh_series_basecase(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sinh_cosh_series_basecase(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sinh_cosh_series_exponential(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sinh_cosh_series_exponential(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sinh_cosh_series(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sinh_cosh_series(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sinh_series(s:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sinh_series(s:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_cosh_series(c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_cosh_series(c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sin_cos_series(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sin_cos_series(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sin_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sin_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_cos_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_cos_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sin_cos_pi_series(s:Tacb_ptr; c:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_sin_cos_pi_series(s:Tacb_poly_t; c:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sin_pi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sin_pi_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_cos_pi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_cos_pi_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_cot_pi_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_cot_pi_series(res:Tacb_poly_t; f:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_tan_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_tan_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_sinc_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_sinc_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_lambertw_series(res:Tacb_ptr; z:Tacb_srcptr; zlen:Tslong; k:Tfmpz_t; flags:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_lambertw_series(res:Tacb_poly_t; z:Tacb_poly_t; k:Tfmpz_t; flags:longint; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_gamma_series(res:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_gamma_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_rgamma_series(res:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_rgamma_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_lgamma_series(res:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_lgamma_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_digamma_series(res:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_digamma_series(res:Tacb_poly_t; f:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_rising_ui_series(res:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; r:Tulong; trunc:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_rising_ui_series(res:Tacb_poly_t; f:Tacb_poly_t; r:Tulong; trunc:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_pow_acb_series(h:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; g:Tacb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_pow_acb_series(h:Tacb_poly_t; f:Tacb_poly_t; g:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_pow_series(h:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; g:Tacb_srcptr; glen:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_pow_series(h:Tacb_poly_t; f:Tacb_poly_t; g:Tacb_poly_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_binomial_pow_acb_series(h:Tacb_ptr; f:Tacb_srcptr; flen:Tslong; g:Tacb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
{ TODO: document  }
procedure _acb_poly_acb_pow_cpx(w:Tacb_ptr; a:Tacb_t; b:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
const
  _acb_poly_pow_cpx = _acb_poly_acb_pow_cpx;  
{ TODO: document  }

procedure _acb_poly_acb_invpow_cpx(res:Tacb_ptr; N:Tacb_t; c:Tacb_t; trunc:Tslong; prec:Tslong);cdecl;external libflint;
{ TODO: document  }
procedure _acb_poly_mullow_cpx(res:Tacb_ptr; src:Tacb_srcptr; len:Tslong; c:Tacb_t; trunc:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_powsum_series_naive(z:Tacb_ptr; s:Tacb_t; a:Tacb_t; q:Tacb_t; n:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_powsum_series_naive_threaded(z:Tacb_ptr; s:Tacb_t; a:Tacb_t; q:Tacb_t; n:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_powsum_one_series_sieved(z:Tacb_ptr; s:Tacb_t; n:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_sum(z:Tacb_ptr; s:Tacb_t; a:Tacb_t; deflate:longint; N:Tulong; 
            M:Tulong; d:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_choose_param(bound:Tmag_t; N:Pulong; M:Pulong; s:Tacb_t; a:Tacb_t; 
            d:Tslong; target:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_bound1(bound:Tmag_t; s:Tacb_t; a:Tacb_t; N:Tslong; M:Tslong; 
            d:Tslong; wp:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_bound(vec:Tarb_ptr; s:Tacb_t; a:Tacb_t; N:Tulong; M:Tulong; 
            d:Tslong; wp:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_tail_naive(sum:Tacb_ptr; s:Tacb_t; Na:Tacb_t; Nasx:Tacb_srcptr; M:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_em_tail_bsplit(z:Tacb_ptr; s:Tacb_t; Na:Tacb_t; Nasx:Tacb_srcptr; M:Tslong; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_cpx_series(z:Tacb_ptr; s:Tacb_t; a:Tacb_t; deflate:longint; d:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_zeta_series(res:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; a:Tacb_t; deflate:longint; 
            len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_zeta_series(res:Tacb_poly_t; f:Tacb_poly_t; a:Tacb_t; deflate:longint; n:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure _acb_poly_polylog_cpx_zeta(w:Tacb_ptr; s:Tacb_t; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_polylog_cpx_small(w:Tacb_ptr; s:Tacb_t; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_polylog_cpx(w:Tacb_ptr; s:Tacb_t; z:Tacb_t; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_polylog_series(res:Tacb_ptr; s:Tacb_srcptr; slen:Tslong; z:Tacb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_polylog_series(res:Tacb_poly_t; s:Tacb_poly_t; z:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_agm1_series(res:Tacb_ptr; z:Tacb_srcptr; zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_agm1_series(res:Tacb_poly_t; z:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_elliptic_k_series(res:Tacb_ptr; z:Tacb_srcptr; zlen:Tslong; len:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_elliptic_k_series(res:Tacb_poly_t; z:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_elliptic_p_series(res:Tacb_ptr; z:Tacb_srcptr; zlen:Tslong; tau:Tacb_t; len:Tslong; 
            prec:Tslong);cdecl;external libflint;
procedure acb_poly_elliptic_p_series(res:Tacb_poly_t; z:Tacb_poly_t; tau:Tacb_t; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure _acb_poly_erf_series(g:Tacb_ptr; h:Tacb_srcptr; hlen:Tslong; n:Tslong; prec:Tslong);cdecl;external libflint;
procedure acb_poly_erf_series(g:Tacb_poly_t; h:Tacb_poly_t; n:Tslong; prec:Tslong);cdecl;external libflint;
function acb_poly_allocated_bytes(x:Tacb_poly_t):Tslong;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 16:12:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_poly_get_coeff_ptr(poly,n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if poly^.length then
    if_local1:=(poly^.coeffs)+n
  else
    if_local1:=NULL;
  acb_poly_get_coeff_ptr:=n<(if_local1);
end;


{$ENDIF read_implementation}
