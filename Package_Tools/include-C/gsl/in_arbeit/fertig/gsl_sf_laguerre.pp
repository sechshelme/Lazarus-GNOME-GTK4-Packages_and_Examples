
unit gsl_sf_laguerre;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_laguerre.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_laguerre.h
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


{ specfunc/gsl_sf_laguerre.h
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
{$ifndef __GSL_SF_LAGUERRE_H__}
{$define __GSL_SF_LAGUERRE_H__}
{$include <gsl/gsl_sf_result.h>}
{ L^a_n(x) = (a+1)_n / n! 1F1(-n,a+1,x)  }
{ Evaluate generalized Laguerre polynomials
 * using explicit representations.
 *
 * exceptions: none
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_laguerre_1_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_laguerre_2_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_laguerre_3_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_laguerre_1(a:Tdouble; x:Tdouble):Tdouble;cdecl;external;
function gsl_sf_laguerre_2(a:Tdouble; x:Tdouble):Tdouble;cdecl;external;
function gsl_sf_laguerre_3(a:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Evaluate generalized Laguerre polynomials.
 *
 * a > -1.0
 * n >= 0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_laguerre_n_e(n:longint; a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_laguerre_n(n:longint; a:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_LAGUERRE_H__  }

implementation


end.
