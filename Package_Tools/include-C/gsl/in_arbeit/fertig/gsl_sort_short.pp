
unit gsl_sort_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sort_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sort_short.h
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
Psize_t  = ^size_t;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sort/gsl_sort_short.h
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
{$ifndef __GSL_SORT_SHORT_H__}
{$define __GSL_SORT_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_permutation.h>}
(* Const before type ignored *)
(* Const before type ignored *)

procedure gsl_sort_short(data:Psmallint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_sort2_short(data1:Psmallint; stride1:Tsize_t; data2:Psmallint; stride2:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_sort_short_index(p:Psize_t; data:Psmallint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_short_smallest(dest:Psmallint; k:Tsize_t; src:Psmallint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_short_smallest_index(p:Psize_t; k:Tsize_t; src:Psmallint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_short_largest(dest:Psmallint; k:Tsize_t; src:Psmallint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sort_short_largest_index(p:Psize_t; k:Tsize_t; src:Psmallint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
{$endif}
{ __GSL_SORT_SHORT_H__  }

implementation


end.
