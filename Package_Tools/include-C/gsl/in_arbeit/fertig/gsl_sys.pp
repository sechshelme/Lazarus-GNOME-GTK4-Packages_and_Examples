
unit gsl_sys;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sys.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sys.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sys/gsl_sys.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_SYS_H__}
{$define __GSL_SYS_H__}
(* Const before type ignored *)

function gsl_log1p(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_expm1(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_hypot3(x:Tdouble; y:Tdouble; z:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_acosh(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_asinh(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_atanh(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_isnan(x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_isinf(x:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_finite(x:Tdouble):longint;cdecl;external;
function gsl_nan:Tdouble;cdecl;external;
function gsl_posinf:Tdouble;cdecl;external;
function gsl_neginf:Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fdiv(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_coerce_double(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_coerce_float(x:single):single;cdecl;external;
(* Const before type ignored *)
function gsl_coerce_long_double(x:Tlong_double):Tlong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ldexp(x:Tdouble; e:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_frexp(x:Tdouble; e:Plongint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fcmp(x1:Tdouble; x2:Tdouble; epsilon:Tdouble):longint;cdecl;external;
{$endif}
{ __GSL_SYS_H__  }

implementation


end.
