{$IFDEF read_interface}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef ARB_MAT_H}
{$define ARB_MAT_H}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function arb_mat_entry(mat,i,j : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_mat_nrows(mat : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_mat_ncols(mat : longint) : longint;

function arb_mat_entry_ptr(mat:Tarb_mat_t; i:Tslong; j:Tslong):Tarb_ptr;cdecl;external libflint;
{ Memory management  }
procedure arb_mat_init(mat:Tarb_mat_t; r:Tslong; c:Tslong);cdecl;external libflint;
procedure arb_mat_clear(mat:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_swap(mat1:Tarb_mat_t; mat2:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_swap_entrywise(mat1:Tarb_mat_t; mat2:Tarb_mat_t);cdecl;external libflint;
{ Window matrices  }
procedure arb_mat_window_init(window:Tarb_mat_t; mat:Tarb_mat_t; r1:Tslong; c1:Tslong; r2:Tslong; 
            c2:Tslong);cdecl;external libflint;
procedure arb_mat_window_clear(window:Tarb_mat_t);cdecl;external libflint;
{ Conversions  }
procedure arb_mat_set(dest:Tarb_mat_t; src:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_set_fmpz_mat(dest:Tarb_mat_t; src:Tfmpz_mat_t);cdecl;external libflint;
procedure arb_mat_set_round_fmpz_mat(dest:Tarb_mat_t; src:Tfmpz_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_set_fmpq_mat(dest:Tarb_mat_t; src:Tfmpq_mat_t; prec:Tslong);cdecl;external libflint;
{ Random generation  }
procedure arb_mat_randtest(mat:Tarb_mat_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external libflint;
{ I/O  }
{$ifdef FLINT_HAVE_FILE}
procedure arb_mat_fprintd(file:PFILE; mat:Tarb_mat_t; digits:Tslong);cdecl;external libflint;
{$endif}

procedure arb_mat_printd(mat:Tarb_mat_t; digits:Tslong);cdecl;external libflint;
{ Comparisons  }
function arb_mat_eq(mat1:Tarb_mat_t; mat2:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_ne(mat1:Tarb_mat_t; mat2:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_equal(mat1:Tarb_mat_t; mat2:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_overlaps(mat1:Tarb_mat_t; mat2:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_contains(mat1:Tarb_mat_t; mat2:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_contains_fmpq_mat(mat1:Tarb_mat_t; mat2:Tfmpq_mat_t):longint;cdecl;external libflint;
function arb_mat_contains_fmpz_mat(mat1:Tarb_mat_t; mat2:Tfmpz_mat_t):longint;cdecl;external libflint;
function arb_mat_is_empty(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_square(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_exact(A:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_zero(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_finite(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_triu(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_tril(mat:Tarb_mat_t):longint;cdecl;external libflint;
function arb_mat_is_diag(mat:Tarb_mat_t):longint;cdecl;external libflint;
{ Radius and interval operations  }
procedure arb_mat_get_mid(B:Tarb_mat_t; A:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_add_error_mag(mat:Tarb_mat_t; err:Tmag_t);cdecl;external libflint;
{ Special matrices  }
procedure arb_mat_zero(mat:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_one(mat:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_ones(mat:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_indeterminate(mat:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_hilbert(mat:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_pascal(mat:Tarb_mat_t; triangular:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_stirling(mat:Tarb_mat_t; kind:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_dct(mat:Tarb_mat_t; _type:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_transpose(mat1:Tarb_mat_t; mat2:Tarb_mat_t);cdecl;external libflint;
{ Norms  }
procedure arb_mat_bound_inf_norm(b:Tmag_t; A:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_frobenius_norm(res:Tarb_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_bound_frobenius_norm(b:Tmag_t; A:Tarb_mat_t);cdecl;external libflint;
{ Arithmetic  }
procedure arb_mat_neg(dest:Tarb_mat_t; src:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_add(res:Tarb_mat_t; mat1:Tarb_mat_t; mat2:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_sub(res:Tarb_mat_t; mat1:Tarb_mat_t; mat2:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_mul(res:Tarb_mat_t; mat1:Tarb_mat_t; mat2:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_mul_classical(C:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_mul_threaded(C:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure _arb_mat_addmul_rad_mag_fast(C:Tarb_mat_t; A:Tmag_srcptr; B:Tmag_srcptr; ar:Tslong; ac:Tslong; 
            bc:Tslong);cdecl;external libflint;
procedure arb_mat_mul_block(C:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_mul_entrywise(res:Tarb_mat_t; mat1:Tarb_mat_t; mat2:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_sqr_classical(B:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_sqr(B:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_pow_ui(B:Tarb_mat_t; A:Tarb_mat_t; exp:Tulong; prec:Tslong);cdecl;external libflint;
{ Scalar arithmetic  }
procedure arb_mat_scalar_mul_2exp_si(B:Tarb_mat_t; A:Tarb_mat_t; c:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_addmul_si(B:Tarb_mat_t; A:Tarb_mat_t; c:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_mul_si(B:Tarb_mat_t; A:Tarb_mat_t; c:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_div_si(B:Tarb_mat_t; A:Tarb_mat_t; c:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_addmul_fmpz(B:Tarb_mat_t; A:Tarb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_mul_fmpz(B:Tarb_mat_t; A:Tarb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_div_fmpz(B:Tarb_mat_t; A:Tarb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_addmul_arb(B:Tarb_mat_t; A:Tarb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_mul_arb(B:Tarb_mat_t; A:Tarb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_scalar_div_arb(B:Tarb_mat_t; A:Tarb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external libflint;
{ Solving  }
procedure arb_mat_swap_rows(mat:Tarb_mat_t; perm:Pslong; r:Tslong; s:Tslong);cdecl;external libflint;
function arb_mat_find_pivot_partial(mat:Tarb_mat_t; start_row:Tslong; end_row:Tslong; c:Tslong):Tslong;cdecl;external libflint;
procedure arb_mat_solve_tril_classical(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_solve_tril_recursive(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_solve_tril(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_solve_triu_classical(X:Tarb_mat_t; U:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_solve_triu_recursive(X:Tarb_mat_t; U:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_solve_triu(X:Tarb_mat_t; U:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
function arb_mat_lu_classical(P:Pslong; LU:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_lu_recursive(P:Pslong; LU:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_lu(P:Pslong; LU:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_solve_lu_precomp(X:Tarb_mat_t; perm:Pslong; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
function arb_mat_solve(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_solve_lu(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_solve_precond(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_solve_preapprox(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; R:Tarb_mat_t; T:Tarb_mat_t; 
           prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_approx_mul(C:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_approx_solve_triu(X:Tarb_mat_t; U:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
procedure arb_mat_approx_solve_tril(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; unit:longint; prec:Tslong);cdecl;external libflint;
function arb_mat_approx_lu(P:Pslong; LU:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_approx_solve_lu_precomp(X:Tarb_mat_t; perm:Pslong; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
function arb_mat_approx_solve(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_approx_inv(X:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_inv(X:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_det_lu(det:Tarb_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_det_precond(det:Tarb_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_det(det:Tarb_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
function _arb_mat_cholesky_banachiewicz(A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_cho(L:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_solve_cho_precomp(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_inv_cho_precomp(X:Tarb_mat_t; L:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
function arb_mat_spd_solve(X:Tarb_mat_t; A:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_spd_inv(X:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function _arb_mat_ldl_inplace(A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function _arb_mat_ldl_golub_and_van_loan(A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
function arb_mat_ldl(L:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong):longint;cdecl;external libflint;
procedure arb_mat_solve_ldl_precomp(X:Tarb_mat_t; L:Tarb_mat_t; B:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_inv_ldl_precomp(X:Tarb_mat_t; L:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
{ Special functions  }
procedure arb_mat_exp_taylor_sum(S:Tarb_mat_t; A:Tarb_mat_t; N:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_mat_exp(B:Tarb_mat_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure _arb_mat_charpoly(poly:Tarb_ptr; mat:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_charpoly(poly:Tarb_poly_t; mat:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure _arb_mat_companion(mat:Tarb_mat_t; poly:Tarb_srcptr; prec:Tslong);cdecl;external libflint;
procedure arb_mat_companion(mat:Tarb_mat_t; poly:Tarb_poly_t; prec:Tslong);cdecl;external libflint;
procedure arb_mat_trace(trace:Tarb_t; mat:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
procedure _arb_mat_diag_prod(res:Tarb_t; A:Tarb_mat_t; a:Tslong; b:Tslong; prec:Tslong);cdecl;external libflint;
procedure arb_mat_diag_prod(res:Tarb_t; A:Tarb_mat_t; prec:Tslong);cdecl;external libflint;
{ Sparsity structure  }
procedure arb_mat_entrywise_is_zero(dest:Tfmpz_mat_t; src:Tarb_mat_t);cdecl;external libflint;
procedure arb_mat_entrywise_not_is_zero(dest:Tfmpz_mat_t; src:Tarb_mat_t);cdecl;external libflint;
function arb_mat_count_is_zero(mat:Tarb_mat_t):Tslong;cdecl;external libflint;
function arb_mat_count_not_is_zero(mat:Tarb_mat_t):Tslong;cdecl;external libflint;
function arb_mat_allocated_bytes(x:Tarb_mat_t):Tslong;cdecl;external libflint;

// === Konventiert am: 29-8-26 17:30:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_mat_entry(mat,i,j : longint) : longint;
begin
  arb_mat_entry:=(mat^.(rows[i]))+j;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_mat_nrows(mat : longint) : longint;
begin
  arb_mat_nrows:=mat^.r;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function arb_mat_ncols(mat : longint) : longint;
begin
  arb_mat_ncols:=mat^.c;
end;


{$ENDIF read_implementation}
