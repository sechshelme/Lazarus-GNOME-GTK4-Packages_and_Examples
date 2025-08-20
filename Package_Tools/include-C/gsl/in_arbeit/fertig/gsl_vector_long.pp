
unit gsl_vector_long;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_long.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_long.h
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
Pgsl_vector_long  = ^gsl_vector_long;
Pgsl_vector_long_const_view  = ^gsl_vector_long_const_view;
Pgsl_vector_long_view  = ^gsl_vector_long_view;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_long.h
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
{$ifndef __GSL_VECTOR_LONG_H__}
{$define __GSL_VECTOR_LONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_long.h>}
type
  Pgsl_vector_long = ^Tgsl_vector_long;
  Tgsl_vector_long = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Plongint;
      block : Pgsl_block_long;
      owner : longint;
    end;

  Pgsl_vector_long_view = ^Tgsl_vector_long_view;
  Tgsl_vector_long_view = record
      vector : Tgsl_vector_long;
    end;

  Pgsl_vector_long_view = ^Tgsl_vector_long_view;
  Tgsl_vector_long_view = Tgsl_vector_long_view;

  Pgsl_vector_long_const_view = ^Tgsl_vector_long_const_view;
  Tgsl_vector_long_const_view = record
      vector : Tgsl_vector_long;
    end;
(* Const before type ignored *)

  Pgsl_vector_long_const_view = ^Tgsl_vector_long_const_view;
  Tgsl_vector_long_const_view = Tgsl_vector_long_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_long_alloc(n:Tsize_t):Pgsl_vector_long;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_calloc(n:Tsize_t):Pgsl_vector_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_alloc_from_block(b:Pgsl_block_long; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_alloc_from_vector(v:Pgsl_vector_long; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_long;cdecl;external;
procedure gsl_vector_long_free(v:Pgsl_vector_long);cdecl;external;
{ Views  }
function gsl_vector_long_view_array(v:Plongint; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
function gsl_vector_long_view_array_with_stride(base:Plongint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_const_view_array(v:Plongint; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_const_view_array_with_stride(base:Plongint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
function gsl_vector_long_subvector(v:Pgsl_vector_long; i:Tsize_t; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
function gsl_vector_long_subvector_with_stride(v:Pgsl_vector_long; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_const_subvector(v:Pgsl_vector_long; i:Tsize_t; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_const_subvector_with_stride(v:Pgsl_vector_long; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_long_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_long_set_zero(v:Pgsl_vector_long);cdecl;external;
procedure gsl_vector_long_set_all(v:Pgsl_vector_long; x:longint);cdecl;external;
function gsl_vector_long_set_basis(v:Pgsl_vector_long; i:Tsize_t):longint;cdecl;external;
function gsl_vector_long_fread(stream:PFILE; v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_fwrite(stream:PFILE; v:Pgsl_vector_long):longint;cdecl;external;
function gsl_vector_long_fscanf(stream:PFILE; v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_fprintf(stream:PFILE; v:Pgsl_vector_long; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_memcpy(dest:Pgsl_vector_long; src:Pgsl_vector_long):longint;cdecl;external;
function gsl_vector_long_reverse(v:Pgsl_vector_long):longint;cdecl;external;
function gsl_vector_long_swap(v:Pgsl_vector_long; w:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_swap_elements(v:Pgsl_vector_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_max(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_min(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_minmax(v:Pgsl_vector_long; min_out:Plongint; max_out:Plongint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_max_index(v:Pgsl_vector_long):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_min_index(v:Pgsl_vector_long):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_minmax_index(v:Pgsl_vector_long; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_add(a:Pgsl_vector_long; b:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_sub(a:Pgsl_vector_long; b:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_mul(a:Pgsl_vector_long; b:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_div(a:Pgsl_vector_long; b:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_scale(a:Pgsl_vector_long; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_add_constant(a:Pgsl_vector_long; x:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_axpby(alpha:longint; x:Pgsl_vector_long; beta:longint; y:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_sum(a:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_equal(u:Pgsl_vector_long; v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_isnull(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_ispos(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_isneg(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_isnonneg(v:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_get(v:Pgsl_vector_long; i:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_long_set(v:Pgsl_vector_long; i:Tsize_t; x:longint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_long_ptr(v:Pgsl_vector_long; i:Tsize_t):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_long_const_ptr(v:Pgsl_vector_long; i:Tsize_t):Plongint;cdecl;external;
{$endif}
{ __GSL_VECTOR_LONG_H__  }

implementation


end.
