
unit gsl_matrix_char;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_char.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_char.h
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
Pgsl_block_char  = ^gsl_block_char;
Pgsl_matrix_char  = ^gsl_matrix_char;
Pgsl_matrix_char_const_view  = ^gsl_matrix_char_const_view;
Pgsl_matrix_char_view  = ^gsl_matrix_char_view;
Pgsl_vector_char  = ^gsl_vector_char;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_char.h
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
{$ifndef __GSL_MATRIX_CHAR_H__}
{$define __GSL_MATRIX_CHAR_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_char.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_char = ^Tgsl_matrix_char;
  Tgsl_matrix_char = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Pchar;
      block : Pgsl_block_char;
      owner : longint;
    end;

  Pgsl_matrix_char_view = ^Tgsl_matrix_char_view;
  Tgsl_matrix_char_view = record
      matrix : Tgsl_matrix_char;
    end;

  Pgsl_matrix_char_view = ^Tgsl_matrix_char_view;
  Tgsl_matrix_char_view = Tgsl_matrix_char_view;

  Pgsl_matrix_char_const_view = ^Tgsl_matrix_char_const_view;
  Tgsl_matrix_char_const_view = record
      matrix : Tgsl_matrix_char;
    end;
(* Const before type ignored *)

  Pgsl_matrix_char_const_view = ^Tgsl_matrix_char_const_view;
  Tgsl_matrix_char_const_view = Tgsl_matrix_char_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_char_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_alloc_from_block(b:Pgsl_block_char; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_alloc_from_matrix(m:Pgsl_matrix_char; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_char;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_alloc_row_from_matrix(m:Pgsl_matrix_char; i:Tsize_t):Pgsl_vector_char;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_alloc_col_from_matrix(m:Pgsl_matrix_char; j:Tsize_t):Pgsl_vector_char;cdecl;external;
procedure gsl_matrix_char_free(m:Pgsl_matrix_char);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_submatrix(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_row(m:Pgsl_matrix_char; i:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_column(m:Pgsl_matrix_char; j:Tsize_t):Tgsl_vector_char_view;cdecl;external;
function gsl_matrix_char_diagonal(m:Pgsl_matrix_char):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_subdiagonal(m:Pgsl_matrix_char; k:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_superdiagonal(m:Pgsl_matrix_char; k:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_subrow(m:Pgsl_matrix_char; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_subcolumn(m:Pgsl_matrix_char; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_view_array(base:Pchar; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_view_array_with_tda(base:Pchar; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_view_vector(v:Pgsl_vector_char; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_view_vector_with_tda(v:Pgsl_vector_char; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_char_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_submatrix(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_row(m:Pgsl_matrix_char; i:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_column(m:Pgsl_matrix_char; j:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_const_diagonal(m:Pgsl_matrix_char):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_subdiagonal(m:Pgsl_matrix_char; k:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_superdiagonal(m:Pgsl_matrix_char; k:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_subrow(m:Pgsl_matrix_char; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_subcolumn(m:Pgsl_matrix_char; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_view_array(base:Pchar; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_view_array_with_tda(base:Pchar; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_view_vector(v:Pgsl_vector_char; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_char_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_view_vector_with_tda(v:Pgsl_vector_char; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_char_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_char_set_zero(m:Pgsl_matrix_char);cdecl;external;
procedure gsl_matrix_char_set_identity(m:Pgsl_matrix_char);cdecl;external;
procedure gsl_matrix_char_set_all(m:Pgsl_matrix_char; x:char);cdecl;external;
function gsl_matrix_char_fread(stream:PFILE; m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_fwrite(stream:PFILE; m:Pgsl_matrix_char):longint;cdecl;external;
function gsl_matrix_char_fscanf(stream:PFILE; m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_fprintf(stream:PFILE; m:Pgsl_matrix_char; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_memcpy(dest:Pgsl_matrix_char; src:Pgsl_matrix_char):longint;cdecl;external;
function gsl_matrix_char_swap(m1:Pgsl_matrix_char; m2:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_char; src:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_swap_rows(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_swap_columns(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_swap_rowcol(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_char_transpose(m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_transpose_memcpy(dest:Pgsl_matrix_char; src:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_char; src:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_max(m:Pgsl_matrix_char):char;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_min(m:Pgsl_matrix_char):char;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_char_minmax(m:Pgsl_matrix_char; min_out:Pchar; max_out:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_char_max_index(m:Pgsl_matrix_char; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_char_min_index(m:Pgsl_matrix_char; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_char_minmax_index(m:Pgsl_matrix_char; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_equal(a:Pgsl_matrix_char; b:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_isnull(m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_ispos(m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_isneg(m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_isnonneg(m:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_norm1(m:Pgsl_matrix_char):char;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_add(a:Pgsl_matrix_char; b:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_sub(a:Pgsl_matrix_char; b:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_mul_elements(a:Pgsl_matrix_char; b:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_div_elements(a:Pgsl_matrix_char; b:Pgsl_matrix_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_scale(a:Pgsl_matrix_char; x:char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_scale_rows(a:Pgsl_matrix_char; x:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_scale_columns(a:Pgsl_matrix_char; x:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_add_constant(a:Pgsl_matrix_char; x:char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_char_add_diagonal(a:Pgsl_matrix_char; x:char):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_get_row(v:Pgsl_vector_char; m:Pgsl_matrix_char; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_get_col(v:Pgsl_vector_char; m:Pgsl_matrix_char; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_set_row(m:Pgsl_matrix_char; i:Tsize_t; v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_set_col(m:Pgsl_matrix_char; j:Tsize_t; v:Pgsl_vector_char):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_get(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_char_set(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t; x:char);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_ptr(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_char_const_ptr(m:Pgsl_matrix_char; i:Tsize_t; j:Tsize_t):Pchar;cdecl;external;
{$endif}
{ __GSL_MATRIX_CHAR_H__  }

implementation


end.
