
unit gsl_blas_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_blas_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_blas_types.h
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
PCBLAS_DIAG_t  = ^CBLAS_DIAG_t;
PCBLAS_INDEX_t  = ^CBLAS_INDEX_t;
PCBLAS_ORDER_t  = ^CBLAS_ORDER_t;
PCBLAS_SIDE_t  = ^CBLAS_SIDE_t;
PCBLAS_TRANSPOSE_t  = ^CBLAS_TRANSPOSE_t;
PCBLAS_UPLO_t  = ^CBLAS_UPLO_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ blas/gsl_blas_types.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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
{
 * Author:  G. Jungman
  }
{ Based on draft BLAST C interface specification  [Jul 7 1998]
  }
{$ifndef __GSL_BLAS_TYPES_H__}
{$define __GSL_BLAS_TYPES_H__}
{$include <gsl/gsl_cblas.h>}
type
  PCBLAS_INDEX_t = ^TCBLAS_INDEX_t;
  TCBLAS_INDEX_t = TCBLAS_INDEX;

  PCBLAS_ORDER_t = ^TCBLAS_ORDER_t;
  TCBLAS_ORDER_t = TCBLAS_ORDER;

  PCBLAS_TRANSPOSE_t = ^TCBLAS_TRANSPOSE_t;
  TCBLAS_TRANSPOSE_t = TCBLAS_TRANSPOSE;

  PCBLAS_UPLO_t = ^TCBLAS_UPLO_t;
  TCBLAS_UPLO_t = TCBLAS_UPLO;

  PCBLAS_DIAG_t = ^TCBLAS_DIAG_t;
  TCBLAS_DIAG_t = TCBLAS_DIAG;

  PCBLAS_SIDE_t = ^TCBLAS_SIDE_t;
  TCBLAS_SIDE_t = TCBLAS_SIDE;
{ typedef  gsl_complex  COMPLEX;  }
{$endif}
{ __GSL_BLAS_TYPES_H__  }

implementation


end.
