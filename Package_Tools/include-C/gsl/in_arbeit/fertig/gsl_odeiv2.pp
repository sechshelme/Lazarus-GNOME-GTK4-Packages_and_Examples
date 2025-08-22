
unit gsl_odeiv2;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_odeiv2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_odeiv2.h
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
Pgsl_odeiv2_control  = ^gsl_odeiv2_control;
Pgsl_odeiv2_control_struct  = ^gsl_odeiv2_control_struct;
Pgsl_odeiv2_control_type  = ^gsl_odeiv2_control_type;
Pgsl_odeiv2_driver  = ^gsl_odeiv2_driver;
Pgsl_odeiv2_driver_struct  = ^gsl_odeiv2_driver_struct;
Pgsl_odeiv2_evolve  = ^gsl_odeiv2_evolve;
Pgsl_odeiv2_evolve_struct  = ^gsl_odeiv2_evolve_struct;
Pgsl_odeiv2_step  = ^gsl_odeiv2_step;
Pgsl_odeiv2_step_struct  = ^gsl_odeiv2_step_struct;
Pgsl_odeiv2_step_type  = ^gsl_odeiv2_step_type;
Pgsl_odeiv2_system  = ^gsl_odeiv2_system;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ode-initval/odeiv2.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
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
{ Author:  G. Jungman  }
{ Modified by Tuomo Keskitalo  }
{$ifndef __GSL_ODEIV2_H__}
{$define __GSL_ODEIV2_H__}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{ Description of a system of ODEs.
 *
 * y' = f(t,y) = dydt(t, y)
 *
 * The system is specified by giving the right-hand-side
 * of the equation and possibly a jacobian function.
 *
 * Some methods require the jacobian function, which calculates
 * the matrix dfdy and the vector dfdt. The matrix dfdy conforms
 * to the GSL standard, being a continuous range of floating point
 * values, in row-order.
 *
 * As with GSL function objects, user-supplied parameter
 * data is also present. 
  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_odeiv2_system = ^Tgsl_odeiv2_system;
  Tgsl_odeiv2_system = record
      _function : function (t:Tdouble; y:Pdouble; dydt:Pdouble; params:pointer):longint;cdecl;
      jacobian : function (t:Tdouble; y:Pdouble; dfdy:Pdouble; dfdt:Pdouble; params:pointer):longint;cdecl;
      dimension : Tsize_t;
      params : pointer;
    end;
{ Function evaluation macros  }
{ Type definitions  }
  Tgsl_odeiv2_step_struct = Tgsl_odeiv2_step;
  Tgsl_odeiv2_control_struct = Tgsl_odeiv2_control;
  Tgsl_odeiv2_evolve_struct = Tgsl_odeiv2_evolve;
  Tgsl_odeiv2_driver_struct = Tgsl_odeiv2_driver;
{ Stepper object
 *
 * Opaque object for stepping an ODE system from t to t+h.
 * In general the object has some state which facilitates
 * iterating the stepping operation.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_odeiv2_step_type = ^Tgsl_odeiv2_step_type;
  Tgsl_odeiv2_step_type = record
      name : Pchar;
      can_use_dydt_in : longint;
      gives_exact_dydt_out : longint;
      alloc : function (dim:Tsize_t):pointer;cdecl;
      apply : function (state:pointer; dim:Tsize_t; t:Tdouble; h:Tdouble; y:Pdouble; 
                   yerr:Pdouble; dydt_in:Pdouble; dydt_out:Pdouble; dydt:Pgsl_odeiv2_system):longint;cdecl;
      set_driver : function (state:pointer; d:Pgsl_odeiv2_driver):longint;cdecl;
      reset : function (state:pointer; dim:Tsize_t):longint;cdecl;
      order : function (state:pointer):dword;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)
  Pgsl_odeiv2_step_struct = ^Tgsl_odeiv2_step_struct;
  Tgsl_odeiv2_step_struct = record
      _type : Pgsl_odeiv2_step_type;
      dimension : Tsize_t;
      state : pointer;
    end;

{ Available stepper types  }
(* Const before type ignored *)
  var
    gsl_odeiv2_step_rk2 : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rk4 : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rkf45 : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rkck : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rk8pd : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rk2imp : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rk4imp : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_bsimp : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_rk1imp : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_msadams : Pgsl_odeiv2_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv2_step_msbdf : Pgsl_odeiv2_step_type;cvar;external;
{ Stepper object methods  }
(* Const before type ignored *)

function gsl_odeiv2_step_alloc(T:Pgsl_odeiv2_step_type; dim:Tsize_t):Pgsl_odeiv2_step;cdecl;external;
function gsl_odeiv2_step_reset(s:Pgsl_odeiv2_step):longint;cdecl;external;
procedure gsl_odeiv2_step_free(s:Pgsl_odeiv2_step);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_step_name(s:Pgsl_odeiv2_step):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_step_order(s:Pgsl_odeiv2_step):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_step_apply(s:Pgsl_odeiv2_step; t:Tdouble; h:Tdouble; y:Pdouble; yerr:Pdouble; 
           dydt_in:Pdouble; dydt_out:Pdouble; dydt:Pgsl_odeiv2_system):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_step_set_driver(s:Pgsl_odeiv2_step; d:Pgsl_odeiv2_driver):longint;cdecl;external;
{ Step size control object.  }
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
  Pgsl_odeiv2_control_type = ^Tgsl_odeiv2_control_type;
  Tgsl_odeiv2_control_type = record
      name : Pchar;
      alloc : function :pointer;cdecl;
      init : function (state:pointer; eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):longint;cdecl;
      hadjust : function (state:pointer; dim:Tsize_t; ord:dword; y:Pdouble; yerr:Pdouble; 
                   yp:Pdouble; h:Pdouble):longint;cdecl;
      errlevel : function (state:pointer; y:Tdouble; dydt:Tdouble; h:Tdouble; ind:Tsize_t; 
                   errlev:Pdouble):longint;cdecl;
      set_driver : function (state:pointer; d:Pgsl_odeiv2_driver):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)
  Pgsl_odeiv2_control_struct = ^Tgsl_odeiv2_control_struct;
  Tgsl_odeiv2_control_struct = record
      _type : Pgsl_odeiv2_control_type;
      state : pointer;
    end;

{ Possible return values for an hadjust() evolution method  }
{ step was increased  }

const
  GSL_ODEIV_HADJ_INC = 1;  
{ step unchanged      }
  GSL_ODEIV_HADJ_NIL = 0;  
{ step decreased      }
  GSL_ODEIV_HADJ_DEC = -(1);  
{ General step size control methods.
 *
 * The hadjust() method controls the adjustment of
 * step size given the result of a step and the error.
 * Valid hadjust() methods must return one of the codes below.
 * errlevel function calculates the desired error level D0.
 *
 * The general data can be used by specializations
 * to store state and control their heuristics.
  }
(* Const before type ignored *)

function gsl_odeiv2_control_alloc(T:Pgsl_odeiv2_control_type):Pgsl_odeiv2_control;cdecl;external;
function gsl_odeiv2_control_init(c:Pgsl_odeiv2_control; eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):longint;cdecl;external;
procedure gsl_odeiv2_control_free(c:Pgsl_odeiv2_control);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_control_hadjust(c:Pgsl_odeiv2_control; s:Pgsl_odeiv2_step; y:Pdouble; yerr:Pdouble; dydt:Pdouble; 
           h:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_control_name(c:Pgsl_odeiv2_control):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_control_errlevel(c:Pgsl_odeiv2_control; y:Tdouble; dydt:Tdouble; h:Tdouble; ind:Tsize_t; 
           errlev:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_control_set_driver(c:Pgsl_odeiv2_control; d:Pgsl_odeiv2_driver):longint;cdecl;external;
{ Available control object constructors.
 *
 * The standard control object is a four parameter heuristic
 * defined as follows:
 *    D0 = eps_abs + eps_rel * (a_y |y| + a_dydt h |y'|)
 *    D1 = |yerr|
 *    q  = consistency order of method (q=4 for 4(5) embedded RK)
 *    S  = safety factor (0.9 say)
 *
 *                      /  (D0/D1)^(1/(q+1))  D0 >= D1
 *    h_NEW = S h_OLD * |
 *                      \  (D0/D1)^(1/q)      D0 < D1
 *
 * This encompasses all the standard error scaling methods.
 *
 * The y method is the standard method with a_y=1, a_dydt=0.
 * The yp method is the standard method with a_y=0, a_dydt=1.
  }
function gsl_odeiv2_control_standard_new(eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):Pgsl_odeiv2_control;cdecl;external;
function gsl_odeiv2_control_y_new(eps_abs:Tdouble; eps_rel:Tdouble):Pgsl_odeiv2_control;cdecl;external;
function gsl_odeiv2_control_yp_new(eps_abs:Tdouble; eps_rel:Tdouble):Pgsl_odeiv2_control;cdecl;external;
{ This controller computes errors using different absolute errors for
 * each component
 *
 *    D0 = eps_abs * scale_abs[i] + eps_rel * (a_y |y| + a_dydt h |y'|)
  }
(* Const before type ignored *)
function gsl_odeiv2_control_scaled_new(eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble; scale_abs:Pdouble; 
           dim:Tsize_t):Pgsl_odeiv2_control;cdecl;external;
{ Evolution object  }
(* Const before type ignored *)
type
  Pgsl_odeiv2_evolve_struct = ^Tgsl_odeiv2_evolve_struct;
  Tgsl_odeiv2_evolve_struct = record
      dimension : Tsize_t;
      y0 : Pdouble;
      yerr : Pdouble;
      dydt_in : Pdouble;
      dydt_out : Pdouble;
      last_step : Tdouble;
      count : dword;
      failed_steps : dword;
      driver : Pgsl_odeiv2_driver;
    end;

{ Evolution object methods  }

function gsl_odeiv2_evolve_alloc(dim:Tsize_t):Pgsl_odeiv2_evolve;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_evolve_apply(e:Pgsl_odeiv2_evolve; con:Pgsl_odeiv2_control; step:Pgsl_odeiv2_step; dydt:Pgsl_odeiv2_system; t:Pdouble; 
           t1:Tdouble; h:Pdouble; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_evolve_apply_fixed_step(e:Pgsl_odeiv2_evolve; con:Pgsl_odeiv2_control; step:Pgsl_odeiv2_step; dydt:Pgsl_odeiv2_system; t:Pdouble; 
           h0:Tdouble; y:Pdouble):longint;cdecl;external;
function gsl_odeiv2_evolve_reset(e:Pgsl_odeiv2_evolve):longint;cdecl;external;
procedure gsl_odeiv2_evolve_free(e:Pgsl_odeiv2_evolve);cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_evolve_set_driver(e:Pgsl_odeiv2_evolve; d:Pgsl_odeiv2_driver):longint;cdecl;external;
{ Driver object
 *
 * This is a high level wrapper for step, control and
 * evolve objects. 
  }
(* Const before type ignored *)
{ ODE system  }
{ stepper object  }
{ control object  }
{ evolve object  }
{ step size  }
{ minimum step size allowed  }
{ maximum step size allowed  }
{ number of steps taken  }
{ Maximum number of steps allowed  }
type
  Pgsl_odeiv2_driver_struct = ^Tgsl_odeiv2_driver_struct;
  Tgsl_odeiv2_driver_struct = record
      sys : Pgsl_odeiv2_system;
      s : Pgsl_odeiv2_step;
      c : Pgsl_odeiv2_control;
      e : Pgsl_odeiv2_evolve;
      h : Tdouble;
      hmin : Tdouble;
      hmax : Tdouble;
      n : dword;
      nmax : dword;
    end;

{ Driver object methods  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_odeiv2_driver_alloc_y_new(sys:Pgsl_odeiv2_system; T:Pgsl_odeiv2_step_type; hstart:Tdouble; epsabs:Tdouble; epsrel:Tdouble):Pgsl_odeiv2_driver;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_driver_alloc_yp_new(sys:Pgsl_odeiv2_system; T:Pgsl_odeiv2_step_type; hstart:Tdouble; epsabs:Tdouble; epsrel:Tdouble):Pgsl_odeiv2_driver;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_driver_alloc_scaled_new(sys:Pgsl_odeiv2_system; T:Pgsl_odeiv2_step_type; hstart:Tdouble; epsabs:Tdouble; epsrel:Tdouble; 
           a_y:Tdouble; a_dydt:Tdouble; scale_abs:Pdouble):Pgsl_odeiv2_driver;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_driver_alloc_standard_new(sys:Pgsl_odeiv2_system; T:Pgsl_odeiv2_step_type; hstart:Tdouble; epsabs:Tdouble; epsrel:Tdouble; 
           a_y:Tdouble; a_dydt:Tdouble):Pgsl_odeiv2_driver;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_driver_set_hmin(d:Pgsl_odeiv2_driver; hmin:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_driver_set_hmax(d:Pgsl_odeiv2_driver; hmax:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_driver_set_nmax(d:Pgsl_odeiv2_driver; nmax:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_driver_apply(d:Pgsl_odeiv2_driver; t:Pdouble; t1:Tdouble; y:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv2_driver_apply_fixed_step(d:Pgsl_odeiv2_driver; t:Pdouble; h:Tdouble; n:dword; y:Pdouble):longint;cdecl;external;
function gsl_odeiv2_driver_reset(d:Pgsl_odeiv2_driver):longint;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv2_driver_reset_hstart(d:Pgsl_odeiv2_driver; hstart:Tdouble):longint;cdecl;external;
procedure gsl_odeiv2_driver_free(state:Pgsl_odeiv2_driver);cdecl;external;
{$endif}
{ __GSL_ODEIV2_H__  }

implementation


end.
