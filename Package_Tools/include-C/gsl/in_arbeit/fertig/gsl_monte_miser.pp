
unit gsl_monte_miser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_monte_miser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_monte_miser.h
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
Pdouble  = ^double;
Pgsl_monte_function  = ^gsl_monte_function;
Pgsl_monte_miser_params  = ^gsl_monte_miser_params;
Pgsl_monte_miser_state  = ^gsl_monte_miser_state;
Pgsl_rng  = ^gsl_rng;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ monte/gsl_monte_miser.h
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
{ Author: MJB  }
{$ifndef __GSL_MONTE_MISER_H__}
{$define __GSL_MONTE_MISER_H__}
{$include <gsl/gsl_rng.h>}
{$include <gsl/gsl_monte.h>}
{$include <gsl/gsl_monte_plain.h>}
type
  Pgsl_monte_miser_state = ^Tgsl_monte_miser_state;
  Tgsl_monte_miser_state = record
      min_calls : Tsize_t;
      min_calls_per_bisection : Tsize_t;
      dither : Tdouble;
      estimate_frac : Tdouble;
      alpha : Tdouble;
      dim : Tsize_t;
      estimate_style : longint;
      depth : longint;
      verbose : longint;
      x : Pdouble;
      xmid : Pdouble;
      sigma_l : Pdouble;
      sigma_r : Pdouble;
      fmax_l : Pdouble;
      fmax_r : Pdouble;
      fmin_l : Pdouble;
      fmin_r : Pdouble;
      fsum_l : Pdouble;
      fsum_r : Pdouble;
      fsum2_l : Pdouble;
      fsum2_r : Pdouble;
      hits_l : Psize_t;
      hits_r : Psize_t;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_monte_miser_integrate(f:Pgsl_monte_function; xl:Pdouble; xh:Pdouble; dim:Tsize_t; calls:Tsize_t; 
           r:Pgsl_rng; state:Pgsl_monte_miser_state; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
function gsl_monte_miser_alloc(dim:Tsize_t):Pgsl_monte_miser_state;cdecl;external;
function gsl_monte_miser_init(state:Pgsl_monte_miser_state):longint;cdecl;external;
procedure gsl_monte_miser_free(state:Pgsl_monte_miser_state);cdecl;external;
type
  Pgsl_monte_miser_params = ^Tgsl_monte_miser_params;
  Tgsl_monte_miser_params = record
      estimate_frac : Tdouble;
      min_calls : Tsize_t;
      min_calls_per_bisection : Tsize_t;
      alpha : Tdouble;
      dither : Tdouble;
    end;
(* Const before type ignored *)

procedure gsl_monte_miser_params_get(state:Pgsl_monte_miser_state; params:Pgsl_monte_miser_params);cdecl;external;
(* Const before type ignored *)
procedure gsl_monte_miser_params_set(state:Pgsl_monte_miser_state; params:Pgsl_monte_miser_params);cdecl;external;
{$endif}
{ __GSL_MONTE_MISER_H__  }

implementation


end.
