
unit gsl_vector_uchar;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_uchar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_uchar.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PFILE  = ^FILE;
Pgsl_block_uchar  = ^gsl_block_uchar;
Pgsl_vector_uchar  = ^gsl_vector_uchar;
Pgsl_vector_uchar_const_view  = ^gsl_vector_uchar_const_view;
Pgsl_vector_uchar_view  = ^gsl_vector_uchar_view;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_uchar.h
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
{$ifndef __GSL_VECTOR_UCHAR_H__}
{$define __GSL_VECTOR_UCHAR_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_uchar.h>}
type
  Pgsl_vector_uchar = ^Tgsl_vector_uchar;
  Tgsl_vector_uchar = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pbyte;
      block : Pgsl_block_uchar;
      owner : longint;
    end;

  Pgsl_vector_uchar_view = ^Tgsl_vector_uchar_view;
  Tgsl_vector_uchar_view = record
      vector : Tgsl_vector_uchar;
    end;

  Pgsl_vector_uchar_view = ^Tgsl_vector_uchar_view;
  Tgsl_vector_uchar_view = Tgsl_vector_uchar_view;

  Pgsl_vector_uchar_const_view = ^Tgsl_vector_uchar_const_view;
  Tgsl_vector_uchar_const_view = record
      vector : Tgsl_vector_uchar;
    end;
(* Const before type ignored *)

  Pgsl_vector_uchar_const_view = ^Tgsl_vector_uchar_const_view;
  Tgsl_vector_uchar_const_view = Tgsl_vector_uchar_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_uchar_alloc(n:Tsize_t):Pgsl_vector_uchar;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_calloc(n:Tsize_t):Pgsl_vector_uchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_alloc_from_block(b:Pgsl_block_uchar; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_uchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_alloc_from_vector(v:Pgsl_vector_uchar; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_uchar;cdecl;external;
procedure gsl_vector_uchar_free(v:Pgsl_vector_uchar);cdecl;external;
{ Views  }
function gsl_vector_uchar_view_array(v:Pbyte; n:Tsize_t):Tgsl_vector_uchar_view;cdecl;external;
function gsl_vector_uchar_view_array_with_stride(base:Pbyte; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_const_view_array(v:Pbyte; n:Tsize_t):Tgsl_vector_uchar_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_const_view_array_with_stride(base:Pbyte; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_const_view;cdecl;external;
function gsl_vector_uchar_subvector(v:Pgsl_vector_uchar; i:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_view;cdecl;external;
function gsl_vector_uchar_subvector_with_stride(v:Pgsl_vector_uchar; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_const_subvector(v:Pgsl_vector_uchar; i:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_const_subvector_with_stride(v:Pgsl_vector_uchar; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uchar_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_uchar_set_zero(v:Pgsl_vector_uchar);cdecl;external;
procedure gsl_vector_uchar_set_all(v:Pgsl_vector_uchar; x:byte);cdecl;external;
function gsl_vector_uchar_set_basis(v:Pgsl_vector_uchar; i:Tsize_t):longint;cdecl;external;
function gsl_vector_uchar_fread(stream:PFILE; v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_fwrite(stream:PFILE; v:Pgsl_vector_uchar):longint;cdecl;external;
function gsl_vector_uchar_fscanf(stream:PFILE; v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_fprintf(stream:PFILE; v:Pgsl_vector_uchar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_memcpy(dest:Pgsl_vector_uchar; src:Pgsl_vector_uchar):longint;cdecl;external;
function gsl_vector_uchar_reverse(v:Pgsl_vector_uchar):longint;cdecl;external;
function gsl_vector_uchar_swap(v:Pgsl_vector_uchar; w:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_swap_elements(v:Pgsl_vector_uchar; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_max(v:Pgsl_vector_uchar):byte;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_min(v:Pgsl_vector_uchar):byte;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uchar_minmax(v:Pgsl_vector_uchar; min_out:Pbyte; max_out:Pbyte);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_max_index(v:Pgsl_vector_uchar):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_min_index(v:Pgsl_vector_uchar):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uchar_minmax_index(v:Pgsl_vector_uchar; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_add(a:Pgsl_vector_uchar; b:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_sub(a:Pgsl_vector_uchar; b:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_mul(a:Pgsl_vector_uchar; b:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_div(a:Pgsl_vector_uchar; b:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_scale(a:Pgsl_vector_uchar; x:byte):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_add_constant(a:Pgsl_vector_uchar; x:byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_axpby(alpha:byte; x:Pgsl_vector_uchar; beta:byte; y:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_sum(a:Pgsl_vector_uchar):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_equal(u:Pgsl_vector_uchar; v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_isnull(v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_ispos(v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_isneg(v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_isnonneg(v:Pgsl_vector_uchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_get(v:Pgsl_vector_uchar; i:Tsize_t):byte;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uchar_set(v:Pgsl_vector_uchar; i:Tsize_t; x:byte);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uchar_ptr(v:Pgsl_vector_uchar; i:Tsize_t):Pbyte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uchar_const_ptr(v:Pgsl_vector_uchar; i:Tsize_t):Pbyte;cdecl;external;
{$ifdef HAVE_INLINE}
{$endif}
{ __GSL_VECTOR_UCHAR_H__  }

implementation


end.
