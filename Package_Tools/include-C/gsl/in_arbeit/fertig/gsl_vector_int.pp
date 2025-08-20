
unit gsl_vector_int;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_int.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_int.h
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
Pgsl_vector_int  = ^gsl_vector_int;
Pgsl_vector_int_const_view  = ^gsl_vector_int_const_view;
Pgsl_vector_int_view  = ^gsl_vector_int_view;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_int.h
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
{$ifndef __GSL_VECTOR_INT_H__}
{$define __GSL_VECTOR_INT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_int.h>}
type
  Pgsl_vector_int = ^Tgsl_vector_int;
  Tgsl_vector_int = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Plongint;
      block : Pgsl_block_int;
      owner : longint;
    end;

  Pgsl_vector_int_view = ^Tgsl_vector_int_view;
  Tgsl_vector_int_view = record
      vector : Tgsl_vector_int;
    end;

  Pgsl_vector_int_view = ^Tgsl_vector_int_view;
  Tgsl_vector_int_view = Tgsl_vector_int_view;

  Pgsl_vector_int_const_view = ^Tgsl_vector_int_const_view;
  Tgsl_vector_int_const_view = record
      vector : Tgsl_vector_int;
    end;
(* Const before type ignored *)

  Pgsl_vector_int_const_view = ^Tgsl_vector_int_const_view;
  Tgsl_vector_int_const_view = Tgsl_vector_int_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_int_alloc(n:Tsize_t):Pgsl_vector_int;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_calloc(n:Tsize_t):Pgsl_vector_int;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_alloc_from_block(b:Pgsl_block_int; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_int;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_alloc_from_vector(v:Pgsl_vector_int; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_int;cdecl;external;
procedure gsl_vector_int_free(v:Pgsl_vector_int);cdecl;external;
{ Views  }
function gsl_vector_int_view_array(v:Plongint; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
function gsl_vector_int_view_array_with_stride(base:Plongint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_const_view_array(v:Plongint; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_const_view_array_with_stride(base:Plongint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
function gsl_vector_int_subvector(v:Pgsl_vector_int; i:Tsize_t; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
function gsl_vector_int_subvector_with_stride(v:Pgsl_vector_int; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_int_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_const_subvector(v:Pgsl_vector_int; i:Tsize_t; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_const_subvector_with_stride(v:Pgsl_vector_int; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_int_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_int_set_zero(v:Pgsl_vector_int);cdecl;external;
procedure gsl_vector_int_set_all(v:Pgsl_vector_int; x:longint);cdecl;external;
function gsl_vector_int_set_basis(v:Pgsl_vector_int; i:Tsize_t):longint;cdecl;external;
function gsl_vector_int_fread(stream:PFILE; v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_fwrite(stream:PFILE; v:Pgsl_vector_int):longint;cdecl;external;
function gsl_vector_int_fscanf(stream:PFILE; v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_fprintf(stream:PFILE; v:Pgsl_vector_int; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_memcpy(dest:Pgsl_vector_int; src:Pgsl_vector_int):longint;cdecl;external;
function gsl_vector_int_reverse(v:Pgsl_vector_int):longint;cdecl;external;
function gsl_vector_int_swap(v:Pgsl_vector_int; w:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_swap_elements(v:Pgsl_vector_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_max(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_min(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_int_minmax(v:Pgsl_vector_int; min_out:Plongint; max_out:Plongint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_max_index(v:Pgsl_vector_int):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_min_index(v:Pgsl_vector_int):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_int_minmax_index(v:Pgsl_vector_int; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_add(a:Pgsl_vector_int; b:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_sub(a:Pgsl_vector_int; b:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_mul(a:Pgsl_vector_int; b:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_div(a:Pgsl_vector_int; b:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_scale(a:Pgsl_vector_int; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_add_constant(a:Pgsl_vector_int; x:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_axpby(alpha:longint; x:Pgsl_vector_int; beta:longint; y:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_sum(a:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_equal(u:Pgsl_vector_int; v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_isnull(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_ispos(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_isneg(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_isnonneg(v:Pgsl_vector_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_get(v:Pgsl_vector_int; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_int_set(v:Pgsl_vector_int; i:Tsize_t; x:longint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_int_ptr(v:Pgsl_vector_int; i:Tsize_t):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_int_const_ptr(v:Pgsl_vector_int; i:Tsize_t):Plongint;cdecl;external;
{$endif}
{ __GSL_VECTOR_INT_H__  }

implementation


end.
