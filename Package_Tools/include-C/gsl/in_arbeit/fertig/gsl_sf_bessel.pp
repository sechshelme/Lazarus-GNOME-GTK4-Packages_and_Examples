
unit gsl_sf_bessel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_bessel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_bessel.h
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
Pgsl_sf_result_e10  = ^gsl_sf_result_e10;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_bessel.h
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
{$ifndef __GSL_SF_BESSEL_H__}
{$define __GSL_SF_BESSEL_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_mode.h>}
{$include <gsl/gsl_precision.h>}
{$include <gsl/gsl_sf_result.h>}
{ Regular Bessel Function J_0(x)
 *
 * exceptions: none
  }
(* Const before type ignored *)

function gsl_sf_bessel_J0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_J0(x:Tdouble):Tdouble;cdecl;external;
{ Regular Bessel Function J_1(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_J1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_J1(x:Tdouble):Tdouble;cdecl;external;
{ Regular Bessel Function J_n(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
function gsl_sf_bessel_Jn_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Jn(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Regular Bessel Function J_n(x),  nmin <= n <= nmax
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
function gsl_sf_bessel_Jn_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Irregular Bessel function Y_0(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_Y0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_Y0(x:Tdouble):Tdouble;cdecl;external;
{ Irregular Bessel function Y_1(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_Y1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_Y1(x:Tdouble):Tdouble;cdecl;external;
{ Irregular Bessel function Y_n(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_Yn_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Yn(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Irregular Bessel function Y_n(x), nmin <= n <= nmax
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Yn_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Regular modified Bessel function I_0(x)
 *
 * exceptions: GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_I0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_I0(x:Tdouble):Tdouble;cdecl;external;
{ Regular modified Bessel function I_1(x)
 *
 * exceptions: GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_I1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_I1(x:Tdouble):Tdouble;cdecl;external;
{ Regular modified Bessel function I_n(x)
 *
 * exceptions: GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_In_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_In(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Regular modified Bessel function  I_n(x) for n=nmin,...,nmax
 *
 * nmin >=0, nmax >= nmin
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_In_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Scaled regular modified Bessel function
 *  exp(-|x|) I_0(x)
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_bessel_I0_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_I0_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Scaled regular modified Bessel function
 *  exp(-|x|) I_1(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_I1_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_I1_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Scaled regular modified Bessel function
 *  exp(-|x|) I_n(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_In_scaled_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_In_scaled(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Scaled regular modified Bessel function
 *  exp(-|x|) I_n(x)  for n=nmin,...,nmax
 *
 * nmin >=0, nmax >= nmin
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_In_scaled_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Irregular modified Bessel function K_0(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_K0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_K0(x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified Bessel function K_1(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_K1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_K1(x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified Bessel function K_n(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Kn_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Kn(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified Bessel function  K_n(x)  for n=nmin,...,nmax
 *
 * x > 0.0, nmin >=0, nmax >= nmin
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Kn_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Scaled irregular modified Bessel function
 *  exp(x) K_0(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
function gsl_sf_bessel_K0_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_K0_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Scaled irregular modified Bessel function
 *  exp(x) K_1(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_K1_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_K1_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Scaled irregular modified Bessel function
 *  exp(x) K_n(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_Kn_scaled_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Kn_scaled(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Scaled irregular modified Bessel function  exp(x) K_n(x)  for n=nmin,...,nmax
 *
 * x > 0.0, nmin >=0, nmax >= nmin
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Kn_scaled_array(nmin:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Regular spherical Bessel function j_0(x) = sin(x)/x
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_bessel_j0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_j0(x:Tdouble):Tdouble;cdecl;external;
{ Regular spherical Bessel function j_1(x) = (sin(x)/x - cos(x))/x
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_j1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_j1(x:Tdouble):Tdouble;cdecl;external;
{ Regular spherical Bessel function j_2(x) = ((3/x^2 - 1)sin(x) - 3cos(x)/x)/x
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_j2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_j2(x:Tdouble):Tdouble;cdecl;external;
{ Regular spherical Bessel function j_l(x)
 *
 * l >= 0, x >= 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_jl_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_jl(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ Regular spherical Bessel function j_l(x) for l=0,1,...,lmax
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_jl_array(lmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Regular spherical Bessel function j_l(x) for l=0,1,...,lmax
 * Uses Steed's method.
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_jl_steed_array(lmax:longint; x:Tdouble; jl_x_array:Pdouble):longint;cdecl;external;
{ Irregular spherical Bessel function y_0(x)
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_bessel_y0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_y0(x:Tdouble):Tdouble;cdecl;external;
{ Irregular spherical Bessel function y_1(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_y1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_y1(x:Tdouble):Tdouble;cdecl;external;
{ Irregular spherical Bessel function y_2(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_y2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_y2(x:Tdouble):Tdouble;cdecl;external;
{ Irregular spherical Bessel function y_l(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_yl_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_yl(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ Irregular spherical Bessel function y_l(x) for l=0,1,...,lmax
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_yl_array(lmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Regular scaled modified spherical Bessel function
 *
 * Exp[-|x|] i_0(x)
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_bessel_i0_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_i0_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Regular scaled modified spherical Bessel function
 *
 * Exp[-|x|] i_1(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_i1_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_i1_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Regular scaled modified spherical Bessel function
 *
 * Exp[-|x|] i_2(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_i2_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_i2_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Regular scaled modified spherical Bessel functions
 *
 * Exp[-|x|] i_l(x)
 *
 * i_l(x) = Sqrt[Pi/(2x)] BesselI[l+1/2,x]
 *
 * l >= 0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_il_scaled_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_il_scaled(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ Regular scaled modified spherical Bessel functions
 *
 * Exp[-|x|] i_l(x)
 * for l=0,1,...,lmax
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_il_scaled_array(lmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Irregular scaled modified spherical Bessel function
 * Exp[x] k_0(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_k0_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_k0_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified spherical Bessel function
 * Exp[x] k_1(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_k1_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_k1_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified spherical Bessel function
 * Exp[x] k_2(x)
 *
 * x > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_k2_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_bessel_k2_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Irregular modified spherical Bessel function
 * Exp[x] k_l[x]
 *
 * k_l(x) = Sqrt[Pi/(2x)] BesselK[l+1/2,x]
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_bessel_kl_scaled_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_kl_scaled(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ Irregular scaled modified spherical Bessel function
 * Exp[x] k_l(x)
 *
 * for l=0,1,...,lmax
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_kl_scaled_array(lmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ Regular cylindrical Bessel function J_nu(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Jnu_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Jnu(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Irregular cylindrical Bessel function Y_nu(x)
 *
 * exceptions:  
  }
function gsl_sf_bessel_Ynu_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Ynu(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Regular cylindrical Bessel function J_nu(x)
 * evaluated at a series of x values. The array
 * contains the x values. They are assumed to be
 * strictly ordered and positive. The array is
 * over-written with the values of J_nu(x_i).
 *
 * exceptions: GSL_EDOM, GSL_EINVAL
  }
function gsl_sf_bessel_sequence_Jnu_e(nu:Tdouble; mode:Tgsl_mode_t; size:Tsize_t; v:Pdouble):longint;cdecl;external;
{ Scaled modified cylindrical Bessel functions
 *
 * Exp[-|x|] BesselI[nu, x]
 * x >= 0, nu >= 0
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_bessel_Inu_scaled_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_bessel_Inu_scaled(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Modified cylindrical Bessel functions
 *
 * BesselI[nu, x]
 * x >= 0, nu >= 0
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_bessel_Inu_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_bessel_Inu(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Scaled modified cylindrical Bessel functions
 *
 * Exp[+|x|] BesselK[nu, x]
 * x > 0, nu >= 0
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Knu_scaled_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Knu_scaled(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Knu_scaled_e10_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result_e10):longint;cdecl;external;
{ Modified cylindrical Bessel functions
 *
 * BesselK[nu, x]
 * x > 0, nu >= 0
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Knu_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_Knu(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Logarithm of modified cylindrical Bessel functions.
 *
 * Log[BesselK[nu, x]]
 * x > 0, nu >= 0
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_lnKnu_e(nu:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_bessel_lnKnu(nu:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ s'th positive zero of the Bessel function J_0(x).
 *
 * exceptions: 
  }
function gsl_sf_bessel_zero_J0_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_bessel_zero_J0(s:dword):Tdouble;cdecl;external;
{ s'th positive zero of the Bessel function J_1(x).
 *
 * exceptions: 
  }
function gsl_sf_bessel_zero_J1_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_bessel_zero_J1(s:dword):Tdouble;cdecl;external;
{ s'th positive zero of the Bessel function J_nu(x).
 *
 * exceptions: 
  }
function gsl_sf_bessel_zero_Jnu_e(nu:Tdouble; s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_bessel_zero_Jnu(nu:Tdouble; s:dword):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_BESSEL_H__  }

implementation


end.
