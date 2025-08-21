
unit gsl_multifit_nlin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multifit_nlin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multifit_nlin.h
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
Pgsl_multifit_fdfridge  = ^gsl_multifit_fdfridge;
Pgsl_multifit_fdfsolver  = ^gsl_multifit_fdfsolver;
Pgsl_multifit_fdfsolver_type  = ^gsl_multifit_fdfsolver_type;
Pgsl_multifit_fsolver  = ^gsl_multifit_fsolver;
Pgsl_multifit_fsolver_type  = ^gsl_multifit_fsolver_type;
Pgsl_multifit_function  = ^gsl_multifit_function;
Pgsl_multifit_function_fdf  = ^gsl_multifit_function_fdf;
Pgsl_multifit_function_fdf_struct  = ^gsl_multifit_function_fdf_struct;
Pgsl_multifit_function_struct  = ^gsl_multifit_function_struct;
Pgsl_permutation  = ^gsl_permutation;
Pgsl_vector  = ^gsl_vector;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multifit_nlin/gsl_multifit_nlin.h
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
{$ifndef __GSL_MULTIFIT_NLIN_H__}
{$define __GSL_MULTIFIT_NLIN_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_permutation.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multifit_gradient(J:Pgsl_matrix; f:Pgsl_vector; g:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_covar(J:Pgsl_matrix; epsrel:Tdouble; covar:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_covar_QRPT(r:Pgsl_matrix; perm:Pgsl_permutation; epsrel:Tdouble; covar:Pgsl_matrix):longint;cdecl;external;
{ Definition of vector-valued functions with parameters based on gsl_vector  }
(* Const before type ignored *)
{ number of functions  }
{ number of independent variables  }
type
  Pgsl_multifit_function_struct = ^Tgsl_multifit_function_struct;
  Tgsl_multifit_function_struct = record
      f : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector):longint;cdecl;
      n : Tsize_t;
      p : Tsize_t;
      params : pointer;
    end;

  Tgsl_multifit_function_struct = Tgsl_multifit_function;
(* Const before type ignored *)

  Pgsl_multifit_fsolver_type = ^Tgsl_multifit_fsolver_type;
  Tgsl_multifit_fsolver_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t; p:Tsize_t):longint;cdecl;
      set : function (state:pointer; _function:Pgsl_multifit_function; x:Pgsl_vector; f:Pgsl_vector; dx:Pgsl_vector):longint;cdecl;
      iterate : function (state:pointer; _function:Pgsl_multifit_function; x:Pgsl_vector; f:Pgsl_vector; dx:Pgsl_vector):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_multifit_fsolver = ^Tgsl_multifit_fsolver;
  Tgsl_multifit_fsolver = record
      _type : Pgsl_multifit_fsolver_type;
      _function : Pgsl_multifit_function;
      x : Pgsl_vector;
      f : Pgsl_vector;
      dx : Pgsl_vector;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multifit_fsolver_alloc(T:Pgsl_multifit_fsolver_type; n:Tsize_t; p:Tsize_t):Pgsl_multifit_fsolver;cdecl;external;
procedure gsl_multifit_fsolver_free(s:Pgsl_multifit_fsolver);cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fsolver_set(s:Pgsl_multifit_fsolver; f:Pgsl_multifit_function; x:Pgsl_vector):longint;cdecl;external;
function gsl_multifit_fsolver_iterate(s:Pgsl_multifit_fsolver):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fsolver_driver(s:Pgsl_multifit_fsolver; maxiter:Tsize_t; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fsolver_name(s:Pgsl_multifit_fsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fsolver_position(s:Pgsl_multifit_fsolver):Pgsl_vector;cdecl;external;
{ Definition of vector-valued functions and gradient with parameters
   based on gsl_vector  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ number of functions  }
{ number of independent variables  }
{ user parameters  }
{ number of function evaluations  }
{ number of Jacobian evaluations  }
type
  Pgsl_multifit_function_fdf_struct = ^Tgsl_multifit_function_fdf_struct;
  Tgsl_multifit_function_fdf_struct = record
      f : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector):longint;cdecl;
      df : function (x:Pgsl_vector; params:pointer; df:Pgsl_matrix):longint;cdecl;
      fdf : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector; df:Pgsl_matrix):longint;cdecl;
      n : Tsize_t;
      p : Tsize_t;
      params : pointer;
      nevalf : Tsize_t;
      nevaldf : Tsize_t;
    end;

  Tgsl_multifit_function_fdf_struct = Tgsl_multifit_function_fdf;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_multifit_fdfsolver_type = ^Tgsl_multifit_fdfsolver_type;
  Tgsl_multifit_fdfsolver_type = record
      name : Pchar;
      size : Tsize_t;
      alloc : function (state:pointer; n:Tsize_t; p:Tsize_t):longint;cdecl;
      set : function (state:pointer; wts:Pgsl_vector; fdf:Pgsl_multifit_function_fdf; x:Pgsl_vector; f:Pgsl_vector; 
                   dx:Pgsl_vector):longint;cdecl;
      iterate : function (state:pointer; wts:Pgsl_vector; fdf:Pgsl_multifit_function_fdf; x:Pgsl_vector; f:Pgsl_vector; 
                   dx:Pgsl_vector):longint;cdecl;
      gradient : function (state:pointer; g:Pgsl_vector):longint;cdecl;
      jac : function (state:pointer; J:Pgsl_matrix):longint;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
(* Const before type ignored *)
{ parameter values x  }
{ residual vector f(x)  }
{ step dx  }
{ gradient J^T f  }
{ sqrt(wts)  }
{ number of iterations performed  }

  Pgsl_multifit_fdfsolver = ^Tgsl_multifit_fdfsolver;
  Tgsl_multifit_fdfsolver = record
      _type : Pgsl_multifit_fdfsolver_type;
      fdf : Pgsl_multifit_function_fdf;
      x : Pgsl_vector;
      f : Pgsl_vector;
      dx : Pgsl_vector;
      g : Pgsl_vector;
      sqrt_wts : Pgsl_vector;
      niter : Tsize_t;
      state : pointer;
    end;
(* Const before type ignored *)

function gsl_multifit_fdfsolver_alloc(T:Pgsl_multifit_fdfsolver_type; n:Tsize_t; p:Tsize_t):Pgsl_multifit_fdfsolver;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfsolver_set(s:Pgsl_multifit_fdfsolver; fdf:Pgsl_multifit_function_fdf; x:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfsolver_wset(s:Pgsl_multifit_fdfsolver; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; wts:Pgsl_vector):longint;cdecl;external;
function gsl_multifit_fdfsolver_iterate(s:Pgsl_multifit_fdfsolver):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfsolver_driver(s:Pgsl_multifit_fdfsolver; maxiter:Tsize_t; xtol:Tdouble; gtol:Tdouble; ftol:Tdouble; 
           info:Plongint):longint;cdecl;external;
function gsl_multifit_fdfsolver_jac(s:Pgsl_multifit_fdfsolver; J:Pgsl_matrix):longint;cdecl;external;
procedure gsl_multifit_fdfsolver_free(s:Pgsl_multifit_fdfsolver);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfsolver_name(s:Pgsl_multifit_fdfsolver):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfsolver_position(s:Pgsl_multifit_fdfsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfsolver_residual(s:Pgsl_multifit_fdfsolver):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfsolver_niter(s:Pgsl_multifit_fdfsolver):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_eval_wf(fdf:Pgsl_multifit_function_fdf; x:Pgsl_vector; wts:Pgsl_vector; y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_eval_wdf(fdf:Pgsl_multifit_function_fdf; x:Pgsl_vector; wts:Pgsl_vector; dy:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfsolver_test(s:Pgsl_multifit_fdfsolver; xtol:Tdouble; gtol:Tdouble; ftol:Tdouble; info:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_test_delta(dx:Pgsl_vector; x:Pgsl_vector; epsabs:Tdouble; epsrel:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_test_gradient(g:Pgsl_vector; epsabs:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfsolver_dif_df(x:Pgsl_vector; wts:Pgsl_vector; fdf:Pgsl_multifit_function_fdf; f:Pgsl_vector; J:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfsolver_dif_fdf(x:Pgsl_vector; fdf:Pgsl_multifit_function_fdf; f:Pgsl_vector; J:Pgsl_matrix):longint;cdecl;external;
{ number of (original) residuals  }
{ number of model parameters  }
{ damping parameter  }
(* Const before type ignored *)
{ diagonal damping matrix or NULL  }
(* Const before type ignored *)
{ general damping matrix or NULL  }
{ function values for finite diff J  }
{ weight vector for augmented system  }
{ user defined fdf  }
{ Tikhonov modified fdf  }
type
  Pgsl_multifit_fdfridge = ^Tgsl_multifit_fdfridge;
  Tgsl_multifit_fdfridge = record
      n : Tsize_t;
      p : Tsize_t;
      lambda : Tdouble;
      L_diag : Pgsl_vector;
      L : Pgsl_matrix;
      f : Pgsl_vector;
      wts : Pgsl_vector;
      s : Pgsl_multifit_fdfsolver;
      fdf : Pgsl_multifit_function_fdf;
      fdftik : Tgsl_multifit_function_fdf;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multifit_fdfridge_alloc(T:Pgsl_multifit_fdfsolver_type; n:Tsize_t; p:Tsize_t):Pgsl_multifit_fdfridge;cdecl;external;
procedure gsl_multifit_fdfridge_free(work:Pgsl_multifit_fdfridge);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_name(w:Pgsl_multifit_fdfridge):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfridge_position(w:Pgsl_multifit_fdfridge):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfridge_residual(w:Pgsl_multifit_fdfridge):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_fdfridge_niter(w:Pgsl_multifit_fdfridge):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_set(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; lambda:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_wset(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; lambda:Tdouble; wts:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_set2(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; lambda:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_wset2(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; lambda:Pgsl_vector; wts:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_set3(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; L:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_wset3(w:Pgsl_multifit_fdfridge; f:Pgsl_multifit_function_fdf; x:Pgsl_vector; L:Pgsl_matrix; wts:Pgsl_vector):longint;cdecl;external;
function gsl_multifit_fdfridge_iterate(w:Pgsl_multifit_fdfridge):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_fdfridge_driver(w:Pgsl_multifit_fdfridge; maxiter:Tsize_t; xtol:Tdouble; gtol:Tdouble; ftol:Tdouble; 
           info:Plongint):longint;cdecl;external;
{ extern const gsl_multifit_fsolver_type * gsl_multifit_fsolver_gradient;  }
(* Const before type ignored *)
  var
    gsl_multifit_fdfsolver_lmsder : Pgsl_multifit_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_fdfsolver_lmder : Pgsl_multifit_fdfsolver_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_fdfsolver_lmniel : Pgsl_multifit_fdfsolver_type;cvar;external;
{$endif}
{ __GSL_MULTIFIT_NLIN_H__  }

implementation


end.
