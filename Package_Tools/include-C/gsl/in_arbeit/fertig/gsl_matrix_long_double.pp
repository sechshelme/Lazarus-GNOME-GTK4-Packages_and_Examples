
unit gsl_matrix_long_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_long_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_long_double.h
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
Pgsl_block_long_double  = ^gsl_block_long_double;
Pgsl_matrix_long_double  = ^gsl_matrix_long_double;
Pgsl_matrix_long_double_const_view  = ^gsl_matrix_long_double_const_view;
Pgsl_matrix_long_double_view  = ^gsl_matrix_long_double_view;
Pgsl_vector_long_double  = ^gsl_vector_long_double;
Plong_double  = ^long_double;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_long_double.h
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
{$ifndef __GSL_MATRIX_LONG_DOUBLE_H__}
{$define __GSL_MATRIX_LONG_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_long_double.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_long_double = ^Tgsl_matrix_long_double;
  Tgsl_matrix_long_double = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Plong_double;
      block : Pgsl_block_long_double;
      owner : longint;
    end;

  Pgsl_matrix_long_double_view = ^Tgsl_matrix_long_double_view;
  Tgsl_matrix_long_double_view = record
      matrix : Tgsl_matrix_long_double;
    end;

  Pgsl_matrix_long_double_view = ^Tgsl_matrix_long_double_view;
  Tgsl_matrix_long_double_view = Tgsl_matrix_long_double_view;

  Pgsl_matrix_long_double_const_view = ^Tgsl_matrix_long_double_const_view;
  Tgsl_matrix_long_double_const_view = record
      matrix : Tgsl_matrix_long_double;
    end;
(* Const before type ignored *)

  Pgsl_matrix_long_double_const_view = ^Tgsl_matrix_long_double_const_view;
  Tgsl_matrix_long_double_const_view = Tgsl_matrix_long_double_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_long_double_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_alloc_from_block(b:Pgsl_block_long_double; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_alloc_from_matrix(m:Pgsl_matrix_long_double; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_alloc_row_from_matrix(m:Pgsl_matrix_long_double; i:Tsize_t):Pgsl_vector_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_alloc_col_from_matrix(m:Pgsl_matrix_long_double; j:Tsize_t):Pgsl_vector_long_double;cdecl;external;
procedure gsl_matrix_long_double_free(m:Pgsl_matrix_long_double);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_submatrix(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_row(m:Pgsl_matrix_long_double; i:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_column(m:Pgsl_matrix_long_double; j:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
function gsl_matrix_long_double_diagonal(m:Pgsl_matrix_long_double):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_subdiagonal(m:Pgsl_matrix_long_double; k:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_superdiagonal(m:Pgsl_matrix_long_double; k:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_subrow(m:Pgsl_matrix_long_double; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_subcolumn(m:Pgsl_matrix_long_double; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_view_array(base:Plong_double; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_view_array_with_tda(base:Plong_double; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_view_vector(v:Pgsl_vector_long_double; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_view_vector_with_tda(v:Pgsl_vector_long_double; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_double_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_submatrix(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_row(m:Pgsl_matrix_long_double; i:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_column(m:Pgsl_matrix_long_double; j:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_const_diagonal(m:Pgsl_matrix_long_double):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_subdiagonal(m:Pgsl_matrix_long_double; k:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_superdiagonal(m:Pgsl_matrix_long_double; k:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_subrow(m:Pgsl_matrix_long_double; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_subcolumn(m:Pgsl_matrix_long_double; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_view_array(base:Plong_double; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_view_array_with_tda(base:Plong_double; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_view_vector(v:Pgsl_vector_long_double; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_double_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_view_vector_with_tda(v:Pgsl_vector_long_double; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_double_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_long_double_set_zero(m:Pgsl_matrix_long_double);cdecl;external;
procedure gsl_matrix_long_double_set_identity(m:Pgsl_matrix_long_double);cdecl;external;
procedure gsl_matrix_long_double_set_all(m:Pgsl_matrix_long_double; x:Tlong_double);cdecl;external;
function gsl_matrix_long_double_fread(stream:PFILE; m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_fwrite(stream:PFILE; m:Pgsl_matrix_long_double):longint;cdecl;external;
function gsl_matrix_long_double_fscanf(stream:PFILE; m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_fprintf(stream:PFILE; m:Pgsl_matrix_long_double; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_memcpy(dest:Pgsl_matrix_long_double; src:Pgsl_matrix_long_double):longint;cdecl;external;
function gsl_matrix_long_double_swap(m1:Pgsl_matrix_long_double; m2:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_long_double; src:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_swap_rows(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_swap_columns(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_swap_rowcol(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_long_double_transpose(m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_transpose_memcpy(dest:Pgsl_matrix_long_double; src:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_long_double; src:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_max(m:Pgsl_matrix_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_min(m:Pgsl_matrix_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_double_minmax(m:Pgsl_matrix_long_double; min_out:Plong_double; max_out:Plong_double);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_double_max_index(m:Pgsl_matrix_long_double; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_double_min_index(m:Pgsl_matrix_long_double; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_double_minmax_index(m:Pgsl_matrix_long_double; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_equal(a:Pgsl_matrix_long_double; b:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_isnull(m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_ispos(m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_isneg(m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_isnonneg(m:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_norm1(m:Pgsl_matrix_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_add(a:Pgsl_matrix_long_double; b:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_sub(a:Pgsl_matrix_long_double; b:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_mul_elements(a:Pgsl_matrix_long_double; b:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_div_elements(a:Pgsl_matrix_long_double; b:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_scale(a:Pgsl_matrix_long_double; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_scale_rows(a:Pgsl_matrix_long_double; x:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_scale_columns(a:Pgsl_matrix_long_double; x:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_add_constant(a:Pgsl_matrix_long_double; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_double_add_diagonal(a:Pgsl_matrix_long_double; x:Tlong_double):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_get_row(v:Pgsl_vector_long_double; m:Pgsl_matrix_long_double; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_get_col(v:Pgsl_vector_long_double; m:Pgsl_matrix_long_double; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_set_row(m:Pgsl_matrix_long_double; i:Tsize_t; v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_set_col(m:Pgsl_matrix_long_double; j:Tsize_t; v:Pgsl_vector_long_double):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_get(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):Tlong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_long_double_set(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t; x:Tlong_double);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_ptr(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):Plong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_double_const_ptr(m:Pgsl_matrix_long_double; i:Tsize_t; j:Tsize_t):Plong_double;cdecl;external;
{$endif}
{ __GSL_MATRIX_LONG_DOUBLE_H__  }

implementation


end.
