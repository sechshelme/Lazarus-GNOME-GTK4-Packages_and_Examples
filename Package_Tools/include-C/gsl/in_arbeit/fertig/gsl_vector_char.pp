
unit gsl_vector_char;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_char.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_char.h
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
Pgsl_vector_char  = ^gsl_vector_char;
Pgsl_vector_char_const_view  = ^gsl_vector_char_const_view;
Pgsl_vector_char_view  = ^gsl_vector_char_view;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_char.h
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
{$ifndef __GSL_VECTOR_CHAR_H__}
{$define __GSL_VECTOR_CHAR_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_char.h>}
type
  Pgsl_vector_char = ^Tgsl_vector_char;
  Tgsl_vector_char = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pchar;
      block : Pgsl_block_char;
      owner : longint;
    end;

  Pgsl_vector_char_view = ^Tgsl_vector_char_view;
  Tgsl_vector_char_view = record
      vector : Tgsl_vector_char;
    end;

  Pgsl_vector_char_view = ^Tgsl_vector_char_view;
  Tgsl_vector_char_view = Tgsl_vector_char_view;

  Pgsl_vector_char_const_view = ^Tgsl_vector_char_const_view;
  Tgsl_vector_char_const_view = record
      vector : Tgsl_vector_char;
    end;
(* Const before type ignored *)

  Pgsl_vector_char_const_view = ^Tgsl_vector_char_const_view;
  Tgsl_vector_char_const_view = Tgsl_vector_char_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_char_alloc(n:Tsize_t):Pgsl_vector_char;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_calloc(n:Tsize_t):Pgsl_vector_char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_alloc_from_block(b:Pgsl_block_char; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_alloc_from_vector(v:Pgsl_vector_char; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_char;cdecl;external;
procedure gsl_vector_char_free(v:Pgsl_vector_char);cdecl;external;
{ Views  }
function gsl_vector_char_view_array(v:Pchar; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
function gsl_vector_char_view_array_with_stride(base:Pchar; stride:Tsize_t; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_const_view_array(v:Pchar; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_const_view_array_with_stride(base:Pchar; stride:Tsize_t; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
function gsl_vector_char_subvector(v:Pgsl_vector_char; i:Tsize_t; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
function gsl_vector_char_subvector_with_stride(v:Pgsl_vector_char; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_char_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_const_subvector(v:Pgsl_vector_char; i:Tsize_t; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_const_subvector_with_stride(v:Pgsl_vector_char; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_char_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_char_set_zero(v:Pgsl_vector_char);cdecl;external;
procedure gsl_vector_char_set_all(v:Pgsl_vector_char; x:char);cdecl;external;
function gsl_vector_char_set_basis(v:Pgsl_vector_char; i:Tsize_t):longint;cdecl;external;
function gsl_vector_char_fread(stream:PFILE; v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_fwrite(stream:PFILE; v:Pgsl_vector_char):longint;cdecl;external;
function gsl_vector_char_fscanf(stream:PFILE; v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_fprintf(stream:PFILE; v:Pgsl_vector_char; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_memcpy(dest:Pgsl_vector_char; src:Pgsl_vector_char):longint;cdecl;external;
function gsl_vector_char_reverse(v:Pgsl_vector_char):longint;cdecl;external;
function gsl_vector_char_swap(v:Pgsl_vector_char; w:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_swap_elements(v:Pgsl_vector_char; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_max(v:Pgsl_vector_char):char;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_min(v:Pgsl_vector_char):char;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_char_minmax(v:Pgsl_vector_char; min_out:Pchar; max_out:Pchar);cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_max_index(v:Pgsl_vector_char):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_min_index(v:Pgsl_vector_char):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_char_minmax_index(v:Pgsl_vector_char; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_add(a:Pgsl_vector_char; b:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_sub(a:Pgsl_vector_char; b:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_mul(a:Pgsl_vector_char; b:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_div(a:Pgsl_vector_char; b:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_scale(a:Pgsl_vector_char; x:char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_add_constant(a:Pgsl_vector_char; x:char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_axpby(alpha:char; x:Pgsl_vector_char; beta:char; y:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_sum(a:Pgsl_vector_char):char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_equal(u:Pgsl_vector_char; v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_isnull(v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_ispos(v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_isneg(v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_isnonneg(v:Pgsl_vector_char):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_get(v:Pgsl_vector_char; i:Tsize_t):char;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_char_set(v:Pgsl_vector_char; i:Tsize_t; x:char);cdecl;external;
(* Const before type ignored *)
function gsl_vector_char_ptr(v:Pgsl_vector_char; i:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_char_const_ptr(v:Pgsl_vector_char; i:Tsize_t):Pchar;cdecl;external;
{$endif}
{ __GSL_VECTOR_CHAR_H__  }

implementation


end.
