
unit gsl_vector_ulong;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_ulong.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_ulong.h
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
Pgsl_vector_ulong  = ^gsl_vector_ulong;
Pgsl_vector_ulong_const_view  = ^gsl_vector_ulong_const_view;
Pgsl_vector_ulong_view  = ^gsl_vector_ulong_view;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_ulong.h
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
{$ifndef __GSL_VECTOR_ULONG_H__}
{$define __GSL_VECTOR_ULONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_ulong.h>}
type
  Pgsl_vector_ulong = ^Tgsl_vector_ulong;
  Tgsl_vector_ulong = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pdword;
      block : Pgsl_block_ulong;
      owner : longint;
    end;

  Pgsl_vector_ulong_view = ^Tgsl_vector_ulong_view;
  Tgsl_vector_ulong_view = record
      vector : Tgsl_vector_ulong;
    end;

  Pgsl_vector_ulong_view = ^Tgsl_vector_ulong_view;
  Tgsl_vector_ulong_view = Tgsl_vector_ulong_view;

  Pgsl_vector_ulong_const_view = ^Tgsl_vector_ulong_const_view;
  Tgsl_vector_ulong_const_view = record
      vector : Tgsl_vector_ulong;
    end;
(* Const before type ignored *)

  Pgsl_vector_ulong_const_view = ^Tgsl_vector_ulong_const_view;
  Tgsl_vector_ulong_const_view = Tgsl_vector_ulong_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_ulong_alloc(n:Tsize_t):Pgsl_vector_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_calloc(n:Tsize_t):Pgsl_vector_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_alloc_from_block(b:Pgsl_block_ulong; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_alloc_from_vector(v:Pgsl_vector_ulong; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_ulong;cdecl;external;
procedure gsl_vector_ulong_free(v:Pgsl_vector_ulong);cdecl;external;
{ Views  }
function gsl_vector_ulong_view_array(v:Pdword; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
function gsl_vector_ulong_view_array_with_stride(base:Pdword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_const_view_array(v:Pdword; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_const_view_array_with_stride(base:Pdword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
function gsl_vector_ulong_subvector(v:Pgsl_vector_ulong; i:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
function gsl_vector_ulong_subvector_with_stride(v:Pgsl_vector_ulong; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_const_subvector(v:Pgsl_vector_ulong; i:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_const_subvector_with_stride(v:Pgsl_vector_ulong; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ulong_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_ulong_set_zero(v:Pgsl_vector_ulong);cdecl;external;
procedure gsl_vector_ulong_set_all(v:Pgsl_vector_ulong; x:dword);cdecl;external;
function gsl_vector_ulong_set_basis(v:Pgsl_vector_ulong; i:Tsize_t):longint;cdecl;external;
function gsl_vector_ulong_fread(stream:PFILE; v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_fwrite(stream:PFILE; v:Pgsl_vector_ulong):longint;cdecl;external;
function gsl_vector_ulong_fscanf(stream:PFILE; v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_fprintf(stream:PFILE; v:Pgsl_vector_ulong; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_memcpy(dest:Pgsl_vector_ulong; src:Pgsl_vector_ulong):longint;cdecl;external;
function gsl_vector_ulong_reverse(v:Pgsl_vector_ulong):longint;cdecl;external;
function gsl_vector_ulong_swap(v:Pgsl_vector_ulong; w:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_swap_elements(v:Pgsl_vector_ulong; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_max(v:Pgsl_vector_ulong):dword;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_min(v:Pgsl_vector_ulong):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ulong_minmax(v:Pgsl_vector_ulong; min_out:Pdword; max_out:Pdword);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_max_index(v:Pgsl_vector_ulong):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_min_index(v:Pgsl_vector_ulong):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ulong_minmax_index(v:Pgsl_vector_ulong; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_add(a:Pgsl_vector_ulong; b:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_sub(a:Pgsl_vector_ulong; b:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_mul(a:Pgsl_vector_ulong; b:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_div(a:Pgsl_vector_ulong; b:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_scale(a:Pgsl_vector_ulong; x:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_add_constant(a:Pgsl_vector_ulong; x:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_axpby(alpha:dword; x:Pgsl_vector_ulong; beta:dword; y:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_sum(a:Pgsl_vector_ulong):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_equal(u:Pgsl_vector_ulong; v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_isnull(v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_ispos(v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_isneg(v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_isnonneg(v:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_get(v:Pgsl_vector_ulong; i:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ulong_set(v:Pgsl_vector_ulong; i:Tsize_t; x:dword);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ulong_ptr(v:Pgsl_vector_ulong; i:Tsize_t):Pdword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ulong_const_ptr(v:Pgsl_vector_ulong; i:Tsize_t):Pdword;cdecl;external;
{$endif}
{ __GSL_VECTOR_ULONG_H__  }

implementation


end.
