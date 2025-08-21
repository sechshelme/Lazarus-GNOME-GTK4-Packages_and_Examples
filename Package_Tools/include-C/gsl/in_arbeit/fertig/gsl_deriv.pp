
unit gsl_deriv;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_deriv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_deriv.h
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


{ deriv/gsl_deriv.h
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
{$ifndef __GSL_DERIV_H__}
{$define __GSL_DERIV_H__}
{$include <gsl/gsl_math.h>}
(* Const before type ignored *)

function gsl_deriv_central(f:Pgsl_function; x:Tdouble; h:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_deriv_backward(f:Pgsl_function; x:Tdouble; h:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_deriv_forward(f:Pgsl_function; x:Tdouble; h:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_DERIV_H__  }

implementation


end.
