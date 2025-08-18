
unit gsl_matrix_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_double.h
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
Pdouble  = ^double;
PFILE  = ^FILE;
Pgsl_block  = ^gsl_block;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_matrix_const_view  = ^gsl_matrix_const_view;
Pgsl_matrix_view  = ^gsl_matrix_view;
Pgsl_vector  = ^gsl_vector;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_double.h
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
{$ifndef __GSL_MATRIX_DOUBLE_H__}
{$define __GSL_MATRIX_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_double.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix = ^Tgsl_matrix;
  Tgsl_matrix = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Pdouble;
      block : Pgsl_block;
      owner : longint;
    end;

  Pgsl_matrix_view = ^Tgsl_matrix_view;
  Tgsl_matrix_view = record
      matrix : Tgsl_matrix;
    end;

  Pgsl_matrix_view = ^Tgsl_matrix_view;
  Tgsl_matrix_view = Tgsl_matrix_view;

  Pgsl_matrix_const_view = ^Tgsl_matrix_const_view;
  Tgsl_matrix_const_view = record
      matrix : Tgsl_matrix;
    end;
(* Const before type ignored *)

  Pgsl_matrix_const_view = ^Tgsl_matrix_const_view;
  Tgsl_matrix_const_view = Tgsl_matrix_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_alloc_from_block(b:Pgsl_block; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_alloc_from_matrix(m:Pgsl_matrix; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix;cdecl;external;
(* Const before type ignored *)
function gsl_vector_alloc_row_from_matrix(m:Pgsl_matrix; i:Tsize_t):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_vector_alloc_col_from_matrix(m:Pgsl_matrix; j:Tsize_t):Pgsl_vector;cdecl;external;
procedure gsl_matrix_free(m:Pgsl_matrix);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_submatrix(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_row(m:Pgsl_matrix; i:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_column(m:Pgsl_matrix; j:Tsize_t):Tgsl_vector_view;cdecl;external;
function gsl_matrix_diagonal(m:Pgsl_matrix):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_subdiagonal(m:Pgsl_matrix; k:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_superdiagonal(m:Pgsl_matrix; k:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_subrow(m:Pgsl_matrix; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_subcolumn(m:Pgsl_matrix; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_view_array(base:Pdouble; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_view_array_with_tda(base:Pdouble; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_view_vector(v:Pgsl_vector; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_view_vector_with_tda(v:Pgsl_vector; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_submatrix(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_row(m:Pgsl_matrix; i:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_column(m:Pgsl_matrix; j:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_const_diagonal(m:Pgsl_matrix):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_subdiagonal(m:Pgsl_matrix; k:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_superdiagonal(m:Pgsl_matrix; k:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_subrow(m:Pgsl_matrix; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_subcolumn(m:Pgsl_matrix; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_view_array(base:Pdouble; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_view_array_with_tda(base:Pdouble; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_view_vector(v:Pgsl_vector; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_view_vector_with_tda(v:Pgsl_vector; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_set_zero(m:Pgsl_matrix);cdecl;external;
procedure gsl_matrix_set_identity(m:Pgsl_matrix);cdecl;external;
procedure gsl_matrix_set_all(m:Pgsl_matrix; x:Tdouble);cdecl;external;
function gsl_matrix_fread(stream:PFILE; m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_fwrite(stream:PFILE; m:Pgsl_matrix):longint;cdecl;external;
function gsl_matrix_fscanf(stream:PFILE; m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_fprintf(stream:PFILE; m:Pgsl_matrix; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_memcpy(dest:Pgsl_matrix; src:Pgsl_matrix):longint;cdecl;external;
function gsl_matrix_swap(m1:Pgsl_matrix; m2:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix; src:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_swap_rows(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_swap_columns(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_swap_rowcol(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_transpose(m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_transpose_memcpy(dest:Pgsl_matrix; src:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix; src:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_max(m:Pgsl_matrix):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_min(m:Pgsl_matrix):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_minmax(m:Pgsl_matrix; min_out:Pdouble; max_out:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_max_index(m:Pgsl_matrix; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_min_index(m:Pgsl_matrix; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_minmax_index(m:Pgsl_matrix; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_equal(a:Pgsl_matrix; b:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_isnull(m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ispos(m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_isneg(m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_isnonneg(m:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_norm1(m:Pgsl_matrix):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_add(a:Pgsl_matrix; b:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_sub(a:Pgsl_matrix; b:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_mul_elements(a:Pgsl_matrix; b:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_div_elements(a:Pgsl_matrix; b:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_scale(a:Pgsl_matrix; x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_scale_rows(a:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_scale_columns(a:Pgsl_matrix; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_add_constant(a:Pgsl_matrix; x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_add_diagonal(a:Pgsl_matrix; x:Tdouble):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_get_row(v:Pgsl_vector; m:Pgsl_matrix; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_get_col(v:Pgsl_vector; m:Pgsl_matrix; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_set_row(m:Pgsl_matrix; i:Tsize_t; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_set_col(m:Pgsl_matrix; j:Tsize_t; v:Pgsl_vector):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_get(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_set(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t; x:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ptr(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):Pdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_const_ptr(m:Pgsl_matrix; i:Tsize_t; j:Tsize_t):Pdouble;cdecl;external;
{$endif}
{ __GSL_MATRIX_DOUBLE_H__  }

implementation


end.
