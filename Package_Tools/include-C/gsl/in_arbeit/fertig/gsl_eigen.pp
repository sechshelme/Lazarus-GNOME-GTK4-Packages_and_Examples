
unit gsl_eigen;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_eigen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_eigen.h
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
Pdouble  = ^double;
Pdword  = ^dword;
Pgsl_complex  = ^gsl_complex;
Pgsl_eigen_francis_workspace  = ^gsl_eigen_francis_workspace;
Pgsl_eigen_gen_workspace  = ^gsl_eigen_gen_workspace;
Pgsl_eigen_genherm_workspace  = ^gsl_eigen_genherm_workspace;
Pgsl_eigen_genhermv_workspace  = ^gsl_eigen_genhermv_workspace;
Pgsl_eigen_gensymm_workspace  = ^gsl_eigen_gensymm_workspace;
Pgsl_eigen_gensymmv_workspace  = ^gsl_eigen_gensymmv_workspace;
Pgsl_eigen_genv_workspace  = ^gsl_eigen_genv_workspace;
Pgsl_eigen_herm_workspace  = ^gsl_eigen_herm_workspace;
Pgsl_eigen_hermv_workspace  = ^gsl_eigen_hermv_workspace;
Pgsl_eigen_nonsymm_workspace  = ^gsl_eigen_nonsymm_workspace;
Pgsl_eigen_nonsymmv_workspace  = ^gsl_eigen_nonsymmv_workspace;
Pgsl_eigen_sort_t  = ^gsl_eigen_sort_t;
Pgsl_eigen_symm_workspace  = ^gsl_eigen_symm_workspace;
Pgsl_eigen_symmv_workspace  = ^gsl_eigen_symmv_workspace;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_matrix_complex  = ^gsl_matrix_complex;
Pgsl_vector  = ^gsl_vector;
Pgsl_vector_complex  = ^gsl_vector_complex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ eigen/gsl_eigen.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2006, 2007 Gerard Jungman, Brian Gough, Patrick Alken
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_EIGEN_H__}
{$define __GSL_EIGEN_H__}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
type
  Pgsl_eigen_symm_workspace = ^Tgsl_eigen_symm_workspace;
  Tgsl_eigen_symm_workspace = record
      size : Tsize_t;
      d : Pdouble;
      sd : Pdouble;
    end;
(* Const before type ignored *)

function gsl_eigen_symm_alloc(n:Tsize_t):Pgsl_eigen_symm_workspace;cdecl;external;
procedure gsl_eigen_symm_free(w:Pgsl_eigen_symm_workspace);cdecl;external;
function gsl_eigen_symm(A:Pgsl_matrix; eval:Pgsl_vector; w:Pgsl_eigen_symm_workspace):longint;cdecl;external;
type
  Pgsl_eigen_symmv_workspace = ^Tgsl_eigen_symmv_workspace;
  Tgsl_eigen_symmv_workspace = record
      size : Tsize_t;
      d : Pdouble;
      sd : Pdouble;
      gc : Pdouble;
      gs : Pdouble;
    end;
(* Const before type ignored *)

function gsl_eigen_symmv_alloc(n:Tsize_t):Pgsl_eigen_symmv_workspace;cdecl;external;
procedure gsl_eigen_symmv_free(w:Pgsl_eigen_symmv_workspace);cdecl;external;
function gsl_eigen_symmv(A:Pgsl_matrix; eval:Pgsl_vector; evec:Pgsl_matrix; w:Pgsl_eigen_symmv_workspace):longint;cdecl;external;
type
  Pgsl_eigen_herm_workspace = ^Tgsl_eigen_herm_workspace;
  Tgsl_eigen_herm_workspace = record
      size : Tsize_t;
      d : Pdouble;
      sd : Pdouble;
      tau : Pdouble;
    end;
(* Const before type ignored *)

function gsl_eigen_herm_alloc(n:Tsize_t):Pgsl_eigen_herm_workspace;cdecl;external;
procedure gsl_eigen_herm_free(w:Pgsl_eigen_herm_workspace);cdecl;external;
function gsl_eigen_herm(A:Pgsl_matrix_complex; eval:Pgsl_vector; w:Pgsl_eigen_herm_workspace):longint;cdecl;external;
type
  Pgsl_eigen_hermv_workspace = ^Tgsl_eigen_hermv_workspace;
  Tgsl_eigen_hermv_workspace = record
      size : Tsize_t;
      d : Pdouble;
      sd : Pdouble;
      tau : Pdouble;
      gc : Pdouble;
      gs : Pdouble;
    end;
(* Const before type ignored *)

function gsl_eigen_hermv_alloc(n:Tsize_t):Pgsl_eigen_hermv_workspace;cdecl;external;
procedure gsl_eigen_hermv_free(w:Pgsl_eigen_hermv_workspace);cdecl;external;
function gsl_eigen_hermv(A:Pgsl_matrix_complex; eval:Pgsl_vector; evec:Pgsl_matrix_complex; w:Pgsl_eigen_hermv_workspace):longint;cdecl;external;
{ matrix size  }
{ max iterations since last eigenvalue found  }
{ number of iterations since last eigenvalue found  }
{ number of eigenvalues found so far  }
{ compute Schur form T = Z^t A Z  }
{ pointer to Hessenberg matrix  }
{ pointer to Schur vector matrix  }
type
  Pgsl_eigen_francis_workspace = ^Tgsl_eigen_francis_workspace;
  Tgsl_eigen_francis_workspace = record
      size : Tsize_t;
      max_iterations : Tsize_t;
      n_iter : Tsize_t;
      n_evals : Tsize_t;
      compute_t : longint;
      H : Pgsl_matrix;
      Z : Pgsl_matrix;
    end;

function gsl_eigen_francis_alloc:Pgsl_eigen_francis_workspace;cdecl;external;
procedure gsl_eigen_francis_free(w:Pgsl_eigen_francis_workspace);cdecl;external;
(* Const before type ignored *)
procedure gsl_eigen_francis_T(compute_t:longint; w:Pgsl_eigen_francis_workspace);cdecl;external;
function gsl_eigen_francis(H:Pgsl_matrix; eval:Pgsl_vector_complex; w:Pgsl_eigen_francis_workspace):longint;cdecl;external;
function gsl_eigen_francis_Z(H:Pgsl_matrix; eval:Pgsl_vector_complex; Z:Pgsl_matrix; w:Pgsl_eigen_francis_workspace):longint;cdecl;external;
{ size of matrices  }
{ diagonal matrix elements from balancing  }
{ Householder coefficients  }
{ pointer to Z matrix  }
{ perform balancing transformation?  }
{ number of eigenvalues found  }
type
  Pgsl_eigen_nonsymm_workspace = ^Tgsl_eigen_nonsymm_workspace;
  Tgsl_eigen_nonsymm_workspace = record
      size : Tsize_t;
      diag : Pgsl_vector;
      tau : Pgsl_vector;
      Z : Pgsl_matrix;
      do_balance : longint;
      n_evals : Tsize_t;
      francis_workspace_p : Pgsl_eigen_francis_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_nonsymm_alloc(n:Tsize_t):Pgsl_eigen_nonsymm_workspace;cdecl;external;
procedure gsl_eigen_nonsymm_free(w:Pgsl_eigen_nonsymm_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_eigen_nonsymm_params(compute_t:longint; balance:longint; w:Pgsl_eigen_nonsymm_workspace);cdecl;external;
function gsl_eigen_nonsymm(A:Pgsl_matrix; eval:Pgsl_vector_complex; w:Pgsl_eigen_nonsymm_workspace):longint;cdecl;external;
function gsl_eigen_nonsymm_Z(A:Pgsl_matrix; eval:Pgsl_vector_complex; Z:Pgsl_matrix; w:Pgsl_eigen_nonsymm_workspace):longint;cdecl;external;
{ size of matrices  }
{ scratch workspace  }
{ scratch workspace  }
{ scratch workspace  }
{ pointer to Schur vectors  }
type
  Pgsl_eigen_nonsymmv_workspace = ^Tgsl_eigen_nonsymmv_workspace;
  Tgsl_eigen_nonsymmv_workspace = record
      size : Tsize_t;
      work : Pgsl_vector;
      work2 : Pgsl_vector;
      work3 : Pgsl_vector;
      Z : Pgsl_matrix;
      nonsymm_workspace_p : Pgsl_eigen_nonsymm_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_nonsymmv_alloc(n:Tsize_t):Pgsl_eigen_nonsymmv_workspace;cdecl;external;
procedure gsl_eigen_nonsymmv_free(w:Pgsl_eigen_nonsymmv_workspace);cdecl;external;
(* Const before type ignored *)
procedure gsl_eigen_nonsymmv_params(balance:longint; w:Pgsl_eigen_nonsymmv_workspace);cdecl;external;
function gsl_eigen_nonsymmv(A:Pgsl_matrix; eval:Pgsl_vector_complex; evec:Pgsl_matrix_complex; w:Pgsl_eigen_nonsymmv_workspace):longint;cdecl;external;
function gsl_eigen_nonsymmv_Z(A:Pgsl_matrix; eval:Pgsl_vector_complex; evec:Pgsl_matrix_complex; Z:Pgsl_matrix; w:Pgsl_eigen_nonsymmv_workspace):longint;cdecl;external;
{ size of matrices  }
type
  Pgsl_eigen_gensymm_workspace = ^Tgsl_eigen_gensymm_workspace;
  Tgsl_eigen_gensymm_workspace = record
      size : Tsize_t;
      symm_workspace_p : Pgsl_eigen_symm_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_gensymm_alloc(n:Tsize_t):Pgsl_eigen_gensymm_workspace;cdecl;external;
procedure gsl_eigen_gensymm_free(w:Pgsl_eigen_gensymm_workspace);cdecl;external;
function gsl_eigen_gensymm(A:Pgsl_matrix; B:Pgsl_matrix; eval:Pgsl_vector; w:Pgsl_eigen_gensymm_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_eigen_gensymm_standardize(A:Pgsl_matrix; B:Pgsl_matrix):longint;cdecl;external;
{ size of matrices  }
type
  Pgsl_eigen_gensymmv_workspace = ^Tgsl_eigen_gensymmv_workspace;
  Tgsl_eigen_gensymmv_workspace = record
      size : Tsize_t;
      symmv_workspace_p : Pgsl_eigen_symmv_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_gensymmv_alloc(n:Tsize_t):Pgsl_eigen_gensymmv_workspace;cdecl;external;
procedure gsl_eigen_gensymmv_free(w:Pgsl_eigen_gensymmv_workspace);cdecl;external;
function gsl_eigen_gensymmv(A:Pgsl_matrix; B:Pgsl_matrix; eval:Pgsl_vector; evec:Pgsl_matrix; w:Pgsl_eigen_gensymmv_workspace):longint;cdecl;external;
{ size of matrices  }
type
  Pgsl_eigen_genherm_workspace = ^Tgsl_eigen_genherm_workspace;
  Tgsl_eigen_genherm_workspace = record
      size : Tsize_t;
      herm_workspace_p : Pgsl_eigen_herm_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_genherm_alloc(n:Tsize_t):Pgsl_eigen_genherm_workspace;cdecl;external;
procedure gsl_eigen_genherm_free(w:Pgsl_eigen_genherm_workspace);cdecl;external;
function gsl_eigen_genherm(A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; eval:Pgsl_vector; w:Pgsl_eigen_genherm_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_eigen_genherm_standardize(A:Pgsl_matrix_complex; B:Pgsl_matrix_complex):longint;cdecl;external;
{ size of matrices  }
type
  Pgsl_eigen_genhermv_workspace = ^Tgsl_eigen_genhermv_workspace;
  Tgsl_eigen_genhermv_workspace = record
      size : Tsize_t;
      hermv_workspace_p : Pgsl_eigen_hermv_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_genhermv_alloc(n:Tsize_t):Pgsl_eigen_genhermv_workspace;cdecl;external;
procedure gsl_eigen_genhermv_free(w:Pgsl_eigen_genhermv_workspace);cdecl;external;
function gsl_eigen_genhermv(A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; eval:Pgsl_vector; evec:Pgsl_matrix_complex; w:Pgsl_eigen_genhermv_workspace):longint;cdecl;external;
{ size of matrices  }
{ scratch workspace  }
{ number of eigenvalues found  }
{ maximum QZ iterations allowed  }
{ number of iterations since last eigenvalue found  }
{ exceptional shift counter  }
{ need to compute top index?  }
{ tolerance for splitting A matrix  }
{ tolerance for splitting B matrix  }
{ scaling factor for shifts  }
{ scaling factor for shifts  }
{ pointer to hessenberg matrix  }
{ pointer to upper triangular matrix  }
{ compute generalized Schur form S  }
{ compute generalized Schur form T  }
{ pointer to left Schur vectors  }
{ pointer to right Schur vectors  }
type
  Pgsl_eigen_gen_workspace = ^Tgsl_eigen_gen_workspace;
  Tgsl_eigen_gen_workspace = record
      size : Tsize_t;
      work : Pgsl_vector;
      n_evals : Tsize_t;
      max_iterations : Tsize_t;
      n_iter : Tsize_t;
      eshift : Tdouble;
      needtop : longint;
      atol : Tdouble;
      btol : Tdouble;
      ascale : Tdouble;
      bscale : Tdouble;
      H : Pgsl_matrix;
      R : Pgsl_matrix;
      compute_s : longint;
      compute_t : longint;
      Q : Pgsl_matrix;
      Z : Pgsl_matrix;
    end;
(* Const before type ignored *)

function gsl_eigen_gen_alloc(n:Tsize_t):Pgsl_eigen_gen_workspace;cdecl;external;
procedure gsl_eigen_gen_free(w:Pgsl_eigen_gen_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_eigen_gen_params(compute_s:longint; compute_t:longint; balance:longint; w:Pgsl_eigen_gen_workspace);cdecl;external;
function gsl_eigen_gen(A:Pgsl_matrix; B:Pgsl_matrix; alpha:Pgsl_vector_complex; beta:Pgsl_vector; w:Pgsl_eigen_gen_workspace):longint;cdecl;external;
function gsl_eigen_gen_QZ(A:Pgsl_matrix; B:Pgsl_matrix; alpha:Pgsl_vector_complex; beta:Pgsl_vector; Q:Pgsl_matrix; 
           Z:Pgsl_matrix; w:Pgsl_eigen_gen_workspace):longint;cdecl;external;
{ size of matrices  }
{ 1-norm of columns of A  }
{ 1-norm of columns of B  }
{ real part of eigenvector  }
{ imag part of eigenvector  }
{ real part of back-transformed eigenvector  }
{ imag part of back-transformed eigenvector  }
{ pointer to left Schur vectors  }
{ pointer to right Schur vectors  }
type
  Pgsl_eigen_genv_workspace = ^Tgsl_eigen_genv_workspace;
  Tgsl_eigen_genv_workspace = record
      size : Tsize_t;
      work1 : Pgsl_vector;
      work2 : Pgsl_vector;
      work3 : Pgsl_vector;
      work4 : Pgsl_vector;
      work5 : Pgsl_vector;
      work6 : Pgsl_vector;
      Q : Pgsl_matrix;
      Z : Pgsl_matrix;
      gen_workspace_p : Pgsl_eigen_gen_workspace;
    end;
(* Const before type ignored *)

function gsl_eigen_genv_alloc(n:Tsize_t):Pgsl_eigen_genv_workspace;cdecl;external;
procedure gsl_eigen_genv_free(w:Pgsl_eigen_genv_workspace);cdecl;external;
function gsl_eigen_genv(A:Pgsl_matrix; B:Pgsl_matrix; alpha:Pgsl_vector_complex; beta:Pgsl_vector; evec:Pgsl_matrix_complex; 
           w:Pgsl_eigen_genv_workspace):longint;cdecl;external;
function gsl_eigen_genv_QZ(A:Pgsl_matrix; B:Pgsl_matrix; alpha:Pgsl_vector_complex; beta:Pgsl_vector; evec:Pgsl_matrix_complex; 
           Q:Pgsl_matrix; Z:Pgsl_matrix; w:Pgsl_eigen_genv_workspace):longint;cdecl;external;
type
  Pgsl_eigen_sort_t = ^Tgsl_eigen_sort_t;
  Tgsl_eigen_sort_t =  Longint;
  Const
    GSL_EIGEN_SORT_VAL_ASC = 0;
    GSL_EIGEN_SORT_VAL_DESC = 1;
    GSL_EIGEN_SORT_ABS_ASC = 2;
    GSL_EIGEN_SORT_ABS_DESC = 3;
;
{ Sort eigensystem results based on eigenvalues.
 * Sorts in order of increasing value or increasing
 * absolute value.
 *
 * exceptions: GSL_EBADLEN
  }

function gsl_eigen_symmv_sort(eval:Pgsl_vector; evec:Pgsl_matrix; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
function gsl_eigen_hermv_sort(eval:Pgsl_vector; evec:Pgsl_matrix_complex; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
function gsl_eigen_nonsymmv_sort(eval:Pgsl_vector_complex; evec:Pgsl_matrix_complex; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
function gsl_eigen_gensymmv_sort(eval:Pgsl_vector; evec:Pgsl_matrix; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
function gsl_eigen_genhermv_sort(eval:Pgsl_vector; evec:Pgsl_matrix_complex; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
function gsl_eigen_genv_sort(alpha:Pgsl_vector_complex; beta:Pgsl_vector; evec:Pgsl_matrix_complex; sort_type:Tgsl_eigen_sort_t):longint;cdecl;external;
{ Prototypes for the schur module  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_schur_gen_eigvals(A:Pgsl_matrix; B:Pgsl_matrix; wr1:Pdouble; wr2:Pdouble; wi:Pdouble; 
           scale1:Pdouble; scale2:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_schur_solve_equation(ca:Tdouble; A:Pgsl_matrix; z:Tdouble; d1:Tdouble; d2:Tdouble; 
           b:Pgsl_vector; x:Pgsl_vector; s:Pdouble; xnorm:Pdouble; smin:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_schur_solve_equation_z(ca:Tdouble; A:Pgsl_matrix; z:Pgsl_complex; d1:Tdouble; d2:Tdouble; 
           b:Pgsl_vector_complex; x:Pgsl_vector_complex; s:Pdouble; xnorm:Pdouble; smin:Tdouble):longint;cdecl;external;
{ The following functions are obsolete:  }
{ Eigensolve by Jacobi Method
 *
 * The data in the matrix input is destroyed.
 *
 * exceptions: 
  }
function gsl_eigen_jacobi(matrix:Pgsl_matrix; eval:Pgsl_vector; evec:Pgsl_matrix; max_rot:dword; nrot:Pdword):longint;cdecl;external;
{ Invert by Jacobi Method
 *
 * exceptions: 
  }
(* Const before type ignored *)
function gsl_eigen_invert_jacobi(matrix:Pgsl_matrix; ainv:Pgsl_matrix; max_rot:dword):longint;cdecl;external;
{$endif}
{ __GSL_EIGEN_H__  }

implementation


end.
