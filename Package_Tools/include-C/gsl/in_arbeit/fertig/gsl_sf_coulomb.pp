
unit gsl_sf_coulomb;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_coulomb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_coulomb.h
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
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_coulomb.h
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
{$ifndef __GSL_SF_COULOMB_H__}
{$define __GSL_SF_COULOMB_H__}
{$include <gsl/gsl_mode.h>}
{$include <gsl/gsl_sf_result.h>}
{ Normalized hydrogenic bound states, radial dependence.  }
{ R_1 := 2Z sqrt(Z) exp(-Z r)
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_hydrogenicR_1_e(Z:Tdouble; r:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hydrogenicR_1(Z:Tdouble; r:Tdouble):Tdouble;cdecl;external;
{ R_n := norm exp(-Z r/n) (2Z/n)^l Laguerre[n-l-1, 2l+1, 2Z/n r]
 *
 * normalization such that psi(n,l,r) = R_n Y_lm
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hydrogenicR_e(n:longint; l:longint; Z:Tdouble; r:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hydrogenicR(n:longint; l:longint; Z:Tdouble; r:Tdouble):Tdouble;cdecl;external;
{ Coulomb wave functions F_lam_F(eta,x), G_lam_G(eta,x)
 * and their derivatives; lam_G := lam_F - k_lam_G
 *
 * lam_F, lam_G > -0.5
 * x > 0.0
 *
 * Conventions of Abramowitz+Stegun.
 *
 * Because there can be a large dynamic range of values,
 * overflows are handled gracefully. If an overflow occurs,
 * GSL_EOVRFLW is signalled and exponent(s) are returned
 * through exp_F, exp_G. These are such that
 *
 *   F_L(eta,x)  =  fc[k_L] * exp(exp_F)
 *   G_L(eta,x)  =  gc[k_L] * exp(exp_G)
 *   F_L'(eta,x) = fcp[k_L] * exp(exp_F)
 *   G_L'(eta,x) = gcp[k_L] * exp(exp_G)
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_coulomb_wave_FG_e(eta:Tdouble; x:Tdouble; lam_F:Tdouble; k_lam_G:longint; F:Pgsl_sf_result; 
           Fp:Pgsl_sf_result; G:Pgsl_sf_result; Gp:Pgsl_sf_result; exp_F:Pdouble; exp_G:Pdouble):longint;cdecl;external;
{ F_L(eta,x) as array  }
function gsl_sf_coulomb_wave_F_array(lam_min:Tdouble; kmax:longint; eta:Tdouble; x:Tdouble; fc_array:Pdouble; 
           F_exponent:Pdouble):longint;cdecl;external;
{ F_L(eta,x), G_L(eta,x) as arrays  }
function gsl_sf_coulomb_wave_FG_array(lam_min:Tdouble; kmax:longint; eta:Tdouble; x:Tdouble; fc_array:Pdouble; 
           gc_array:Pdouble; F_exponent:Pdouble; G_exponent:Pdouble):longint;cdecl;external;
{ F_L(eta,x), G_L(eta,x), F'_L(eta,x), G'_L(eta,x) as arrays  }
function gsl_sf_coulomb_wave_FGp_array(lam_min:Tdouble; kmax:longint; eta:Tdouble; x:Tdouble; fc_array:Pdouble; 
           fcp_array:Pdouble; gc_array:Pdouble; gcp_array:Pdouble; F_exponent:Pdouble; G_exponent:Pdouble):longint;cdecl;external;
{ Coulomb wave function divided by the argument,
 * F(eta, x)/x. This is the function which reduces to
 * spherical Bessel functions in the limit eta->0.
  }
function gsl_sf_coulomb_wave_sphF_array(lam_min:Tdouble; kmax:longint; eta:Tdouble; x:Tdouble; fc_array:Pdouble; 
           F_exponent:Pdouble):longint;cdecl;external;
{ Coulomb wave function normalization constant.
 * [Abramowitz+Stegun 14.1.8, 14.1.9]
  }
function gsl_sf_coulomb_CL_e(L:Tdouble; eta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_coulomb_CL_array(Lmin:Tdouble; kmax:longint; eta:Tdouble; cl:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_SF_COULOMB_H__  }

implementation


end.
