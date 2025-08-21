
unit gsl_sort_long;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sort_long.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sort_long.h
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
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sort/gsl_sort_long.h
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
{$ifndef __GSL_SORT_LONG_H__}
{$define __GSL_SORT_LONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_permutation.h>}
(* Const before type ignored *)
(* Const before type ignored *)

procedure gsl_sort_long(data:Plongint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_sort2_long(data1:Plongint; stride1:Tsize_t; data2:Plongint; stride2:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_sort_long_index(p:Psize_t; data:Plongint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_long_smallest(dest:Plongint; k:Tsize_t; src:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_long_smallest_index(p:Psize_t; k:Tsize_t; src:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_long_largest(dest:Plongint; k:Tsize_t; src:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_long_largest_index(p:Psize_t; k:Tsize_t; src:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
{$endif}
{ __GSL_SORT_LONG_H__  }

implementation


end.
