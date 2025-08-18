
unit gsl_vector_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_double.h
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
Pgsl_vector  = ^gsl_vector;
Pgsl_vector_const_view  = ^gsl_vector_const_view;
Pgsl_vector_view  = ^gsl_vector_view;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_double.h
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
{$ifndef __GSL_VECTOR_DOUBLE_H__}
{$define __GSL_VECTOR_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_double.h>}
type
  Pgsl_vector = ^Tgsl_vector;
  Tgsl_vector = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pdouble;
      block : Pgsl_block;
      owner : longint;
    end;

  Pgsl_vector_view = ^Tgsl_vector_view;
  Tgsl_vector_view = record
      vector : Tgsl_vector;
    end;

  Pgsl_vector_view = ^Tgsl_vector_view;
  Tgsl_vector_view = Tgsl_vector_view;

  Pgsl_vector_const_view = ^Tgsl_vector_const_view;
  Tgsl_vector_const_view = record
      vector : Tgsl_vector;
    end;
(* Const before type ignored *)

  Pgsl_vector_const_view = ^Tgsl_vector_const_view;
  Tgsl_vector_const_view = Tgsl_vector_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_alloc(n:Tsize_t):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_vector_calloc(n:Tsize_t):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_alloc_from_block(b:Pgsl_block; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_alloc_from_vector(v:Pgsl_vector; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector;cdecl;external;
procedure gsl_vector_free(v:Pgsl_vector);cdecl;external;
{ Views  }
function gsl_vector_view_array(v:Pdouble; n:Tsize_t):Tgsl_vector_view;cdecl;external;
function gsl_vector_view_array_with_stride(base:Pdouble; stride:Tsize_t; n:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_const_view_array(v:Pdouble; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_const_view_array_with_stride(base:Pdouble; stride:Tsize_t; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
function gsl_vector_subvector(v:Pgsl_vector; i:Tsize_t; n:Tsize_t):Tgsl_vector_view;cdecl;external;
function gsl_vector_subvector_with_stride(v:Pgsl_vector; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_const_subvector(v:Pgsl_vector; i:Tsize_t; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_const_subvector_with_stride(v:Pgsl_vector; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_set_zero(v:Pgsl_vector);cdecl;external;
procedure gsl_vector_set_all(v:Pgsl_vector; x:Tdouble);cdecl;external;
function gsl_vector_set_basis(v:Pgsl_vector; i:Tsize_t):longint;cdecl;external;
function gsl_vector_fread(stream:PFILE; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_fwrite(stream:PFILE; v:Pgsl_vector):longint;cdecl;external;
function gsl_vector_fscanf(stream:PFILE; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_fprintf(stream:PFILE; v:Pgsl_vector; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_memcpy(dest:Pgsl_vector; src:Pgsl_vector):longint;cdecl;external;
function gsl_vector_reverse(v:Pgsl_vector):longint;cdecl;external;
function gsl_vector_swap(v:Pgsl_vector; w:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_swap_elements(v:Pgsl_vector; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_max(v:Pgsl_vector):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_vector_min(v:Pgsl_vector):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_minmax(v:Pgsl_vector; min_out:Pdouble; max_out:Pdouble);cdecl;external;
(* Const before type ignored *)
function gsl_vector_max_index(v:Pgsl_vector):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_min_index(v:Pgsl_vector):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_minmax_index(v:Pgsl_vector; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_add(a:Pgsl_vector; b:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_sub(a:Pgsl_vector; b:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_mul(a:Pgsl_vector; b:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_div(a:Pgsl_vector; b:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_scale(a:Pgsl_vector; x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_add_constant(a:Pgsl_vector; x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_axpby(alpha:Tdouble; x:Pgsl_vector; beta:Tdouble; y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_sum(a:Pgsl_vector):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_equal(u:Pgsl_vector; v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_isnull(v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ispos(v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_isneg(v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_isnonneg(v:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_get(v:Pgsl_vector; i:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_set(v:Pgsl_vector; i:Tsize_t; x:Tdouble);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ptr(v:Pgsl_vector; i:Tsize_t):Pdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_const_ptr(v:Pgsl_vector; i:Tsize_t):Pdouble;cdecl;external;
{$ifdef HAVE_INLINE}
{$endif}
{ __GSL_VECTOR_DOUBLE_H__  }

implementation


end.
