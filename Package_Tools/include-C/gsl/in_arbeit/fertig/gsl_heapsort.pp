
unit gsl_heapsort;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_heapsort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_heapsort.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sort/gsl_heapsort.h
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
{$ifndef __GSL_HEAPSORT_H__}
{$define __GSL_HEAPSORT_H__}
{$include <gsl/gsl_permutation.h>}
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tgsl_comparison_fn_t = function (para1:pointer; para2:pointer):longint;cdecl;

procedure gsl_heapsort(array:pointer; count:Tsize_t; size:Tsize_t; compare:Tgsl_comparison_fn_t);cdecl;external;
(* Const before type ignored *)
function gsl_heapsort_index(p:Psize_t; array:pointer; count:Tsize_t; size:Tsize_t; compare:Tgsl_comparison_fn_t):longint;cdecl;external;
{$endif}
{ __GSL_HEAPSORT_H__  }

implementation


end.
