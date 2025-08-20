
unit gsl_vector_uint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_uint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_uint.h
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
Pgsl_block_uint  = ^gsl_block_uint;
Pgsl_vector_uint  = ^gsl_vector_uint;
Pgsl_vector_uint_const_view  = ^gsl_vector_uint_const_view;
Pgsl_vector_uint_view  = ^gsl_vector_uint_view;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_uint.h
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
{$ifndef __GSL_VECTOR_UINT_H__}
{$define __GSL_VECTOR_UINT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_uint.h>}
type
  Pgsl_vector_uint = ^Tgsl_vector_uint;
  Tgsl_vector_uint = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pdword;
      block : Pgsl_block_uint;
      owner : longint;
    end;

  Pgsl_vector_uint_view = ^Tgsl_vector_uint_view;
  Tgsl_vector_uint_view = record
      vector : Tgsl_vector_uint;
    end;

  Pgsl_vector_uint_view = ^Tgsl_vector_uint_view;
  Tgsl_vector_uint_view = Tgsl_vector_uint_view;

  Pgsl_vector_uint_const_view = ^Tgsl_vector_uint_const_view;
  Tgsl_vector_uint_const_view = record
      vector : Tgsl_vector_uint;
    end;
(* Const before type ignored *)

  Pgsl_vector_uint_const_view = ^Tgsl_vector_uint_const_view;
  Tgsl_vector_uint_const_view = Tgsl_vector_uint_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_uint_alloc(n:Tsize_t):Pgsl_vector_uint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_calloc(n:Tsize_t):Pgsl_vector_uint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_alloc_from_block(b:Pgsl_block_uint; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_uint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_alloc_from_vector(v:Pgsl_vector_uint; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_uint;cdecl;external;
procedure gsl_vector_uint_free(v:Pgsl_vector_uint);cdecl;external;
{ Views  }
function gsl_vector_uint_view_array(v:Pdword; n:Tsize_t):Tgsl_vector_uint_view;cdecl;external;
function gsl_vector_uint_view_array_with_stride(base:Pdword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uint_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_const_view_array(v:Pdword; n:Tsize_t):Tgsl_vector_uint_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_const_view_array_with_stride(base:Pdword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uint_const_view;cdecl;external;
function gsl_vector_uint_subvector(v:Pgsl_vector_uint; i:Tsize_t; n:Tsize_t):Tgsl_vector_uint_view;cdecl;external;
function gsl_vector_uint_subvector_with_stride(v:Pgsl_vector_uint; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uint_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_const_subvector(v:Pgsl_vector_uint; i:Tsize_t; n:Tsize_t):Tgsl_vector_uint_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_const_subvector_with_stride(v:Pgsl_vector_uint; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_uint_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_uint_set_zero(v:Pgsl_vector_uint);cdecl;external;
procedure gsl_vector_uint_set_all(v:Pgsl_vector_uint; x:dword);cdecl;external;
function gsl_vector_uint_set_basis(v:Pgsl_vector_uint; i:Tsize_t):longint;cdecl;external;
function gsl_vector_uint_fread(stream:PFILE; v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_fwrite(stream:PFILE; v:Pgsl_vector_uint):longint;cdecl;external;
function gsl_vector_uint_fscanf(stream:PFILE; v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_fprintf(stream:PFILE; v:Pgsl_vector_uint; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_memcpy(dest:Pgsl_vector_uint; src:Pgsl_vector_uint):longint;cdecl;external;
function gsl_vector_uint_reverse(v:Pgsl_vector_uint):longint;cdecl;external;
function gsl_vector_uint_swap(v:Pgsl_vector_uint; w:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_swap_elements(v:Pgsl_vector_uint; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_max(v:Pgsl_vector_uint):dword;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_min(v:Pgsl_vector_uint):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uint_minmax(v:Pgsl_vector_uint; min_out:Pdword; max_out:Pdword);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_max_index(v:Pgsl_vector_uint):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_min_index(v:Pgsl_vector_uint):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uint_minmax_index(v:Pgsl_vector_uint; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_add(a:Pgsl_vector_uint; b:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_sub(a:Pgsl_vector_uint; b:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_mul(a:Pgsl_vector_uint; b:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_div(a:Pgsl_vector_uint; b:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_scale(a:Pgsl_vector_uint; x:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_add_constant(a:Pgsl_vector_uint; x:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_axpby(alpha:dword; x:Pgsl_vector_uint; beta:dword; y:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_sum(a:Pgsl_vector_uint):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_equal(u:Pgsl_vector_uint; v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_isnull(v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_ispos(v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_isneg(v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_isnonneg(v:Pgsl_vector_uint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_get(v:Pgsl_vector_uint; i:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_uint_set(v:Pgsl_vector_uint; i:Tsize_t; x:dword);cdecl;external;
(* Const before type ignored *)
function gsl_vector_uint_ptr(v:Pgsl_vector_uint; i:Tsize_t):Pdword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_uint_const_ptr(v:Pgsl_vector_uint; i:Tsize_t):Pdword;cdecl;external;
{$endif}
{ __GSL_VECTOR_UINT_H__  }

implementation


end.
