
unit gsl_spblas;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spblas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spblas.h
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
Pgsl_spmatrix  = ^gsl_spmatrix;
Pgsl_vector  = ^gsl_vector;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_spblas.h
 * 
 * Copyright (C) 2012-2014 Patrick Alken
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
{$ifndef __GSL_SPBLAS_H__}
{$define __GSL_SPBLAS_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_spmatrix.h>}
{$include <gsl/gsl_blas.h>}
{
 * Prototypes
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spblas_dgemv(TransA:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_spmatrix; x:Pgsl_vector; beta:Tdouble; 
           y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spblas_dgemm(alpha:Tdouble; A:Pgsl_spmatrix; B:Pgsl_spmatrix; C:Pgsl_spmatrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spblas_scatter(A:Pgsl_spmatrix; j:Tsize_t; alpha:Tdouble; w:Plongint; x:Pdouble; 
           mark:longint; C:Pgsl_spmatrix; nz:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ __GSL_SPBLAS_H__  }

implementation


end.
