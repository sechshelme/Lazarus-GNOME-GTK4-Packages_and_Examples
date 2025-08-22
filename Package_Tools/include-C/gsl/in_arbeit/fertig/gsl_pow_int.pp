
unit gsl_pow_int;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_pow_int.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_pow_int.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_pow_int.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_POW_INT_H__}
{$define __GSL_POW_INT_H__}
{$include <gsl/gsl_inline.h>}
(* Const before type ignored *)

function gsl_pow_2(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_3(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_4(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_5(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_6(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_7(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_8(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_pow_9(x:Tdouble):Tdouble;cdecl;external;
function gsl_pow_int(x:Tdouble; n:longint):Tdouble;cdecl;external;
function gsl_pow_uint(x:Tdouble; n:dword):Tdouble;cdecl;external;
{$endif}
{ __GSL_POW_INT_H__  }

implementation


end.
