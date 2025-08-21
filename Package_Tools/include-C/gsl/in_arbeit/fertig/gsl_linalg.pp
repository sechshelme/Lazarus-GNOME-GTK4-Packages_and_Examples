
unit gsl_linalg;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_linalg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_linalg.h
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
Pgsl_linalg_matrix_mod_t  = ^gsl_linalg_matrix_mod_t;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_matrix_complex  = ^gsl_matrix_complex;
Pgsl_permutation  = ^gsl_permutation;
Pgsl_vector  = ^gsl_vector;
Pgsl_vector_complex  = ^gsl_vector_complex;
Pgsl_vector_uint  = ^gsl_vector_uint;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ linalg/gsl_linalg.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2006, 2007, 2019 Gerard Jungman, Brian Gough, Patrick Alken
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
{$ifndef __GSL_LINALG_H__}
{$define __GSL_LINALG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_mode.h>}
{$include <gsl/gsl_permutation.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_blas.h>}
type
  Pgsl_linalg_matrix_mod_t = ^Tgsl_linalg_matrix_mod_t;
  Tgsl_linalg_matrix_mod_t =  Longint;
  Const
    GSL_LINALG_MOD_NONE = 0;
    GSL_LINALG_MOD_TRANSPOSE = 1;
    GSL_LINALG_MOD_CONJUGATE = 2;
;
{ Note: You can now use the gsl_blas_dgemm function instead of matmult  }
{ Simple implementation of matrix multiply.
 * Calculates C = A.B
 *
 * exceptions: GSL_EBADLEN
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_linalg_matmult(A:Pgsl_matrix; B:Pgsl_matrix; C:Pgsl_matrix):longint;cdecl;external;
{ Simple implementation of matrix multiply.
 * Allows transposition of either matrix, so it
 * can compute A.B or Trans(A).B or A.Trans(B) or Trans(A).Trans(B)
 *
 * exceptions: GSL_EBADLEN
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_matmult_mod(A:Pgsl_matrix; modA:Tgsl_linalg_matrix_mod_t; B:Pgsl_matrix; modB:Tgsl_linalg_matrix_mod_t; C:Pgsl_matrix):longint;cdecl;external;
{ Calculate the matrix exponential by the scaling and
 * squaring method described in Moler + Van Loan,
 * SIAM Rev 20, 801 (1978). The mode argument allows
 * choosing an optimal strategy, from the table
 * given in the paper, for a given precision.
 *
 * exceptions: GSL_ENOTSQR, GSL_EBADLEN
  }
(* Const before type ignored *)
function gsl_linalg_exponential_ss(A:Pgsl_matrix; eA:Pgsl_matrix; mode:Tgsl_mode_t):longint;cdecl;external;
{ Householder Transformations  }
function gsl_linalg_householder_transform(v:Pgsl_vector):Tdouble;cdecl;external;
function gsl_linalg_householder_transform2(alpha:Pdouble; v:Pgsl_vector):Tdouble;cdecl;external;
function gsl_linalg_complex_householder_transform(v:Pgsl_vector_complex):Tgsl_complex;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_householder_hm(tau:Tdouble; v:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_householder_mh(tau:Tdouble; v:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_householder_hv(tau:Tdouble; v:Pgsl_vector; w:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_householder_left(tau:Tdouble; v:Pgsl_vector; A:Pgsl_matrix; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_householder_right(tau:Tdouble; v:Pgsl_vector; A:Pgsl_matrix; work:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_householder_hm1(tau:Tdouble; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_complex_householder_hm(tau:Tgsl_complex; v:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_complex_householder_mh(tau:Tgsl_complex; v:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_complex_householder_hv(tau:Tgsl_complex; v:Pgsl_vector_complex; w:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_householder_left(tau:Tgsl_complex; v:Pgsl_vector_complex; A:Pgsl_matrix_complex; work:Pgsl_vector_complex):longint;cdecl;external;
{ Hessenberg reduction  }
function gsl_linalg_hessenberg_decomp(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_hessenberg_unpack(H:Pgsl_matrix; tau:Pgsl_vector; U:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_hessenberg_unpack_accum(H:Pgsl_matrix; tau:Pgsl_vector; U:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_hessenberg_set_zero(H:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_hessenberg_submatrix(M:Pgsl_matrix; A:Pgsl_matrix; top:Tsize_t; tau:Pgsl_vector):longint;cdecl;external;
{ Hessenberg-Triangular reduction  }
function gsl_linalg_hesstri_decomp(A:Pgsl_matrix; B:Pgsl_matrix; U:Pgsl_matrix; V:Pgsl_matrix; work:Pgsl_vector):longint;cdecl;external;
{ Singular Value Decomposition

 * exceptions: 
  }
function gsl_linalg_SV_decomp(A:Pgsl_matrix; V:Pgsl_matrix; S:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_SV_decomp_mod(A:Pgsl_matrix; X:Pgsl_matrix; V:Pgsl_matrix; S:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_SV_decomp_jacobi(A:Pgsl_matrix; Q:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_SV_solve(U:Pgsl_matrix; Q:Pgsl_matrix; S:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_SV_leverage(U:Pgsl_matrix; h:Pgsl_vector):longint;cdecl;external;
{ LU Decomposition, Gaussian elimination with partial pivoting
  }
function gsl_linalg_LU_decomp(A:Pgsl_matrix; p:Pgsl_permutation; signum:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_solve(LU:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_svx(LU:Pgsl_matrix; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_refine(A:Pgsl_matrix; LU:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector; 
           work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_invert(LU:Pgsl_matrix; p:Pgsl_permutation; inverse:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_LU_invx(LU:Pgsl_matrix; p:Pgsl_permutation):longint;cdecl;external;
function gsl_linalg_LU_det(LU:Pgsl_matrix; signum:longint):Tdouble;cdecl;external;
function gsl_linalg_LU_lndet(LU:Pgsl_matrix):Tdouble;cdecl;external;
function gsl_linalg_LU_sgndet(lu:Pgsl_matrix; signum:longint):longint;cdecl;external;
{ Banded LU decomposition  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_band_decomp(M:Tsize_t; lb:Tsize_t; ub:Tsize_t; AB:Pgsl_matrix; piv:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_band_solve(lb:Tsize_t; ub:Tsize_t; LUB:Pgsl_matrix; piv:Pgsl_vector_uint; b:Pgsl_vector; 
           x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_band_svx(lb:Tsize_t; ub:Tsize_t; LUB:Pgsl_matrix; piv:Pgsl_vector_uint; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LU_band_unpack(M:Tsize_t; lb:Tsize_t; ub:Tsize_t; LUB:Pgsl_matrix; piv:Pgsl_vector_uint; 
           L:Pgsl_matrix; U:Pgsl_matrix):longint;cdecl;external;
{ Complex LU Decomposition  }
function gsl_linalg_complex_LU_decomp(A:Pgsl_matrix_complex; p:Pgsl_permutation; signum:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_LU_solve(LU:Pgsl_matrix_complex; p:Pgsl_permutation; b:Pgsl_vector_complex; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_LU_svx(LU:Pgsl_matrix_complex; p:Pgsl_permutation; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_LU_refine(A:Pgsl_matrix_complex; LU:Pgsl_matrix_complex; p:Pgsl_permutation; b:Pgsl_vector_complex; x:Pgsl_vector_complex; 
           work:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_LU_invert(LU:Pgsl_matrix_complex; p:Pgsl_permutation; inverse:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_complex_LU_invx(LU:Pgsl_matrix_complex; p:Pgsl_permutation):longint;cdecl;external;
function gsl_linalg_complex_LU_det(LU:Pgsl_matrix_complex; signum:longint):Tgsl_complex;cdecl;external;
function gsl_linalg_complex_LU_lndet(LU:Pgsl_matrix_complex):Tdouble;cdecl;external;
function gsl_linalg_complex_LU_sgndet(LU:Pgsl_matrix_complex; signum:longint):Tgsl_complex;cdecl;external;
{ QR decomposition  }
function gsl_linalg_QR_decomp(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_QR_decomp_old(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_QR_decomp_r(A:Pgsl_matrix; T:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_solve(QR:Pgsl_matrix; tau:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_solve_r(QR:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_svx(QR:Pgsl_matrix; tau:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_lssolve(QR:Pgsl_matrix; tau:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector; residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_lssolve_r(QR:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QR_QRsolve(Q:Pgsl_matrix; R:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_Rsolve(QR:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QR_Rsvx(QR:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QR_update(Q:Pgsl_matrix; R:Pgsl_matrix; w:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_QTvec(QR:Pgsl_matrix; tau:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_QTvec_r(QR:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_Qvec(QR:Pgsl_matrix; tau:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_QTmat(QR:Pgsl_matrix; tau:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_QTmat_r(QR:Pgsl_matrix; T:Pgsl_matrix; B:Pgsl_matrix; work:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_matQ(QR:Pgsl_matrix; tau:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_unpack(QR:Pgsl_matrix; tau:Pgsl_vector; Q:Pgsl_matrix; R:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_unpack_r(QR:Pgsl_matrix; T:Pgsl_matrix; Q:Pgsl_matrix; R:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_R_solve(R:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_R_svx(R:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QR_rcond(QR:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ complex QR decomposition  }
function gsl_linalg_complex_QR_decomp(A:Pgsl_matrix_complex; tau:Pgsl_vector_complex):longint;cdecl;external;
function gsl_linalg_complex_QR_decomp_r(A:Pgsl_matrix_complex; T:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_solve(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; b:Pgsl_vector_complex; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_solve_r(QR:Pgsl_matrix_complex; T:Pgsl_matrix_complex; b:Pgsl_vector_complex; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_svx(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_lssolve(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; b:Pgsl_vector_complex; x:Pgsl_vector_complex; residual:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_lssolve_r(QR:Pgsl_matrix_complex; T:Pgsl_matrix_complex; b:Pgsl_vector_complex; x:Pgsl_vector_complex; work:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_QHvec(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_QHvec_r(QR:Pgsl_matrix_complex; T:Pgsl_matrix_complex; b:Pgsl_vector_complex; work:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_Qvec(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_unpack(QR:Pgsl_matrix_complex; tau:Pgsl_vector_complex; Q:Pgsl_matrix_complex; R:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_QR_unpack_r(QR:Pgsl_matrix_complex; T:Pgsl_matrix_complex; Q:Pgsl_matrix_complex; R:Pgsl_matrix_complex):longint;cdecl;external;
{ banded QR decomposition  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_band_decomp_L2(M:Tsize_t; p:Tsize_t; q:Tsize_t; AB:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_band_unpack_L2(p:Tsize_t; q:Tsize_t; QRB:Pgsl_matrix; tau:Pgsl_vector; Q:Pgsl_matrix; 
           R:Pgsl_matrix):longint;cdecl;external;
{ Q R P^T decomposition  }
function gsl_linalg_QRPT_decomp(A:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; signum:Plongint; norm:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QRPT_decomp2(A:Pgsl_matrix; q:Pgsl_matrix; r:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; 
           signum:Plongint; norm:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_solve(QR:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_lssolve(QR:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector; 
           residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_lssolve2(QR:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; b:Pgsl_vector; rank:Tsize_t; 
           x:Pgsl_vector; residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_svx(QR:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_QRsolve(Q:Pgsl_matrix; R:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_Rsolve(QR:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_Rsvx(QR:Pgsl_matrix; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_update(Q:Pgsl_matrix; R:Pgsl_matrix; p:Pgsl_permutation; u:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QRPT_rank(QR:Pgsl_matrix; tol:Tdouble):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_QRPT_rcond(QR:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ triangle on top of diagonal QR decomposition  }
(* Const before type ignored *)
function gsl_linalg_QR_UD_decomp(U:Pgsl_matrix; D:Pgsl_vector; Y:Pgsl_matrix; T:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_UD_lssolve(R:Pgsl_matrix; Y:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector; 
           work:Pgsl_vector):longint;cdecl;external;
{ triangle on top of rectangle QR decomposition  }
function gsl_linalg_QR_UR_decomp(S:Pgsl_matrix; A:Pgsl_matrix; T:Pgsl_matrix):longint;cdecl;external;
{ triangle on top of triangle QR decomposition  }
function gsl_linalg_QR_UU_decomp(U:Pgsl_matrix; S:Pgsl_matrix; T:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_UU_lssolve(R:Pgsl_matrix; Y:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector; 
           work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QR_UU_QTvec(Y:Pgsl_matrix; T:Pgsl_matrix; b:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
{ triangle on top of trapezoidal QR decomposition  }
function gsl_linalg_QR_UZ_decomp(S:Pgsl_matrix; A:Pgsl_matrix; T:Pgsl_matrix):longint;cdecl;external;
{ QL decomposition  }
function gsl_linalg_QL_decomp(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_QL_unpack(QL:Pgsl_matrix; tau:Pgsl_vector; Q:Pgsl_matrix; L:Pgsl_matrix):longint;cdecl;external;
{ COD decomposition  }
function gsl_linalg_COD_decomp(A:Pgsl_matrix; tau_Q:Pgsl_vector; tau_Z:Pgsl_vector; p:Pgsl_permutation; rank:Psize_t; 
           work:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_COD_decomp_e(A:Pgsl_matrix; tau_Q:Pgsl_vector; tau_Z:Pgsl_vector; p:Pgsl_permutation; tol:Tdouble; 
           rank:Psize_t; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_COD_lssolve(QRZT:Pgsl_matrix; tau_Q:Pgsl_vector; tau_Z:Pgsl_vector; perm:Pgsl_permutation; rank:Tsize_t; 
           b:Pgsl_vector; x:Pgsl_vector; residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_COD_lssolve2(lambda:Tdouble; QRZT:Pgsl_matrix; tau_Q:Pgsl_vector; tau_Z:Pgsl_vector; perm:Pgsl_permutation; 
           rank:Tsize_t; b:Pgsl_vector; x:Pgsl_vector; residual:Pgsl_vector; S:Pgsl_matrix; 
           work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_COD_unpack(QRZT:Pgsl_matrix; tau_Q:Pgsl_vector; tau_Z:Pgsl_vector; rank:Tsize_t; Q:Pgsl_matrix; 
           R:Pgsl_matrix; Z:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_COD_matZ(QRZT:Pgsl_matrix; tau_Z:Pgsl_vector; rank:Tsize_t; A:Pgsl_matrix; work:Pgsl_vector):longint;cdecl;external;
{ LQ decomposition  }
function gsl_linalg_LQ_decomp(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_lssolve(LQ:Pgsl_matrix; tau:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector; residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_QTvec(LQ:Pgsl_matrix; tau:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_solve_T(LQ:Pgsl_matrix; tau:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_svx_T(LQ:Pgsl_matrix; tau:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_lssolve_T(LQ:Pgsl_matrix; tau:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector; residual:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_Lsolve_T(LQ:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_LQ_Lsvx_T(LQ:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_L_solve_T(L:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_vecQ(LQ:Pgsl_matrix; tau:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_vecQT(LQ:Pgsl_matrix; tau:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_LQ_unpack(LQ:Pgsl_matrix; tau:Pgsl_vector; Q:Pgsl_matrix; L:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_LQ_update(Q:Pgsl_matrix; R:Pgsl_matrix; v:Pgsl_vector; w:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_LQ_LQsolve(Q:Pgsl_matrix; L:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
{ P^T L Q decomposition  }
function gsl_linalg_PTLQ_decomp(A:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; signum:Plongint; norm:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_PTLQ_decomp2(A:Pgsl_matrix; q:Pgsl_matrix; r:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; 
           signum:Plongint; norm:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_solve_T(QR:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_svx_T(LQ:Pgsl_matrix; tau:Pgsl_vector; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_LQsolve_T(Q:Pgsl_matrix; L:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_Lsolve_T(LQ:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_Lsvx_T(LQ:Pgsl_matrix; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_PTLQ_update(Q:Pgsl_matrix; L:Pgsl_matrix; p:Pgsl_permutation; v:Pgsl_vector; w:Pgsl_vector):longint;cdecl;external;
{ Cholesky Decomposition  }
function gsl_linalg_cholesky_decomp(A:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_cholesky_decomp1(A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_solve(cholesky:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_solve_mat(cholesky:Pgsl_matrix; B:Pgsl_matrix; X:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_svx(cholesky:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_svx_mat(cholesky:Pgsl_matrix; X:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_cholesky_invert(cholesky:Pgsl_matrix):longint;cdecl;external;
{ Cholesky decomposition with unit-diagonal triangular parts.
 *   A = L D L^T, where diag(L) = (1,1,...,1).
 *   Upon exit, A contains L and L^T as for Cholesky, and
 *   the diagonal of A is (1,1,...,1). The vector Dis set
 *   to the diagonal elements of the diagonal matrix D.
  }
function gsl_linalg_cholesky_decomp_unit(A:Pgsl_matrix; D:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_scale(A:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_scale_apply(A:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_cholesky_decomp2(A:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_svx2(LLT:Pgsl_matrix; S:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_solve2(LLT:Pgsl_matrix; S:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_rcond(LLT:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ Complex Cholesky Decomposition  }
function gsl_linalg_complex_cholesky_decomp(A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_complex_cholesky_solve(cholesky:Pgsl_matrix_complex; b:Pgsl_vector_complex; x:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_complex_cholesky_svx(cholesky:Pgsl_matrix_complex; x:Pgsl_vector_complex):longint;cdecl;external;
function gsl_linalg_complex_cholesky_invert(cholesky:Pgsl_matrix_complex):longint;cdecl;external;
{ Pivoted Cholesky LDLT decomposition  }
function gsl_linalg_pcholesky_decomp(A:Pgsl_matrix; p:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_solve(LDLT:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_svx(LDLT:Pgsl_matrix; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_pcholesky_decomp2(A:Pgsl_matrix; p:Pgsl_permutation; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_solve2(LDLT:Pgsl_matrix; p:Pgsl_permutation; S:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_svx2(LDLT:Pgsl_matrix; p:Pgsl_permutation; S:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_invert(LDLT:Pgsl_matrix; p:Pgsl_permutation; Ainv:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_pcholesky_rcond(LDLT:Pgsl_matrix; p:Pgsl_permutation; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ Modified Cholesky decomposition  }
function gsl_linalg_mcholesky_decomp(A:Pgsl_matrix; p:Pgsl_permutation; E:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_mcholesky_solve(LDLT:Pgsl_matrix; p:Pgsl_permutation; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_mcholesky_svx(LDLT:Pgsl_matrix; p:Pgsl_permutation; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_mcholesky_rcond(LDLT:Pgsl_matrix; p:Pgsl_permutation; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_mcholesky_invert(LDLT:Pgsl_matrix; p:Pgsl_permutation; Ainv:Pgsl_matrix):longint;cdecl;external;
{ Banded Cholesky decomposition  }
function gsl_linalg_cholesky_band_decomp(A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_band_solve(LLT:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_svx(LLT:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_cholesky_band_solvem(LLT:Pgsl_matrix; B:Pgsl_matrix; X:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_svxm(LLT:Pgsl_matrix; X:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_invert(LLT:Pgsl_matrix; Ainv:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_unpack(LLT:Pgsl_matrix; L:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_scale(A:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_scale_apply(A:Pgsl_matrix; S:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_cholesky_band_rcond(LLT:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ L D L^T decomposition  }
function gsl_linalg_ldlt_decomp(A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_ldlt_solve(LDLT:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_ldlt_svx(LDLT:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_ldlt_rcond(LDLT:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ Banded L D L^T decomposition  }
function gsl_linalg_ldlt_band_decomp(A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_ldlt_band_solve(LDLT:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_ldlt_band_svx(LDLT:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_ldlt_band_unpack(LDLT:Pgsl_matrix; L:Pgsl_matrix; D:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_ldlt_band_rcond(LDLT:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ Symmetric to symmetric tridiagonal decomposition  }
function gsl_linalg_symmtd_decomp(A:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_symmtd_unpack(A:Pgsl_matrix; tau:Pgsl_vector; Q:Pgsl_matrix; diag:Pgsl_vector; subdiag:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_symmtd_unpack_T(A:Pgsl_matrix; diag:Pgsl_vector; subdiag:Pgsl_vector):longint;cdecl;external;
{ Hermitian to symmetric tridiagonal decomposition  }
function gsl_linalg_hermtd_decomp(A:Pgsl_matrix_complex; tau:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_hermtd_unpack(A:Pgsl_matrix_complex; tau:Pgsl_vector_complex; U:Pgsl_matrix_complex; diag:Pgsl_vector; sudiag:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_hermtd_unpack_T(A:Pgsl_matrix_complex; diag:Pgsl_vector; subdiag:Pgsl_vector):longint;cdecl;external;
{ Linear Solve Using Householder Transformations

 * exceptions: 
  }
(* Const before type ignored *)
function gsl_linalg_HH_solve(A:Pgsl_matrix; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_HH_svx(A:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
{ Linear solve for a symmetric tridiagonal system.

 * The input vectors represent the NxN matrix as follows:
 *
 *     diag[0]  offdiag[0]             0    ...
 *  offdiag[0]     diag[1]    offdiag[1]    ...
 *           0  offdiag[1]       diag[2]    ...
 *           0           0    offdiag[2]    ...
 *         ...         ...           ...    ...
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_solve_symm_tridiag(diag:Pgsl_vector; offdiag:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
{ Linear solve for a nonsymmetric tridiagonal system.

 * The input vectors represent the NxN matrix as follows:
 *
 *       diag[0]  abovediag[0]              0    ...
 *  belowdiag[0]       diag[1]   abovediag[1]    ...
 *             0  belowdiag[1]        diag[2]    ...
 *             0             0   belowdiag[2]    ...
 *           ...           ...            ...    ...
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_solve_tridiag(diag:Pgsl_vector; abovediag:Pgsl_vector; belowdiag:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
{ Linear solve for a symmetric cyclic tridiagonal system.

 * The input vectors represent the NxN matrix as follows:
 *
 *      diag[0]  offdiag[0]             0   .....  offdiag[N-1]
 *   offdiag[0]     diag[1]    offdiag[1]   .....
 *            0  offdiag[1]       diag[2]   .....
 *            0           0    offdiag[2]   .....
 *          ...         ...
 * offdiag[N-1]         ...
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_solve_symm_cyc_tridiag(diag:Pgsl_vector; offdiag:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
{ Linear solve for a nonsymmetric cyclic tridiagonal system.

 * The input vectors represent the NxN matrix as follows:
 *
 *        diag[0]  abovediag[0]             0   .....  belowdiag[N-1]
 *   belowdiag[0]       diag[1]  abovediag[1]   .....
 *              0  belowdiag[1]       diag[2]
 *              0             0  belowdiag[2]   .....
 *            ...           ...
 * abovediag[N-1]           ...
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_solve_cyc_tridiag(diag:Pgsl_vector; abovediag:Pgsl_vector; belowdiag:Pgsl_vector; b:Pgsl_vector; x:Pgsl_vector):longint;cdecl;external;
{ Bidiagonal decomposition  }
function gsl_linalg_bidiag_decomp(A:Pgsl_matrix; tau_U:Pgsl_vector; tau_V:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_linalg_bidiag_unpack(A:Pgsl_matrix; tau_U:Pgsl_vector; U:Pgsl_matrix; tau_V:Pgsl_vector; V:Pgsl_matrix; 
           diag:Pgsl_vector; superdiag:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_bidiag_unpack2(A:Pgsl_matrix; tau_U:Pgsl_vector; tau_V:Pgsl_vector; V:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_bidiag_unpack_B(A:Pgsl_matrix; diag:Pgsl_vector; superdiag:Pgsl_vector):longint;cdecl;external;
{ Balancing  }
function gsl_linalg_balance_matrix(A:Pgsl_matrix; D:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_balance_accum(A:Pgsl_matrix; D:Pgsl_vector):longint;cdecl;external;
function gsl_linalg_balance_columns(A:Pgsl_matrix; D:Pgsl_vector):longint;cdecl;external;
{ condition estimation  }
(* Const before type ignored *)
function gsl_linalg_tri_rcond(Uplo:TCBLAS_UPLO_t; A:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_tri_upper_rcond(A:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_tri_lower_rcond(A:Pgsl_matrix; rcond:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_linalg_invnorm1(N:Tsize_t; Ainvx:function (TransA:TCBLAS_TRANSPOSE_t; x:Pgsl_vector; params:pointer):longint; params:pointer; Ainvnorm:Pdouble; work:Pgsl_vector):longint;cdecl;external;
{ triangular matrices  }
function gsl_linalg_tri_upper_invert(T:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_tri_lower_invert(T:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_tri_upper_unit_invert(T:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_tri_lower_unit_invert(T:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_tri_invert(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; T:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_complex_tri_invert(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; T:Pgsl_matrix_complex):longint;cdecl;external;
function gsl_linalg_tri_LTL(L:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_tri_UL(LU:Pgsl_matrix):longint;cdecl;external;
function gsl_linalg_complex_tri_LHL(L:Pgsl_matrix_complex):longint;cdecl;external;
function gsl_linalg_complex_tri_UL(LU:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_linalg_givens(a:Tdouble; b:Tdouble; c:Pdouble; s:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_linalg_givens_gv(v:Pgsl_vector; i:Tsize_t; j:Tsize_t; c:Tdouble; s:Tdouble);cdecl;external;
{$endif}
{ __GSL_LINALG_H__  }

implementation


end.
