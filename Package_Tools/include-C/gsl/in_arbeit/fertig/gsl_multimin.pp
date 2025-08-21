
unit gsl_multimin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multimin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multimin.h
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
Pgsl_multimin_fdfminimizer  = ^gsl_multimin_fdfminimizer;
Pgsl_multimin_fdfminimizer_type  = ^gsl_multimin_fdfminimizer_type;
Pgsl_multimin_fminimizer  = ^gsl_multimin_fminimizer;
Pgsl_multimin_fminimizer_type  = ^gsl_multimin_fminimizer_type;
Pgsl_multimin_function  = ^gsl_multimin_function;
Pgsl_multimin_function_fdf  = ^gsl_multimin_function_fdf;
Pgsl_multimin_function_fdf_struct  = ^gsl_multimin_function_fdf_struct;
Pgsl_multimin_function_struct  = ^gsl_multimin_function_struct;
Pgsl_vector  = ^gsl_vector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multimin/gsl_multimin.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Fabrice Rossi
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
{ Modified by Tuomo Keskitalo to include fminimizer and 
   Nelder Mead related lines  }
{$ifndef __GSL_MULTIMIN_H__}
{$define __GSL_MULTIMIN_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_min.h>}
{ Definition of an arbitrary real-valued function with gsl_vector input and  }
{ parameters  }
(* Const before type ignored *)
type
  Pgsl_multimin_function_struct = ^Tgsl_multimin_function_struct;
  Tgsl_multimin_function_struct = record
      f : function (x:Pgsl_vector; params:pointer):Tdouble;cdecl;
      n : Tsize_t;
      params : pointer;
    end;

  Tgsl_multimin_function_struct = Tgsl_multimin_function;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MULTIMIN_FN_EVAL(F,x : longint) : longint;

{ Definition of an arbitrary differentiable real-valued function  }
{ with gsl_vector input and parameters  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_multimin_function_fdf_struct = ^Tgsl_multimin_function_fdf_struct;
  Tgsl_multimin_function_fdf_struct = record
      f : function (x:Pgsl_vector; params:pointer):Tdouble;cdecl;
      df : procedure (x:Pgsl_vector; params:pointer; df:Pgsl_vector);cdecl;
      fdf : procedure (x:Pgsl_vector; params:pointer; f:Pdouble; df:Pgsl_vector);cdecl;
      n : Tsize_t;
      params : pointer;
    end;

  Tgsl_multimin_function_fdf_struct = Tgsl_multimin_function_fdf;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MULTIMIN_FN_EVAL_F(F,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL_DF(F,x,g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL_F_DF(F,x,y,g : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multimin_diff(f:Pgsl_multimin_function; x:Pgsl_vector; g:Pgsl_vector):longint;cdecl;external;
{ minimization of non-differentiable functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_multimin_fminimizer_type = ^Tgsl_multimin_fminimizer_type;
  Tgsl_multimin_fminimizer_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t):longint;cdecl;
      set : function (state:pointer; f:Pgsl_multimin_function; x:Pgsl_vector; size:Pdouble; step_size:Pgsl_vector):longint;cdecl;
      iterate : function (state:pointer; f:Pgsl_multimin_function; x:Pgsl_vector; size:Pdouble; fval:Pdouble):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
{ multi dimensional part  }
(* Const before type ignored *)

  Pgsl_multimin_fminimizer = ^Tgsl_multimin_fminimizer;
  Tgsl_multimin_fminimizer = record
      _type : Pgsl_multimin_fminimizer_type;
      f : Pgsl_multimin_function;
      fval : Tdouble;
      x : Pgsl_vector;
      size : Tdouble;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multimin_fminimizer_alloc(T:Pgsl_multimin_fminimizer_type; n:Tsize_t):Pgsl_multimin_fminimizer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multimin_fminimizer_set(s:Pgsl_multimin_fminimizer; f:Pgsl_multimin_function; x:Pgsl_vector; step_size:Pgsl_vector):longint;cdecl;external;
procedure gsl_multimin_fminimizer_free(s:Pgsl_multimin_fminimizer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multimin_fminimizer_name(s:Pgsl_multimin_fminimizer):Pchar;cdecl;external;
function gsl_multimin_fminimizer_iterate(s:Pgsl_multimin_fminimizer):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fminimizer_x(s:Pgsl_multimin_fminimizer):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fminimizer_minimum(s:Pgsl_multimin_fminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fminimizer_size(s:Pgsl_multimin_fminimizer):Tdouble;cdecl;external;
{ Convergence test functions  }
(* Const before type ignored *)
function gsl_multimin_test_gradient(g:Pgsl_vector; epsabs:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_test_size(size:Tdouble; epsabs:Tdouble):longint;cdecl;external;
{ minimisation of differentiable functions  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_multimin_fdfminimizer_type = ^Tgsl_multimin_fdfminimizer_type;
  Tgsl_multimin_fdfminimizer_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t):longint;cdecl;
      set : function (state:pointer; fdf:Pgsl_multimin_function_fdf; x:Pgsl_vector; f:Pdouble; gradient:Pgsl_vector; 
                   step_size:Tdouble; tol:Tdouble):longint;cdecl;
      iterate : function (state:pointer; fdf:Pgsl_multimin_function_fdf; x:Pgsl_vector; f:Pdouble; gradient:Pgsl_vector; 
                   dx:Pgsl_vector):longint;cdecl;
      restart : function (state:pointer):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
{ multi dimensional part  }
(* Const before type ignored *)

  Pgsl_multimin_fdfminimizer = ^Tgsl_multimin_fdfminimizer;
  Tgsl_multimin_fdfminimizer = record
      _type : Pgsl_multimin_fdfminimizer_type;
      fdf : Pgsl_multimin_function_fdf;
      f : Tdouble;
      x : Pgsl_vector;
      gradient : Pgsl_vector;
      dx : Pgsl_vector;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multimin_fdfminimizer_alloc(T:Pgsl_multimin_fdfminimizer_type; n:Tsize_t):Pgsl_multimin_fdfminimizer;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_set(s:Pgsl_multimin_fdfminimizer; fdf:Pgsl_multimin_function_fdf; x:Pgsl_vector; step_size:Tdouble; tol:Tdouble):longint;cdecl;external;
procedure gsl_multimin_fdfminimizer_free(s:Pgsl_multimin_fdfminimizer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_name(s:Pgsl_multimin_fdfminimizer):Pchar;cdecl;external;
function gsl_multimin_fdfminimizer_iterate(s:Pgsl_multimin_fdfminimizer):longint;cdecl;external;
function gsl_multimin_fdfminimizer_restart(s:Pgsl_multimin_fdfminimizer):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_x(s:Pgsl_multimin_fdfminimizer):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_dx(s:Pgsl_multimin_fdfminimizer):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_gradient(s:Pgsl_multimin_fdfminimizer):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multimin_fdfminimizer_minimum(s:Pgsl_multimin_fdfminimizer):Tdouble;cdecl;external;
(* Const before type ignored *)
  var
    gsl_multimin_fdfminimizer_steepest_descent : Pgsl_multimin_fdfminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fdfminimizer_conjugate_pr : Pgsl_multimin_fdfminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fdfminimizer_conjugate_fr : Pgsl_multimin_fdfminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fdfminimizer_vector_bfgs : Pgsl_multimin_fdfminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fdfminimizer_vector_bfgs2 : Pgsl_multimin_fdfminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fminimizer_nmsimplex : Pgsl_multimin_fminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fminimizer_nmsimplex2 : Pgsl_multimin_fminimizer_type;cvar;external;
(* Const before type ignored *)
    gsl_multimin_fminimizer_nmsimplex2rand : Pgsl_multimin_fminimizer_type;cvar;external;
{$endif}
{ __GSL_MULTIMIN_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL(F,x : longint) : longint;
begin
  GSL_MULTIMIN_FN_EVAL:=F^.f(xF^.params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL_F(F,x : longint) : longint;
begin
  GSL_MULTIMIN_FN_EVAL_F:=F^.f(xF^.params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL_DF(F,x,g : longint) : longint;
begin
  GSL_MULTIMIN_FN_EVAL_DF:=F^.df(xF^.paramsg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIMIN_FN_EVAL_F_DF(F,x,y,g : longint) : longint;
begin
  GSL_MULTIMIN_FN_EVAL_F_DF:=F^.fdf(xF^.paramsyg);
end;


end.
