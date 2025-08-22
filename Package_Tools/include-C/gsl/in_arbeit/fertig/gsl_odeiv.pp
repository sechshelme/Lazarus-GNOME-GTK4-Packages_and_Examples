
unit gsl_odeiv;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_odeiv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_odeiv.h
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
Pgsl_odeiv_control  = ^gsl_odeiv_control;
Pgsl_odeiv_control_type  = ^gsl_odeiv_control_type;
Pgsl_odeiv_evolve  = ^gsl_odeiv_evolve;
Pgsl_odeiv_step  = ^gsl_odeiv_step;
Pgsl_odeiv_step_type  = ^gsl_odeiv_step_type;
Pgsl_odeiv_system  = ^gsl_odeiv_system;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ode-initval/gsl_odeiv.h
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
{ Author:  G. Jungman
  }
{$ifndef __GSL_ODEIV_H__}
{$define __GSL_ODEIV_H__}
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
  Pgsl_odeiv_system = ^Tgsl_odeiv_system;
  Tgsl_odeiv_system = record
      _function : function (t:Tdouble; y:Pdouble; dydt:Pdouble; params:pointer):longint;cdecl;
      jacobian : function (t:Tdouble; y:Pdouble; dfdy:Pdouble; dfdt:Pdouble; params:pointer):longint;cdecl;
      dimension : Tsize_t;
      params : pointer;
    end;
{ General stepper object.
 *
 * Opaque object for stepping an ODE system from t to t+h.
 * In general the object has some state which facilitates
 * iterating the stepping operation.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_odeiv_step_type = ^Tgsl_odeiv_step_type;
  Tgsl_odeiv_step_type = record
      name : Pchar;
      can_use_dydt_in : longint;
      gives_exact_dydt_out : longint;
      alloc : function (dim:Tsize_t):pointer;cdecl;
      apply : function (state:pointer; dim:Tsize_t; t:Tdouble; h:Tdouble; y:Pdouble; 
                   yerr:Pdouble; dydt_in:Pdouble; dydt_out:Pdouble; dydt:Pgsl_odeiv_system):longint;cdecl;
      reset : function (state:pointer; dim:Tsize_t):longint;cdecl;
      order : function (state:pointer):dword;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_odeiv_step = ^Tgsl_odeiv_step;
  Tgsl_odeiv_step = record
      _type : Pgsl_odeiv_step_type;
      dimension : Tsize_t;
      state : pointer;
    end;
{ Available stepper types.
 *
 * rk2    : embedded 2nd(3rd) Runge-Kutta
 * rk4    : 4th order (classical) Runge-Kutta
 * rkck   : embedded 4th(5th) Runge-Kutta, Cash-Karp
 * rk8pd  : embedded 8th(9th) Runge-Kutta, Prince-Dormand
 * rk2imp : implicit 2nd order Runge-Kutta at Gaussian points
 * rk4imp : implicit 4th order Runge-Kutta at Gaussian points
 * gear1  : M=1 implicit Gear method
 * gear2  : M=2 implicit Gear method
  }
(* Const before type ignored *)
  var
    gsl_odeiv_step_rk2 : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rk4 : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rkf45 : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rkck : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rk8pd : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rk2imp : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rk2simp : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_rk4imp : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_bsimp : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_gear1 : Pgsl_odeiv_step_type;cvar;external;
(* Const before type ignored *)
    gsl_odeiv_step_gear2 : Pgsl_odeiv_step_type;cvar;external;
{ Constructor for specialized stepper objects.
  }
(* Const before type ignored *)

function gsl_odeiv_step_alloc(T:Pgsl_odeiv_step_type; dim:Tsize_t):Pgsl_odeiv_step;cdecl;external;
function gsl_odeiv_step_reset(s:Pgsl_odeiv_step):longint;cdecl;external;
procedure gsl_odeiv_step_free(s:Pgsl_odeiv_step);cdecl;external;
{ General stepper object methods.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv_step_name(s:Pgsl_odeiv_step):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv_step_order(s:Pgsl_odeiv_step):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv_step_apply(s:Pgsl_odeiv_step; t:Tdouble; h:Tdouble; y:Pdouble; yerr:Pdouble; 
           dydt_in:Pdouble; dydt_out:Pdouble; dydt:Pgsl_odeiv_system):longint;cdecl;external;
{ General step size control object.
 *
 * The hadjust() method controls the adjustment of
 * step size given the result of a step and the error.
 * Valid hadjust() methods must return one of the codes below.
 *
 * The general data can be used by specializations
 * to store state and control their heuristics.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_odeiv_control_type = ^Tgsl_odeiv_control_type;
  Tgsl_odeiv_control_type = record
      name : Pchar;
      alloc : function :pointer;cdecl;
      init : function (state:pointer; eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):longint;cdecl;
      hadjust : function (state:pointer; dim:Tsize_t; ord:dword; y:Pdouble; yerr:Pdouble; 
                   yp:Pdouble; h:Pdouble):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_odeiv_control = ^Tgsl_odeiv_control;
  Tgsl_odeiv_control = record
      _type : Pgsl_odeiv_control_type;
      state : pointer;
    end;
{ Possible return values for an hadjust() evolution method.
  }
{ step was increased  }

const
  GSL_ODEIV_HADJ_INC = 1;  
{ step unchanged      }
  GSL_ODEIV_HADJ_NIL = 0;  
{ step decreased      }
  GSL_ODEIV_HADJ_DEC = -(1);  
(* Const before type ignored *)

function gsl_odeiv_control_alloc(T:Pgsl_odeiv_control_type):Pgsl_odeiv_control;cdecl;external;
function gsl_odeiv_control_init(c:Pgsl_odeiv_control; eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):longint;cdecl;external;
procedure gsl_odeiv_control_free(c:Pgsl_odeiv_control);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv_control_hadjust(c:Pgsl_odeiv_control; s:Pgsl_odeiv_step; y:Pdouble; yerr:Pdouble; dydt:Pdouble; 
           h:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_odeiv_control_name(c:Pgsl_odeiv_control):Pchar;cdecl;external;
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
function gsl_odeiv_control_standard_new(eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble):Pgsl_odeiv_control;cdecl;external;
function gsl_odeiv_control_y_new(eps_abs:Tdouble; eps_rel:Tdouble):Pgsl_odeiv_control;cdecl;external;
function gsl_odeiv_control_yp_new(eps_abs:Tdouble; eps_rel:Tdouble):Pgsl_odeiv_control;cdecl;external;
{ This controller computes errors using different absolute errors for
 * each component
 *
 *    D0 = eps_abs * scale_abs[i] + eps_rel * (a_y |y| + a_dydt h |y'|)
  }
(* Const before type ignored *)
function gsl_odeiv_control_scaled_new(eps_abs:Tdouble; eps_rel:Tdouble; a_y:Tdouble; a_dydt:Tdouble; scale_abs:Pdouble; 
           dim:Tsize_t):Pgsl_odeiv_control;cdecl;external;
{ General evolution object.
  }
type
  Pgsl_odeiv_evolve = ^Tgsl_odeiv_evolve;
  Tgsl_odeiv_evolve = record
      dimension : Tsize_t;
      y0 : Pdouble;
      yerr : Pdouble;
      dydt_in : Pdouble;
      dydt_out : Pdouble;
      last_step : Tdouble;
      count : dword;
      failed_steps : dword;
    end;
{ Evolution object methods.
  }

function gsl_odeiv_evolve_alloc(dim:Tsize_t):Pgsl_odeiv_evolve;cdecl;external;
(* Const before type ignored *)
function gsl_odeiv_evolve_apply(e:Pgsl_odeiv_evolve; con:Pgsl_odeiv_control; step:Pgsl_odeiv_step; dydt:Pgsl_odeiv_system; t:Pdouble; 
           t1:Tdouble; h:Pdouble; y:Pdouble):longint;cdecl;external;
function gsl_odeiv_evolve_reset(e:Pgsl_odeiv_evolve):longint;cdecl;external;
procedure gsl_odeiv_evolve_free(e:Pgsl_odeiv_evolve);cdecl;external;
{$endif}
{ __GSL_ODEIV_H__  }

implementation


end.
