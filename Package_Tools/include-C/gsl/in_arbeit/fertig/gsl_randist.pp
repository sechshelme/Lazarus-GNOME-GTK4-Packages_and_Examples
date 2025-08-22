
unit gsl_randist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_randist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_randist.h
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
Pdword  = ^dword;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_ran_discrete_t  = ^gsl_ran_discrete_t;
Pgsl_rng  = ^gsl_rng;
Pgsl_vector  = ^gsl_vector;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ randist/gsl_randist.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 James Theiler, Brian Gough
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
{$ifndef __GSL_RANDIST_H__}
{$define __GSL_RANDIST_H__}
{$include <gsl/gsl_rng.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
(* Const before type ignored *)

function gsl_ran_bernoulli(r:Pgsl_rng; p:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
function gsl_ran_bernoulli_pdf(k:dword; p:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_beta(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_beta_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_binomial(r:Pgsl_rng; p:Tdouble; n:dword):dword;cdecl;external;
(* Const before type ignored *)
function gsl_ran_binomial_knuth(r:Pgsl_rng; p:Tdouble; n:dword):dword;cdecl;external;
(* Const before type ignored *)
function gsl_ran_binomial_tpe(r:Pgsl_rng; p:Tdouble; n:dword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_binomial_pdf(k:dword; p:Tdouble; n:dword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_exponential(r:Pgsl_rng; mu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_exponential_pdf(x:Tdouble; mu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_exppow(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_exppow_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_cauchy(r:Pgsl_rng; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_cauchy_pdf(x:Tdouble; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_chisq(r:Pgsl_rng; nu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_chisq_pdf(x:Tdouble; nu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_ran_dirichlet(r:Pgsl_rng; K:Tsize_t; alpha:Pdouble; theta:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_dirichlet_pdf(K:Tsize_t; alpha:Pdouble; theta:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_dirichlet_lnpdf(K:Tsize_t; alpha:Pdouble; theta:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_erlang(r:Pgsl_rng; a:Tdouble; n:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_erlang_pdf(x:Tdouble; a:Tdouble; n:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_fdist(r:Pgsl_rng; nu1:Tdouble; nu2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_fdist_pdf(x:Tdouble; nu1:Tdouble; nu2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_flat(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_flat_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gamma(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gamma_int(r:Pgsl_rng; a:dword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gamma_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gamma_mt(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gamma_knuth(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian(r:Pgsl_rng; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian_ratio_method(r:Pgsl_rng; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian_ziggurat(r:Pgsl_rng; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian_pdf(x:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_ugaussian(r:Pgsl_rng):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_ugaussian_ratio_method(r:Pgsl_rng):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_ugaussian_pdf(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian_tail(r:Pgsl_rng; a:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gaussian_tail_pdf(x:Tdouble; a:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_ugaussian_tail(r:Pgsl_rng; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_ugaussian_tail_pdf(x:Tdouble; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_bivariate_gaussian(r:Pgsl_rng; sigma_x:Tdouble; sigma_y:Tdouble; rho:Tdouble; x:Pdouble; 
            y:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_bivariate_gaussian_pdf(x:Tdouble; y:Tdouble; sigma_x:Tdouble; sigma_y:Tdouble; rho:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_multivariate_gaussian(r:Pgsl_rng; mu:Pgsl_vector; L:Pgsl_matrix; result:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_multivariate_gaussian_log_pdf(x:Pgsl_vector; mu:Pgsl_vector; L:Pgsl_matrix; result:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_multivariate_gaussian_pdf(x:Pgsl_vector; mu:Pgsl_vector; L:Pgsl_matrix; result:Pdouble; work:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_ran_multivariate_gaussian_mean(X:Pgsl_matrix; mu_hat:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
function gsl_ran_multivariate_gaussian_vcov(X:Pgsl_matrix; sigma_hat:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_wishart(r:Pgsl_rng; df:Tdouble; L:Pgsl_matrix; result:Pgsl_matrix; work:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_wishart_log_pdf(X:Pgsl_matrix; L_X:Pgsl_matrix; df:Tdouble; L:Pgsl_matrix; result:Pdouble; 
           work:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_wishart_pdf(X:Pgsl_matrix; L_X:Pgsl_matrix; df:Tdouble; L:Pgsl_matrix; result:Pdouble; 
           work:Pgsl_matrix):longint;cdecl;external;
(* Const before type ignored *)
function gsl_ran_landau(r:Pgsl_rng):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_landau_pdf(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_geometric(r:Pgsl_rng; p:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_geometric_pdf(k:dword; p:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_hypergeometric(r:Pgsl_rng; n1:dword; n2:dword; t:dword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_hypergeometric_pdf(k:dword; n1:dword; n2:dword; t:dword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gumbel1(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gumbel1_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gumbel2(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_gumbel2_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_logistic(r:Pgsl_rng; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_logistic_pdf(x:Tdouble; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_lognormal(r:Pgsl_rng; zeta:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_lognormal_pdf(x:Tdouble; zeta:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_logarithmic(r:Pgsl_rng; p:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_logarithmic_pdf(k:dword; p:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_ran_multinomial(r:Pgsl_rng; K:Tsize_t; N:dword; p:Pdouble; n:Pdword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_multinomial_pdf(K:Tsize_t; p:Pdouble; n:Pdword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_multinomial_lnpdf(K:Tsize_t; p:Pdouble; n:Pdword):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_negative_binomial(r:Pgsl_rng; p:Tdouble; n:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_negative_binomial_pdf(k:dword; p:Tdouble; n:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_pascal(r:Pgsl_rng; p:Tdouble; n:dword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_pascal_pdf(k:dword; p:Tdouble; n:dword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_pareto(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_pareto_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_ran_poisson(r:Pgsl_rng; mu:Tdouble):dword;cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_poisson_array(r:Pgsl_rng; n:Tsize_t; array:Pdword; mu:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_poisson_pdf(k:dword; mu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_rayleigh(r:Pgsl_rng; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_rayleigh_pdf(x:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_rayleigh_tail(r:Pgsl_rng; a:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_rayleigh_tail_pdf(x:Tdouble; a:Tdouble; sigma:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_tdist(r:Pgsl_rng; nu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_tdist_pdf(x:Tdouble; nu:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_laplace(r:Pgsl_rng; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_laplace_pdf(x:Tdouble; a:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_levy(r:Pgsl_rng; c:Tdouble; alpha:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_levy_skew(r:Pgsl_rng; c:Tdouble; alpha:Tdouble; beta:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_weibull(r:Pgsl_rng; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_weibull_pdf(x:Tdouble; a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_dir_2d(r:Pgsl_rng; x:Pdouble; y:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_dir_2d_trig_method(r:Pgsl_rng; x:Pdouble; y:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_dir_3d(r:Pgsl_rng; x:Pdouble; y:Pdouble; z:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_dir_nd(r:Pgsl_rng; n:Tsize_t; x:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_shuffle(r:Pgsl_rng; base:pointer; nmembm:Tsize_t; size:Tsize_t);cdecl;external;
(* Const before type ignored *)
function gsl_ran_choose(r:Pgsl_rng; dest:pointer; k:Tsize_t; src:pointer; n:Tsize_t; 
           size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
procedure gsl_ran_sample(r:Pgsl_rng; dest:pointer; k:Tsize_t; src:pointer; n:Tsize_t; 
            size:Tsize_t);cdecl;external;
{ struct for Walker algorithm  }
type
  Pgsl_ran_discrete_t = ^Tgsl_ran_discrete_t;
  Tgsl_ran_discrete_t = record
      K : Tsize_t;
      A : Psize_t;
      F : Pdouble;
    end;
(* Const before type ignored *)

function gsl_ran_discrete_preproc(K:Tsize_t; P:Pdouble):Pgsl_ran_discrete_t;cdecl;external;
procedure gsl_ran_discrete_free(g:Pgsl_ran_discrete_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_ran_discrete(r:Pgsl_rng; g:Pgsl_ran_discrete_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_ran_discrete_pdf(k:Tsize_t; g:Pgsl_ran_discrete_t):Tdouble;cdecl;external;
{$endif}
{ __GSL_RANDIST_H__  }

implementation


end.
