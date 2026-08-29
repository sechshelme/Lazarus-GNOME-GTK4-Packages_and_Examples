unit ca_poly;

interface

uses
  fp_flint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2020 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{ Polynomial object  }
type
  Pca_poly_struct = ^Tca_poly_struct;
  Tca_poly_struct = record
      coeffs : Pca_struct;
      alloc : Tslong;
      length : Tslong;
    end;

  Pca_poly_t = ^Tca_poly_t;
  Tca_poly_t = array[0..0] of Tca_poly_struct;
{ todo: return NULL when out of bounds?  }

function ca_poly_coeff_ptr(poly:Tca_poly_t; i:Tslong):Tca_ptr;cdecl;external libflint;
{ Vectors of polynomials  }
type
  Pca_poly_vec_struct = ^Tca_poly_vec_struct;
  Tca_poly_vec_struct = record
      entries : Pca_poly_struct;
      length : Tslong;
      alloc : Tslong;
    end;

  Pca_poly_vec_t = ^Tca_poly_vec_t;
  Tca_poly_vec_t = array[0..0] of Tca_poly_vec_struct;
{ Memory management  }

procedure ca_poly_init(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_init2(poly:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_clear(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_fit_length(poly:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_set_length(poly:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_normalise(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_swap(poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Assignment and simple values  }
procedure ca_poly_set_ca(poly:Tca_poly_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set_si(poly:Tca_poly_t; x:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_zero(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_x(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_one(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set(res:Tca_poly_t; src:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set_fmpz_poly(res:Tca_poly_t; src:Tfmpz_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set_fmpq_poly(res:Tca_poly_t; src:Tfmpq_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_transfer(res:Tca_poly_t; res_ctx:Tca_ctx_t; src:Tca_poly_t; src_ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set_coeff_ca(poly:Tca_poly_t; n:Tslong; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Random generation  }
procedure ca_poly_randtest(poly:Tca_poly_t; state:Tflint_rand_t; len:Tslong; depth:Tslong; bits:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_randtest_rational(poly:Tca_poly_t; state:Tflint_rand_t; len:Tslong; bits:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Input and output  }
procedure ca_poly_print(poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_printn(poly:Tca_poly_t; digits:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Degree and leading coefficient  }
function ca_poly_is_proper(poly:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_poly_make_monic(res:Tca_poly_t; poly:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure _ca_poly_reverse(res:Tca_ptr; poly:Tca_srcptr; len:Tslong; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_reverse(res:Tca_poly_t; poly:Tca_poly_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Comparisons  }
function _ca_poly_check_equal(poly1:Tca_srcptr; len1:Tslong; poly2:Tca_srcptr; len2:Tslong; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_poly_check_equal(poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_poly_check_is_zero(poly:Tca_poly_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
function ca_poly_check_is_one(poly:Tca_poly_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external libflint;
{ Arithmetic  }
procedure _ca_poly_shift_left(res:Tca_ptr; poly:Tca_srcptr; len:Tslong; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_shift_left(res:Tca_poly_t; poly:Tca_poly_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_shift_right(res:Tca_ptr; poly:Tca_srcptr; len:Tslong; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_shift_right(res:Tca_poly_t; poly:Tca_poly_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_neg(res:Tca_poly_t; src:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_add(res:Tca_ptr; poly1:Tca_srcptr; len1:Tslong; poly2:Tca_srcptr; len2:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_add(res:Tca_poly_t; poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_sub(res:Tca_ptr; poly1:Tca_srcptr; len1:Tslong; poly2:Tca_srcptr; len2:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_sub(res:Tca_poly_t; poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_mul(C:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; lenB:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_mul(res:Tca_poly_t; poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_mul_ca(res:Tca_poly_t; poly:Tca_poly_t; c:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_div_ca(res:Tca_poly_t; poly:Tca_poly_t; c:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ todo: improve, document  }
procedure ca_poly_div_fmpz(res:Tca_poly_t; poly:Tca_poly_t; c:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_mullow_same_nf(C:Tca_ptr; A:Tca_srcptr; Alen:Tslong; B:Tca_srcptr; Blen:Tslong; 
            len:Tslong; K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_mullow(C:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; lenB:Tslong; 
            n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_mullow(res:Tca_poly_t; poly1:Tca_poly_t; poly2:Tca_poly_t; n:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_divrem_basecase(Q:Tca_ptr; R:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; 
            lenB:Tslong; invB:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_poly_divrem_basecase(Q:Tca_poly_t; R:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure _ca_poly_divrem(Q:Tca_ptr; R:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; 
            lenB:Tslong; invB:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
function ca_poly_divrem(Q:Tca_poly_t; R:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_poly_div(Q:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_poly_rem(R:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure _ca_poly_pow_ui_trunc(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; exp:Tulong; len:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_pow_ui_trunc(res:Tca_poly_t; poly:Tca_poly_t; exp:Tulong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_pow_ui(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; exp:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_pow_ui(res:Tca_poly_t; poly:Tca_poly_t; exp:Tulong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Evaluation and composition  }
procedure _ca_poly_evaluate_horner(res:Tca_t; f:Tca_srcptr; len:Tslong; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_evaluate_horner(res:Tca_t; f:Tca_poly_t; a:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_evaluate(res:Tca_t; f:Tca_srcptr; len:Tslong; x:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_evaluate(res:Tca_t; f:Tca_poly_t; a:Tca_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_compose(res:Tca_ptr; poly1:Tca_srcptr; len1:Tslong; poly2:Tca_srcptr; len2:Tslong; 
            ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_compose(res:Tca_poly_t; poly1:Tca_poly_t; poly2:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Integral and derivative  }
procedure _ca_poly_derivative(res:Tca_ptr; poly:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_derivative(res:Tca_poly_t; poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_integral(res:Tca_ptr; poly:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_integral(res:Tca_poly_t; poly:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Greatest common divisor  }
function _ca_poly_gcd_euclidean(G:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; lenB:Tslong; 
           ctx:Tca_ctx_t):Tslong;cdecl;external libflint;
function ca_poly_gcd_euclidean(G:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function _ca_poly_gcd(G:Tca_ptr; A:Tca_srcptr; lenA:Tslong; B:Tca_srcptr; lenB:Tslong; 
           ctx:Tca_ctx_t):Tslong;cdecl;external libflint;
function ca_poly_gcd(G:Tca_poly_t; A:Tca_poly_t; B:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
{ Power series division  }
procedure _ca_poly_inv_series(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_inv_series(res:Tca_poly_t; f:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_div_series(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; g:Tca_srcptr; glen:Tslong; 
            len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_div_series(res:Tca_poly_t; f:Tca_poly_t; g:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Elementary functions  }
procedure _ca_poly_exp_series(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_exp_series(res:Tca_poly_t; f:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_log_series(res:Tca_ptr; f:Tca_srcptr; flen:Tslong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_log_series(res:Tca_poly_t; f:Tca_poly_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
{ Vectors of polynomials  }
function _ca_poly_vec_init(len:Tslong; ctx:Tca_ctx_t):Pca_poly_struct;cdecl;external libflint;
procedure ca_poly_vec_init(res:Tca_poly_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_vec_fit_length(vec:Tca_poly_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_vec_set_length(vec:Tca_poly_vec_t; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure _ca_poly_vec_clear(v:Pca_poly_struct; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_vec_clear(vec:Tca_poly_vec_t; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_vec_append(vec:Tca_poly_vec_t; f:Tca_poly_t; ctx:Tca_ctx_t);cdecl;external libflint;
{ Roots and factorization  }
function ca_poly_factor_squarefree(c:Tca_t; fac:Tca_poly_vec_t; exp:Pulong; F:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_poly_squarefree_part(res:Tca_poly_t; poly:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
procedure _ca_poly_set_roots(poly:Tca_ptr; roots:Tca_srcptr; exp:Pulong; len:Tslong; ctx:Tca_ctx_t);cdecl;external libflint;
procedure ca_poly_set_roots(poly:Tca_poly_t; roots:Tca_vec_t; exp:Pulong; ctx:Tca_ctx_t);cdecl;external libflint;
function _ca_poly_roots(roots:Tca_ptr; poly:Tca_srcptr; len:Tslong; ctx:Tca_ctx_t):longint;cdecl;external libflint;
function ca_poly_roots(roots:Tca_vec_t; exp:Pulong; poly:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external libflint;
{$endif}

// === Konventiert am: 29-8-26 20:08:36 ===


implementation



end.
