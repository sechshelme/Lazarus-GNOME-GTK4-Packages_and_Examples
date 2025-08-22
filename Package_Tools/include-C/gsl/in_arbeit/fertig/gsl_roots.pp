
unit gsl_roots;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_roots.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_roots.h
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
Pgsl_function  = ^gsl_function;
Pgsl_function_fdf  = ^gsl_function_fdf;
Pgsl_root_fdfsolver  = ^gsl_root_fdfsolver;
Pgsl_root_fdfsolver_type  = ^gsl_root_fdfsolver_type;
Pgsl_root_fsolver  = ^gsl_root_fsolver;
Pgsl_root_fsolver_type  = ^gsl_root_fsolver_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ roots/gsl_roots.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Reid Priedhorsky, Brian Gough
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
{$ifndef __GSL_ROOTS_H__}
{$define __GSL_ROOTS_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
(* Const before type ignored *)
type
  Pgsl_root_fsolver_type = ^Tgsl_root_fsolver_type;
  Tgsl_root_fsolver_type = record
      name : Pchar;
      size : Tsize_t;
      set : function (state:pointer; f:Pgsl_function; root:Pdouble; x_lower:Tdouble; x_upper:Tdouble):longint;cdecl;
      iterate : function (state:pointer; f:Pgsl_function; root:Pdouble; x_lower:Pdouble; x_upper:Pdouble):longint;cdecl;
    end;
(* Const before type ignored *)

  Pgsl_root_fsolver = ^Tgsl_root_fsolver;
  Tgsl_root_fsolver = record
      _type : Pgsl_root_fsolver_type;
      _function : Pgsl_function;
      root : Tdouble;
      x_lower : Tdouble;
      x_upper : Tdouble;
      state : pointer;
    end;
(* Const before type ignored *)

  Pgsl_root_fdfsolver_type = ^Tgsl_root_fdfsolver_type;
  Tgsl_root_fdfsolver_type = record
      name : Pchar;
      size : Tsize_t;
      set : function (state:pointer; f:Pgsl_function_fdf; root:Pdouble):longint;cdecl;
      iterate : function (state:pointer; f:Pgsl_function_fdf; root:Pdouble):longint;cdecl;
    end;
(* Const before type ignored *)

  Pgsl_root_fdfsolver = ^Tgsl_root_fdfsolver;
  Tgsl_root_fdfsolver = record
      _type : Pgsl_root_fdfsolver_type;
      fdf : Pgsl_function_fdf;
      root : Tdouble;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_root_fsolver_alloc(T:Pgsl_root_fsolver_type):Pgsl_root_fsolver;cdecl;external;
procedure gsl_root_fsolver_free(s:Pgsl_root_fsolver);cdecl;external;
function gsl_root_fsolver_set(s:Pgsl_root_fsolver; f:Pgsl_function; x_lower:Tdouble; x_upper:Tdouble):longint;cdecl;external;
function gsl_root_fsolver_iterate(s:Pgsl_root_fsolver):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_root_fsolver_name(s:Pgsl_root_fsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_root_fsolver_root(s:Pgsl_root_fsolver):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_root_fsolver_x_lower(s:Pgsl_root_fsolver):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_root_fsolver_x_upper(s:Pgsl_root_fsolver):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_root_fdfsolver_alloc(T:Pgsl_root_fdfsolver_type):Pgsl_root_fdfsolver;cdecl;external;
function gsl_root_fdfsolver_set(s:Pgsl_root_fdfsolver; fdf:Pgsl_function_fdf; root:Tdouble):longint;cdecl;external;
function gsl_root_fdfsolver_iterate(s:Pgsl_root_fdfsolver):longint;cdecl;external;
procedure gsl_root_fdfsolver_free(s:Pgsl_root_fdfsolver);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_root_fdfsolver_name(s:Pgsl_root_fdfsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_root_fdfsolver_root(s:Pgsl_root_fdfsolver):Tdouble;cdecl;external;
function gsl_root_test_interval(x_lower:Tdouble; x_upper:Tdouble; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
function gsl_root_test_residual(f:Tdouble; epsabs:Tdouble):longint;cdecl;external;
function gsl_root_test_delta(x1:Tdouble; x0:Tdouble; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
  var
    gsl_root_fsolver_bisection : Pgsl_root_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_root_fsolver_brent : Pgsl_root_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_root_fsolver_falsepos : Pgsl_root_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_root_fdfsolver_newton : Pgsl_root_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_root_fdfsolver_secant : Pgsl_root_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_root_fdfsolver_steffenson : Pgsl_root_fdfsolver_type;cvar;external;
{$endif}
{ __GSL_ROOTS_H__  }

implementation


end.
