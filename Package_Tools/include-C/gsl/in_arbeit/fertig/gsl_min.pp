
unit gsl_min;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_min.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_min
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
Pgsl_min_fminimizer  = ^gsl_min_fminimizer;
Pgsl_min_fminimizer_type  = ^gsl_min_fminimizer_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ min/gsl_min.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007, 2009 Brian Gough
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
{$ifndef __GSL_MIN_H__}
{$define __GSL_MIN_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
(* Const before type ignored *)
type
  Pgsl_min_fminimizer_type = ^Tgsl_min_fminimizer_type;
  Tgsl_min_fminimizer_type = record
      name : Pchar;
      size : Tsize_t;
      set : function (state:pointer; f:Pgsl_function; x_minimum:Tdouble; f_minimum:Tdouble; x_lower:Tdouble; 
                   f_lower:Tdouble; x_upper:Tdouble; f_upper:Tdouble):longint;cdecl;
      iterate : function (state:pointer; f:Pgsl_function; x_minimum:Pdouble; f_minimum:Pdouble; x_lower:Pdouble; 
                   f_lower:Pdouble; x_upper:Pdouble; f_upper:Pdouble):longint;cdecl;
    end;
(* Const before type ignored *)

  Pgsl_min_fminimizer = ^Tgsl_min_fminimizer;
  Tgsl_min_fminimizer = record
      _type : Pgsl_min_fminimizer_type;
      _function : Pgsl_function;
      x_minimum : Tdouble;
      x_lower : Tdouble;
      x_upper : Tdouble;
      f_minimum : Tdouble;
      f_lower : Tdouble;
      f_upper : Tdouble;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_min_fminimizer_alloc(T:Pgsl_min_fminimizer_type):Pgsl_min_fminimizer;cdecl;external;
procedure gsl_min_fminimizer_free(s:Pgsl_min_fminimizer);cdecl;external;
function gsl_min_fminimizer_set(s:Pgsl_min_fminimizer; f:Pgsl_function; x_minimum:Tdouble; x_lower:Tdouble; x_upper:Tdouble):longint;cdecl;external;
function gsl_min_fminimizer_set_with_values(s:Pgsl_min_fminimizer; f:Pgsl_function; x_minimum:Tdouble; f_minimum:Tdouble; x_lower:Tdouble; 
           f_lower:Tdouble; x_upper:Tdouble; f_upper:Tdouble):longint;cdecl;external;
function gsl_min_fminimizer_iterate(s:Pgsl_min_fminimizer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_min_fminimizer_name(s:Pgsl_min_fminimizer):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_x_minimum(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_x_lower(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_x_upper(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_f_minimum(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_f_lower(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_min_fminimizer_f_upper(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
{ Deprecated, use x_minimum instead  }
(* Const before type ignored *)
function gsl_min_fminimizer_minimum(s:Pgsl_min_fminimizer):Tdouble;cdecl;external;
function gsl_min_test_interval(x_lower:Tdouble; x_upper:Tdouble; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
  var
    gsl_min_fminimizer_goldensection : Pgsl_min_fminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_min_fminimizer_brent : Pgsl_min_fminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_min_fminimizer_quad_golden : Pgsl_min_fminimizer_type;cvar;external;
type

  Tgsl_min_bracketing_function = function (f:Pgsl_function; x_minimum:Pdouble; f_minimum:Pdouble; x_lower:Pdouble; f_lower:Pdouble; 
               x_upper:Pdouble; f_upper:Pdouble; eval_max:Tsize_t):longint;cdecl;

function gsl_min_find_bracket(f:Pgsl_function; x_minimum:Pdouble; f_minimum:Pdouble; x_lower:Pdouble; f_lower:Pdouble; 
           x_upper:Pdouble; f_upper:Pdouble; eval_max:Tsize_t):longint;cdecl;external;
{$endif}
{ __GSL_MIN_H__  }

implementation


end.
