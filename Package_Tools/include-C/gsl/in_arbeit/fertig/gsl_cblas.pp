
unit gsl_cblas;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_cblas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_cblas.h
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
PCBLAS_DIAG  = ^CBLAS_DIAG;
PCBLAS_ORDER  = ^CBLAS_ORDER;
PCBLAS_SIDE  = ^CBLAS_SIDE;
PCBLAS_TRANSPOSE  = ^CBLAS_TRANSPOSE;
PCBLAS_UPLO  = ^CBLAS_UPLO;
Pchar  = ^char;
Pdouble  = ^double;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ blas/gsl_cblas.h
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
{ This is a copy of the CBLAS standard header.
 * We carry this around so we do not have to
 * break our model for flexible BLAS functionality.
  }
{$ifndef __GSL_CBLAS_H__}
{$define __GSL_CBLAS_H__}
{$include <stddef.h>}
{
 * Enumerated and derived types
  }
{ this may vary between platforms  }

const
  CBLAS_INDEX = size_t;  
type
  TCBLAS_ORDER =  Longint;
  Const
    CblasRowMajor = 101;
    CblasColMajor = 102;

type
  TCBLAS_TRANSPOSE =  Longint;
  Const
    CblasNoTrans = 111;
    CblasTrans = 112;
    CblasConjTrans = 113;

type
  TCBLAS_UPLO =  Longint;
  Const
    CblasUpper = 121;
    CblasLower = 122;

type
  TCBLAS_DIAG =  Longint;
  Const
    CblasNonUnit = 131;
    CblasUnit = 132;

type
  TCBLAS_SIDE =  Longint;
  Const
    CblasLeft = 141;
    CblasRight = 142;

{
 * ===========================================================================
 * Prototypes for level 1 BLAS functions (complex are recast as routines)
 * ===========================================================================
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function cblas_sdsdot(N:longint; alpha:single; X:Psingle; incX:longint; Y:Psingle; 
           incY:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_dsdot(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_sdot(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_ddot(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint):Tdouble;cdecl;external;
{
 * Functions having prefixes Z and C only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cdotu_sub(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
            dotu:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cdotc_sub(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
            dotc:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zdotu_sub(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
            dotu:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zdotc_sub(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint; 
            dotc:pointer);cdecl;external;
{
 * Functions having prefixes S D SC DZ
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_snrm2(N:longint; X:Psingle; incX:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_sasum(N:longint; X:Psingle; incX:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_dnrm2(N:longint; X:Pdouble; incX:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_dasum(N:longint; X:Pdouble; incX:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_scnrm2(N:longint; X:pointer; incX:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_scasum(N:longint; X:pointer; incX:longint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_dznrm2(N:longint; X:pointer; incX:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_dzasum(N:longint; X:pointer; incX:longint):Tdouble;cdecl;external;
{
 * Functions having standard 4 prefixes (S D C Z)
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_isamax(N:longint; X:Psingle; incX:longint):TCBLAS_INDEX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_idamax(N:longint; X:Pdouble; incX:longint):TCBLAS_INDEX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_icamax(N:longint; X:pointer; incX:longint):TCBLAS_INDEX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cblas_izamax(N:longint; X:pointer; incX:longint):TCBLAS_INDEX;cdecl;external;
{
 * ===========================================================================
 * Prototypes for level 1 BLAS routines
 * ===========================================================================
  }
{ 
 * Routines with standard 4 prefixes (s, d, c, z)
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sswap(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_scopy(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_saxpy(N:longint; alpha:single; X:Psingle; incX:longint; Y:Psingle; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dswap(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dcopy(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_daxpy(N:longint; alpha:Tdouble; X:Pdouble; incX:longint; Y:Pdouble; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cswap(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ccopy(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_caxpy(N:longint; alpha:pointer; X:pointer; incX:longint; Y:pointer; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zswap(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zcopy(N:longint; X:pointer; incX:longint; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zaxpy(N:longint; alpha:pointer; X:pointer; incX:longint; Y:pointer; 
            incY:longint);cdecl;external;
{ 
 * Routines with S and D prefix only
  }
procedure cblas_srotg(a:Psingle; b:Psingle; c:Psingle; s:Psingle);cdecl;external;
(* Const before type ignored *)
procedure cblas_srotmg(d1:Psingle; d2:Psingle; b1:Psingle; b2:single; P:Psingle);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_srot(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint; 
            c:single; s:single);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_srotm(N:longint; X:Psingle; incX:longint; Y:Psingle; incY:longint; 
            P:Psingle);cdecl;external;
procedure cblas_drotg(a:Pdouble; b:Pdouble; c:Pdouble; s:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure cblas_drotmg(d1:Pdouble; d2:Pdouble; b1:Pdouble; b2:Tdouble; P:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_drot(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint; 
            c:Tdouble; s:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_drotm(N:longint; X:Pdouble; incX:longint; Y:Pdouble; incY:longint; 
            P:Pdouble);cdecl;external;
{ 
 * Routines with S D C Z CS and ZD prefixes
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sscal(N:longint; alpha:single; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dscal(N:longint; alpha:Tdouble; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cscal(N:longint; alpha:pointer; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zscal(N:longint; alpha:pointer; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_csscal(N:longint; alpha:single; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zdscal(N:longint; alpha:Tdouble; X:pointer; incX:longint);cdecl;external;
{
 * ===========================================================================
 * Prototypes for level 2 BLAS
 * ===========================================================================
  }
{ 
 * Routines with standard 4 prefixes (S, D, C, Z)
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sgemv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; alpha:single; 
            A:Psingle; lda:longint; X:Psingle; incX:longint; beta:single; 
            Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sgbmv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
            KU:longint; alpha:single; A:Psingle; lda:longint; X:Psingle; 
            incX:longint; beta:single; Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_strmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_stbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_stpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:Psingle; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_strsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_stbsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:Psingle; lda:longint; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_stpsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:Psingle; X:Psingle; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dgemv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; alpha:Tdouble; 
            A:Pdouble; lda:longint; X:Pdouble; incX:longint; beta:Tdouble; 
            Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dgbmv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
            KU:longint; alpha:Tdouble; A:Pdouble; lda:longint; X:Pdouble; 
            incX:longint; beta:Tdouble; Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtrmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:Pdouble; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtrsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtbsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:Pdouble; lda:longint; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtpsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:Pdouble; X:Pdouble; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cgemv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; alpha:pointer; 
            A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
            Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cgbmv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
            KU:longint; alpha:pointer; A:pointer; lda:longint; X:pointer; 
            incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctrmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:pointer; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctrsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctbsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctpsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:pointer; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zgemv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; alpha:pointer; 
            A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
            Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zgbmv(order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; M:longint; N:longint; KL:longint; 
            KU:longint; alpha:pointer; A:pointer; lda:longint; X:pointer; 
            incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztrmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:pointer; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztrsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztbsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            K:longint; A:pointer; lda:longint; X:pointer; incX:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztpsv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; N:longint; 
            Ap:pointer; X:pointer; incX:longint);cdecl;external;
{ 
 * Routines with S and D prefixes only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssymv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; A:Psingle; 
            lda:longint; X:Psingle; incX:longint; beta:single; Y:Psingle; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; K:longint; alpha:single; 
            A:Psingle; lda:longint; X:Psingle; incX:longint; beta:single; 
            Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sspmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; Ap:Psingle; 
            X:Psingle; incX:longint; beta:single; Y:Psingle; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sger(order:TCBLAS_ORDER; M:longint; N:longint; alpha:single; X:Psingle; 
            incX:longint; Y:Psingle; incY:longint; A:Psingle; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssyr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
            incX:longint; A:Psingle; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sspr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
            incX:longint; Ap:Psingle);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssyr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
            incX:longint; Y:Psingle; incY:longint; A:Psingle; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sspr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:Psingle; 
            incX:longint; Y:Psingle; incY:longint; A:Psingle);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsymv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; A:Pdouble; 
            lda:longint; X:Pdouble; incX:longint; beta:Tdouble; Y:Pdouble; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; K:longint; alpha:Tdouble; 
            A:Pdouble; lda:longint; X:Pdouble; incX:longint; beta:Tdouble; 
            Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dspmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; Ap:Pdouble; 
            X:Pdouble; incX:longint; beta:Tdouble; Y:Pdouble; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dger(order:TCBLAS_ORDER; M:longint; N:longint; alpha:Tdouble; X:Pdouble; 
            incX:longint; Y:Pdouble; incY:longint; A:Pdouble; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsyr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:Pdouble; 
            incX:longint; A:Pdouble; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dspr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:Pdouble; 
            incX:longint; Ap:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsyr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:Pdouble; 
            incX:longint; Y:Pdouble; incY:longint; A:Pdouble; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dspr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:Pdouble; 
            incX:longint; Y:Pdouble; incY:longint; A:Pdouble);cdecl;external;
{ 
 * Routines with C and Z prefixes only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chemv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; A:pointer; 
            lda:longint; X:pointer; incX:longint; beta:pointer; Y:pointer; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; K:longint; alpha:pointer; 
            A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
            Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; Ap:pointer; 
            X:pointer; incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cgeru(order:TCBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cgerc(order:TCBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cher(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:pointer; 
            incX:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chpr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:single; X:pointer; 
            incX:longint; A:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cher2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chpr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; Ap:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhemv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; A:pointer; 
            lda:longint; X:pointer; incX:longint; beta:pointer; Y:pointer; 
            incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhbmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; K:longint; alpha:pointer; 
            A:pointer; lda:longint; X:pointer; incX:longint; beta:pointer; 
            Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhpmv(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; Ap:pointer; 
            X:pointer; incX:longint; beta:pointer; Y:pointer; incY:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zgeru(order:TCBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zgerc(order:TCBLAS_ORDER; M:longint; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zher(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:pointer; 
            incX:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhpr(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:Tdouble; X:pointer; 
            incX:longint; A:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zher2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; A:pointer; lda:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhpr2(order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; N:longint; alpha:pointer; X:pointer; 
            incX:longint; Y:pointer; incY:longint; Ap:pointer);cdecl;external;
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
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_sgemm(Order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; TransB:TCBLAS_TRANSPOSE; M:longint; N:longint; 
            K:longint; alpha:single; A:Psingle; lda:longint; B:Psingle; 
            ldb:longint; beta:single; C:Psingle; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssymm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:single; A:Psingle; lda:longint; B:Psingle; ldb:longint; 
            beta:single; C:Psingle; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssyrk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:single; A:Psingle; lda:longint; beta:single; C:Psingle; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ssyr2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:single; A:Psingle; lda:longint; B:Psingle; ldb:longint; 
            beta:single; C:Psingle; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_strmm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:single; A:Psingle; lda:longint; 
            B:Psingle; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_strsm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:single; A:Psingle; lda:longint; 
            B:Psingle; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dgemm(Order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; TransB:TCBLAS_TRANSPOSE; M:longint; N:longint; 
            K:longint; alpha:Tdouble; A:Pdouble; lda:longint; B:Pdouble; 
            ldb:longint; beta:Tdouble; C:Pdouble; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsymm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:Tdouble; A:Pdouble; lda:longint; B:Pdouble; ldb:longint; 
            beta:Tdouble; C:Pdouble; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsyrk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:Tdouble; A:Pdouble; lda:longint; beta:Tdouble; C:Pdouble; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dsyr2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:Tdouble; A:Pdouble; lda:longint; B:Pdouble; ldb:longint; 
            beta:Tdouble; C:Pdouble; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtrmm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:Tdouble; A:Pdouble; lda:longint; 
            B:Pdouble; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_dtrsm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:Tdouble; A:Pdouble; lda:longint; 
            B:Pdouble; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cgemm(Order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; TransB:TCBLAS_TRANSPOSE; M:longint; N:longint; 
            K:longint; alpha:pointer; A:pointer; lda:longint; B:pointer; 
            ldb:longint; beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_csymm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_csyrk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; beta:pointer; C:pointer; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_csyr2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctrmm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
            B:pointer; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ctrsm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
            B:pointer; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zgemm(Order:TCBLAS_ORDER; TransA:TCBLAS_TRANSPOSE; TransB:TCBLAS_TRANSPOSE; M:longint; N:longint; 
            K:longint; alpha:pointer; A:pointer; lda:longint; B:pointer; 
            ldb:longint; beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zsymm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zsyrk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; beta:pointer; C:pointer; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zsyr2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztrmm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
            B:pointer; ldb:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_ztrsm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; TransA:TCBLAS_TRANSPOSE; Diag:TCBLAS_DIAG; 
            M:longint; N:longint; alpha:pointer; A:pointer; lda:longint; 
            B:pointer; ldb:longint);cdecl;external;
{ 
 * Routines with prefixes C and Z only
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_chemm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cherk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:single; A:pointer; lda:longint; beta:single; C:pointer; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_cher2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:single; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zhemm(Order:TCBLAS_ORDER; Side:TCBLAS_SIDE; Uplo:TCBLAS_UPLO; M:longint; N:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:pointer; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zherk(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:Tdouble; A:pointer; lda:longint; beta:Tdouble; C:pointer; 
            ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_zher2k(Order:TCBLAS_ORDER; Uplo:TCBLAS_UPLO; Trans:TCBLAS_TRANSPOSE; N:longint; K:longint; 
            alpha:pointer; A:pointer; lda:longint; B:pointer; ldb:longint; 
            beta:Tdouble; C:pointer; ldc:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cblas_xerbla(p:longint; rout:Pchar; form:Pchar; args:array of const);cdecl;external;
procedure cblas_xerbla(p:longint; rout:Pchar; form:Pchar);cdecl;external;
{$endif}
{ __GSL_CBLAS_H__  }

implementation


end.
