
unit gsl_matrix_int;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_int.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_int.h
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
Pgsl_block_int  = ^gsl_block_int;
Pgsl_matrix_int  = ^gsl_matrix_int;
Pgsl_matrix_int_const_view  = ^gsl_matrix_int_const_view;
Pgsl_matrix_int_view  = ^gsl_matrix_int_view;
Pgsl_vector_int  = ^gsl_vector_int;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_int.h
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
{$ifndef __GSL_MATRIX_INT_H__}
{$define __GSL_MATRIX_INT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_int.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_int = ^Tgsl_matrix_int;
  Tgsl_matrix_int = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Plongint;
      block : Pgsl_block_int;
      owner : longint;
    end;

  Pgsl_matrix_int_view = ^Tgsl_matrix_int_view;
  Tgsl_matrix_int_view = record
      matrix : Tgsl_matrix_int;
    end;

  Pgsl_matrix_int_view = ^Tgsl_matrix_int_view;
  Tgsl_matrix_int_view = Tgsl_matrix_int_view;

  Pgsl_matrix_int_const_view = ^Tgsl_matrix_int_const_view;
  Tgsl_matrix_int_const_view = record
      matrix : Tgsl_matrix_int;
    end;
(* Const before type ignored *)

  Pgsl_matrix_int_const_view = ^Tgsl_matrix_int_const_view;
  Tgsl_matrix_int_const_view = Tgsl_matrix_int_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_int_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_int;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_int;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_alloc_from_block(b:Pgsl_block_int; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_int;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_alloc_from_matrix(m:Pgsl_matrix_int; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_int;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_alloc_row_from_matrix(m:Pgsl_matrix_int; i:Tsize_t):Pgsl_vector_int;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_alloc_col_from_matrix(m:Pgsl_matrix_int; j:Tsize_t):Pgsl_vector_int;cdecl;external;
procedure gsl_matrix_int_free(m:Pgsl_matrix_int);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_submatrix(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_row(m:Pgsl_matrix_int; i:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_column(m:Pgsl_matrix_int; j:Tsize_t):Tgsl_vector_int_view;cdecl;external;
function gsl_matrix_int_diagonal(m:Pgsl_matrix_int):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_subdiagonal(m:Pgsl_matrix_int; k:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_superdiagonal(m:Pgsl_matrix_int; k:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_subrow(m:Pgsl_matrix_int; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_subcolumn(m:Pgsl_matrix_int; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_view_array(base:Plongint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_view_array_with_tda(base:Plongint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_view_vector(v:Pgsl_vector_int; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_view_vector_with_tda(v:Pgsl_vector_int; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_int_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_submatrix(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_row(m:Pgsl_matrix_int; i:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_column(m:Pgsl_matrix_int; j:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_const_diagonal(m:Pgsl_matrix_int):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_subdiagonal(m:Pgsl_matrix_int; k:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_superdiagonal(m:Pgsl_matrix_int; k:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_subrow(m:Pgsl_matrix_int; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_subcolumn(m:Pgsl_matrix_int; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_view_array(base:Plongint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_view_array_with_tda(base:Plongint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_view_vector(v:Pgsl_vector_int; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_int_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_view_vector_with_tda(v:Pgsl_vector_int; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_int_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_int_set_zero(m:Pgsl_matrix_int);cdecl;external;
procedure gsl_matrix_int_set_identity(m:Pgsl_matrix_int);cdecl;external;
procedure gsl_matrix_int_set_all(m:Pgsl_matrix_int; x:longint);cdecl;external;
function gsl_matrix_int_fread(stream:PFILE; m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_fwrite(stream:PFILE; m:Pgsl_matrix_int):longint;cdecl;external;
function gsl_matrix_int_fscanf(stream:PFILE; m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_fprintf(stream:PFILE; m:Pgsl_matrix_int; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_memcpy(dest:Pgsl_matrix_int; src:Pgsl_matrix_int):longint;cdecl;external;
function gsl_matrix_int_swap(m1:Pgsl_matrix_int; m2:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_int; src:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_swap_rows(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_swap_columns(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_swap_rowcol(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_int_transpose(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_transpose_memcpy(dest:Pgsl_matrix_int; src:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_int; src:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_max(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_min(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_int_minmax(m:Pgsl_matrix_int; min_out:Plongint; max_out:Plongint);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_int_max_index(m:Pgsl_matrix_int; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_int_min_index(m:Pgsl_matrix_int; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_int_minmax_index(m:Pgsl_matrix_int; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_equal(a:Pgsl_matrix_int; b:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_isnull(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_ispos(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_isneg(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_isnonneg(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_norm1(m:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_add(a:Pgsl_matrix_int; b:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_sub(a:Pgsl_matrix_int; b:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_mul_elements(a:Pgsl_matrix_int; b:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_div_elements(a:Pgsl_matrix_int; b:Pgsl_matrix_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_scale(a:Pgsl_matrix_int; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_scale_rows(a:Pgsl_matrix_int; x:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_scale_columns(a:Pgsl_matrix_int; x:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_add_constant(a:Pgsl_matrix_int; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_int_add_diagonal(a:Pgsl_matrix_int; x:longint):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_get_row(v:Pgsl_vector_int; m:Pgsl_matrix_int; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_get_col(v:Pgsl_vector_int; m:Pgsl_matrix_int; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_set_row(m:Pgsl_matrix_int; i:Tsize_t; v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_set_col(m:Pgsl_matrix_int; j:Tsize_t; v:Pgsl_vector_int):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_get(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_int_set(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t; x:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_ptr(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_int_const_ptr(m:Pgsl_matrix_int; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external;
{$endif}
{ __GSL_MATRIX_INT_H__  }

implementation


end.
