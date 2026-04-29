
unit matrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from matrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    matrix.h
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
PdReal  = ^dReal;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{ optimized and unoptimized vector and matrix functions  }
{$ifndef _ODE_MATRIX_H_}
{$define _ODE_MATRIX_H_}
{$include <ode/common.h>}
{ C++ extern C conditionnal removed }
{ set a vector/matrix of size n to all zeros, or to a specific value.  }

procedure dSetZero(a:PdReal; n:longint);cdecl;external;
procedure dSetValue(a:PdReal; n:longint; value:TdReal);cdecl;external;
{ get the dot product of two n*1 vectors. if n <= 0 then
 * zero will be returned (in which case a and b need not be valid).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function dDot(a:PdReal; b:PdReal; n:longint):TdReal;cdecl;external;
{ get the dot products of (a0,b), (a1,b), etc and return them in outsum.
 * all vectors are n*1. if n <= 0 then zeroes will be returned (in which case
 * the input vectors need not be valid). this function is somewhat faster
 * than calling dDot() for all of the combinations separately.
  }
{ NOT INCLUDED in the library for now.
void dMultidot2 (const dReal *a0, const dReal *a1,
		 const dReal *b, dReal *outsum, int n);
 }
{ matrix multiplication. all matrices are stored in standard row format.
 * the digit refers to the argument that is transposed:
 *   0:   A = B  * C   (sizes: A:p*r B:p*q C:q*r)
 *   1:   A = B' * C   (sizes: A:p*r B:q*p C:q*r)
 *   2:   A = B  * C'  (sizes: A:p*r B:p*q C:r*q)
 * case 1,2 are equivalent to saying that the operation is A=B*C but
 * B or C are stored in standard column format.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dMultiply0(A:PdReal; B:PdReal; C:PdReal; p:longint; q:longint; 
            r:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure dMultiply1(A:PdReal; B:PdReal; C:PdReal; p:longint; q:longint; 
            r:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure dMultiply2(A:PdReal; B:PdReal; C:PdReal; p:longint; q:longint; 
            r:longint);cdecl;external;
{ do an in-place cholesky decomposition on the lower triangle of the n*n
 * symmetric matrix A (which is stored by rows). the resulting lower triangle
 * will be such that L*L'=A. return 1 on success and 0 on failure (on failure
 * the matrix is not positive definite).
  }
function dFactorCholesky(A:PdReal; n:longint):longint;cdecl;external;
{ solve for x: L*L'*x = b, and put the result back into x.
 * L is size n*n, b is size n*1. only the lower triangle of L is considered.
  }
(* Const before type ignored *)
procedure dSolveCholesky(L:PdReal; b:PdReal; n:longint);cdecl;external;
{ compute the inverse of the n*n positive definite matrix A and put it in
 * Ainv. this is not especially fast. this returns 1 on success (A was
 * positive definite) or 0 on failure (not PD).
  }
(* Const before type ignored *)
function dInvertPDMatrix(A:PdReal; Ainv:PdReal; n:longint):longint;cdecl;external;
{ check whether an n*n matrix A is positive definite, return 1/0 (yes/no).
 * positive definite means that x'*A*x > 0 for any x. this performs a
 * cholesky decomposition of A. if the decomposition fails then the matrix
 * is not positive definite. A is stored by rows. A is not altered.
  }
(* Const before type ignored *)
function dIsPositiveDefinite(A:PdReal; n:longint):longint;cdecl;external;
{ factorize a matrix A into L*D*L', where L is lower triangular with ones on
 * the diagonal, and D is diagonal.
 * A is an n*n matrix stored by rows, with a leading dimension of n rounded
 * up to 4. L is written into the strict lower triangle of A (the ones are not
 * written) and the reciprocal of the diagonal elements of D are written into
 * d.
  }
procedure dFactorLDLT(A:PdReal; d:PdReal; n:longint; nskip:longint);cdecl;external;
{ solve L*x=b, where L is n*n lower triangular with ones on the diagonal,
 * and x,b are n*1. b is overwritten with x.
 * the leading dimension of L is `nskip'.
  }
(* Const before type ignored *)
procedure dSolveL1(L:PdReal; b:PdReal; n:longint; nskip:longint);cdecl;external;
{ solve L'*x=b, where L is n*n lower triangular with ones on the diagonal,
 * and x,b are n*1. b is overwritten with x.
 * the leading dimension of L is `nskip'.
  }
(* Const before type ignored *)
procedure dSolveL1T(L:PdReal; b:PdReal; n:longint; nskip:longint);cdecl;external;
{ in matlab syntax: a(1:n) = a(1:n) .* d(1:n) 
  }
(* Const before type ignored *)
procedure dScaleVector(a:PdReal; d:PdReal; n:longint);cdecl;external;
{ The function is an alias for @c dScaleVector.
 * It has been deprecated because of a wrong naming schema used.
  }
{extern_DEPRECATED }(* Const before type ignored *)
procedure dVectorScale(a:PdReal; d:PdReal; n:longint);cdecl;external;
{ given `L', a n*n lower triangular matrix with ones on the diagonal,
 * and `d', a n*1 vector of the reciprocal diagonal elements of an n*n matrix
 * D, solve L*D*L'*x=b where x,b are n*1. x overwrites b.
 * the leading dimension of L is `nskip'.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dSolveLDLT(L:PdReal; d:PdReal; b:PdReal; n:longint; nskip:longint);cdecl;external;
{ given an L*D*L' factorization of an n*n matrix A, return the updated
 * factorization L2*D2*L2' of A plus the following "top left" matrix:
 *
 *    [ b a' ]     <-- b is a[0]
 *    [ a 0  ]     <-- a is a[1..n-1]
 *
 *   - L has size n*n, its leading dimension is nskip. L is lower triangular
 *     with ones on the diagonal. only the lower triangle of L is referenced.
 *   - d has size n. d contains the reciprocal diagonal elements of D.
 *   - a has size n.
 * the result is written into L, except that the left column of L and d[0]
 * are not actually modified. see ldltaddTL.m for further comments. 
  }
(* Const before type ignored *)
procedure dLDLTAddTL(L:PdReal; d:PdReal; a:PdReal; n:longint; nskip:longint);cdecl;external;
{ given an L*D*L' factorization of a permuted matrix A, produce a new
 * factorization for row and column `r' removed.
 *   - A has size n1*n1, its leading dimension in nskip. A is symmetric and
 *     positive definite. only the lower triangle of A is referenced.
 *     A itself may actually be an array of row pointers.
 *   - L has size n2*n2, its leading dimension in nskip. L is lower triangular
 *     with ones on the diagonal. only the lower triangle of L is referenced.
 *   - d has size n2. d contains the reciprocal diagonal elements of D.
 *   - p is a permutation vector. it contains n2 indexes into A. each index
 *     must be in the range 0..n1-1.
 *   - r is the row/column of L to remove.
 * the new L will be written within the old L, i.e. will have the same leading
 * dimension. the last row and column of L, and the last element of d, are
 * undefined on exit.
 *
 * a fast O(n^2) algorithm is used. see ldltremove.m for further comments.
  }
(* Const before type ignored *)
procedure dLDLTRemove(A:PPdReal; p:Plongint; L:PdReal; d:PdReal; n1:longint; 
            n2:longint; r:longint; nskip:longint);cdecl;external;
{ given an n*n matrix A (with leading dimension nskip), remove the r'th row
 * and column by moving elements. the new matrix will have the same leading
 * dimension. the last row and column of A are untouched on exit.
  }
procedure dRemoveRowCol(A:PdReal; n:longint; nskip:longint; r:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
