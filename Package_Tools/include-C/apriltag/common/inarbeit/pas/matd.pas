unit matd;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include <assert.h>}
{$include <stddef.h>}
{$include <string.h>}
{ C++ extern C conditionnal removed }
{*
 * Defines a matrix structure for holding double-precision values with
 * data in row-major order (i.e. index = row*ncols + col).
 *
 * nrows and ncols are 1-based counts with the exception that a scalar (non-matrix)
 *   is represented with nrows=0 and/or ncols=0.
  }
{    double *data; }
type
  Pmatd_t = ^Tmatd_t;
  Tmatd_t = record
      nrows : dword;
      ncols : dword;
      data : Pdouble;
    end;
{ /xxxxxxx #define MATD_ALLOC(name, nrows, ncols) double name ## _storage [nrows*ncols]; matd_t name =  .nrows = nrows, .ncols = ncols, .data = &name ## _storage ;
 }
{*
 * Defines a small value which can be used in place of zero for approximating
 * calculations which are singular at zero values (i.e. inverting a matrix with
 * a zero or near-zero determinant).
  }

const
  MATD_EPS = 1e-8;  
{*
 * A macro to reference a specific matd_t data element given it's zero-based
 * row and column indexes. Suitable for both retrieval and assignment.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MATD_EL(m,row,col : longint) : longint;

{*
 * Creates a double matrix with the given number of rows and columns (or a scalar
 * in the case where rows=0 and/or cols=0). All data elements will be initialized
 * to zero. It is the caller's responsibility to call matd_destroy() on the
 * returned matrix.
  }
function matd_create(rows:longint; cols:longint):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a double matrix with the given number of rows and columns (or a scalar
 * in the case where rows=0 and/or cols=0). All data elements will be initialized
 * using the supplied array of data, which must contain at least rows*cols elements,
 * arranged in row-major order (i.e. index = row*ncols + col). It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
  }
function matd_create_data(rows:longint; cols:longint; data:Pdouble):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a double matrix with the given number of rows and columns (or a scalar
 * in the case where rows=0 and/or cols=0). All data elements will be initialized
 * using the supplied array of float data, which must contain at least rows*cols elements,
 * arranged in row-major order (i.e. index = row*ncols + col). It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
  }
function matd_create_dataf(rows:longint; cols:longint; data:Psingle):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a square identity matrix with the given number of rows (and
 * therefore columns), or a scalar with value 1 in the case where dim=0.
 * It is the caller's responsibility to call matd_destroy() on the
 * returned matrix.
  }
function matd_identity(dim:longint):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a scalar with the supplied value 'v'. It is the caller's responsibility
 * to call matd_destroy() on the returned matrix.
 *
 * NOTE: Scalars are different than 1x1 matrices (implementation note:
 * they are encoded as 0x0 matrices). For example: for matrices A*B, A
 * and B must both have specific dimensions. However, if A is a
 * scalar, there are no restrictions on the size of B.
  }
function matd_create_scalar(v:Tdouble):Pmatd_t;cdecl;external libapriltag;
{*
 * Retrieves the cell value for matrix 'm' at the given zero-based row and column index.
 * Performs more thorough validation checking than MATD_EL().
  }
function matd_get(m:Pmatd_t; row:longint; col:longint):Tdouble;cdecl;external libapriltag;
{*
 * Assigns the given value to the matrix cell at the given zero-based row and
 * column index. Performs more thorough validation checking than MATD_EL().
  }
procedure matd_put(m:Pmatd_t; row:longint; col:longint; value:Tdouble);cdecl;external libapriltag;
{*
 * Retrieves the scalar value of the given element ('m' must be a scalar).
 * Performs more thorough validation checking than MATD_EL().
  }
function matd_get_scalar(m:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Assigns the given value to the supplied scalar element ('m' must be a scalar).
 * Performs more thorough validation checking than MATD_EL().
  }
procedure matd_put_scalar(m:Pmatd_t; value:Tdouble);cdecl;external libapriltag;
{*
 * Creates an exact copy of the supplied matrix 'm'. It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
  }
function matd_copy(m:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a copy of a subset of the supplied matrix 'a'. The subset will include
 * rows 'r0' through 'r1', inclusive ('r1' >= 'r0'), and columns 'c0' through 'c1',
 * inclusive ('c1' >= 'c0'). All parameters are zero-based (i.e. matd_select(a, 0, 0, 0, 0)
 * will return only the first cell). Cannot be used on scalars or to extend
 * beyond the number of rows/columns of 'a'. It is the caller's  responsibility to
 * call matd_destroy() on the returned matrix.
  }
function matd_select(a:Pmatd_t; r0:longint; r1:longint; c0:longint; c1:longint):Pmatd_t;cdecl;external libapriltag;
{*
 * Prints the supplied matrix 'm' to standard output by applying the supplied
 * printf format specifier 'fmt' for each individual element. Each row will
 * be printed on a separate newline.
  }
procedure matd_print(m:Pmatd_t; fmt:Pchar);cdecl;external libapriltag;
{*
 * Prints the transpose of the supplied matrix 'm' to standard output by applying
 * the supplied printf format specifier 'fmt' for each individual element. Each
 * row will be printed on a separate newline.
  }
procedure matd_print_transpose(m:Pmatd_t; fmt:Pchar);cdecl;external libapriltag;
{*
 * Adds the two supplied matrices together, cell-by-cell, and returns the results
 * as a new matrix of the same dimensions. The supplied matrices must have
 * identical dimensions.  It is the caller's responsibility to call matd_destroy()
 * on the returned matrix.
  }
function matd_add(a:Pmatd_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Adds the values of 'b' to matrix 'a', cell-by-cell, and overwrites the
 * contents of 'a' with the results. The supplied matrices must have
 * identical dimensions.
  }
procedure matd_add_inplace(a:Pmatd_t; b:Pmatd_t);cdecl;external libapriltag;
{*
 * Subtracts matrix 'b' from matrix 'a', cell-by-cell, and returns the results
 * as a new matrix of the same dimensions. The supplied matrices must have
 * identical dimensions.  It is the caller's responsibility to call matd_destroy()
 * on the returned matrix.
  }
function matd_subtract(a:Pmatd_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Subtracts the values of 'b' from matrix 'a', cell-by-cell, and overwrites the
 * contents of 'a' with the results. The supplied matrices must have
 * identical dimensions.
  }
procedure matd_subtract_inplace(a:Pmatd_t; b:Pmatd_t);cdecl;external libapriltag;
{*
 * Scales all cell values of matrix 'a' by the given scale factor 's' and
 * returns the result as a new matrix of the same dimensions. It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
  }
function matd_scale(a:Pmatd_t; s:Tdouble):Pmatd_t;cdecl;external libapriltag;
{*
 * Scales all cell values of matrix 'a' by the given scale factor 's' and
 * overwrites the contents of 'a' with the results.
  }
procedure matd_scale_inplace(a:Pmatd_t; s:Tdouble);cdecl;external libapriltag;
{*
 * Multiplies the two supplied matrices together (matrix product), and returns the
 * results as a new matrix. The supplied matrices must have dimensions such that
 * columns(a) = rows(b). The returned matrix will have a row count of rows(a)
 * and a column count of columns(b). It is the caller's responsibility to call
 * matd_destroy() on the returned matrix.
  }
function matd_multiply(a:Pmatd_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Creates a matrix which is the transpose of the supplied matrix 'a'. It is the
 * caller's responsibility to call matd_destroy() on the returned matrix.
  }
function matd_transpose(a:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Calculates the determinant of the supplied matrix 'a'.
  }
function matd_det(a:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Attempts to compute an inverse of the supplied matrix 'a' and return it as
 * a new matrix. This is strictly only possible if the determinant of 'a' is
 * non-zero (matd_det(a) != 0).
 *
 * If the determinant is zero, NULL is returned. It is otherwise the
 * caller's responsibility to cope with the results caused by poorly
 * conditioned matrices. (E.g.., if such a situation is likely to arise, compute
 * the pseudo-inverse from the SVD.)
 * }
function matd_inverse(a:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{
static inline void matd_set_data(matd_t *m, const double *data)

    memcpy(m->data, data, m->nrows * m->ncols * sizeof(double));


static inline int matd_is_scalar(const matd_t *a)

    assert(a != NULL);
    return a->ncols <= 1 && a->nrows <= 1;


static inline int matd_is_vector(const matd_t *a)

    assert(a != NULL);
    return a->ncols == 1 || a->nrows == 1;


static inline int matd_is_vector_len(const matd_t *a, int len)

    assert(a != NULL);
    return (a->ncols == 1 && a->nrows == (unsigned int)len) || (a->ncols == (unsigned int)len && a->nrows == 1);


  }
function matd_vec_mag(a:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Calculates the magnitude of the distance between the points represented by
 * matrices 'a' and 'b'. Both 'a' and 'b' must be vectors and have the same
 * dimension (although one may be a row vector and one may be a column vector).
  }
function matd_vec_dist(a:Pmatd_t; b:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Same as matd_vec_dist, but only uses the first 'n' terms to compute distance
  }
function matd_vec_dist_n(a:Pmatd_t; b:Pmatd_t; n:longint):Tdouble;cdecl;external libapriltag;
{*
 * Calculates the dot product of two vectors. Both 'a' and 'b' must be vectors
 * and have the same dimension (although one may be a row vector and one may be
 * a column vector).
  }
function matd_vec_dot_product(a:Pmatd_t; b:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Calculates the normalization of the supplied vector 'a' (i.e. a unit vector
 * of the same dimension and orientation as 'a' with a magnitude of 1) and returns
 * it as a new vector. 'a' must be a vector of any dimension and must have a
 * non-zero magnitude. It is the caller's responsibility to call matd_destroy()
 * on the returned matrix.
  }
function matd_vec_normalize(a:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{*
 * Calculates the cross product of supplied matrices 'a' and 'b' (i.e. a x b)
 * and returns it as a new matrix. Both 'a' and 'b' must be vectors of dimension
 * 3, but can be either row or column vectors. It is the caller's responsibility
 * to call matd_destroy() on the returned matrix.
  }
function matd_crossproduct(a:Pmatd_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
function matd_err_inf(a:Pmatd_t; b:Pmatd_t):Tdouble;cdecl;external libapriltag;
{*
 * Creates a new matrix by applying a series of matrix operations, as expressed
 * in 'expr', to the supplied list of matrices. Each matrix to be operated upon
 * must be represented in the expression by a separate matrix placeholder, 'M',
 * and there must be one matrix supplied as an argument for each matrix
 * placeholder in the expression. All rules and caveats of the corresponding
 * matrix operations apply to the operated-on matrices. It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
 *
 * Available operators (in order of increasing precedence):
 *   M+M   add two matrices together
 *   M-M   subtract one matrix from another
 *   M*M   multiply two matrices together (matrix product)
 *   MM    multiply two matrices together (matrix product)
 *   -M    negate a matrix
 *   M^-1  take the inverse of a matrix
 *   M'    take the transpose of a matrix
 *
 * Expressions can be combined together and grouped by enclosing them in
 * parenthesis, i.e.:
 *   -M(M+M+M)-(M*M)^-1
 *
 * Scalar values can be generated on-the-fly, i.e.:
 *   M*2.2  scales M by 2.2
 *   -2+M   adds -2 to all elements of M
 *
 * All whitespace in the expression is ignored.
  }
function matd_op(expr:Pchar; args:array of const):Pmatd_t;cdecl;external libapriltag;
function matd_op(expr:Pchar):Pmatd_t;cdecl;external libapriltag;
{*
 * Frees the memory associated with matrix 'm', being the result of an earlier
 * call to a matd_*() function, after which 'm' will no longer be usable.
  }
procedure matd_destroy(m:Pmatd_t);cdecl;external libapriltag;
type
  Pmatd_svd_t = ^Tmatd_svd_t;
  Tmatd_svd_t = record
      U : Pmatd_t;
      S : Pmatd_t;
      V : Pmatd_t;
    end;
{* Compute a complete SVD of a matrix. The SVD exists for all
 * matrices. For a matrix MxN, we will have:
 *
 * A = U*S*V'
 *
 * where A is MxN, U is MxM (and is an orthonormal basis), S is MxN
 * (and is diagonal up to machine precision), and V is NxN (and is an
 * orthonormal basis).
 *
 * The caller is responsible for destroying U, S, and V.
 * }

function matd_svd(A:Pmatd_t):Tmatd_svd_t;cdecl;external libapriltag;
const
  MATD_SVD_NO_WARNINGS = 1;  

function matd_svd_flags(A:Pmatd_t; flags:longint):Tmatd_svd_t;cdecl;external libapriltag;
{////////////////////////////// }
{ PLU Decomposition }
{ All square matrices (even singular ones) have a partially-pivoted }
{ LU decomposition such that A = PLU, where P is a permutation }
{ matrix, L is a lower triangular matrix, and U is an upper }
{ triangular matrix. }
{ }
{ was the input matrix singular? When a zero pivot is found, this }
{ flag is set to indicate that this has happened. }
{ permutation indices }
{ either +1 or -1 }
{ The matd_plu_t object returned "owns" the enclosed LU matrix. It }
{ is not expected that the returned object is itself useful to }
{ users: it contains the L and U information all smushed }
{ together. }
{ combined L and U matrices, permuted so they can be triangular. }
type
  Pmatd_plu_t = ^Tmatd_plu_t;
  Tmatd_plu_t = record
      singular : longint;
      piv : Pdword;
      pivsign : longint;
      lu : Pmatd_t;
    end;

function matd_plu(a:Pmatd_t):Pmatd_plu_t;cdecl;external libapriltag;
procedure matd_plu_destroy(mlu:Pmatd_plu_t);cdecl;external libapriltag;
function matd_plu_det(lu:Pmatd_plu_t):Tdouble;cdecl;external libapriltag;
function matd_plu_p(lu:Pmatd_plu_t):Pmatd_t;cdecl;external libapriltag;
function matd_plu_l(lu:Pmatd_plu_t):Pmatd_t;cdecl;external libapriltag;
function matd_plu_u(lu:Pmatd_plu_t):Pmatd_t;cdecl;external libapriltag;
function matd_plu_solve(mlu:Pmatd_plu_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{ uses LU decomposition internally. }
function matd_solve(A:Pmatd_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
{////////////////////////////// }
{ Cholesky Factorization }
{*
 * Creates a double matrix with the Cholesky lower triangular matrix
 * of A. A must be symmetric, positive definite. It is the caller's
 * responsibility to call matd_destroy() on the returned matrix.
  }
{matd_t *matd_cholesky(const matd_t *A); }
type
  Pmatd_chol_t = ^Tmatd_chol_t;
  Tmatd_chol_t = record
      is_spd : longint;
      u : Pmatd_t;
    end;

function matd_chol(A:Pmatd_t):Pmatd_chol_t;cdecl;external libapriltag;
function matd_chol_solve(chol:Pmatd_chol_t; b:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
procedure matd_chol_destroy(chol:Pmatd_chol_t);cdecl;external libapriltag;
{ only sensible on PSD matrices }
function matd_chol_inverse(a:Pmatd_t):Pmatd_t;cdecl;external libapriltag;
procedure matd_ltransposetriangle_solve(u:Pmatd_t; b:Pdouble; x:Pdouble);cdecl;external libapriltag;
procedure matd_ltriangle_solve(u:Pmatd_t; b:Pdouble; x:Pdouble);cdecl;external libapriltag;
procedure matd_utriangle_solve(u:Pmatd_t; b:Pdouble; x:Pdouble);cdecl;external libapriltag;
function matd_max(m:Pmatd_t):Tdouble;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:22:38 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MATD_EL(m,row,col : longint) : longint;
begin
  MATD_EL:=m^.(data[(row*(m^.ncols))+col]);
end;


end.
