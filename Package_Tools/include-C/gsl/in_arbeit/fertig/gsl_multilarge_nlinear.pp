
unit gsl_multilarge_nlinear;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multilarge_nlinear.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multilarge_nlinear.h
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
Pgsl_matrix  = ^gsl_matrix;
Pgsl_multilarge_nlinear_fdf  = ^gsl_multilarge_nlinear_fdf;
Pgsl_multilarge_nlinear_fdtype  = ^gsl_multilarge_nlinear_fdtype;
Pgsl_multilarge_nlinear_parameters  = ^gsl_multilarge_nlinear_parameters;
Pgsl_multilarge_nlinear_scale  = ^gsl_multilarge_nlinear_scale;
Pgsl_multilarge_nlinear_solver  = ^gsl_multilarge_nlinear_solver;
Pgsl_multilarge_nlinear_trs  = ^gsl_multilarge_nlinear_trs;
Pgsl_multilarge_nlinear_trust_state  = ^gsl_multilarge_nlinear_trust_state;
Pgsl_multilarge_nlinear_type  = ^gsl_multilarge_nlinear_type;
Pgsl_multilarge_nlinear_workspace  = ^gsl_multilarge_nlinear_workspace;
Pgsl_vector  = ^gsl_vector;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multilarge_nlinear/gsl_multilarge_nlinear.h
 * 
 * Copyright (C) 2015, 2016 Patrick Alken
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
{$ifndef __GSL_MULTILARGE_NLINEAR_H__}
{$define __GSL_MULTILARGE_NLINEAR_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_permutation.h>}
{$include <gsl/gsl_blas.h>}
type
  Pgsl_multilarge_nlinear_fdtype = ^Tgsl_multilarge_nlinear_fdtype;
  Tgsl_multilarge_nlinear_fdtype =  Longint;
  Const
    GSL_MULTILARGE_NLINEAR_FWDIFF = 0;
    GSL_MULTILARGE_NLINEAR_CTRDIFF = 1;
;
{ Definition of vector-valued functions and gradient with parameters
   based on gsl_vector  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ number of functions  }
{ number of independent variables  }
{ user parameters  }
{ number of function evaluations  }
{ number of Jacobian matrix-vector evaluations  }
{ number of Jacobian J^T J evaluations  }
{ number of fvv evaluations  }
type
  Pgsl_multilarge_nlinear_fdf = ^Tgsl_multilarge_nlinear_fdf;
  Tgsl_multilarge_nlinear_fdf = record
      f : function (x:Pgsl_vector; params:pointer; f:Pgsl_vector):longint;cdecl;
      df : function (TransJ:TCBLAS_TRANSPOSE_t; x:Pgsl_vector; u:Pgsl_vector; params:pointer; v:Pgsl_vector; 
                   JTJ:Pgsl_matrix):longint;cdecl;
      fvv : function (x:Pgsl_vector; v:Pgsl_vector; params:pointer; fvv:Pgsl_vector):longint;cdecl;
      n : Tsize_t;
      p : Tsize_t;
      params : pointer;
      nevalf : Tsize_t;
      nevaldfu : Tsize_t;
      nevaldf2 : Tsize_t;
      nevalfvv : Tsize_t;
    end;
{ trust region subproblem method  }
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

  Pgsl_multilarge_nlinear_trs = ^Tgsl_multilarge_nlinear_trs;
  Tgsl_multilarge_nlinear_trs = record
      name : Pchar;
      alloc : function (params:pointer; n:Tsize_t; p:Tsize_t):pointer;cdecl;
      init : function (vtrust_state:pointer; vstate:pointer):longint;cdecl;
      preloop : function (vtrust_state:pointer; vstate:pointer):longint;cdecl;
      step : function (vtrust_state:pointer; delta:Tdouble; dx:Pgsl_vector; vstate:pointer):longint;cdecl;
      preduction : function (vtrust_state:pointer; dx:Pgsl_vector; pred:Pdouble; vstate:pointer):longint;cdecl;
      free : procedure (vstate:pointer);cdecl;
    end;
{ scaling matrix specification  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_multilarge_nlinear_scale = ^Tgsl_multilarge_nlinear_scale;
  Tgsl_multilarge_nlinear_scale = record
      name : Pchar;
      init : function (JTJ:Pgsl_matrix; diag:Pgsl_vector):longint;cdecl;
      update : function (JTJ:Pgsl_matrix; diag:Pgsl_vector):longint;cdecl;
    end;
{
 * linear least squares solvers - there are three steps to
 * solving a least squares problem using a direct method:
 *
 * 1. init: called once per iteration when a new Jacobian matrix
 *          is required; form normal equations matrix J^T J
 * 2. presolve: called each time a new LM parameter value mu is available;
 *              used for cholesky method in order to factor
 *              the (J^T J + mu D^T D) matrix
 * 3. solve: solve the least square system for a given rhs
  }
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

  Pgsl_multilarge_nlinear_solver = ^Tgsl_multilarge_nlinear_solver;
  Tgsl_multilarge_nlinear_solver = record
      name : Pchar;
      alloc : function (n:Tsize_t; p:Tsize_t):pointer;cdecl;
      init : function (vtrust_state:pointer; vstate:pointer):longint;cdecl;
      presolve : function (mu:Tdouble; vtrust_state:pointer; vstate:pointer):longint;cdecl;
      solve : function (g:Pgsl_vector; x:Pgsl_vector; vtrust_state:pointer; vstate:pointer):longint;cdecl;
      rcond : function (rcond:Pdouble; JTJ:Pgsl_matrix; vstate:pointer):longint;cdecl;
      covar : function (JTJ:Pgsl_matrix; covar:Pgsl_matrix; vstate:pointer):longint;cdecl;
      free : procedure (vstate:pointer);cdecl;
    end;
{ tunable parameters  }
(* Const before type ignored *)
{ trust region subproblem method  }
(* Const before type ignored *)
{ scaling method  }
(* Const before type ignored *)
{ solver method  }
{ finite difference method  }
{ factor for increasing trust radius  }
{ factor for decreasing trust radius  }
{ max allowed |a|/|v|  }
{ step size for finite difference Jacobian  }
{ step size for finite difference fvv  }
{ maximum iterations for trs method  }
{ tolerance for solving trs  }

  Pgsl_multilarge_nlinear_parameters = ^Tgsl_multilarge_nlinear_parameters;
  Tgsl_multilarge_nlinear_parameters = record
      trs : Pgsl_multilarge_nlinear_trs;
      scale : Pgsl_multilarge_nlinear_scale;
      solver : Pgsl_multilarge_nlinear_solver;
      fdtype : Tgsl_multilarge_nlinear_fdtype;
      factor_up : Tdouble;
      factor_down : Tdouble;
      avmax : Tdouble;
      h_df : Tdouble;
      h_fvv : Tdouble;
      max_iter : Tsize_t;
      tol : Tdouble;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_multilarge_nlinear_type = ^Tgsl_multilarge_nlinear_type;
  Tgsl_multilarge_nlinear_type = record
      name : Pchar;
      alloc : function (params:Pgsl_multilarge_nlinear_parameters; n:Tsize_t; p:Tsize_t):pointer;cdecl;
      init : function (state:pointer; wts:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; x:Pgsl_vector; f:Pgsl_vector; 
                   g:Pgsl_vector; JTJ:Pgsl_matrix):longint;cdecl;
      iterate : function (state:pointer; wts:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; x:Pgsl_vector; f:Pgsl_vector; 
                   g:Pgsl_vector; JTJ:Pgsl_matrix; dx:Pgsl_vector):longint;cdecl;
      rcond : function (rcond:Pdouble; JTJ:Pgsl_matrix; state:pointer):longint;cdecl;
      covar : function (JTJ:Pgsl_matrix; covar:Pgsl_matrix; state:pointer):longint;cdecl;
      avratio : function (state:pointer):Tdouble;cdecl;
      free : procedure (state:pointer);cdecl;
    end;
{ current state passed to low-level trust region algorithms  }
(* Const before type ignored *)
{ parameter values x  }
(* Const before type ignored *)
{ residual vector f(x)  }
(* Const before type ignored *)
{ gradient J^T f  }
(* Const before type ignored *)
{ matrix J^T J  }
(* Const before type ignored *)
{ scaling matrix D  }
(* Const before type ignored *)
{ sqrt(diag(W)) or NULL for unweighted  }
(* Const before type ignored *)
{ LM parameter  }
(* Const before type ignored *)
{ workspace for direct least squares solver  }
{ |a| / |v|  }

  Pgsl_multilarge_nlinear_trust_state = ^Tgsl_multilarge_nlinear_trust_state;
  Tgsl_multilarge_nlinear_trust_state = record
      x : Pgsl_vector;
      f : Pgsl_vector;
      g : Pgsl_vector;
      JTJ : Pgsl_matrix;
      diag : Pgsl_vector;
      sqrt_wts : Pgsl_vector;
      mu : Pdouble;
      params : Pgsl_multilarge_nlinear_parameters;
      solver_state : pointer;
      fdf : Pgsl_multilarge_nlinear_fdf;
      avratio : Pdouble;
    end;
(* Const before type ignored *)
{ parameter values x  }
{ residual vector f(x)  }
{ step dx  }
{ gradient J^T f  }
{ matrix J^T J  }
{ sqrt(W)  }
{ ptr to sqrt_wts_work, or NULL if not using weights  }
{ number of residuals  }
{ number of parameters  }
{ number of iterations performed  }

  Pgsl_multilarge_nlinear_workspace = ^Tgsl_multilarge_nlinear_workspace;
  Tgsl_multilarge_nlinear_workspace = record
      _type : Pgsl_multilarge_nlinear_type;
      fdf : Pgsl_multilarge_nlinear_fdf;
      x : Pgsl_vector;
      f : Pgsl_vector;
      dx : Pgsl_vector;
      g : Pgsl_vector;
      JTJ : Pgsl_matrix;
      sqrt_wts_work : Pgsl_vector;
      sqrt_wts : Pgsl_vector;
      n : Tsize_t;
      p : Tsize_t;
      niter : Tsize_t;
      params : Tgsl_multilarge_nlinear_parameters;
      state : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multilarge_nlinear_alloc(T:Pgsl_multilarge_nlinear_type; params:Pgsl_multilarge_nlinear_parameters; n:Tsize_t; p:Tsize_t):Pgsl_multilarge_nlinear_workspace;cdecl;external;
procedure gsl_multilarge_nlinear_free(w:Pgsl_multilarge_nlinear_workspace);cdecl;external;
function gsl_multilarge_nlinear_default_parameters:Tgsl_multilarge_nlinear_parameters;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_init(x:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_winit(x:Pgsl_vector; wts:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
function gsl_multilarge_nlinear_iterate(w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_avratio(w:Pgsl_multilarge_nlinear_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_rcond(rcond:Pdouble; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
function gsl_multilarge_nlinear_covar(covar:Pgsl_matrix; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_driver(maxiter:Tsize_t; xtol:Tdouble; gtol:Tdouble; ftol:Tdouble; callback:procedure (iter:Tsize_t; params:pointer; w:Pgsl_multilarge_nlinear_workspace); 
           callback_params:pointer; info:Plongint; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_name(w:Pgsl_multilarge_nlinear_workspace):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_position(w:Pgsl_multilarge_nlinear_workspace):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_residual(w:Pgsl_multilarge_nlinear_workspace):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_step(w:Pgsl_multilarge_nlinear_workspace):Pgsl_vector;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_nlinear_niter(w:Pgsl_multilarge_nlinear_workspace):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_trs_name(w:Pgsl_multilarge_nlinear_workspace):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_eval_f(fdf:Pgsl_multilarge_nlinear_fdf; x:Pgsl_vector; swts:Pgsl_vector; y:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_eval_df(TransJ:TCBLAS_TRANSPOSE_t; x:Pgsl_vector; f:Pgsl_vector; u:Pgsl_vector; swts:Pgsl_vector; 
           h:Tdouble; fdtype:Tgsl_multilarge_nlinear_fdtype; fdf:Pgsl_multilarge_nlinear_fdf; v:Pgsl_vector; JTJ:Pgsl_matrix; 
           work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_eval_fvv(h:Tdouble; x:Pgsl_vector; v:Pgsl_vector; f:Pgsl_vector; swts:Pgsl_vector; 
           fdf:Pgsl_multilarge_nlinear_fdf; yvv:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
{ convergence.c  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_test(xtol:Tdouble; gtol:Tdouble; ftol:Tdouble; info:Plongint; w:Pgsl_multilarge_nlinear_workspace):longint;cdecl;external;
{ fdjac.c  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_df(h:Tdouble; fdtype:Tgsl_multilarge_nlinear_fdtype; x:Pgsl_vector; wts:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; 
           f:Pgsl_vector; J:Pgsl_matrix; work:Pgsl_vector):longint;cdecl;external;
{ fdfvv.c  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_nlinear_fdfvv(h:Tdouble; x:Pgsl_vector; v:Pgsl_vector; f:Pgsl_vector; J:Pgsl_matrix; 
           swts:Pgsl_vector; fdf:Pgsl_multilarge_nlinear_fdf; fvv:Pgsl_vector; work:Pgsl_vector):longint;cdecl;external;
{ top-level algorithms  }
(* Const before type ignored *)
  var
    gsl_multilarge_nlinear_trust : Pgsl_multilarge_nlinear_type;cvar;external;
{ trust region subproblem methods  }
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_lm : Pgsl_multilarge_nlinear_trs;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_lmaccel : Pgsl_multilarge_nlinear_trs;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_dogleg : Pgsl_multilarge_nlinear_trs;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_ddogleg : Pgsl_multilarge_nlinear_trs;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_subspace2D : Pgsl_multilarge_nlinear_trs;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_trs_cgst : Pgsl_multilarge_nlinear_trs;cvar;external;
{ scaling matrix strategies  }
(* Const before type ignored *)
    gsl_multilarge_nlinear_scale_levenberg : Pgsl_multilarge_nlinear_scale;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_scale_marquardt : Pgsl_multilarge_nlinear_scale;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_scale_more : Pgsl_multilarge_nlinear_scale;cvar;external;
{ linear solvers  }
(* Const before type ignored *)
    gsl_multilarge_nlinear_solver_cholesky : Pgsl_multilarge_nlinear_solver;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_solver_mcholesky : Pgsl_multilarge_nlinear_solver;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_nlinear_solver_none : Pgsl_multilarge_nlinear_solver;cvar;external;
{$endif}
{ __GSL_MULTILARGE_NLINEAR_H__  }

implementation


end.
