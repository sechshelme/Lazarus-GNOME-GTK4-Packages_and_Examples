
unit gsl_matrix_ulong;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_matrix_ulong.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_matrix_ulong.h
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
Pdword  = ^dword;
PFILE  = ^FILE;
Pgsl_block_ulong  = ^gsl_block_ulong;
Pgsl_matrix_ulong  = ^gsl_matrix_ulong;
Pgsl_matrix_ulong_const_view  = ^gsl_matrix_ulong_const_view;
Pgsl_matrix_ulong_view  = ^gsl_matrix_ulong_view;
Pgsl_vector_ulong  = ^gsl_vector_ulong;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ matrix/gsl_matrix_ulong.h
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
{$ifndef __GSL_MATRIX_ULONG_H__}
{$define __GSL_MATRIX_ULONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_ulong.h>}
{$include <gsl/gsl_blas_types.h>}
type
  Pgsl_matrix_ulong = ^Tgsl_matrix_ulong;
  Tgsl_matrix_ulong = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      tda : Tsize_t;
      data : Pdword;
      block : Pgsl_block_ulong;
      owner : longint;
    end;

  Pgsl_matrix_ulong_view = ^Tgsl_matrix_ulong_view;
  Tgsl_matrix_ulong_view = record
      matrix : Tgsl_matrix_ulong;
    end;

  Pgsl_matrix_ulong_view = ^Tgsl_matrix_ulong_view;
  Tgsl_matrix_ulong_view = Tgsl_matrix_ulong_view;

  Pgsl_matrix_ulong_const_view = ^Tgsl_matrix_ulong_const_view;
  Tgsl_matrix_ulong_const_view = record
      matrix : Tgsl_matrix_ulong;
    end;
(* Const before type ignored *)

  Pgsl_matrix_ulong_const_view = ^Tgsl_matrix_ulong_const_view;
  Tgsl_matrix_ulong_const_view = Tgsl_matrix_ulong_const_view;
{ Allocation  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_matrix_ulong_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_calloc(n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_alloc_from_block(b:Pgsl_block_ulong; offset:Tsize_t; n1:Tsize_t; n2:Tsize_t; d2:Tsize_t):Pgsl_matrix_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_alloc_from_matrix(m:Pgsl_matrix_ulong; k1:Tsize_t; k2:Tsize_t; n1:Tsize_t; n2:Tsize_t):Pgsl_matrix_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_alloc_row_from_matrix(m:Pgsl_matrix_ulong; i:Tsize_t):Pgsl_vector_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_alloc_col_from_matrix(m:Pgsl_matrix_ulong; j:Tsize_t):Pgsl_vector_ulong;cdecl;external;
procedure gsl_matrix_ulong_free(m:Pgsl_matrix_ulong);cdecl;external;
{ Views  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_submatrix(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_row(m:Pgsl_matrix_ulong; i:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_column(m:Pgsl_matrix_ulong; j:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
function gsl_matrix_ulong_diagonal(m:Pgsl_matrix_ulong):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_subdiagonal(m:Pgsl_matrix_ulong; k:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_superdiagonal(m:Pgsl_matrix_ulong; k:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_subrow(m:Pgsl_matrix_ulong; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_subcolumn(m:Pgsl_matrix_ulong; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_view_array(base:Pdword; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_view_array_with_tda(base:Pdword; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_view_vector(v:Pgsl_vector_ulong; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_view_vector_with_tda(v:Pgsl_vector_ulong; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_ulong_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_submatrix(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_row(m:Pgsl_matrix_ulong; i:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_column(m:Pgsl_matrix_ulong; j:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_const_diagonal(m:Pgsl_matrix_ulong):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_subdiagonal(m:Pgsl_matrix_ulong; k:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_superdiagonal(m:Pgsl_matrix_ulong; k:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_subrow(m:Pgsl_matrix_ulong; i:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_subcolumn(m:Pgsl_matrix_ulong; j:Tsize_t; offset:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_view_array(base:Pdword; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_view_array_with_tda(base:Pdword; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_view_vector(v:Pgsl_vector_ulong; n1:Tsize_t; n2:Tsize_t):Tgsl_matrix_ulong_const_view;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_view_vector_with_tda(v:Pgsl_vector_ulong; n1:Tsize_t; n2:Tsize_t; tda:Tsize_t):Tgsl_matrix_ulong_const_view;cdecl;external;
{ Operations  }
procedure gsl_matrix_ulong_set_zero(m:Pgsl_matrix_ulong);cdecl;external;
procedure gsl_matrix_ulong_set_identity(m:Pgsl_matrix_ulong);cdecl;external;
procedure gsl_matrix_ulong_set_all(m:Pgsl_matrix_ulong; x:dword);cdecl;external;
function gsl_matrix_ulong_fread(stream:PFILE; m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_fwrite(stream:PFILE; m:Pgsl_matrix_ulong):longint;cdecl;external;
function gsl_matrix_ulong_fscanf(stream:PFILE; m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_fprintf(stream:PFILE; m:Pgsl_matrix_ulong; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_memcpy(dest:Pgsl_matrix_ulong; src:Pgsl_matrix_ulong):longint;cdecl;external;
function gsl_matrix_ulong_swap(m1:Pgsl_matrix_ulong; m2:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_tricpy(Uplo:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_ulong; src:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_swap_rows(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_swap_columns(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_swap_rowcol(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
function gsl_matrix_ulong_transpose(m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_transpose_memcpy(dest:Pgsl_matrix_ulong; src:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_transpose_tricpy(Uplo_src:TCBLAS_UPLO_t; Diag:TCBLAS_DIAG_t; dest:Pgsl_matrix_ulong; src:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_max(m:Pgsl_matrix_ulong):dword;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_min(m:Pgsl_matrix_ulong):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_ulong_minmax(m:Pgsl_matrix_ulong; min_out:Pdword; max_out:Pdword);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_ulong_max_index(m:Pgsl_matrix_ulong; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_ulong_min_index(m:Pgsl_matrix_ulong; imin:Psize_t; jmin:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_matrix_ulong_minmax_index(m:Pgsl_matrix_ulong; imin:Psize_t; jmin:Psize_t; imax:Psize_t; jmax:Psize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_equal(a:Pgsl_matrix_ulong; b:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_isnull(m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_ispos(m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_isneg(m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_isnonneg(m:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_norm1(m:Pgsl_matrix_ulong):dword;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_add(a:Pgsl_matrix_ulong; b:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_sub(a:Pgsl_matrix_ulong; b:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_mul_elements(a:Pgsl_matrix_ulong; b:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_div_elements(a:Pgsl_matrix_ulong; b:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_scale(a:Pgsl_matrix_ulong; x:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_scale_rows(a:Pgsl_matrix_ulong; x:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_scale_columns(a:Pgsl_matrix_ulong; x:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_add_constant(a:Pgsl_matrix_ulong; x:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_matrix_ulong_add_diagonal(a:Pgsl_matrix_ulong; x:dword):longint;cdecl;external;
{********************************************************************* }
{ The functions below are obsolete                                     }
{********************************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_get_row(v:Pgsl_vector_ulong; m:Pgsl_matrix_ulong; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_get_col(v:Pgsl_vector_ulong; m:Pgsl_matrix_ulong; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_set_row(m:Pgsl_matrix_ulong; i:Tsize_t; v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_set_col(m:Pgsl_matrix_ulong; j:Tsize_t; v:Pgsl_vector_ulong):longint;cdecl;external;
{********************************************************************* }
{ inline functions if you are using GCC  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_get(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_matrix_ulong_set(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t; x:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_ptr(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):Pdword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_matrix_ulong_const_ptr(m:Pgsl_matrix_ulong; i:Tsize_t; j:Tsize_t):Pdword;cdecl;external;
{$endif}
{ __GSL_MATRIX_ULONG_H__  }

implementation


end.
