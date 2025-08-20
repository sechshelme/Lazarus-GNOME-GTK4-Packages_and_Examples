
unit gsl_matrix_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_short.h
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
Pgsl_block_short  = ^gsl_block_short;
Pgsl_matrix_short  = ^gsl_matrix_short;
Pgsl_matrix_short_const_view  = ^gsl_matrix_short_const_view;
Pgsl_matrix_short_view  = ^gsl_matrix_short_view;
Pgsl_vector_short  = ^gsl_vector_short;
Psize_t  = ^size_t;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_short.h
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
{$ifndef __GSL_MATRIX_SHORT_H__}
{$define __GSL_MATRIX_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_short.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_short = ^Tgsl_matrix_short;
  Tgsl_matrix_short = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Psmallint;
      block : Pgsl_block_short;
      owner : longint;
    end;

  Pgsl_matrix_short_view = ^Tgsl_matrix_short_view;
  Tgsl_matrix_short_view = record
      matrix : Tgsl_matrix_short;
    end;

  Pgsl_matrix_short_view = ^Tgsl_matrix_short_view;
  Tgsl_matrix_short_view = Tgsl_matrix_short_view;

  Pgsl_matrix_short_const_view = ^Tgsl_matrix_short_const_view;
  Tgsl_matrix_short_const_view = record
      matrix : Tgsl_matrix_short;
    end;
(* Const before type ignored *)

  Pgsl_matrix_short_const_view = ^Tgsl_matrix_short_const_view;
  Tgsl_matrix_short_const_view = Tgsl_matrix_short_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_short_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_alloc_from_block(b:Pgsl_block_short; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_alloc_from_matrix(m:Pgsl_matrix_short; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_short;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_alloc_row_from_matrix(m:Pgsl_matrix_short; i:Tsize_t):Pgsl_vector_short;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_alloc_col_from_matrix(m:Pgsl_matrix_short; j:Tsize_t):Pgsl_vector_short;cdecl;external;
procedure gsl_matrix_short_free(m:Pgsl_matrix_short);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_submatrix(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_row(m:Pgsl_matrix_short; i:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_column(m:Pgsl_matrix_short; j:Tsize_t):Tgsl_vector_short_view;cdecl;external;
function gsl_matrix_short_diagonal(m:Pgsl_matrix_short):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_subdiagonal(m:Pgsl_matrix_short; k:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_superdiagonal(m:Pgsl_matrix_short; k:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_subrow(m:Pgsl_matrix_short; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_subcolumn(m:Pgsl_matrix_short; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_view_array(base:Psmallint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_view_array_with_tda(base:Psmallint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_view_vector(v:Pgsl_vector_short; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_view_vector_with_tda(v:Pgsl_vector_short; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_short_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_submatrix(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_row(m:Pgsl_matrix_short; i:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_column(m:Pgsl_matrix_short; j:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_const_diagonal(m:Pgsl_matrix_short):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_subdiagonal(m:Pgsl_matrix_short; k:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_superdiagonal(m:Pgsl_matrix_short; k:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_subrow(m:Pgsl_matrix_short; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_subcolumn(m:Pgsl_matrix_short; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_view_array(base:Psmallint; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_view_array_with_tda(base:Psmallint; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_view_vector(v:Pgsl_vector_short; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_short_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_view_vector_with_tda(v:Pgsl_vector_short; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_short_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_short_set_zero(m:Pgsl_matrix_short);cdecl;external;
procedure gsl_matrix_short_set_identity(m:Pgsl_matrix_short);cdecl;external;
procedure gsl_matrix_short_set_all(m:Pgsl_matrix_short; x:smallint);cdecl;external;
function gsl_matrix_short_fread(stream:PFILE; m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_fwrite(stream:PFILE; m:Pgsl_matrix_short):longint;cdecl;external;
function gsl_matrix_short_fscanf(stream:PFILE; m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_fprintf(stream:PFILE; m:Pgsl_matrix_short; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_memcpy(dest:Pgsl_matrix_short; src:Pgsl_matrix_short):longint;cdecl;external;
function gsl_matrix_short_swap(m1:Pgsl_matrix_short; m2:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_short; src:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_swap_rows(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_swap_columns(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_swap_rowcol(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_short_transpose(m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_transpose_memcpy(dest:Pgsl_matrix_short; src:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_short; src:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_max(m:Pgsl_matrix_short):smallint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_min(m:Pgsl_matrix_short):smallint;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_short_minmax(m:Pgsl_matrix_short; min_out:Psmallint; max_out:Psmallint);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_short_max_index(m:Pgsl_matrix_short; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_short_min_index(m:Pgsl_matrix_short; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_short_minmax_index(m:Pgsl_matrix_short; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_equal(a:Pgsl_matrix_short; b:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_isnull(m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_ispos(m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_isneg(m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_isnonneg(m:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_norm1(m:Pgsl_matrix_short):smallint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_add(a:Pgsl_matrix_short; b:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_sub(a:Pgsl_matrix_short; b:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_mul_elements(a:Pgsl_matrix_short; b:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_div_elements(a:Pgsl_matrix_short; b:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_scale(a:Pgsl_matrix_short; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_scale_rows(a:Pgsl_matrix_short; x:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_scale_columns(a:Pgsl_matrix_short; x:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_add_constant(a:Pgsl_matrix_short; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_short_add_diagonal(a:Pgsl_matrix_short; x:smallint):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_get_row(v:Pgsl_vector_short; m:Pgsl_matrix_short; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_get_col(v:Pgsl_vector_short; m:Pgsl_matrix_short; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_set_row(m:Pgsl_matrix_short; i:Tsize_t; v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_set_col(m:Pgsl_matrix_short; j:Tsize_t; v:Pgsl_vector_short):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_get(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):smallint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_short_set(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t; x:smallint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_ptr(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):Psmallint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_short_const_ptr(m:Pgsl_matrix_short; i:Tsize_t; j:Tsize_t):Psmallint;cdecl;external;
{$endif}
{ __GSL_MATRIX_SHORT_H__  }

implementation


end.
