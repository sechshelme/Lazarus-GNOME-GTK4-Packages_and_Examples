
unit gsl_vector_complex_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_complex_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_complex_float.h
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
Pgsl_block_complex_float  = ^gsl_block_complex_float;
Pgsl_complex_float  = ^gsl_complex_float;
Pgsl_vector_complex_float  = ^gsl_vector_complex_float;
Pgsl_vector_complex_float_const_view  = ^gsl_vector_complex_float_const_view;
Pgsl_vector_complex_float_view  = ^gsl_vector_complex_float_view;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_complex_float.h
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
{$ifndef __GSL_VECTOR_COMPLEX_FLOAT_H__}
{$define __GSL_VECTOR_COMPLEX_FLOAT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_float.h>}
{$include <gsl/gsl_vector_complex.h>}
{$include <gsl/gsl_block_complex_float.h>}
type
  Pgsl_vector_complex_float = ^Tgsl_vector_complex_float;
  Tgsl_vector_complex_float = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Psingle;
      block : Pgsl_block_complex_float;
      owner : longint;
    end;

  Pgsl_vector_complex_float_view = ^Tgsl_vector_complex_float_view;
  Tgsl_vector_complex_float_view = record
      vector : Tgsl_vector_complex_float;
    end;

  Pgsl_vector_complex_float_view = ^Tgsl_vector_complex_float_view;
  Tgsl_vector_complex_float_view = Tgsl_vector_complex_float_view;

  Pgsl_vector_complex_float_const_view = ^Tgsl_vector_complex_float_const_view;
  Tgsl_vector_complex_float_const_view = record
      vector : Tgsl_vector_complex_float;
    end;
(* Const before type ignored *)

  Pgsl_vector_complex_float_const_view = ^Tgsl_vector_complex_float_const_view;
  Tgsl_vector_complex_float_const_view = Tgsl_vector_complex_float_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_complex_float_alloc(n:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_calloc(n:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_alloc_from_block(b:Pgsl_block_complex_float; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_alloc_from_vector(v:Pgsl_vector_complex_float; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_complex_float;cdecl;external;
procedure gsl_vector_complex_float_free(v:Pgsl_vector_complex_float);cdecl;external;
{ Views  }
function gsl_vector_complex_float_view_array(base:Psingle; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
function gsl_vector_complex_float_view_array_with_stride(base:Psingle; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_view_array(base:Psingle; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_view_array_with_stride(base:Psingle; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
function gsl_vector_complex_float_subvector(base:Pgsl_vector_complex_float; i:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
function gsl_vector_complex_float_subvector_with_stride(v:Pgsl_vector_complex_float; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_subvector(base:Pgsl_vector_complex_float; i:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_subvector_with_stride(v:Pgsl_vector_complex_float; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_float_const_view;cdecl;external;
function gsl_vector_complex_float_real(v:Pgsl_vector_complex_float):Tgsl_vector_float_view;cdecl;external;
function gsl_vector_complex_float_imag(v:Pgsl_vector_complex_float):Tgsl_vector_float_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_real(v:Pgsl_vector_complex_float):Tgsl_vector_float_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_const_imag(v:Pgsl_vector_complex_float):Tgsl_vector_float_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_complex_float_set_zero(v:Pgsl_vector_complex_float);cdecl;external;
procedure gsl_vector_complex_float_set_all(v:Pgsl_vector_complex_float; z:Tgsl_complex_float);cdecl;external;
function gsl_vector_complex_float_set_basis(v:Pgsl_vector_complex_float; i:Tsize_t):longint;cdecl;external;
function gsl_vector_complex_float_fread(stream:PFILE; v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_fwrite(stream:PFILE; v:Pgsl_vector_complex_float):longint;cdecl;external;
function gsl_vector_complex_float_fscanf(stream:PFILE; v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_fprintf(stream:PFILE; v:Pgsl_vector_complex_float; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_memcpy(dest:Pgsl_vector_complex_float; src:Pgsl_vector_complex_float):longint;cdecl;external;
function gsl_vector_complex_float_reverse(v:Pgsl_vector_complex_float):longint;cdecl;external;
function gsl_vector_complex_float_swap(v:Pgsl_vector_complex_float; w:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_swap_elements(v:Pgsl_vector_complex_float; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_equal(u:Pgsl_vector_complex_float; v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_isnull(v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_ispos(v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_isneg(v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_isnonneg(v:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_add(a:Pgsl_vector_complex_float; b:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_sub(a:Pgsl_vector_complex_float; b:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_mul(a:Pgsl_vector_complex_float; b:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_div(a:Pgsl_vector_complex_float; b:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_scale(a:Pgsl_vector_complex_float; x:Tgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_add_constant(a:Pgsl_vector_complex_float; x:Tgsl_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_axpby(alpha:Tgsl_complex_float; x:Pgsl_vector_complex_float; beta:Tgsl_complex_float; y:Pgsl_vector_complex_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_get(v:Pgsl_vector_complex_float; i:Tsize_t):Tgsl_complex_float;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_complex_float_set(v:Pgsl_vector_complex_float; i:Tsize_t; z:Tgsl_complex_float);cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_float_ptr(v:Pgsl_vector_complex_float; i:Tsize_t):Pgsl_complex_float;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_float_const_ptr(v:Pgsl_vector_complex_float; i:Tsize_t):Pgsl_complex_float;cdecl;external;
{$endif}
{ __GSL_VECTOR_COMPLEX_FLOAT_H__  }

implementation


end.
