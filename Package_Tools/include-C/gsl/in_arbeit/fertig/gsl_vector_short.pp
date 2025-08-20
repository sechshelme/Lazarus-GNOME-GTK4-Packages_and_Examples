
unit gsl_vector_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_short.h
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
Pgsl_vector_short  = ^gsl_vector_short;
Pgsl_vector_short_const_view  = ^gsl_vector_short_const_view;
Pgsl_vector_short_view  = ^gsl_vector_short_view;
Psize_t  = ^size_t;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_short.h
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
{$ifndef __GSL_VECTOR_SHORT_H__}
{$define __GSL_VECTOR_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_short.h>}
type
  Pgsl_vector_short = ^Tgsl_vector_short;
  Tgsl_vector_short = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Psmallint;
      block : Pgsl_block_short;
      owner : longint;
    end;

  Pgsl_vector_short_view = ^Tgsl_vector_short_view;
  Tgsl_vector_short_view = record
      vector : Tgsl_vector_short;
    end;

  Pgsl_vector_short_view = ^Tgsl_vector_short_view;
  Tgsl_vector_short_view = Tgsl_vector_short_view;

  Pgsl_vector_short_const_view = ^Tgsl_vector_short_const_view;
  Tgsl_vector_short_const_view = record
      vector : Tgsl_vector_short;
    end;
(* Const before type ignored *)

  Pgsl_vector_short_const_view = ^Tgsl_vector_short_const_view;
  Tgsl_vector_short_const_view = Tgsl_vector_short_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_short_alloc(n:Tsize_t):Pgsl_vector_short;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_calloc(n:Tsize_t):Pgsl_vector_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_alloc_from_block(b:Pgsl_block_short; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_alloc_from_vector(v:Pgsl_vector_short; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_short;cdecl;external;
procedure gsl_vector_short_free(v:Pgsl_vector_short);cdecl;external;
{ Views  }
function gsl_vector_short_view_array(v:Psmallint; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
function gsl_vector_short_view_array_with_stride(base:Psmallint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_const_view_array(v:Psmallint; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_const_view_array_with_stride(base:Psmallint; stride:Tsize_t; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
function gsl_vector_short_subvector(v:Pgsl_vector_short; i:Tsize_t; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
function gsl_vector_short_subvector_with_stride(v:Pgsl_vector_short; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_short_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_const_subvector(v:Pgsl_vector_short; i:Tsize_t; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_const_subvector_with_stride(v:Pgsl_vector_short; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_short_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_short_set_zero(v:Pgsl_vector_short);cdecl;external;
procedure gsl_vector_short_set_all(v:Pgsl_vector_short; x:smallint);cdecl;external;
function gsl_vector_short_set_basis(v:Pgsl_vector_short; i:Tsize_t):longint;cdecl;external;
function gsl_vector_short_fread(stream:PFILE; v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_fwrite(stream:PFILE; v:Pgsl_vector_short):longint;cdecl;external;
function gsl_vector_short_fscanf(stream:PFILE; v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_fprintf(stream:PFILE; v:Pgsl_vector_short; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_memcpy(dest:Pgsl_vector_short; src:Pgsl_vector_short):longint;cdecl;external;
function gsl_vector_short_reverse(v:Pgsl_vector_short):longint;cdecl;external;
function gsl_vector_short_swap(v:Pgsl_vector_short; w:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_swap_elements(v:Pgsl_vector_short; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_max(v:Pgsl_vector_short):smallint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_min(v:Pgsl_vector_short):smallint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_short_minmax(v:Pgsl_vector_short; min_out:Psmallint; max_out:Psmallint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_max_index(v:Pgsl_vector_short):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_min_index(v:Pgsl_vector_short):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_short_minmax_index(v:Pgsl_vector_short; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_add(a:Pgsl_vector_short; b:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_sub(a:Pgsl_vector_short; b:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_mul(a:Pgsl_vector_short; b:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_div(a:Pgsl_vector_short; b:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_scale(a:Pgsl_vector_short; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_add_constant(a:Pgsl_vector_short; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_axpby(alpha:smallint; x:Pgsl_vector_short; beta:smallint; y:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_sum(a:Pgsl_vector_short):smallint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_equal(u:Pgsl_vector_short; v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_isnull(v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_ispos(v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_isneg(v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_isnonneg(v:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_get(v:Pgsl_vector_short; i:Tsize_t):smallint;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_short_set(v:Pgsl_vector_short; i:Tsize_t; x:smallint);cdecl;external;
(* Const before type ignored *)
function gsl_vector_short_ptr(v:Pgsl_vector_short; i:Tsize_t):Psmallint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_short_const_ptr(v:Pgsl_vector_short; i:Tsize_t):Psmallint;cdecl;external;
{$endif}
{ __GSL_VECTOR_SHORT_H__  }

implementation


end.
