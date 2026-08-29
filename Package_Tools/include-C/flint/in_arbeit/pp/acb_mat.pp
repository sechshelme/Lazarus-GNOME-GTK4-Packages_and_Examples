
unit acb_mat;
interface

{
  Automatically converted by H2Pas 1.0.0 from acb_mat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    acb_mat.h
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
Pslong  = ^slong;
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
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function acb_mat_entry(mat,i,j : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_mat_nrows(mat : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_mat_ncols(mat : longint) : longint;

function acb_mat_entry_ptr(mat:Tacb_mat_t; i:Tslong; j:Tslong):Tacb_ptr;cdecl;external;
{ Memory management  }
procedure acb_mat_init(mat:Tacb_mat_t; r:Tslong; c:Tslong);cdecl;external;
procedure acb_mat_clear(mat:Tacb_mat_t);cdecl;external;
procedure acb_mat_swap(mat1:Tacb_mat_t; mat2:Tacb_mat_t);cdecl;external;
procedure acb_mat_swap_entrywise(mat1:Tacb_mat_t; mat2:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_window_init(window:Tacb_mat_t; mat:Tacb_mat_t; r1:Tslong; c1:Tslong; r2:Tslong; 
            c2:Tslong);cdecl;external;
{
ARB_MAT_INLINE void
acb_mat_window_clear(acb_mat_t window)

    flint_free(window->rows);

 }
{ Conversions  }
(* Const before type ignored *)
procedure acb_mat_set(dest:Tacb_mat_t; src:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_set_fmpz_mat(dest:Tacb_mat_t; src:Tfmpz_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_set_round_fmpz_mat(dest:Tacb_mat_t; src:Tfmpz_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_set_fmpq_mat(dest:Tacb_mat_t; src:Tfmpq_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_set_arb_mat(dest:Tacb_mat_t; src:Tarb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_set_round_arb_mat(dest:Tacb_mat_t; src:Tarb_mat_t; prec:Tslong);cdecl;external;
{ Random generation  }
procedure acb_mat_randtest(mat:Tacb_mat_t; state:Tflint_rand_t; prec:Tslong; mag_bits:Tslong);cdecl;external;
procedure acb_mat_randtest_eig(A:Tacb_mat_t; state:Tflint_rand_t; E:Tacb_srcptr; prec:Tslong);cdecl;external;
{ I/O  }
{$ifdef FLINT_HAVE_FILE}
(* Const before type ignored *)
procedure acb_mat_fprintd(file:PFILE; mat:Tacb_mat_t; digits:Tslong);cdecl;external;
{$endif}
(* Const before type ignored *)

procedure acb_mat_printd(mat:Tacb_mat_t; digits:Tslong);cdecl;external;
{ Comparisons  }
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eq(mat1:Tacb_mat_t; mat2:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_ne(mat1:Tacb_mat_t; mat2:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_equal(mat1:Tacb_mat_t; mat2:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_overlaps(mat1:Tacb_mat_t; mat2:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_contains(mat1:Tacb_mat_t; mat2:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_contains_fmpq_mat(mat1:Tacb_mat_t; mat2:Tfmpq_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_contains_fmpz_mat(mat1:Tacb_mat_t; mat2:Tfmpz_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_real(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_empty(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_square(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_exact(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_zero(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_finite(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_triu(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_tril(mat:Tacb_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_is_diag(mat:Tacb_mat_t):longint;cdecl;external;
{ Radius and interval operations  }
(* Const before type ignored *)
procedure acb_mat_get_mid(B:Tacb_mat_t; A:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_add_error_mag(mat:Tacb_mat_t; err:Tmag_t);cdecl;external;
{ Special matrices  }
procedure acb_mat_zero(mat:Tacb_mat_t);cdecl;external;
procedure acb_mat_one(mat:Tacb_mat_t);cdecl;external;
procedure acb_mat_ones(mat:Tacb_mat_t);cdecl;external;
procedure acb_mat_indeterminate(mat:Tacb_mat_t);cdecl;external;
procedure acb_mat_dft(res:Tacb_mat_t; kind:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_transpose(mat1:Tacb_mat_t; mat2:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_conjugate(mat1:Tacb_mat_t; mat2:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_conjugate_transpose(mat1:Tacb_mat_t; mat2:Tacb_mat_t);cdecl;external;
{ Norms  }
(* Const before type ignored *)
procedure acb_mat_bound_inf_norm(b:Tmag_t; A:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_frobenius_norm(res:Tarb_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_bound_frobenius_norm(b:Tmag_t; A:Tacb_mat_t);cdecl;external;
{ Arithmetic  }
(* Const before type ignored *)
procedure acb_mat_neg(dest:Tacb_mat_t; src:Tacb_mat_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_add(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_sub(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_mul_classical(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_mul_threaded(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_mul_reorder(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_mul(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_mul_entrywise(res:Tacb_mat_t; mat1:Tacb_mat_t; mat2:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_sqr_classical(res:Tacb_mat_t; mat:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_sqr(res:Tacb_mat_t; mat:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_pow_ui(B:Tacb_mat_t; A:Tacb_mat_t; exp:Tulong; prec:Tslong);cdecl;external;
{ Scalar arithmetic  }
(* Const before type ignored *)
procedure acb_mat_scalar_mul_2exp_si(B:Tacb_mat_t; A:Tacb_mat_t; c:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_scalar_addmul_si(B:Tacb_mat_t; A:Tacb_mat_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_scalar_mul_si(B:Tacb_mat_t; A:Tacb_mat_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_scalar_div_si(B:Tacb_mat_t; A:Tacb_mat_t; c:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_addmul_fmpz(B:Tacb_mat_t; A:Tacb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_mul_fmpz(B:Tacb_mat_t; A:Tacb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_div_fmpz(B:Tacb_mat_t; A:Tacb_mat_t; c:Tfmpz_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_addmul_acb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_mul_acb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_div_acb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tacb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_addmul_arb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_mul_arb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_scalar_div_arb(B:Tacb_mat_t; A:Tacb_mat_t; c:Tarb_t; prec:Tslong);cdecl;external;
{ Solving  }
procedure acb_mat_swap_rows(mat:Tacb_mat_t; perm:Pslong; r:Tslong; s:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_mat_find_pivot_partial(mat:Tacb_mat_t; start_row:Tslong; end_row:Tslong; c:Tslong):Tslong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_tril_classical(X:Tacb_mat_t; L:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_tril_recursive(X:Tacb_mat_t; L:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_tril(X:Tacb_mat_t; L:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_triu_classical(X:Tacb_mat_t; U:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_triu_recursive(X:Tacb_mat_t; U:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_triu(X:Tacb_mat_t; U:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_mat_lu_classical(P:Pslong; LU:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_lu_recursive(P:Pslong; LU:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_lu(P:Pslong; LU:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_solve_lu_precomp(X:Tacb_mat_t; perm:Pslong; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_solve_lu(X:Tacb_mat_t; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_solve(X:Tacb_mat_t; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_solve_precond(X:Tacb_mat_t; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_approx_mul(C:Tacb_mat_t; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_approx_solve_triu(X:Tacb_mat_t; U:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_approx_solve_tril(X:Tacb_mat_t; L:Tacb_mat_t; B:Tacb_mat_t; unit:longint; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_mat_approx_lu(P:Pslong; LU:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_approx_solve_lu_precomp(X:Tacb_mat_t; perm:Pslong; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_approx_solve(X:Tacb_mat_t; A:Tacb_mat_t; B:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_approx_inv(X:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
function acb_mat_inv(X:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
procedure acb_mat_det_lu(det:Tacb_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_det_precond(det:Tacb_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_det(det:Tacb_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
{ Eigenvalues and eigenvectors  }
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_approx_eig_qr(E:Tacb_ptr; L:Tacb_mat_t; R:Tacb_mat_t; A:Tacb_mat_t; tol:Tmag_t; 
           maxiter:Tslong; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_eig_global_enclosure(eps:Tmag_t; A:Tacb_mat_t; E:Tacb_srcptr; R:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure acb_mat_eig_enclosure_rump(lambda:Tacb_t; J:Tacb_mat_t; X:Tacb_mat_t; A:Tacb_mat_t; lambda_approx:Tacb_t; 
            X_approx:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eig_simple_rump(E:Tacb_ptr; L:Tacb_mat_t; R:Tacb_mat_t; A:Tacb_mat_t; E_approx:Tacb_srcptr; 
           R_approx:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eig_simple_vdhoeven_mourrain(E:Tacb_ptr; L:Tacb_mat_t; R:Tacb_mat_t; A:Tacb_mat_t; E_approx:Tacb_srcptr; 
           R_approx:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eig_simple(E:Tacb_ptr; L:Tacb_mat_t; R:Tacb_mat_t; A:Tacb_mat_t; E_approx:Tacb_srcptr; 
           R_approx:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eig_multiple_rump(E:Tacb_ptr; A:Tacb_mat_t; E_approx:Tacb_srcptr; R_approx:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function acb_mat_eig_multiple(E:Tacb_ptr; A:Tacb_mat_t; E_approx:Tacb_srcptr; R_approx:Tacb_mat_t; prec:Tslong):longint;cdecl;external;
{ Special functions  }
(* Const before type ignored *)
procedure acb_mat_exp_taylor_sum(S:Tacb_mat_t; A:Tacb_mat_t; N:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_exp(B:Tacb_mat_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_mat_charpoly(poly:Tacb_ptr; mat:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_charpoly(poly:Tacb_poly_t; mat:Tacb_mat_t; prec:Tslong);cdecl;external;
procedure _acb_mat_companion(mat:Tacb_mat_t; poly:Tacb_srcptr; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_companion(mat:Tacb_mat_t; poly:Tacb_poly_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_trace(trace:Tacb_t; mat:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure _acb_mat_diag_prod(res:Tacb_t; A:Tacb_mat_t; a:Tslong; b:Tslong; prec:Tslong);cdecl;external;
(* Const before type ignored *)
procedure acb_mat_diag_prod(res:Tacb_t; A:Tacb_mat_t; prec:Tslong);cdecl;external;
(* Const before type ignored *)
function acb_mat_allocated_bytes(x:Tacb_mat_t):Tslong;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_mat_entry(mat,i,j : longint) : longint;
begin
  acb_mat_entry:=(mat^.(rows[i]))+j;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_mat_nrows(mat : longint) : longint;
begin
  acb_mat_nrows:=mat^.r;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function acb_mat_ncols(mat : longint) : longint;
begin
  acb_mat_ncols:=mat^.c;
end;


end.
