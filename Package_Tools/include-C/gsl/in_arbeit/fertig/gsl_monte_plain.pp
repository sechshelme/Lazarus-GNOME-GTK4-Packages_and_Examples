
unit gsl_monte_plain;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_monte_plain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_monte_plain.h
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
Pgsl_monte_function  = ^gsl_monte_function;
Pgsl_monte_plain_state  = ^gsl_monte_plain_state;
Pgsl_rng  = ^gsl_rng;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ monte/gsl_monte_plain.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Michael Booth
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
{ Plain Monte-Carlo.  }
{ Author: MJB  }
{$ifndef __GSL_MONTE_PLAIN_H__}
{$define __GSL_MONTE_PLAIN_H__}
{$include <stdio.h>}
{$include <gsl/gsl_monte.h>}
{$include <gsl/gsl_rng.h>}
type
  Pgsl_monte_plain_state = ^Tgsl_monte_plain_state;
  Tgsl_monte_plain_state = record
      dim : Tsize_t;
      x : Pdouble;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_monte_plain_integrate(f:Pgsl_monte_function; xl:Pdouble; xu:Pdouble; dim:Tsize_t; calls:Tsize_t; 
           r:Pgsl_rng; state:Pgsl_monte_plain_state; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
function gsl_monte_plain_alloc(dim:Tsize_t):Pgsl_monte_plain_state;cdecl;external;
function gsl_monte_plain_init(state:Pgsl_monte_plain_state):longint;cdecl;external;
procedure gsl_monte_plain_free(state:Pgsl_monte_plain_state);cdecl;external;
{$endif}
{ __GSL_MONTE_PLAIN_H__  }

implementation


end.
