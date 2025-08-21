
unit gsl_ieee_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_ieee_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_ieee_utils.h
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
Pchar  = ^char;
Pdouble  = ^double;
PFILE  = ^FILE;
Pgsl_ieee_double_rep  = ^gsl_ieee_double_rep;
Pgsl_ieee_float_rep  = ^gsl_ieee_float_rep;
Plongint  = ^longint;
Psingle  = ^single;
Pxxxx  = ^xxxx;
Pxxxxxx  = ^xxxxxx;
Pxxxxxxx  = ^xxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ieee-utils/gsl_ieee_utils.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Brian Gough
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
{$ifndef __GSL_IEEE_UTILS_H__}
{$define __GSL_IEEE_UTILS_H__}
{$include <stdio.h>}
type
  Txxxx =  Longint;
  Const
    GSL_IEEE_TYPE_NAN = 1;
    GSL_IEEE_TYPE_INF = 2;
    GSL_IEEE_TYPE_NORMAL = 3;
    GSL_IEEE_TYPE_DENORMAL = 4;
    GSL_IEEE_TYPE_ZERO = 5;

{ Actual bits are 0..22, element 23 is \0  }
type
  Pgsl_ieee_float_rep = ^Tgsl_ieee_float_rep;
  Tgsl_ieee_float_rep = record
      sign : longint;
      mantissa : array[0..23] of char;
      exponent : longint;
      _type : longint;
    end;
{ Actual bits are 0..51, element 52 is \0  }

  Pgsl_ieee_double_rep = ^Tgsl_ieee_double_rep;
  Tgsl_ieee_double_rep = record
      sign : longint;
      mantissa : array[0..52] of char;
      exponent : longint;
      _type : longint;
    end;
(* Const before type ignored *)

procedure gsl_ieee_printf_float(x:Psingle);cdecl;external;
(* Const before type ignored *)
procedure gsl_ieee_printf_double(x:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ieee_fprintf_float(stream:PFILE; x:Psingle);cdecl;external;
(* Const before type ignored *)
procedure gsl_ieee_fprintf_double(stream:PFILE; x:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ieee_float_to_rep(x:Psingle; r:Pgsl_ieee_float_rep);cdecl;external;
(* Const before type ignored *)
procedure gsl_ieee_double_to_rep(x:Pdouble; r:Pgsl_ieee_double_rep);cdecl;external;
type
  Txxxxxxx =  Longint;
  Const
    GSL_IEEE_SINGLE_PRECISION = 1;
    GSL_IEEE_DOUBLE_PRECISION = 2;
    GSL_IEEE_EXTENDED_PRECISION = 3;

type
  Txxxxxxx =  Longint;
  Const
    GSL_IEEE_ROUND_TO_NEAREST = 1;
    GSL_IEEE_ROUND_DOWN = 2;
    GSL_IEEE_ROUND_UP = 3;
    GSL_IEEE_ROUND_TO_ZERO = 4;

type
  Txxxxxx =  Longint;
  Const
    GSL_IEEE_MASK_INVALID = 1;
    GSL_IEEE_MASK_DENORMALIZED = 2;
    GSL_IEEE_MASK_DIVISION_BY_ZERO = 4;
    GSL_IEEE_MASK_OVERFLOW = 8;
    GSL_IEEE_MASK_UNDERFLOW = 16;
    GSL_IEEE_MASK_ALL = 31;
    GSL_IEEE_TRAP_INEXACT = 32;


procedure gsl_ieee_env_setup;cdecl;external;
(* Const before type ignored *)
function gsl_ieee_read_mode_string(description:Pchar; precision:Plongint; rounding:Plongint; exception_mask:Plongint):longint;cdecl;external;
function gsl_ieee_set_mode(precision:longint; rounding:longint; exception_mask:longint):longint;cdecl;external;
{$endif}
{ __GSL_IEEE_UTILS_H__  }

implementation


end.
