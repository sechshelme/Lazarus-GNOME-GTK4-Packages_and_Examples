
unit gsl_interp2d;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_interp2d.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_interp2d.h
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
Pgsl_interp2d  = ^gsl_interp2d;
Pgsl_interp2d_type  = ^gsl_interp2d_type;
Pgsl_interp_accel  = ^gsl_interp_accel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ interpolation/gsl_interp2d.h
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
{$ifndef __GSL_INTERP2D_H__}
{$define __GSL_INTERP2D_H__}
{$include <gsl/gsl_interp.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_interp2d_type = ^Tgsl_interp2d_type;
  Tgsl_interp2d_type = record
      name : Pchar;
      min_size : dword;
      alloc : function (xsize:Tsize_t; ysize:Tsize_t):pointer;cdecl;
      init : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t):longint;cdecl;
      eval : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z:Pdouble):longint;cdecl;
      eval_deriv_x : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z_p:Pdouble):longint;cdecl;
      eval_deriv_y : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z_p:Pdouble):longint;cdecl;
      eval_deriv_xx : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z_pp:Pdouble):longint;cdecl;
      eval_deriv_xy : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z_pp:Pdouble):longint;cdecl;
      eval_deriv_yy : function (para1:pointer; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
                   ysize:Tsize_t; x:Tdouble; y:Tdouble; para9:Pgsl_interp_accel; para10:Pgsl_interp_accel; 
                   z_pp:Pdouble):longint;cdecl;
      free : procedure (para1:pointer);cdecl;
    end;
(* Const before type ignored *)
{ interpolation type  }
{ minimum value of x for which data have been provided  }
{ maximum value of x for which data have been provided  }
{ minimum value of y for which data have been provided  }
{ maximum value of y for which data have been provided  }
{ number of x values provided  }
{ number of y values provided  }
{ internal state object specific to the interpolation type  }

  Pgsl_interp2d = ^Tgsl_interp2d;
  Tgsl_interp2d = record
      _type : Pgsl_interp2d_type;
      xmin : Tdouble;
      xmax : Tdouble;
      ymin : Tdouble;
      ymax : Tdouble;
      xsize : Tsize_t;
      ysize : Tsize_t;
      state : pointer;
    end;
{ available types  }
(* Const before type ignored *)
  var
    gsl_interp2d_bilinear : Pgsl_interp2d_type;cvar;external;
(* Const before type ignored *)
    gsl_interp2d_bicubic : Pgsl_interp2d_type;cvar;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_interp2d_alloc(T:Pgsl_interp2d_type; xsize:Tsize_t; ysize:Tsize_t):Pgsl_interp2d;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_name(interp:Pgsl_interp2d):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_interp2d_min_size(interp:Pgsl_interp2d):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_interp2d_type_min_size(T:Pgsl_interp2d_type):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_set(interp:Pgsl_interp2d; zarr:Pdouble; i:Tsize_t; j:Tsize_t; z:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_get(interp:Pgsl_interp2d; zarr:Pdouble; i:Tsize_t; j:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_idx(interp:Pgsl_interp2d; i:Tsize_t; j:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_init(interp:Pgsl_interp2d; xa:Pdouble; ya:Pdouble; za:Pdouble; xsize:Tsize_t; 
           ysize:Tsize_t):longint;cdecl;external;
procedure gsl_interp2d_free(interp:Pgsl_interp2d);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_extrap(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_interp2d_eval_e_extrap(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
{$endif}
{ !GSL_DISABLE_DEPRECATED  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_interp2d_eval_extrap_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_x(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_x_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_y(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_y_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_xx(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_xx_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_yy(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_yy_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_xy(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp2d_eval_deriv_xy_e(interp:Pgsl_interp2d; xarr:Pdouble; yarr:Pdouble; zarr:Pdouble; x:Tdouble; 
           y:Tdouble; xa:Pgsl_interp_accel; ya:Pgsl_interp_accel; z:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_INTERP2D_H__  }

implementation


end.
