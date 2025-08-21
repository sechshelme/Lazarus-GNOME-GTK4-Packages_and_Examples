
unit gsl_sort_vector_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sort_vector_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sort_vector_float.h
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
Pgsl_permutation  = ^gsl_permutation;
Pgsl_vector_float  = ^gsl_vector_float;
Psingle  = ^single;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sort/gsl_sort_vector_float.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Thomas Walter, Brian Gough
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
{$ifndef __GSL_SORT_VECTOR_FLOAT_H__}
{$define __GSL_SORT_VECTOR_FLOAT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_permutation.h>}
{$include <gsl/gsl_vector_float.h>}

procedure gsl_sort_vector_float(v:Pgsl_vector_float);cdecl;external;
procedure gsl_sort_vector2_float(v1:Pgsl_vector_float; v2:Pgsl_vector_float);cdecl;external;
(* Const before type ignored *)
function gsl_sort_vector_float_index(p:Pgsl_permutation; v:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_vector_float_smallest(dest:Psingle; k:Tsize_t; v:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_vector_float_largest(dest:Psingle; k:Tsize_t; v:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_vector_float_smallest_index(p:Psize_t; k:Tsize_t; v:Pgsl_vector_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_vector_float_largest_index(p:Psize_t; k:Tsize_t; v:Pgsl_vector_float):longint;cdecl;external;
{$endif}
{ __GSL_SORT_VECTOR_FLOAT_H__  }

implementation


end.
