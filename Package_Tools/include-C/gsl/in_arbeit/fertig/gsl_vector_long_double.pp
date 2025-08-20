
unit gsl_vector_long_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_long_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_long_double.h
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
Pgsl_vector_long_double  = ^gsl_vector_long_double;
Pgsl_vector_long_double_const_view  = ^gsl_vector_long_double_const_view;
Pgsl_vector_long_double_view  = ^gsl_vector_long_double_view;
Plong_double  = ^long_double;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_long_double.h
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
{$ifndef __GSL_VECTOR_LONG_DOUBLE_H__}
{$define __GSL_VECTOR_LONG_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_long_double.h>}
type
  Pgsl_vector_long_double = ^Tgsl_vector_long_double;
  Tgsl_vector_long_double = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Plong_double;
      block : Pgsl_block_long_double;
      owner : longint;
    end;

  Pgsl_vector_long_double_view = ^Tgsl_vector_long_double_view;
  Tgsl_vector_long_double_view = record
      vector : Tgsl_vector_long_double;
    end;

  Pgsl_vector_long_double_view = ^Tgsl_vector_long_double_view;
  Tgsl_vector_long_double_view = Tgsl_vector_long_double_view;

  Pgsl_vector_long_double_const_view = ^Tgsl_vector_long_double_const_view;
  Tgsl_vector_long_double_const_view = record
      vector : Tgsl_vector_long_double;
    end;
(* Const before type ignored *)

  Pgsl_vector_long_double_const_view = ^Tgsl_vector_long_double_const_view;
  Tgsl_vector_long_double_const_view = Tgsl_vector_long_double_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_long_double_alloc(n:Tsize_t):Pgsl_vector_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_calloc(n:Tsize_t):Pgsl_vector_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_alloc_from_block(b:Pgsl_block_long_double; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_alloc_from_vector(v:Pgsl_vector_long_double; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_long_double;cdecl;external;
procedure gsl_vector_long_double_free(v:Pgsl_vector_long_double);cdecl;external;
{ Views  }
function gsl_vector_long_double_view_array(v:Plong_double; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
function gsl_vector_long_double_view_array_with_stride(base:Plong_double; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_const_view_array(v:Plong_double; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_const_view_array_with_stride(base:Plong_double; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
function gsl_vector_long_double_subvector(v:Pgsl_vector_long_double; i:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
function gsl_vector_long_double_subvector_with_stride(v:Pgsl_vector_long_double; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_const_subvector(v:Pgsl_vector_long_double; i:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_const_subvector_with_stride(v:Pgsl_vector_long_double; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_double_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_long_double_set_zero(v:Pgsl_vector_long_double);cdecl;external;
procedure gsl_vector_long_double_set_all(v:Pgsl_vector_long_double; x:Tlong_double);cdecl;external;
function gsl_vector_long_double_set_basis(v:Pgsl_vector_long_double; i:Tsize_t):longint;cdecl;external;
function gsl_vector_long_double_fread(stream:PFILE; v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_fwrite(stream:PFILE; v:Pgsl_vector_long_double):longint;cdecl;external;
function gsl_vector_long_double_fscanf(stream:PFILE; v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_fprintf(stream:PFILE; v:Pgsl_vector_long_double; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_memcpy(dest:Pgsl_vector_long_double; src:Pgsl_vector_long_double):longint;cdecl;external;
function gsl_vector_long_double_reverse(v:Pgsl_vector_long_double):longint;cdecl;external;
function gsl_vector_long_double_swap(v:Pgsl_vector_long_double; w:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_swap_elements(v:Pgsl_vector_long_double; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_max(v:Pgsl_vector_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_min(v:Pgsl_vector_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_double_minmax(v:Pgsl_vector_long_double; min_out:Plong_double; max_out:Plong_double);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_max_index(v:Pgsl_vector_long_double):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_min_index(v:Pgsl_vector_long_double):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_double_minmax_index(v:Pgsl_vector_long_double; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_add(a:Pgsl_vector_long_double; b:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_sub(a:Pgsl_vector_long_double; b:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_mul(a:Pgsl_vector_long_double; b:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_div(a:Pgsl_vector_long_double; b:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_scale(a:Pgsl_vector_long_double; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_add_constant(a:Pgsl_vector_long_double; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_axpby(alpha:Tlong_double; x:Pgsl_vector_long_double; beta:Tlong_double; y:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_sum(a:Pgsl_vector_long_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_equal(u:Pgsl_vector_long_double; v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_isnull(v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_ispos(v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_isneg(v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_isnonneg(v:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_get(v:Pgsl_vector_long_double; i:Tsize_t):Tlong_double;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_double_set(v:Pgsl_vector_long_double; i:Tsize_t; x:Tlong_double);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_double_ptr(v:Pgsl_vector_long_double; i:Tsize_t):Plong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_double_const_ptr(v:Pgsl_vector_long_double; i:Tsize_t):Plong_double;cdecl;external;
{$endif}
{ __GSL_VECTOR_LONG_DOUBLE_H__  }

implementation


end.
