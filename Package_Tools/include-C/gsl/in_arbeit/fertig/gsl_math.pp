
unit gsl_math;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_math.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_math.h
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
Pgsl_function_fdf_struct  = ^gsl_function_fdf_struct;
Pgsl_function_struct  = ^gsl_function_struct;
Pgsl_function_vec_struct  = ^gsl_function_vec_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_math.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_MATH_H__}
{$define __GSL_MATH_H__}
{$include <math.h>}
{$include <gsl/gsl_sys.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_machine.h>}
{$include <gsl/gsl_precision.h>}
{$include <gsl/gsl_nan.h>}
{$include <gsl/gsl_pow_int.h>}
{$include <gsl/gsl_minmax.h>}
{$ifndef M_E}
{ e  }

const
  M_E = 2.71828182845904523536028747135;  
{$endif}
{$ifndef M_LOG2E}
{ log_2 (e)  }

const
  M_LOG2E = 1.44269504088896340735992468100;  
{$endif}
{$ifndef M_LOG10E}
{ log_10 (e)  }

const
  M_LOG10E = 0.43429448190325182765112891892;  
{$endif}
{$ifndef M_SQRT2}
{ sqrt(2)  }

const
  M_SQRT2 = 1.41421356237309504880168872421;  
{$endif}
{$ifndef M_SQRT1_2}
{ sqrt(1/2)  }

const
  M_SQRT1_2 = 0.70710678118654752440084436210;  
{$endif}
{$ifndef M_SQRT3}
{ sqrt(3)  }

const
  M_SQRT3 = 1.73205080756887729352744634151;  
{$endif}
{$ifndef M_PI}
{ pi  }

const
  M_PI = 3.14159265358979323846264338328;  
{$endif}
{$ifndef M_PI_2}
{ pi/2  }

const
  M_PI_2 = 1.57079632679489661923132169164;  
{$endif}
{$ifndef M_PI_4}
{ pi/4  }

const
  M_PI_4 = 0.78539816339744830961566084582;  
{$endif}
{$ifndef M_SQRTPI}
{ sqrt(pi)  }

const
  M_SQRTPI = 1.77245385090551602729816748334;  
{$endif}
{$ifndef M_2_SQRTPI}
{ 2/sqrt(pi)  }

const
  M_2_SQRTPI = 1.12837916709551257389615890312;  
{$endif}
{$ifndef M_1_PI}
{ 1/pi  }

const
  M_1_PI = 0.31830988618379067153776752675;  
{$endif}
{$ifndef M_2_PI}
{ 2/pi  }

const
  M_2_PI = 0.63661977236758134307553505349;  
{$endif}
{$ifndef M_LN10}
{ ln(10)  }

const
  M_LN10 = 2.30258509299404568401799145468;  
{$endif}
{$ifndef M_LN2}
{ ln(2)  }

const
  M_LN2 = 0.69314718055994530941723212146;  
{$endif}
{$ifndef M_LNPI}
{ ln(pi)  }

const
  M_LNPI = 1.14472988584940017414342735135;  
{$endif}
{$ifndef M_EULER}
{ Euler constant  }

const
  M_EULER = 0.57721566490153286060651209008;  
{$endif}
{ other needlessly compulsive abstractions  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GSL_IS_ODD(n : longint) : Tn;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_IS_EVEN(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SIGN(x : longint) : longint;

{ Return nonzero if x is a real number, i.e. non NaN or infinite.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_IS_REAL(x : longint) : longint;

{ Definition of an arbitrary function with parameters  }
type
  Pgsl_function_struct = ^Tgsl_function_struct;
  Tgsl_function_struct = record
      _function : function (x:Tdouble; params:pointer):Tdouble;cdecl;
      params : pointer;
    end;

  Tgsl_function_struct = Tgsl_function;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_FN_EVAL(F,x : longint) : longint;

{ Definition of an arbitrary function returning two values, r1, r2  }
type
  Pgsl_function_fdf_struct = ^Tgsl_function_fdf_struct;
  Tgsl_function_fdf_struct = record
      f : function (x:Tdouble; params:pointer):Tdouble;cdecl;
      df : function (x:Tdouble; params:pointer):Tdouble;cdecl;
      fdf : procedure (x:Tdouble; params:pointer; f:Pdouble; df:Pdouble);cdecl;
      params : pointer;
    end;

  Tgsl_function_fdf_struct = Tgsl_function_fdf;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_FN_FDF_EVAL_F(FDF,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_FDF_EVAL_DF(FDF,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_FDF_EVAL_F_DF(FDF,x,y,dy : longint) : longint;

{ Definition of an arbitrary vector-valued function with parameters  }
type
  Pgsl_function_vec_struct = ^Tgsl_function_vec_struct;
  Tgsl_function_vec_struct = record
      _function : function (x:Tdouble; y:Pdouble; params:pointer):longint;cdecl;
      params : pointer;
    end;

  Tgsl_function_vec_struct = Tgsl_function_vec;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_FN_VEC_EVAL(F,x,y : longint) : longint;

{$endif}
{ __GSL_MATH_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSL_IS_ODD(n : longint) : Tn;
begin
  GSL_IS_ODD:=Tn(@(1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_IS_EVEN(n : longint) : longint;
begin
  GSL_IS_EVEN:= not (GSL_IS_ODD(n));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_SIGN(x : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0.0 then
    if_local1:=1
  else
    if_local1:=-(1);
  GSL_SIGN:=x>=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_IS_REAL(x : longint) : longint;
begin
  GSL_IS_REAL:=gsl_finite(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_EVAL(F,x : longint) : longint;
begin
  GSL_FN_EVAL:=F^._function(xF^.params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_FDF_EVAL_F(FDF,x : longint) : longint;
begin
  GSL_FN_FDF_EVAL_F:=FDF^.f(xFDF^.params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_FDF_EVAL_DF(FDF,x : longint) : longint;
begin
  GSL_FN_FDF_EVAL_DF:=FDF^.df(xFDF^.params);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_FDF_EVAL_F_DF(FDF,x,y,dy : longint) : longint;
begin
  GSL_FN_FDF_EVAL_F_DF:=FDF^.fdf(xFDF^.paramsydy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_FN_VEC_EVAL(F,x,y : longint) : longint;
begin
  GSL_FN_VEC_EVAL:=F^._function(xyF^.params);
end;


end.
