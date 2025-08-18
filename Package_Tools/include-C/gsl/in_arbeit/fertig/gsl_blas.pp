
unit gsl_blas;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_blas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_blas.h
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
Pgsl_complex  = ^gsl_complex;
Pgsl_complex_float  = ^gsl_complex_float;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_matrix_complex  = ^gsl_matrix_complex;
Pgsl_matrix_complex_float  = ^gsl_matrix_complex_float;
Pgsl_matrix_float  = ^gsl_matrix_float;
Pgsl_vector  = ^gsl_vector;
Pgsl_vector_complex  = ^gsl_vector_complex;
Pgsl_vector_complex_float  = ^gsl_vector_complex_float;
Pgsl_vector_float  = ^gsl_vector_float;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ blas/gsl_blas.h
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
{$ifndef __GSL_BLAS_H__}
{$define __GSL_BLAS_H__}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_blas_types.h>}
{ ========================================================================
 * Level 1
 * ========================================================================
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_blas_sdsdot(alpha:single; X:Pgsl_vector_float; Y:Pgsl_vector_float; result:Psingle):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dsdot(X:Pgsl_vector_float; Y:Pgsl_vector_float; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_sdot(X:Pgsl_vector_float; Y:Pgsl_vector_float; result:Psingle):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ddot(X:Pgsl_vector; Y:Pgsl_vector; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cdotu(X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float; dotu:Pgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cdotc(X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float; dotc:Pgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zdotu(X:Pgsl_vector_complex; Y:Pgsl_vector_complex; dotu:Pgsl_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zdotc(X:Pgsl_vector_complex; Y:Pgsl_vector_complex; dotc:Pgsl_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_snrm2(X:Pgsl_vector_float):single;cdecl;external;
(* Const before type ignored *)
function gsl_blas_sasum(X:Pgsl_vector_float):single;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dnrm2(X:Pgsl_vector):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dasum(X:Pgsl_vector):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_blas_scnrm2(X:Pgsl_vector_complex_float):single;cdecl;external;
(* Const before type ignored *)
function gsl_blas_scasum(X:Pgsl_vector_complex_float):single;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dznrm2(X:Pgsl_vector_complex):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dzasum(X:Pgsl_vector_complex):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_blas_isamax(X:Pgsl_vector_float):TCBLAS_INDEX_t;cdecl;external;
(* Const before type ignored *)
function gsl_blas_idamax(X:Pgsl_vector):TCBLAS_INDEX_t;cdecl;external;
(* Const before type ignored *)
function gsl_blas_icamax(X:Pgsl_vector_complex_float):TCBLAS_INDEX_t;cdecl;external;
(* Const before type ignored *)
function gsl_blas_izamax(X:Pgsl_vector_complex):TCBLAS_INDEX_t;cdecl;external;
function gsl_blas_sswap(X:Pgsl_vector_float; Y:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_scopy(X:Pgsl_vector_float; Y:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_saxpy(alpha:single; X:Pgsl_vector_float; Y:Pgsl_vector_float):longint;cdecl;external;
function gsl_blas_dswap(X:Pgsl_vector; Y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dcopy(X:Pgsl_vector; Y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_daxpy(alpha:Tdouble; X:Pgsl_vector; Y:Pgsl_vector):longint;cdecl;external;
function gsl_blas_cswap(X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ccopy(X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_caxpy(alpha:Tgsl_complex_float; X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float):longint;cdecl;external;
function gsl_blas_zswap(X:Pgsl_vector_complex; Y:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_zcopy(X:Pgsl_vector_complex; Y:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zaxpy(alpha:Tgsl_complex; X:Pgsl_vector_complex; Y:Pgsl_vector_complex):longint;cdecl;external;
function gsl_blas_srotg(a:Psingle; b:Psingle; c:Psingle; s:Psingle):longint;cdecl;external;
function gsl_blas_srotmg(d1:Psingle; d2:Psingle; b1:Psingle; b2:single; P:Psingle):longint;cdecl;external;
function gsl_blas_srot(X:Pgsl_vector_float; Y:Pgsl_vector_float; c:single; s:single):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_srotm(X:Pgsl_vector_float; Y:Pgsl_vector_float; P:Psingle):longint;cdecl;external;
function gsl_blas_drotg(a:Pdouble; b:Pdouble; c:Pdouble; s:Pdouble):longint;cdecl;external;
function gsl_blas_drotmg(d1:Pdouble; d2:Pdouble; b1:Pdouble; b2:Tdouble; P:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_drot(X:Pgsl_vector; Y:Pgsl_vector; c:Tdouble; s:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_drotm(X:Pgsl_vector; Y:Pgsl_vector; P:Pdouble):longint;cdecl;external;
procedure gsl_blas_sscal(alpha:single; X:Pgsl_vector_float);cdecl;external;
procedure gsl_blas_dscal(alpha:Tdouble; X:Pgsl_vector);cdecl;external;
(* Const before type ignored *)
procedure gsl_blas_cscal(alpha:Tgsl_complex_float; X:Pgsl_vector_complex_float);cdecl;external;
(* Const before type ignored *)
procedure gsl_blas_zscal(alpha:Tgsl_complex; X:Pgsl_vector_complex);cdecl;external;
procedure gsl_blas_csscal(alpha:single; X:Pgsl_vector_complex_float);cdecl;external;
procedure gsl_blas_zdscal(alpha:Tdouble; X:Pgsl_vector_complex);cdecl;external;
{ ===========================================================================
 * Level 2
 * ===========================================================================
  }
{
 * Routines with standard 4 prefixes (S, D, C, Z)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_sgemv(TransA:TCBLAS_TRANSPOSE_t; alpha:single; A:Pgsl_matrix_float; X:Pgsl_vector_float; beta:single; 
           Y:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_strmv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_float; X:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_strsv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_float; X:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dgemv(TransA:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_matrix; X:Pgsl_vector; beta:Tdouble; 
           Y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dtrmv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix; X:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dtrsv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix; X:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cgemv(TransA:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; X:Pgsl_vector_complex_float; beta:Tgsl_complex_float; 
           Y:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ctrmv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_complex_float; X:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ctrsv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_complex_float; X:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zgemv(TransA:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; X:Pgsl_vector_complex; beta:Tgsl_complex; 
           Y:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ztrmv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_complex; X:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ztrsv(Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; A:Pgsl_matrix_complex; X:Pgsl_vector_complex):longint;cdecl;external;
{
 * Routines with S and D prefixes only
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ssymv(Uplo:TCBLAS_UPLO_t; alpha:single; A:Pgsl_matrix_float; X:Pgsl_vector_float; beta:single; 
           Y:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_sger(alpha:single; X:Pgsl_vector_float; Y:Pgsl_vector_float; A:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ssyr(Uplo:TCBLAS_UPLO_t; alpha:single; X:Pgsl_vector_float; A:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ssyr2(Uplo:TCBLAS_UPLO_t; alpha:single; X:Pgsl_vector_float; Y:Pgsl_vector_float; A:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dsymv(Uplo:TCBLAS_UPLO_t; alpha:Tdouble; A:Pgsl_matrix; X:Pgsl_vector; beta:Tdouble; 
           Y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dger(alpha:Tdouble; X:Pgsl_vector; Y:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dsyr(Uplo:TCBLAS_UPLO_t; alpha:Tdouble; X:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dsyr2(Uplo:TCBLAS_UPLO_t; alpha:Tdouble; X:Pgsl_vector; Y:Pgsl_vector; A:Pgsl_matrix):longint;cdecl;external;
{
 * Routines with C and Z prefixes only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_chemv(Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; X:Pgsl_vector_complex_float; beta:Tgsl_complex_float; 
           Y:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cgeru(alpha:Tgsl_complex_float; X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float; A:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cgerc(alpha:Tgsl_complex_float; X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float; A:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_cher(Uplo:TCBLAS_UPLO_t; alpha:single; X:Pgsl_vector_complex_float; A:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cher2(Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex_float; X:Pgsl_vector_complex_float; Y:Pgsl_vector_complex_float; A:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zhemv(Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; X:Pgsl_vector_complex; beta:Tgsl_complex; 
           Y:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zgeru(alpha:Tgsl_complex; X:Pgsl_vector_complex; Y:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zgerc(alpha:Tgsl_complex; X:Pgsl_vector_complex; Y:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_zher(Uplo:TCBLAS_UPLO_t; alpha:Tdouble; X:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zher2(Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex; X:Pgsl_vector_complex; Y:Pgsl_vector_complex; A:Pgsl_matrix_complex):longint;cdecl;external;
{
 * ===========================================================================
 * Prototypes for level 3 BLAS
 * ===========================================================================
  }
{
 * Routines with standard 4 prefixes (S, D, C, Z)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_sgemm(TransA:TCBLAS_TRANSPOSE_t; TransB:TCBLAS_TRANSPOSE_t; alpha:single; A:Pgsl_matrix_float; B:Pgsl_matrix_float; 
           beta:single; C:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ssymm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:single; A:Pgsl_matrix_float; B:Pgsl_matrix_float; 
           beta:single; C:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_ssyrk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:single; A:Pgsl_matrix_float; beta:single; 
           C:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ssyr2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:single; A:Pgsl_matrix_float; B:Pgsl_matrix_float; 
           beta:single; C:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_strmm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:single; 
           A:Pgsl_matrix_float; B:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_strsm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:single; 
           A:Pgsl_matrix_float; B:Pgsl_matrix_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dgemm(TransA:TCBLAS_TRANSPOSE_t; TransB:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_matrix; B:Pgsl_matrix; 
           beta:Tdouble; C:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dsymm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:Tdouble; A:Pgsl_matrix; B:Pgsl_matrix; 
           beta:Tdouble; C:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dsyrk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_matrix; beta:Tdouble; 
           C:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_dsyr2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_matrix; B:Pgsl_matrix; 
           beta:Tdouble; C:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dtrmm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tdouble; 
           A:Pgsl_matrix; B:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_dtrsm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tdouble; 
           A:Pgsl_matrix; B:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cgemm(TransA:TCBLAS_TRANSPOSE_t; TransB:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float; 
           beta:Tgsl_complex_float; C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_csymm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float; 
           beta:Tgsl_complex_float; C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_csyrk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; beta:Tgsl_complex_float; 
           C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_csyr2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float; 
           beta:Tgsl_complex_float; C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ctrmm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tgsl_complex_float; 
           A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ctrsm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tgsl_complex_float; 
           A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zgemm(TransA:TCBLAS_TRANSPOSE_t; TransB:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; 
           beta:Tgsl_complex; C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zsymm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; 
           beta:Tgsl_complex; C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zsyrk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; beta:Tgsl_complex; 
           C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zsyr2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; 
           beta:Tgsl_complex; C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ztrmm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tgsl_complex; 
           A:Pgsl_matrix_complex; B:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_ztrsm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; TransA:TCBLAS_TRANSPOSE_t; Diag:TCBLAS_DIAG_t; alpha:Tgsl_complex; 
           A:Pgsl_matrix_complex; B:Pgsl_matrix_complex):longint;cdecl;external;
{
 * Routines with prefixes C and Z only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_chemm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float; 
           beta:Tgsl_complex_float; C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_cherk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:single; A:Pgsl_matrix_complex_float; beta:single; 
           C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_cher2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex_float; A:Pgsl_matrix_complex_float; B:Pgsl_matrix_complex_float; 
           beta:single; C:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zhemm(Side:TCBLAS_SIDE_t; Uplo:TCBLAS_UPLO_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; 
           beta:Tgsl_complex; C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_blas_zherk(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tdouble; A:Pgsl_matrix_complex; beta:Tdouble; 
           C:Pgsl_matrix_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_blas_zher2k(Uplo:TCBLAS_UPLO_t; Trans:TCBLAS_TRANSPOSE_t; alpha:Tgsl_complex; A:Pgsl_matrix_complex; B:Pgsl_matrix_complex; 
           beta:Tdouble; C:Pgsl_matrix_complex):longint;cdecl;external;
{$endif}
{ __GSL_BLAS_H__  }

implementation


end.
