
unit gsl_monte_vegas;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_monte_vegas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_monte_vegas.h
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
Pcxxxxx  = ^cxxxxx;
Pdouble  = ^double;
PFILE  = ^FILE;
Pgsl_monte_function  = ^gsl_monte_function;
Pgsl_monte_vegas_params  = ^gsl_monte_vegas_params;
Pgsl_monte_vegas_state  = ^gsl_monte_vegas_state;
Pgsl_rng  = ^gsl_rng;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ monte/gsl_monte_vegas.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Michael Booth
 * Copyright (C) 2009 Brian Gough
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
{ header for the gsl "vegas" routines.  Mike Booth, May 1998  }
{$ifndef __GSL_MONTE_VEGAS_H__}
{$define __GSL_MONTE_VEGAS_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_rng.h>}
{$include <gsl/gsl_monte.h>}
type
  Tcxxxxx =  Longint;
  Const
    GSL_VEGAS_MODE_IMPORTANCE = 1;
    GSL_VEGAS_MODE_IMPORTANCE_ONLY = 0;
    GSL_VEGAS_MODE_STRATIFIED = -(1);

{ grid  }
{ these are both counted along the axes  }
{ distribution  }
{ control variables  }
{ scratch variables preserved between calls to vegas1/2/3   }
type
  Pgsl_monte_vegas_state = ^Tgsl_monte_vegas_state;
  Tgsl_monte_vegas_state = record
      dim : Tsize_t;
      bins_max : Tsize_t;
      bins : dword;
      boxes : dword;
      xi : Pdouble;
      xin : Pdouble;
      delx : Pdouble;
      weight : Pdouble;
      vol : Tdouble;
      x : Pdouble;
      bin : Plongint;
      box : Plongint;
      d : Pdouble;
      alpha : Tdouble;
      mode : longint;
      verbose : longint;
      iterations : dword;
      stage : longint;
      jac : Tdouble;
      wtd_int_sum : Tdouble;
      sum_wgts : Tdouble;
      chi_sum : Tdouble;
      chisq : Tdouble;
      result : Tdouble;
      sigma : Tdouble;
      it_start : dword;
      it_num : dword;
      samples : dword;
      calls_per_box : dword;
      ostream : PFILE;
    end;

function gsl_monte_vegas_integrate(f:Pgsl_monte_function; xl:Pdouble; xu:Pdouble; dim:Tsize_t; calls:Tsize_t; 
           r:Pgsl_rng; state:Pgsl_monte_vegas_state; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
function gsl_monte_vegas_alloc(dim:Tsize_t):Pgsl_monte_vegas_state;cdecl;external;
function gsl_monte_vegas_init(state:Pgsl_monte_vegas_state):longint;cdecl;external;
procedure gsl_monte_vegas_free(state:Pgsl_monte_vegas_state);cdecl;external;
(* Const before type ignored *)
function gsl_monte_vegas_chisq(state:Pgsl_monte_vegas_state):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_monte_vegas_runval(state:Pgsl_monte_vegas_state; result:Pdouble; sigma:Pdouble);cdecl;external;
type
  Pgsl_monte_vegas_params = ^Tgsl_monte_vegas_params;
  Tgsl_monte_vegas_params = record
      alpha : Tdouble;
      iterations : Tsize_t;
      stage : longint;
      mode : longint;
      verbose : longint;
      ostream : PFILE;
    end;
(* Const before type ignored *)

procedure gsl_monte_vegas_params_get(state:Pgsl_monte_vegas_state; params:Pgsl_monte_vegas_params);cdecl;external;
(* Const before type ignored *)
procedure gsl_monte_vegas_params_set(state:Pgsl_monte_vegas_state; params:Pgsl_monte_vegas_params);cdecl;external;
{$endif}
{ __GSL_MONTE_VEGAS_H__  }

implementation


end.
