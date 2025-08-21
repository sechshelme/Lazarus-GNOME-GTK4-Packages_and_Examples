
unit gsl_interp;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_interp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_interp.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ interpolation/gsl_interp.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004 Gerard Jungman
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
{ Author:  G. Jungman
  }
{$ifndef __GSL_INTERP_H__}
{$define __GSL_INTERP_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_types.h>}
{ evaluation accelerator  }
{ cache of index    }
{ keep statistics   }
type
  Pgsl_interp_accel = ^Tgsl_interp_accel;
  Tgsl_interp_accel = record
      cache : Tsize_t;
      miss_count : Tsize_t;
      hit_count : Tsize_t;
    end;
{ interpolation object type  }
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

  Pgsl_interp_type = ^Tgsl_interp_type;
  Tgsl_interp_type = record
      name : Pchar;
      min_size : dword;
      alloc : function (size:Tsize_t):pointer;cdecl;
      init : function (para1:pointer; xa:Pdouble; ya:Pdouble; size:Tsize_t):longint;cdecl;
      eval : function (para1:pointer; xa:Pdouble; ya:Pdouble; size:Tsize_t; x:Tdouble; 
                   para6:Pgsl_interp_accel; y:Pdouble):longint;cdecl;
      eval_deriv : function (para1:pointer; xa:Pdouble; ya:Pdouble; size:Tsize_t; x:Tdouble; 
                   para6:Pgsl_interp_accel; y_p:Pdouble):longint;cdecl;
      eval_deriv2 : function (para1:pointer; xa:Pdouble; ya:Pdouble; size:Tsize_t; x:Tdouble; 
                   para6:Pgsl_interp_accel; y_pp:Pdouble):longint;cdecl;
      eval_integ : function (para1:pointer; xa:Pdouble; ya:Pdouble; size:Tsize_t; para5:Pgsl_interp_accel; 
                   a:Tdouble; b:Tdouble; result:Pdouble):longint;cdecl;
      free : procedure (para1:pointer);cdecl;
    end;
{ general interpolation object  }
(* Const before type ignored *)

  Pgsl_interp = ^Tgsl_interp;
  Tgsl_interp = record
      _type : Pgsl_interp_type;
      xmin : Tdouble;
      xmax : Tdouble;
      size : Tsize_t;
      state : pointer;
    end;
{ available types  }
(* Const before type ignored *)
  var
    gsl_interp_linear : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_polynomial : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_cspline : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_cspline_periodic : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_akima : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_akima_periodic : Pgsl_interp_type;cvar;external;
(* Const before type ignored *)
    gsl_interp_steffen : Pgsl_interp_type;cvar;external;

function gsl_interp_accel_alloc:Pgsl_interp_accel;cdecl;external;
function gsl_interp_accel_reset(a:Pgsl_interp_accel):longint;cdecl;external;
procedure gsl_interp_accel_free(a:Pgsl_interp_accel);cdecl;external;
(* Const before type ignored *)
function gsl_interp_alloc(T:Pgsl_interp_type; n:Tsize_t):Pgsl_interp;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_init(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_name(interp:Pgsl_interp):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_interp_min_size(interp:Pgsl_interp):dword;cdecl;external;
(* Const before type ignored *)
function gsl_interp_type_min_size(T:Pgsl_interp_type):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_e(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel; 
           y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_deriv_e(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel; 
           d:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_deriv(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_deriv2_e(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel; 
           d2:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_deriv2(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; x:Tdouble; a:Pgsl_interp_accel):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_integ_e(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; a:Tdouble; b:Tdouble; 
           acc:Pgsl_interp_accel; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_interp_eval_integ(obj:Pgsl_interp; xa:Pdouble; ya:Pdouble; a:Tdouble; b:Tdouble; 
           acc:Pgsl_interp_accel):Tdouble;cdecl;external;
procedure gsl_interp_free(interp:Pgsl_interp);cdecl;external;
(* Const before type ignored *)
function gsl_interp_bsearch(x_array:Pdouble; x:Tdouble; index_lo:Tsize_t; index_hi:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_interp_accel_find(a:Pgsl_interp_accel; x_array:Pdouble; size:Tsize_t; x:Tdouble):Tsize_t;cdecl;external;
{$endif}
{ __GSL_INTERP_H__  }

implementation


end.
