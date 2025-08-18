
unit gsl_vector_complex_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_vector_complex_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_vector_complex_double.h
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
Pgsl_block_complex  = ^gsl_block_complex;
Pgsl_complex  = ^gsl_complex;
Pgsl_vector_complex  = ^gsl_vector_complex;
Pgsl_vector_complex_const_view  = ^gsl_vector_complex_const_view;
Pgsl_vector_complex_view  = ^gsl_vector_complex_view;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vector/gsl_vector_complex_double.h
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
{$ifndef __GSL_VECTOR_COMPLEX_DOUBLE_H__}
{$define __GSL_VECTOR_COMPLEX_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_check_range.h>}
{$include <gsl/gsl_vector_double.h>}
{$include <gsl/gsl_vector_complex.h>}
{$include <gsl/gsl_block_complex_double.h>}
type
  Pgsl_vector_complex = ^Tgsl_vector_complex;
  Tgsl_vector_complex = record
      size : Tsize_t;
      stride : Tsize_t;
      data : Pdouble;
      block : Pgsl_block_complex;
      owner : longint;
    end;

  Pgsl_vector_complex_view = ^Tgsl_vector_complex_view;
  Tgsl_vector_complex_view = record
      vector : Tgsl_vector_complex;
    end;

  Pgsl_vector_complex_view = ^Tgsl_vector_complex_view;
  Tgsl_vector_complex_view = Tgsl_vector_complex_view;

  Pgsl_vector_complex_const_view = ^Tgsl_vector_complex_const_view;
  Tgsl_vector_complex_const_view = record
      vector : Tgsl_vector_complex;
    end;
(* Const before type ignored *)

  Pgsl_vector_complex_const_view = ^Tgsl_vector_complex_const_view;
  Tgsl_vector_complex_const_view = Tgsl_vector_complex_const_view;
{ Allocation  }
(* Const before type ignored *)

function gsl_vector_complex_alloc(n:Tsize_t):Pgsl_vector_complex;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_calloc(n:Tsize_t):Pgsl_vector_complex;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_alloc_from_block(b:Pgsl_block_complex; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_complex;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_alloc_from_vector(v:Pgsl_vector_complex; offset:Tsize_t; n:Tsize_t; stride:Tsize_t):Pgsl_vector_complex;cdecl;external;
procedure gsl_vector_complex_free(v:Pgsl_vector_complex);cdecl;external;
{ Views  }
function gsl_vector_complex_view_array(base:Pdouble; n:Tsize_t):Tgsl_vector_complex_view;cdecl;external;
function gsl_vector_complex_view_array_with_stride(base:Pdouble; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_view_array(base:Pdouble; n:Tsize_t):Tgsl_vector_complex_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_view_array_with_stride(base:Pdouble; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_const_view;cdecl;external;
function gsl_vector_complex_subvector(base:Pgsl_vector_complex; i:Tsize_t; n:Tsize_t):Tgsl_vector_complex_view;cdecl;external;
function gsl_vector_complex_subvector_with_stride(v:Pgsl_vector_complex; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_subvector(base:Pgsl_vector_complex; i:Tsize_t; n:Tsize_t):Tgsl_vector_complex_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_subvector_with_stride(v:Pgsl_vector_complex; i:Tsize_t; stride:Tsize_t; n:Tsize_t):Tgsl_vector_complex_const_view;cdecl;external;
function gsl_vector_complex_real(v:Pgsl_vector_complex):Tgsl_vector_view;cdecl;external;
function gsl_vector_complex_imag(v:Pgsl_vector_complex):Tgsl_vector_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_real(v:Pgsl_vector_complex):Tgsl_vector_const_view;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_const_imag(v:Pgsl_vector_complex):Tgsl_vector_const_view;cdecl;external;
{ Operations  }
procedure gsl_vector_complex_set_zero(v:Pgsl_vector_complex);cdecl;external;
procedure gsl_vector_complex_set_all(v:Pgsl_vector_complex; z:Tgsl_complex);cdecl;external;
function gsl_vector_complex_set_basis(v:Pgsl_vector_complex; i:Tsize_t):longint;cdecl;external;
function gsl_vector_complex_fread(stream:PFILE; v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_fwrite(stream:PFILE; v:Pgsl_vector_complex):longint;cdecl;external;
function gsl_vector_complex_fscanf(stream:PFILE; v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_fprintf(stream:PFILE; v:Pgsl_vector_complex; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_memcpy(dest:Pgsl_vector_complex; src:Pgsl_vector_complex):longint;cdecl;external;
function gsl_vector_complex_reverse(v:Pgsl_vector_complex):longint;cdecl;external;
function gsl_vector_complex_swap(v:Pgsl_vector_complex; w:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_swap_elements(v:Pgsl_vector_complex; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_equal(u:Pgsl_vector_complex; v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_isnull(v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_ispos(v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_isneg(v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_isnonneg(v:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_add(a:Pgsl_vector_complex; b:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_sub(a:Pgsl_vector_complex; b:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_mul(a:Pgsl_vector_complex; b:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_div(a:Pgsl_vector_complex; b:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_scale(a:Pgsl_vector_complex; x:Tgsl_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_add_constant(a:Pgsl_vector_complex; x:Tgsl_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_axpby(alpha:Tgsl_complex; x:Pgsl_vector_complex; beta:Tgsl_complex; y:Pgsl_vector_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_get(v:Pgsl_vector_complex; i:Tsize_t):Tgsl_complex;cdecl;external;
(* Const before type ignored *)
procedure gsl_vector_complex_set(v:Pgsl_vector_complex; i:Tsize_t; z:Tgsl_complex);cdecl;external;
(* Const before type ignored *)
function gsl_vector_complex_ptr(v:Pgsl_vector_complex; i:Tsize_t):Pgsl_complex;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_vector_complex_const_ptr(v:Pgsl_vector_complex; i:Tsize_t):Pgsl_complex;cdecl;external;
{$endif}
{ __GSL_VECTOR_COMPLEX_DOUBLE_H__  }

implementation


end.
