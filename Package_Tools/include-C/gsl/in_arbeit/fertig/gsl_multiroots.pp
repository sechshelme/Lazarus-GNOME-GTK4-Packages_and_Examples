
unit gsl_multiroots;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multiroots.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multiroots.h
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
Pgsl_matrix  = ^gsl_matrix;
Pgsl_multiroot_fdfsolver  = ^gsl_multiroot_fdfsolver;
Pgsl_multiroot_fdfsolver_type  = ^gsl_multiroot_fdfsolver_type;
Pgsl_multiroot_fsolver  = ^gsl_multiroot_fsolver;
Pgsl_multiroot_fsolver_type  = ^gsl_multiroot_fsolver_type;
Pgsl_multiroot_function  = ^gsl_multiroot_function;
Pgsl_multiroot_function_fdf  = ^gsl_multiroot_function_fdf;
Pgsl_multiroot_function_fdf_struct  = ^gsl_multiroot_function_fdf_struct;
Pgsl_multiroot_function_struct  = ^gsl_multiroot_function_struct;
Pgsl_vector  = ^gsl_vector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multiroots/gsl_multiroots.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Brian Gough
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
{$ifndef __GSL_MULTIROOTS_H__}
{$define __GSL_MULTIROOTS_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{ Definition of vector-valued functions with parameters based on gsl_vector  }
(* Const before type ignored *)
type
  Pgsl_multiroot_function_struct = ^Tgsl_multiroot_function_struct;
  Tgsl_multiroot_function_struct = record
      f : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector):longint;cdecl;
      n : Tsize_t;
      params : pointer;
    end;

  Tgsl_multiroot_function_struct = Tgsl_multiroot_function;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MULTIROOT_FN_EVAL(F,x,y : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiroot_fdjacobian(F:Pgsl_multiroot_function; x:Pgsl_vector; f:Pgsl_vector; epsrel:Tdouble; jacobian:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
type
  Pgsl_multiroot_fsolver_type = ^Tgsl_multiroot_fsolver_type;
  Tgsl_multiroot_fsolver_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t):longint;cdecl;
      set : function (state:pointer; _function:Pgsl_multiroot_function; x:Pgsl_vector; f:Pgsl_vector; dx:Pgsl_vector):longint;cdecl;
      iterate : function (state:pointer; _function:Pgsl_multiroot_function; x:Pgsl_vector; f:Pgsl_vector; dx:Pgsl_vector):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_multiroot_fsolver = ^Tgsl_multiroot_fsolver;
  Tgsl_multiroot_fsolver = record
      _type : Pgsl_multiroot_fsolver_type;
      _function : Pgsl_multiroot_function;
      x : Pgsl_vector;
      f : Pgsl_vector;
      dx : Pgsl_vector;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multiroot_fsolver_alloc(T:Pgsl_multiroot_fsolver_type; n:Tsize_t):Pgsl_multiroot_fsolver;cdecl;external;
procedure gsl_multiroot_fsolver_free(s:Pgsl_multiroot_fsolver);cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fsolver_set(s:Pgsl_multiroot_fsolver; f:Pgsl_multiroot_function; x:Pgsl_vector):longint;cdecl;external;
function gsl_multiroot_fsolver_iterate(s:Pgsl_multiroot_fsolver):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiroot_fsolver_name(s:Pgsl_multiroot_fsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fsolver_root(s:Pgsl_multiroot_fsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fsolver_dx(s:Pgsl_multiroot_fsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fsolver_f(s:Pgsl_multiroot_fsolver):Pgsl_vector;cdecl;external;
{ Definition of vector-valued functions and gradient with parameters
   based on gsl_vector  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_multiroot_function_fdf_struct = ^Tgsl_multiroot_function_fdf_struct;
  Tgsl_multiroot_function_fdf_struct = record
      f : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector):longint;cdecl;
      df : function (x:Pgsl_vector; params:pointer; df:Pgsl_matrix):longint;cdecl;
      fdf : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector; df:Pgsl_matrix):longint;cdecl;
      n : Tsize_t;
      params : pointer;
    end;

  Tgsl_multiroot_function_fdf_struct = Tgsl_multiroot_function_fdf;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MULTIROOT_FN_EVAL_F(F,x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL_DF(F,x,dy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL_F_DF(F,x,y,dy : longint) : longint;

(* Const before type ignored *)
type
  Pgsl_multiroot_fdfsolver_type = ^Tgsl_multiroot_fdfsolver_type;
  Tgsl_multiroot_fdfsolver_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t):longint;cdecl;
      set : function (state:pointer; fdf:Pgsl_multiroot_function_fdf; x:Pgsl_vector; f:Pgsl_vector; J:Pgsl_matrix; 
                   dx:Pgsl_vector):longint;cdecl;
      iterate : function (state:pointer; fdf:Pgsl_multiroot_function_fdf; x:Pgsl_vector; f:Pgsl_vector; J:Pgsl_matrix; 
                   dx:Pgsl_vector):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_multiroot_fdfsolver = ^Tgsl_multiroot_fdfsolver;
  Tgsl_multiroot_fdfsolver = record
      _type : Pgsl_multiroot_fdfsolver_type;
      fdf : Pgsl_multiroot_function_fdf;
      x : Pgsl_vector;
      f : Pgsl_vector;
      J : Pgsl_matrix;
      dx : Pgsl_vector;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multiroot_fdfsolver_alloc(T:Pgsl_multiroot_fdfsolver_type; n:Tsize_t):Pgsl_multiroot_fdfsolver;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fdfsolver_set(s:Pgsl_multiroot_fdfsolver; fdf:Pgsl_multiroot_function_fdf; x:Pgsl_vector):longint;cdecl;external;
function gsl_multiroot_fdfsolver_iterate(s:Pgsl_multiroot_fdfsolver):longint;cdecl;external;
procedure gsl_multiroot_fdfsolver_free(s:Pgsl_multiroot_fdfsolver);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiroot_fdfsolver_name(s:Pgsl_multiroot_fdfsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fdfsolver_root(s:Pgsl_multiroot_fdfsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fdfsolver_dx(s:Pgsl_multiroot_fdfsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_fdfsolver_f(s:Pgsl_multiroot_fdfsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiroot_test_delta(dx:Pgsl_vector; x:Pgsl_vector; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multiroot_test_residual(f:Pgsl_vector; epsabs:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
  var
    gsl_multiroot_fsolver_dnewton : Pgsl_multiroot_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fsolver_broyden : Pgsl_multiroot_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fsolver_hybrid : Pgsl_multiroot_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fsolver_hybrids : Pgsl_multiroot_fsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fdfsolver_newton : Pgsl_multiroot_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fdfsolver_gnewton : Pgsl_multiroot_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fdfsolver_hybridj : Pgsl_multiroot_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multiroot_fdfsolver_hybridsj : Pgsl_multiroot_fdfsolver_type;cvar;external;
{$endif}
{ __GSL_MULTIROOTS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL(F,x,y : longint) : longint;
begin
  GSL_MULTIROOT_FN_EVAL:=F^.f(xF^.paramsy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL_F(F,x,y : longint) : longint;
begin
  GSL_MULTIROOT_FN_EVAL_F:=F^.f(xF^.paramsy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL_DF(F,x,dy : longint) : longint;
begin
  GSL_MULTIROOT_FN_EVAL_DF:=F^.df(xF^.paramsdy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MULTIROOT_FN_EVAL_F_DF(F,x,y,dy : longint) : longint;
begin
  GSL_MULTIROOT_FN_EVAL_F_DF:=F^.fdf(xF^.paramsydy);
end;


end.
