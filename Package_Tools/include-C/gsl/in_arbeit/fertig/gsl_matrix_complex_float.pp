
unit gsl_matrix_complex_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_complex_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_complex_float.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Pgsl_block_complex_float  = ^gsl_block_complex_float;
Pgsl_complex_float  = ^gsl_complex_float;
Pgsl_matrix_complex_float  = ^gsl_matrix_complex_float;
Pgsl_matrix_complex_float_const_view  = ^gsl_matrix_complex_float_const_view;
Pgsl_matrix_complex_float_view  = ^gsl_matrix_complex_float_view;
Pgsl_vector_complex_float  = ^gsl_vector_complex_float;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_complex_float.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_MATRIX_COMPLEX_FLOAT_H__}
{$define __GSL_MATRIX_COMPLEX_FLOAT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_complex_float.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_complex_float = ^Tgsl_matrix_complex_float;
  Tgsl_matrix_complex_float = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Psingle;
      block : Pgsl_block_complex_float;
      owner : longint;
    end;

  Pgsl_matrix_complex_float_view = ^Tgsl_matrix_complex_float_view;
  Tgsl_matrix_complex_float_view = record
      matrix : Tgsl_matrix_complex_float;
    end;

  Pgsl_matrix_complex_float_view = ^Tgsl_matrix_complex_float_view;
  Tgsl_matrix_complex_float_view = Tgsl_matrix_complex_float_view;

  Pgsl_matrix_complex_float_const_view = ^Tgsl_matrix_complex_float_const_view;
  Tgsl_matrix_complex_float_const_view = record
      matrix : Tgsl_matrix_complex_float;
    end;
(* Const before type ignored *)

  Pgsl_matrix_complex_float_const_view = ^Tgsl_matrix_complex_float_const_view;
  Tgsl_matrix_complex_float_const_view = Tgsl_matrix_complex_float_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_complex_float_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_alloc_from_block(b:Pgsl_block_complex_float; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_alloc_from_matrix(b:Pgsl_matrix_complex_float; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_complex_float;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_alloc_row_from_matrix(m:Pgsl_matrix_complex_float; i:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_alloc_col_from_matrix(m:Pgsl_matrix_complex_float; j:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
procedure gsl_matrix_complex_float_free(m:Pgsl_matrix_complex_float);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_submatrix(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_row(m:Pgsl_matrix_complex_float; i:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_column(m:Pgsl_matrix_complex_float; j:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
function gsl_matrix_complex_float_diagonal(m:Pgsl_matrix_complex_float):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_subdiagonal(m:Pgsl_matrix_complex_float; k:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_superdiagonal(m:Pgsl_matrix_complex_float; k:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_subrow(m:Pgsl_matrix_complex_float; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_subcolumn(m:Pgsl_matrix_complex_float; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_view_array(base:Psingle; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_view_array_with_tda(base:Psingle; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_view_vector(v:Pgsl_vector_complex_float; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_view_vector_with_tda(v:Pgsl_vector_complex_float; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_complex_float_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_submatrix(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_row(m:Pgsl_matrix_complex_float; i:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_column(m:Pgsl_matrix_complex_float; j:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_const_diagonal(m:Pgsl_matrix_complex_float):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_subdiagonal(m:Pgsl_matrix_complex_float; k:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_superdiagonal(m:Pgsl_matrix_complex_float; k:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_subrow(m:Pgsl_matrix_complex_float; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_subcolumn(m:Pgsl_matrix_complex_float; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_view_array(base:Psingle; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_view_array_with_tda(base:Psingle; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_view_vector(v:Pgsl_vector_complex_float; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_view_vector_with_tda(v:Pgsl_vector_complex_float; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_complex_float_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_complex_float_set_zero(m:Pgsl_matrix_complex_float);cdecl;external;
procedure gsl_matrix_complex_float_set_identity(m:Pgsl_matrix_complex_float);cdecl;external;
procedure gsl_matrix_complex_float_set_all(m:Pgsl_matrix_complex_float; x:Tgsl_complex_float);cdecl;external;
function gsl_matrix_complex_float_fread(stream:PFILE; m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_fwrite(stream:PFILE; m:Pgsl_matrix_complex_float):longint;cdecl;external;
function gsl_matrix_complex_float_fscanf(stream:PFILE; m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_fprintf(stream:PFILE; m:Pgsl_matrix_complex_float; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_memcpy(dest:Pgsl_matrix_complex_float; src:Pgsl_matrix_complex_float):longint;cdecl;external;
function gsl_matrix_complex_float_swap(m1:Pgsl_matrix_complex_float; m2:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_complex_float; src:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_swap_rows(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_swap_columns(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_swap_rowcol(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_complex_float_transpose(m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_transpose_memcpy(dest:Pgsl_matrix_complex_float; src:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_complex_float; src:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_conjtrans_memcpy(dest:Pgsl_matrix_complex_float; src:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_equal(a:Pgsl_matrix_complex_float; b:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_isnull(m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_ispos(m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_isneg(m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_isnonneg(m:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_add(a:Pgsl_matrix_complex_float; b:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_sub(a:Pgsl_matrix_complex_float; b:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_mul_elements(a:Pgsl_matrix_complex_float; b:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_div_elements(a:Pgsl_matrix_complex_float; b:Pgsl_matrix_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_scale(a:Pgsl_matrix_complex_float; x:Tgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_scale_rows(a:Pgsl_matrix_complex_float; x:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_scale_columns(a:Pgsl_matrix_complex_float; x:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_add_constant(a:Pgsl_matrix_complex_float; x:Tgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_complex_float_add_diagonal(a:Pgsl_matrix_complex_float; x:Tgsl_complex_float):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_get_row(v:Pgsl_vector_complex_float; m:Pgsl_matrix_complex_float; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_get_col(v:Pgsl_vector_complex_float; m:Pgsl_matrix_complex_float; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_set_row(m:Pgsl_matrix_complex_float; i:Tsize_t; v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_set_col(m:Pgsl_matrix_complex_float; j:Tsize_t; v:Pgsl_vector_complex_float):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_get(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):Tgsl_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_complex_float_set(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t; x:Tgsl_complex_float);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_ptr(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):Pgsl_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_complex_float_const_ptr(m:Pgsl_matrix_complex_float; i:Tsize_t; j:Tsize_t):Pgsl_complex_float;cdecl;external;
{$endif}
{ __GSL_MATRIX_COMPLEX_FLOAT_H__  }

implementation


end.
