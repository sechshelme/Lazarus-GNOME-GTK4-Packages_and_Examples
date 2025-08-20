
unit gsl_matrix_long;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_long.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_long.h
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
Pgsl_block_long  = ^gsl_block_long;
Pgsl_matrix_long  = ^gsl_matrix_long;
Pgsl_matrix_long_const_view  = ^gsl_matrix_long_const_view;
Pgsl_matrix_long_view  = ^gsl_matrix_long_view;
Pgsl_vector_long  = ^gsl_vector_long;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_long.h
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
{$ifndef __GSL_MATRIX_LONG_H__}
{$define __GSL_MATRIX_LONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_long.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_long = ^Tgsl_matrix_long;
  Tgsl_matrix_long = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Plongint;
      block : Pgsl_block_long;
      owner : longint;
    end;

  Pgsl_matrix_long_view = ^Tgsl_matrix_long_view;
  Tgsl_matrix_long_view = record
      matrix : Tgsl_matrix_long;
    end;

  Pgsl_matrix_long_view = ^Tgsl_matrix_long_view;
  Tgsl_matrix_long_view = Tgsl_matrix_long_view;

  Pgsl_matrix_long_const_view = ^Tgsl_matrix_long_const_view;
  Tgsl_matrix_long_const_view = record
      matrix : Tgsl_matrix_long;
    end;
(* Const before type ignored *)

  Pgsl_matrix_long_const_view = ^Tgsl_matrix_long_const_view;
  Tgsl_matrix_long_const_view = Tgsl_matrix_long_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_long_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_alloc_from_block(b:Pgsl_block_long; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_alloc_from_matrix(m:Pgsl_matrix_long; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_long;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_alloc_row_from_matrix(m:Pgsl_matrix_long; i:Tsize_t):Pgsl_vector_long;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_alloc_col_from_matrix(m:Pgsl_matrix_long; j:Tsize_t):Pgsl_vector_long;cdecl;external;
procedure gsl_matrix_long_free(m:Pgsl_matrix_long);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_submatrix(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_row(m:Pgsl_matrix_long; i:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_column(m:Pgsl_matrix_long; j:Tsize_t):Tgsl_vector_long_view;cdecl;external;
function gsl_matrix_long_diagonal(m:Pgsl_matrix_long):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_subdiagonal(m:Pgsl_matrix_long; k:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_superdiagonal(m:Pgsl_matrix_long; k:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_subrow(m:Pgsl_matrix_long; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_subcolumn(m:Pgsl_matrix_long; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_view_array(base:Plongint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_view_array_with_tda(base:Plongint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_view_vector(v:Pgsl_vector_long; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_view_vector_with_tda(v:Pgsl_vector_long; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_submatrix(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_row(m:Pgsl_matrix_long; i:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_column(m:Pgsl_matrix_long; j:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_const_diagonal(m:Pgsl_matrix_long):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_subdiagonal(m:Pgsl_matrix_long; k:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_superdiagonal(m:Pgsl_matrix_long; k:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_subrow(m:Pgsl_matrix_long; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_subcolumn(m:Pgsl_matrix_long; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_view_array(base:Plongint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_view_array_with_tda(base:Plongint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_view_vector(v:Pgsl_vector_long; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_long_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_view_vector_with_tda(v:Pgsl_vector_long; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_long_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_long_set_zero(m:Pgsl_matrix_long);cdecl;external;
procedure gsl_matrix_long_set_identity(m:Pgsl_matrix_long);cdecl;external;
procedure gsl_matrix_long_set_all(m:Pgsl_matrix_long; x:longint);cdecl;external;
function gsl_matrix_long_fread(stream:PFILE; m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_fwrite(stream:PFILE; m:Pgsl_matrix_long):longint;cdecl;external;
function gsl_matrix_long_fscanf(stream:PFILE; m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_fprintf(stream:PFILE; m:Pgsl_matrix_long; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_memcpy(dest:Pgsl_matrix_long; src:Pgsl_matrix_long):longint;cdecl;external;
function gsl_matrix_long_swap(m1:Pgsl_matrix_long; m2:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_long; src:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_swap_rows(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_swap_columns(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_swap_rowcol(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_long_transpose(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_transpose_memcpy(dest:Pgsl_matrix_long; src:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_long; src:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_max(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_min(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_minmax(m:Pgsl_matrix_long; min_out:Plongint; max_out:Plongint);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_max_index(m:Pgsl_matrix_long; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_min_index(m:Pgsl_matrix_long; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_long_minmax_index(m:Pgsl_matrix_long; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_equal(a:Pgsl_matrix_long; b:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_isnull(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_ispos(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_isneg(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_isnonneg(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_norm1(m:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_add(a:Pgsl_matrix_long; b:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_sub(a:Pgsl_matrix_long; b:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_mul_elements(a:Pgsl_matrix_long; b:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_div_elements(a:Pgsl_matrix_long; b:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_scale(a:Pgsl_matrix_long; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_scale_rows(a:Pgsl_matrix_long; x:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_scale_columns(a:Pgsl_matrix_long; x:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_add_constant(a:Pgsl_matrix_long; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_long_add_diagonal(a:Pgsl_matrix_long; x:longint):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_get_row(v:Pgsl_vector_long; m:Pgsl_matrix_long; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_get_col(v:Pgsl_vector_long; m:Pgsl_matrix_long; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_set_row(m:Pgsl_matrix_long; i:Tsize_t; v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_set_col(m:Pgsl_matrix_long; j:Tsize_t; v:Pgsl_vector_long):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_get(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_long_set(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t; x:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_ptr(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_long_const_ptr(m:Pgsl_matrix_long; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external;
{$endif}
{ __GSL_MATRIX_LONG_H__  }

implementation


end.
