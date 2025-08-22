
unit gsl_sf_clausen;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_clausen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_clausen.h
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
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_clausen.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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
{ Author:  G. Jungman  }
{$ifndef __GSL_SF_CLAUSEN_H__}
{$define __GSL_SF_CLAUSEN_H__}
{$include <gsl/gsl_sf_result.h>}
{ Calculate the Clausen integral:
 *   Cl_2(x) := Integrate[-Log[2 Sin[t/2]], t,0,x]
 *
 * Relation to dilogarithm:
 *   Cl_2(theta) = Im[ Li_2(e^(i theta)) ]
  }

function gsl_sf_clausen_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_clausen(x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_CLAUSEN_H__  }

implementation


end.
