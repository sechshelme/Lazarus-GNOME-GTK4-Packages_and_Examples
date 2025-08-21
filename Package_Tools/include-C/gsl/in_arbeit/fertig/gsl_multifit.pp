
unit gsl_multifit;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multifit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multifit
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
Pgsl_multifit_linear_workspace  = ^gsl_multifit_linear_workspace;
Pgsl_multifit_robust_stats  = ^gsl_multifit_robust_stats;
Pgsl_multifit_robust_type  = ^gsl_multifit_robust_type;
Pgsl_multifit_robust_workspace  = ^gsl_multifit_robust_workspace;
Pgsl_vector  = ^gsl_vector;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multifit/gsl_multifit.h
 * 
 * Copyright (C) 2000, 2007, 2010 Brian Gough
 * Copyright (C) 2013, Patrick Alken
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
{$ifndef __GSL_MULTIFIT_H__}
{$define __GSL_MULTIFIT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_types.h>}
{ maximum number of observations  }
{ maximum number of parameters  }
{ number of observations in current SVD decomposition  }
{ number of parameters in current SVD decomposition  }
{ least squares matrix for SVD, n-by-p  }
{ reciprocal condition number  }
type
  Pgsl_multifit_linear_workspace = ^Tgsl_multifit_linear_workspace;
  Tgsl_multifit_linear_workspace = record
      nmax : Tsize_t;
      pmax : Tsize_t;
      n : Tsize_t;
      p : Tsize_t;
      A : Pgsl_matrix;
      Q : Pgsl_matrix;
      QSI : Pgsl_matrix;
      S : Pgsl_vector;
      t : Pgsl_vector;
      xt : Pgsl_vector;
      D : Pgsl_vector;
      rcond : Tdouble;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multifit_linear_alloc(n:Tsize_t; p:Tsize_t):Pgsl_multifit_linear_workspace;cdecl;external;
procedure gsl_multifit_linear_free(w:Pgsl_multifit_linear_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear(X:Pgsl_matrix; y:Pgsl_vector; c:Pgsl_vector; cov:Pgsl_matrix; chisq:Pdouble; 
           work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_tsvd(X:Pgsl_matrix; y:Pgsl_vector; tol:Tdouble; c:Pgsl_vector; cov:Pgsl_matrix; 
           chisq:Pdouble; rank:Psize_t; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_linear_svd(X:Pgsl_matrix; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_linear_bsvd(X:Pgsl_matrix; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_rank(tol:Tdouble; work:Pgsl_multifit_linear_workspace):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_solve(lambda:Tdouble; X:Pgsl_matrix; y:Pgsl_vector; c:Pgsl_vector; rnorm:Pdouble; 
           snorm:Pdouble; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_applyW(X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; WX:Pgsl_matrix; Wy:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_stdform1(L:Pgsl_vector; X:Pgsl_matrix; y:Pgsl_vector; Xs:Pgsl_matrix; ys:Pgsl_vector; 
           work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_wstdform1(L:Pgsl_vector; X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; Xs:Pgsl_matrix; 
           ys:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
function gsl_multifit_linear_L_decomp(L:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_stdform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; y:Pgsl_vector; Xs:Pgsl_matrix; 
           ys:Pgsl_vector; M:Pgsl_matrix; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_wstdform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; 
           Xs:Pgsl_matrix; ys:Pgsl_vector; M:Pgsl_matrix; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_genform1(L:Pgsl_vector; cs:Pgsl_vector; c:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_genform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; y:Pgsl_vector; cs:Pgsl_vector; 
           M:Pgsl_matrix; c:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_wgenform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; 
           cs:Pgsl_vector; M:Pgsl_matrix; c:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_lreg(smin:Tdouble; smax:Tdouble; reg_param:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_linear_lcurve(y:Pgsl_vector; reg_param:Pgsl_vector; rho:Pgsl_vector; eta:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_lcurvature(y:Pgsl_vector; reg_param:Pgsl_vector; rho:Pgsl_vector; eta:Pgsl_vector; kappa:Pgsl_vector; 
           work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_lcorner(rho:Pgsl_vector; eta:Pgsl_vector; idx:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_lcorner2(reg_param:Pgsl_vector; eta:Pgsl_vector; idx:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_Lk(p:Tsize_t; k:Tsize_t; L:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_Lsobolev(p:Tsize_t; kmax:Tsize_t; alpha:Pgsl_vector; L:Pgsl_matrix; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_wlinear(X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; c:Pgsl_vector; cov:Pgsl_matrix; 
           chisq:Pdouble; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_wlinear_tsvd(X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; tol:Tdouble; c:Pgsl_vector; 
           cov:Pgsl_matrix; chisq:Pdouble; rank:Psize_t; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_wlinear_svd(X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; tol:Tdouble; rank:Psize_t; 
           c:Pgsl_vector; cov:Pgsl_matrix; chisq:Pdouble; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_wlinear_usvd(X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; tol:Tdouble; rank:Psize_t; 
           c:Pgsl_vector; cov:Pgsl_matrix; chisq:Pdouble; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_est(x:Pgsl_vector; c:Pgsl_vector; cov:Pgsl_matrix; y:Pdouble; y_err:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_linear_rcond(w:Pgsl_multifit_linear_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_residuals(X:Pgsl_matrix; y:Pgsl_vector; c:Pgsl_vector; r:Pgsl_vector):longint;cdecl;external;
{ gcv.c  }
(* Const before type ignored *)
function gsl_multifit_linear_gcv_init(y:Pgsl_vector; reg_param:Pgsl_vector; UTy:Pgsl_vector; delta0:Pdouble; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_gcv_curve(reg_param:Pgsl_vector; UTy:Pgsl_vector; delta0:Tdouble; G:Pgsl_vector; work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_gcv_min(reg_param:Pgsl_vector; UTy:Pgsl_vector; G:Pgsl_vector; delta0:Tdouble; lambda:Pdouble; 
           work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_linear_gcv_calc(lambda:Tdouble; UTy:Pgsl_vector; delta0:Tdouble; work:Pgsl_multifit_linear_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_linear_gcv(y:Pgsl_vector; reg_param:Pgsl_vector; G:Pgsl_vector; lambda:Pdouble; G_lambda:Pdouble; 
           work:Pgsl_multifit_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
{ method name  }
(* Const before type ignored *)
(* Const before type ignored *)
{ default tuning constant  }
type
  Pgsl_multifit_robust_type = ^Tgsl_multifit_robust_type;
  Tgsl_multifit_robust_type = record
      name : Pchar;
      wfun : function (r:Pgsl_vector; w:Pgsl_vector):longint;cdecl;
      psi_deriv : function (r:Pgsl_vector; dpsi:Pgsl_vector):longint;cdecl;
      tuning_default : Tdouble;
    end;
{ OLS estimate of sigma  }
{ MAD estimate of sigma  }
{ robust estimate of sigma  }
{ final estimate of sigma  }
{ R^2 coefficient of determination  }
{ degree of freedom adjusted R^2  }
{ root mean squared error  }
{ residual sum of squares  }
{ degrees of freedom  }
{ number of iterations  }
{ final weights  }
{ final residuals y - X c  }

  Pgsl_multifit_robust_stats = ^Tgsl_multifit_robust_stats;
  Tgsl_multifit_robust_stats = record
      sigma_ols : Tdouble;
      sigma_mad : Tdouble;
      sigma_rob : Tdouble;
      sigma : Tdouble;
      Rsq : Tdouble;
      adj_Rsq : Tdouble;
      rmse : Tdouble;
      sse : Tdouble;
      dof : Tsize_t;
      numit : Tsize_t;
      weights : Pgsl_vector;
      r : Pgsl_vector;
    end;
{ number of observations  }
{ number of parameters  }
{ number of iterations  }
{ maximum iterations  }
(* Const before type ignored *)
{ tuning parameter  }
{ residuals at current iteration  }
{ weights at current iteration  }
{ coefficients from previous iteration  }
{ multiplicative factors for residuals  }
{ psi(r)  }
{ psi'(r)  }
{ Q S^-1 of original matrix X  }
{ balancing parameters of original matrix X  }
{ workspace of length n  }
{ various statistics  }

  Pgsl_multifit_robust_workspace = ^Tgsl_multifit_robust_workspace;
  Tgsl_multifit_robust_workspace = record
      n : Tsize_t;
      p : Tsize_t;
      numit : Tsize_t;
      maxiter : Tsize_t;
      _type : Pgsl_multifit_robust_type;
      tune : Tdouble;
      r : Pgsl_vector;
      weights : Pgsl_vector;
      c_prev : Pgsl_vector;
      resfac : Pgsl_vector;
      psi : Pgsl_vector;
      dpsi : Pgsl_vector;
      QSI : Pgsl_matrix;
      D : Pgsl_vector;
      workn : Pgsl_vector;
      stats : Tgsl_multifit_robust_stats;
      multifit_p : Pgsl_multifit_linear_workspace;
    end;
{ available types  }
(* Const before type ignored *)
  var
    gsl_multifit_robust_default : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_bisquare : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_cauchy : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_fair : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_huber : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_ols : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
    gsl_multifit_robust_welsch : Pgsl_multifit_robust_type;cvar;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multifit_robust_alloc(T:Pgsl_multifit_robust_type; n:Tsize_t; p:Tsize_t):Pgsl_multifit_robust_workspace;cdecl;external;
procedure gsl_multifit_robust_free(w:Pgsl_multifit_robust_workspace);cdecl;external;
(* Const before type ignored *)
function gsl_multifit_robust_tune(tune:Tdouble; w:Pgsl_multifit_robust_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_robust_maxiter(maxiter:Tsize_t; w:Pgsl_multifit_robust_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_robust_name(w:Pgsl_multifit_robust_workspace):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_robust_statistics(w:Pgsl_multifit_robust_workspace):Tgsl_multifit_robust_stats;cdecl;external;
(* Const before type ignored *)
function gsl_multifit_robust_weights(r:Pgsl_vector; wts:Pgsl_vector; w:Pgsl_multifit_robust_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_robust(X:Pgsl_matrix; y:Pgsl_vector; c:Pgsl_vector; cov:Pgsl_matrix; w:Pgsl_multifit_robust_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_robust_est(x:Pgsl_vector; c:Pgsl_vector; cov:Pgsl_matrix; y:Pdouble; y_err:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multifit_robust_residuals(X:Pgsl_matrix; y:Pgsl_vector; c:Pgsl_vector; r:Pgsl_vector; w:Pgsl_multifit_robust_workspace):longint;cdecl;external;
{$endif}
{ __GSL_MULTIFIT_H__  }

implementation


end.
