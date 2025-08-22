
unit gsl_siman;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_siman.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_siman.h
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
Pgsl_rng  = ^gsl_rng;
Pgsl_siman_copy_construct_t  = ^gsl_siman_copy_construct_t;
Pgsl_siman_params_t  = ^gsl_siman_params_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ siman/gsl_siman.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Mark Galassi
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
{$ifndef __GSL_SIMAN_H__}
{$define __GSL_SIMAN_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_rng.h>}
{ types for the function pointers passed to gsl_siman_solve  }
type

  Tgsl_siman_Efunc_t = function (xp:pointer):Tdouble;cdecl;
(* Const before type ignored *)

  Tgsl_siman_step_t = procedure (r:Pgsl_rng; xp:pointer; step_size:Tdouble);cdecl;

  Tgsl_siman_metric_t = function (xp:pointer; yp:pointer):Tdouble;cdecl;

  Tgsl_siman_print_t = procedure (xp:pointer);cdecl;

  Tgsl_siman_copy_t = procedure (source:pointer; dest:pointer);cdecl;

  Pgsl_siman_copy_construct_t = ^Tgsl_siman_copy_construct_t;
  Tgsl_siman_copy_construct_t = function (xp:pointer):pointer;cdecl;

  Tgsl_siman_destroy_t = procedure (xp:pointer);cdecl;
{ this structure contains all the information needed to structure the
   search, beyond the energy function, the step function and the
   initial guess.  }
{ how many points to try for each step  }
{ how many iterations at each temperature?  }
{ max step size in the random walk  }
{ the following parameters are for the Boltzmann distribution  }

  Pgsl_siman_params_t = ^Tgsl_siman_params_t;
  Tgsl_siman_params_t = record
      n_tries : longint;
      iters_fixed_T : longint;
      step_size : Tdouble;
      k : Tdouble;
      t_initial : Tdouble;
      mu_t : Tdouble;
      t_min : Tdouble;
    end;
{ prototype for the workhorse function  }
(* Const before type ignored *)

procedure gsl_siman_solve(r:Pgsl_rng; x0_p:pointer; Ef:Tgsl_siman_Efunc_t; take_step:Tgsl_siman_step_t; distance:Tgsl_siman_metric_t; 
            print_position:Tgsl_siman_print_t; copyfunc:Tgsl_siman_copy_t; copy_constructor:Tgsl_siman_copy_construct_t; destructor:Tgsl_siman_destroy_t; element_size:Tsize_t; 
            params:Tgsl_siman_params_t);cdecl;external;
(* Const before type ignored *)
procedure gsl_siman_solve_many(r:Pgsl_rng; x0_p:pointer; Ef:Tgsl_siman_Efunc_t; take_step:Tgsl_siman_step_t; distance:Tgsl_siman_metric_t; 
            print_position:Tgsl_siman_print_t; element_size:Tsize_t; params:Tgsl_siman_params_t);cdecl;external;
{$endif}
{ __GSL_SIMAN_H__  }

implementation


end.
