
unit gsl_diff;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_diff.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_diff.h
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
Pdouble  = ^double;
Pgsl_function  = ^gsl_function;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ diff/gsl_diff.h
 * 
 * Copyright (C) 2000 David Morrison
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
{$ifndef __GSL_DIFF_H__}
{$define __GSL_DIFF_H__}
{$include <gsl/gsl_math.h>}
{ xxxxxxxxxxxxxxxxxx }
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)

function gsl_diff_central(f:Pgsl_function; x:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_diff_backward(f:Pgsl_function; x:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_diff_forward(f:Pgsl_function; x:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
{$endif}
{$endif}
{ __GSL_DIFF_H__  }

implementation


end.
