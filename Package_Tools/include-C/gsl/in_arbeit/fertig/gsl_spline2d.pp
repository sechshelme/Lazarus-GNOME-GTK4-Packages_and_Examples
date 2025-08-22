
unit gsl_spline2d;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spline2d.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spline2d.h
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
Pgsl_interp2d_type  = ^gsl_interp2d_type;
Pgsl_interp_accel  = ^gsl_interp_accel;
Pgsl_spline2d  = ^gsl_spline2d;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ interpolation/gsl_spline2d.h
 * 
 * Copyright 2012 David Zaslavsky
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
{$ifndef __GSL_SPLINE2D_H__}
{$define __GSL_SPLINE2D_H__}
{$include <gsl/gsl_interp.h>}
{$include <gsl/gsl_interp2d.h>}
{
 * A 2D interpolation object which stores the arrays defining the function.
 * In all other respects, this is just like a gsl_interp2d object.
  }
{ low-level interpolation object  }
{ x data array  }
{ y data array  }
{ z data array  }
type
  Pgsl_spline2d = ^Tgsl_spline2d;
  Tgsl_spline2d = record
      interp_object : Tgsl_interp2d;
      xarr : Pdouble;
      yarr : Pdouble;
      zarr : Pdouble;
    end;
(* Const before type ignored *)

function gsl_spline2d_alloc(T:Pgsl_interp2d_type; xsize:Tsize_t; ysize:Tsize_t):Pgsl_spline2d;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_init(interp:Pgsl_spline2d; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
           ysize:Tsize_t):longint;cdecl;external;
procedure gsl_spline2d_free(interp:Pgsl_spline2d);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_extrap(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_extrap_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_x(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_x_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_y(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_y_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_xx(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_xx_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_yy(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_yy_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_xy(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_eval_deriv_xy_e(interp:Pgsl_spline2d; x:Tdouble; y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; 
           z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spline2d_min_size(interp:Pgsl_spline2d):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_name(interp:Pgsl_spline2d):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_set(interp:Pgsl_spline2d; zarr:Pdouble; i:Tsize_t; j:Tsize_t; z:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spline2d_get(interp:Pgsl_spline2d; zarr:Pdouble; i:Tsize_t; j:Tsize_t):Tdouble;cdecl;external;
{$endif}
{ __GSL_SPLINE2D_H__  }

implementation


end.
