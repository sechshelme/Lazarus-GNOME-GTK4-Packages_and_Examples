
unit gsl_fit;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_fit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_fit.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fit/gsl_fit.h
 * 
 * Copyright (C) 2000, 2007 Brian Gough
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
{$ifndef __GSL_FIT_H__}
{$define __GSL_FIT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_fit_linear(x:Pdouble; xstride:Tsize_t; y:Pdouble; ystride:Tsize_t; n:Tsize_t; 
           c0:Pdouble; c1:Pdouble; cov00:Pdouble; cov01:Pdouble; cov11:Pdouble; 
           sumsq:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fit_wlinear(x:Pdouble; xstride:Tsize_t; w:Pdouble; wstride:Tsize_t; y:Pdouble; 
           ystride:Tsize_t; n:Tsize_t; c0:Pdouble; c1:Pdouble; cov00:Pdouble; 
           cov01:Pdouble; cov11:Pdouble; chisq:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fit_linear_est(x:Tdouble; c0:Tdouble; c1:Tdouble; cov00:Tdouble; cov01:Tdouble; 
           cov11:Tdouble; y:Pdouble; y_err:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fit_mul(x:Pdouble; xstride:Tsize_t; y:Pdouble; ystride:Tsize_t; n:Tsize_t; 
           c1:Pdouble; cov11:Pdouble; sumsq:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fit_wmul(x:Pdouble; xstride:Tsize_t; w:Pdouble; wstride:Tsize_t; y:Pdouble; 
           ystride:Tsize_t; n:Tsize_t; c1:Pdouble; cov11:Pdouble; sumsq:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fit_mul_est(x:Tdouble; c1:Tdouble; cov11:Tdouble; y:Pdouble; y_err:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_FIT_H__  }

implementation


end.
