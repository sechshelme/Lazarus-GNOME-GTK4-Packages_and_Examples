
unit gsl_vector_ushort;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_ushort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_ushort.h
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
Pgsl_block_ushort  = ^gsl_block_ushort;
Pgsl_vector_ushort  = ^gsl_vector_ushort;
Pgsl_vector_ushort_const_view  = ^gsl_vector_ushort_const_view;
Pgsl_vector_ushort_view  = ^gsl_vector_ushort_view;
Psize_t  = ^size_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_ushort.h
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
{$ifndef __GSL_VECTOR_USHORT_H__}
{$define __GSL_VECTOR_USHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_block_ushort.h>}
type
  Pgsl_vector_ushort = ^Tgsl_vector_ushort;
  Tgsl_vector_ushort = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pword;
      block : Pgsl_block_ushort;
      owner : longint;
    end;

  Pgsl_vector_ushort_view = ^Tgsl_vector_ushort_view;
  Tgsl_vector_ushort_view = record
      vector : Tgsl_vector_ushort;
    end;

  Pgsl_vector_ushort_view = ^Tgsl_vector_ushort_view;
  Tgsl_vector_ushort_view = Tgsl_vector_ushort_view;

  Pgsl_vector_ushort_const_view = ^Tgsl_vector_ushort_const_view;
  Tgsl_vector_ushort_const_view = record
      vector : Tgsl_vector_ushort;
    end;
(* Const before type ignored *)

  Pgsl_vector_ushort_const_view = ^Tgsl_vector_ushort_const_view;
  Tgsl_vector_ushort_const_view = Tgsl_vector_ushort_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_ushort_alloc(n:Tsize_t):Pgsl_vector_ushort;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_calloc(n:Tsize_t):Pgsl_vector_ushort;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_alloc_from_block(b:Pgsl_block_ushort; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_ushort;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_alloc_from_vector(v:Pgsl_vector_ushort; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_ushort;cdecl;external;
procedure gsl_vector_ushort_free(v:Pgsl_vector_ushort);cdecl;external;
{ Views  }
function gsl_vector_ushort_view_array(v:Pword; n:Tsize_t):Tgsl_vector_ushort_view;cdecl;external;
function gsl_vector_ushort_view_array_with_stride(base:Pword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_const_view_array(v:Pword; n:Tsize_t):Tgsl_vector_ushort_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_const_view_array_with_stride(base:Pword; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_const_view;cdecl;external;
function gsl_vector_ushort_subvector(v:Pgsl_vector_ushort; i:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_view;cdecl;external;
function gsl_vector_ushort_subvector_with_stride(v:Pgsl_vector_ushort; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_const_subvector(v:Pgsl_vector_ushort; i:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_const_subvector_with_stride(v:Pgsl_vector_ushort; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_ushort_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_ushort_set_zero(v:Pgsl_vector_ushort);cdecl;external;
procedure gsl_vector_ushort_set_all(v:Pgsl_vector_ushort; x:word);cdecl;external;
function gsl_vector_ushort_set_basis(v:Pgsl_vector_ushort; i:Tsize_t):longint;cdecl;external;
function gsl_vector_ushort_fread(stream:PFILE; v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_fwrite(stream:PFILE; v:Pgsl_vector_ushort):longint;cdecl;external;
function gsl_vector_ushort_fscanf(stream:PFILE; v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_fprintf(stream:PFILE; v:Pgsl_vector_ushort; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_memcpy(dest:Pgsl_vector_ushort; src:Pgsl_vector_ushort):longint;cdecl;external;
function gsl_vector_ushort_reverse(v:Pgsl_vector_ushort):longint;cdecl;external;
function gsl_vector_ushort_swap(v:Pgsl_vector_ushort; w:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_swap_elements(v:Pgsl_vector_ushort; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_max(v:Pgsl_vector_ushort):word;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_min(v:Pgsl_vector_ushort):word;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ushort_minmax(v:Pgsl_vector_ushort; min_out:Pword; max_out:Pword);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_max_index(v:Pgsl_vector_ushort):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_min_index(v:Pgsl_vector_ushort):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ushort_minmax_index(v:Pgsl_vector_ushort; imin:Psize_t; imax:Psize_t);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_add(a:Pgsl_vector_ushort; b:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_sub(a:Pgsl_vector_ushort; b:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_mul(a:Pgsl_vector_ushort; b:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_div(a:Pgsl_vector_ushort; b:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_scale(a:Pgsl_vector_ushort; x:word):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_add_constant(a:Pgsl_vector_ushort; x:word):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_axpby(alpha:word; x:Pgsl_vector_ushort; beta:word; y:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_sum(a:Pgsl_vector_ushort):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_equal(u:Pgsl_vector_ushort; v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_isnull(v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_ispos(v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_isneg(v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_isnonneg(v:Pgsl_vector_ushort):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_get(v:Pgsl_vector_ushort; i:Tsize_t):word;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_ushort_set(v:Pgsl_vector_ushort; i:Tsize_t; x:word);cdecl;external;
(* Const before type ignored *)
function gsl_vector_ushort_ptr(v:Pgsl_vector_ushort; i:Tsize_t):Pword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_ushort_const_ptr(v:Pgsl_vector_ushort; i:Tsize_t):Pword;cdecl;external;
{$endif}
{ __GSL_VECTOR_USHORT_H__  }

implementation


end.
