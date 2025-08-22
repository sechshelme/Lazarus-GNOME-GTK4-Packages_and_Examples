
unit gsl_spline;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spline.h
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
Pgsl_interp  = ^gsl_interp;
Pgsl_interp_accel  = ^gsl_interp_accel;
Pgsl_interp_type  = ^gsl_interp_type;
Pgsl_spline  = ^gsl_spline;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ interpolation/gsl_spline.h
 * 
 * Copyright (C) 2001, 2007 Brian Gough
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
{$ifndef __GSL_SPLINE_H__}
{$define __GSL_SPLINE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_interp.h>}
{ general interpolation object  }
type
  Pgsl_spline = ^Tgsl_spline;
  Tgsl_spline = record
      interp : Pgsl_interp;
      x : Pdouble;
      y : Pdouble;
      size : Tsize_t;
    end;
(* Const before type ignored *)

function gsl_spline_alloc(T:Pgsl_interp_type; size:Tsize_t):Pgsl_spline;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline_init(spline:Pgsl_spline; xa:Pdouble; ya:Pdouble; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline_name(spline:Pgsl_spline):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_spline_min_size(spline:Pgsl_spline):dword;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_e(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_deriv_e(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_deriv(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_deriv2_e(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_deriv2(spline:Pgsl_spline; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_integ_e(spline:Pgsl_spline; a:Tdouble; b:Tdouble; acc:Pgsl_interp_accel; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spline_eval_integ(spline:Pgsl_spline; a:Tdouble; b:Tdouble; acc:Pgsl_interp_accel):Tdouble;cdecl;external;
procedure gsl_spline_free(spline:Pgsl_spline);cdecl;external;
{$endif}
{ __GSL_INTERP_H__  }

implementation


end.
