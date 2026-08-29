
unit ca_mat;
interface

{
  Automatically converted by H2Pas 1.0.0 from ca_mat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ca_mat.h
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
Pca_mat_struct  = ^ca_mat_struct;
Pca_mat_t  = ^ca_mat_t;
Pca_ptr  = ^ca_ptr;
Pslong  = ^slong;
Pulong  = ^ulong;
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
{$ifndef CA_MAT_H}
{$define CA_MAT_H}
{ Matrix object  }
type
  Pca_mat_struct = ^Tca_mat_struct;
  Tca_mat_struct = record
      entries : Tca_ptr;
      r : Tslong;
      c : Tslong;
      rows : Pca_ptr;
    end;

  Pca_mat_t = ^Tca_mat_t;
  Tca_mat_t = array[0..0] of Tca_mat_struct;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ca_mat_entry(mat,i,j : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ca_mat_nrows(mat : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ca_mat_ncols(mat : longint) : longint;

function ca_mat_entry_ptr(mat:Tca_mat_t; i:Tslong; j:Tslong):Tca_ptr;cdecl;external;
{ Memory management  }
procedure ca_mat_init(mat:Tca_mat_t; r:Tslong; c:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_clear(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_swap(mat1:Tca_mat_t; mat2:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Window matrices  }
(* Const before type ignored *)
procedure ca_mat_window_init(window:Tca_mat_t; mat:Tca_mat_t; r1:Tslong; c1:Tslong; r2:Tslong; 
            c2:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_window_clear(window:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Shape  }
(* Const before type ignored *)
function ca_mat_is_empty(mat:Tca_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_is_square(mat:Tca_mat_t):longint;cdecl;external;
{ Conversions  }
(* Const before type ignored *)
procedure ca_mat_set(dest:Tca_mat_t; src:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_set_fmpz_mat(dest:Tca_mat_t; src:Tfmpz_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_set_fmpq_mat(dest:Tca_mat_t; src:Tfmpq_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_set_ca(y:Tca_mat_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_transfer(res:Tca_mat_t; res_ctx:Tca_ctx_t; src:Tca_mat_t; src_ctx:Tca_ctx_t);cdecl;external;
{ Random generation  }
procedure ca_mat_randtest(mat:Tca_mat_t; state:Tflint_rand_t; len:Tslong; bits:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_randtest_rational(mat:Tca_mat_t; state:Tflint_rand_t; bits:Tslong; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_randops(mat:Tca_mat_t; state:Tflint_rand_t; count:Tslong; ctx:Tca_ctx_t);cdecl;external;
{ I/O  }
(* Const before type ignored *)
procedure ca_mat_print(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_printn(mat:Tca_mat_t; digits:Tslong; ctx:Tca_ctx_t);cdecl;external;
{ Special matrices  }
procedure ca_mat_zero(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_one(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_ones(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_pascal(mat:Tca_mat_t; triangular:longint; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_stirling(mat:Tca_mat_t; kind:longint; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_hilbert(mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
procedure ca_mat_dft(res:Tca_mat_t; _type:longint; ctx:Tca_ctx_t);cdecl;external;
{ Comparisons and properties  }
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_check_equal(A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
function ca_mat_check_is_zero(A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
function ca_mat_check_is_one(A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
{ Conjugate and transpose  }
(* Const before type ignored *)
procedure ca_mat_transpose(B:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_conj(B:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_conj_transpose(mat1:Tca_mat_t; mat2:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Arithmetic  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_add_ca(y:Tca_mat_t; a:Tca_mat_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_sub_ca(y:Tca_mat_t; a:Tca_mat_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_addmul_ca(y:Tca_mat_t; a:Tca_mat_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_submul_ca(y:Tca_mat_t; a:Tca_mat_t; x:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_neg(dest:Tca_mat_t; src:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_add(res:Tca_mat_t; mat1:Tca_mat_t; mat2:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_sub(res:Tca_mat_t; mat1:Tca_mat_t; mat2:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul(C:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul_classical(C:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul_same_nf(C:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; K:Tca_field_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_mul_si(B:Tca_mat_t; A:Tca_mat_t; c:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul_fmpz(B:Tca_mat_t; A:Tca_mat_t; c:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul_fmpq(B:Tca_mat_t; A:Tca_mat_t; c:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_mul_ca(B:Tca_mat_t; A:Tca_mat_t; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_div_si(B:Tca_mat_t; A:Tca_mat_t; c:Tslong; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_div_fmpz(B:Tca_mat_t; A:Tca_mat_t; c:Tfmpz_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_div_fmpq(B:Tca_mat_t; A:Tca_mat_t; c:Tfmpq_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_div_ca(B:Tca_mat_t; A:Tca_mat_t; c:Tca_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_sqr(res:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_pow_ui_binexp(B:Tca_mat_t; A:Tca_mat_t; exp:Tulong; ctx:Tca_ctx_t);cdecl;external;
{ Polynomial evaluation  }
(* Const before type ignored *)
procedure _ca_mat_ca_poly_evaluate(y:Tca_mat_t; poly:Tca_srcptr; len:Tslong; x:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_ca_poly_evaluate(res:Tca_mat_t; f:Tca_poly_t; a:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Trace  }
(* Const before type ignored *)
procedure ca_mat_trace(trace:Tca_t; mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Gaussian elimination, solving and inverse  }
function ca_mat_find_pivot(pivot_row:Pslong; mat:Tca_mat_t; start_row:Tslong; end_row:Tslong; column:Tslong; 
           ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
procedure _ca_mat_swap_rows(mat:Tca_mat_t; perm:Pslong; r:Tslong; s:Tslong);cdecl;external;
(* Const before type ignored *)
function ca_mat_lu_classical(rank:Pslong; P:Pslong; LU:Tca_mat_t; A:Tca_mat_t; rank_check:longint; 
           ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_lu_recursive(rank:Pslong; P:Pslong; LU:Tca_mat_t; A:Tca_mat_t; rank_check:longint; 
           ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_lu(rank:Pslong; P:Pslong; LU:Tca_mat_t; A:Tca_mat_t; rank_check:longint; 
           ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_fflu(rank:Pslong; P:Pslong; LU:Tca_mat_t; den:Tca_t; A:Tca_mat_t; 
           rank_check:longint; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_rref_fflu(rank:Pslong; R:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_rref_lu(rank:Pslong; R:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_rref(rank:Pslong; R:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_nonsingular_lu(P:Pslong; LU:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
function ca_mat_nonsingular_fflu(P:Pslong; LU:Tca_mat_t; den:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_nonsingular_solve_adjugate(X:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_nonsingular_solve_fflu(X:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_nonsingular_solve_lu(X:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_nonsingular_solve(X:Tca_mat_t; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
function ca_mat_inv(X:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_tril_classical(X:Tca_mat_t; L:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_tril_recursive(X:Tca_mat_t; L:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_tril(X:Tca_mat_t; L:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_triu_classical(X:Tca_mat_t; U:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_triu_recursive(X:Tca_mat_t; U:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_triu(X:Tca_mat_t; U:Tca_mat_t; B:Tca_mat_t; unit:longint; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_lu_precomp(X:Tca_mat_t; perm:Pslong; A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ca_mat_solve_fflu_precomp(X:Tca_mat_t; perm:Pslong; A:Tca_mat_t; den:Tca_t; B:Tca_mat_t; 
            ctx:Tca_ctx_t);cdecl;external;
{ Rank and kernel  }
(* Const before type ignored *)
function ca_mat_rank(rank:Pslong; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_right_kernel(X:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
{ Determinant  }
(* Const before type ignored *)
procedure ca_mat_det_berkowitz(det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
function ca_mat_det_lu(det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_det_bareiss(det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
procedure ca_mat_det_cofactor(det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_det(det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_adjugate_cofactor(adj:Tca_mat_t; det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_adjugate_charpoly(adj:Tca_mat_t; det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_adjugate(adj:Tca_mat_t; det:Tca_t; A:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
{ Characteristic polynomial  }
(* Const before type ignored *)
procedure _ca_mat_charpoly_berkowitz(cp:Tca_ptr; mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_charpoly_berkowitz(cp:Tca_poly_t; mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
function _ca_mat_charpoly_danilevsky(p:Tca_ptr; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_charpoly_danilevsky(cp:Tca_poly_t; mat:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
procedure _ca_mat_charpoly(cp:Tca_ptr; mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
procedure ca_mat_charpoly(cp:Tca_poly_t; mat:Tca_mat_t; ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
function ca_mat_companion(A:Tca_mat_t; poly:Tca_poly_t; ctx:Tca_ctx_t):longint;cdecl;external;
{ Eigenvalues and eigenvectors  }
(* Const before type ignored *)
function ca_mat_eigenvalues(lambda:Tca_vec_t; exp:Pulong; mat:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
{ Diagonalization  }
(* Const before type ignored *)
function ca_mat_diagonalization(D:Tca_mat_t; P:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
(* Const before type ignored *)
procedure ca_mat_set_jordan_blocks(mat:Tca_mat_t; lambda:Tca_vec_t; num_blocks:Tslong; block_lambda:Pslong; block_size:Pslong; 
            ctx:Tca_ctx_t);cdecl;external;
(* Const before type ignored *)
function ca_mat_jordan_blocks(lambda:Tca_vec_t; num_blocks:Pslong; block_lambda:Pslong; block_size:Pslong; A:Tca_mat_t; 
           ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_mat_jordan_transformation(mat:Tca_mat_t; lambda:Tca_vec_t; num_blocks:Tslong; block_lambda:Pslong; block_size:Pslong; 
           A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_jordan_form(J:Tca_mat_t; P:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
{ Matrix functions  }
(* Const before type ignored *)
function ca_mat_exp(res:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):longint;cdecl;external;
(* Const before type ignored *)
function ca_mat_log(res:Tca_mat_t; A:Tca_mat_t; ctx:Tca_ctx_t):Ttruth_t;cdecl;external;
{ Internal representation  }
{ todo: document, make consistent  }
(* Const before type ignored *)
function _ca_mat_same_field(A:Tca_mat_t; ctx:Tca_ctx_t):Tca_field_ptr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _ca_mat_same_field2(A:Tca_mat_t; B:Tca_mat_t; ctx:Tca_ctx_t):Tca_field_ptr;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ca_mat_entry(mat,i,j : longint) : longint;
begin
  ca_mat_entry:=(mat^.(rows[i]))+j;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ca_mat_nrows(mat : longint) : longint;
begin
  ca_mat_nrows:=mat^.r;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ca_mat_ncols(mat : longint) : longint;
begin
  ca_mat_ncols:=mat^.c;
end;


end.
