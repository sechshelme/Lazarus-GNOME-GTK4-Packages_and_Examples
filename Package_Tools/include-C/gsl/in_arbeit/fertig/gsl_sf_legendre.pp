
unit gsl_sf_legendre;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_legendre.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_legendre.h
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
Pgsl_sf_legendre_t  = ^gsl_sf_legendre_t;
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_legendre.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2004 Gerard Jungman
 * Copyright (C) 2019 Patrick Alken
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
{$ifndef __GSL_SF_LEGENDRE_H__}
{$define __GSL_SF_LEGENDRE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_sf_result.h>}
{ P_l(x)   l >= 0; |x| <= 1
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_legendre_Pl_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Pl(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ P_l(x) for l=0,...,lmax; |x| <= 1
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Pl_array(lmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ P_l(x) and P_l'(x) for l=0,...,lmax; |x| <= 1
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Pl_deriv_array(lmax:longint; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble):longint;cdecl;external;
{ P_l(x), l=1,2,3
 *
 * exceptions: none
  }
function gsl_sf_legendre_P1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_legendre_P2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_legendre_P3_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_P1(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_P2(x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_P3(x:Tdouble):Tdouble;cdecl;external;
{ Q_0(x), x > -1, x != 1
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
function gsl_sf_legendre_Q0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_Q0(x:Tdouble):Tdouble;cdecl;external;
{ Q_1(x), x > -1, x != 1
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
function gsl_sf_legendre_Q1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_Q1(x:Tdouble):Tdouble;cdecl;external;
{ Q_l(x), x > -1, x != 1, l >= 0
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Ql_e(l:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Ql(l:longint; x:Tdouble):Tdouble;cdecl;external;
{ P_l^m(x)  m >= 0; l >= m; |x| <= 1.0
 *
 * Note that this function grows combinatorially with l.
 * Therefore we can easily generate an overflow for l larger
 * than about 150.
 *
 * There is no trouble for small m, but when m and l are both large,
 * then there will be trouble. Rather than allow overflows, these
 * functions refuse to calculate when they can sense that l and m are
 * too big.
 *
 * If you really want to calculate a spherical harmonic, then DO NOT
 * use this. Instead use legendre_sphPlm() below, which  uses a similar
 * recursion, but with the normalized functions.
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Plm_e(l:longint; m:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Plm(l:longint; m:longint; x:Tdouble):Tdouble;cdecl;external;
{ P_l^m(x)  m >= 0; l >= m; |x| <= 1.0
 * l=|m|,...,lmax
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Plm_array(lmax:longint; m:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ P_l^m(x)  and d(P_l^m(x))/dx;  m >= 0; lmax >= m; |x| <= 1.0
 * l=|m|,...,lmax
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_Plm_deriv_array(lmax:longint; m:longint; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble):longint;cdecl;external;
{ P_l^m(x), normalized properly for use in spherical harmonics
 * m >= 0; l >= m; |x| <= 1.0
 *
 * There is no overflow problem, as there is for the
 * standard normalization of P_l^m(x).
 *
 * Specifically, it returns:
 *
 *        sqrt((2l+1)/(4pi)) sqrt((l-m)!/(l+m)!) P_l^m(x)
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_sphPlm_e(l:longint; m:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_sphPlm(l:longint; m:longint; x:Tdouble):Tdouble;cdecl;external;
{ sphPlm(l,m,x) values
 * m >= 0; l >= m; |x| <= 1.0
 * l=|m|,...,lmax
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_sphPlm_array(lmax:longint; m:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ sphPlm(l,m,x) and d(sphPlm(l,m,x))/dx values
 * m >= 0; l >= m; |x| <= 1.0
 * l=|m|,...,lmax
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_sphPlm_deriv_array(lmax:longint; m:longint; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble):longint;cdecl;external;
{ size of result_array[] needed for the array versions of Plm
 * (lmax - m + 1)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_array_size(lmax:longint; m:longint):longint;cdecl;external;
{ Irregular Spherical Conical Function
 * P^1/2_-1/2 + I lambda(x)
 *
 * x > -1.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_half_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_half(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Regular Spherical Conical Function
 * P^-1/2_-1/2 + I lambda(x)
 *
 * x > -1.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_mhalf_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_mhalf(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Conical Function
 * P^0_-1/2 + I lambda(x)
 *
 * x > -1.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_0_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_0(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Conical Function
 * P^1_-1/2 + I lambda(x)
 *
 * x > -1.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_1_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_1(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Regular Spherical Conical Function
 * P^-1/2-l_-1/2 + I lambda(x)
 *
 * x > -1.0, l >= -1
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_sph_reg_e(l:longint; lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_sph_reg(l:longint; lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ Regular Cylindrical Conical Function
 * P^-m_-1/2 + I lambda(x)
 *
 * x > -1.0, m >= -1
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_cyl_reg_e(m:longint; lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_conicalP_cyl_reg(m:longint; lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external;
{ The following spherical functions are specializations
 * of Legendre functions which give the regular eigenfunctions
 * of the Laplacian on a 3-dimensional hyperbolic space.
 * Of particular interest is the flat limit, which is
 * Flat-Lim := lambda->Inf, eta->0, lambda*eta fixed.
  }
{ Zeroth radial eigenfunction of the Laplacian on the
 * 3-dimensional hyperbolic space.
 *
 * legendre_H3d_0(lambda,eta) := sin(lambda*eta)/(lambda*sinh(eta))
 * 
 * Normalization:
 * Flat-Lim legendre_H3d_0(lambda,eta) = j_0(lambda*eta)
 *
 * eta >= 0.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_0_e(lambda:Tdouble; eta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_0(lambda:Tdouble; eta:Tdouble):Tdouble;cdecl;external;
{ First radial eigenfunction of the Laplacian on the
 * 3-dimensional hyperbolic space.
 *
 * legendre_H3d_1(lambda,eta) :=
 *    1/sqrt(lambda^2 + 1) sin(lam eta)/(lam sinh(eta))
 *    (coth(eta) - lambda cot(lambda*eta))
 * 
 * Normalization:
 * Flat-Lim legendre_H3d_1(lambda,eta) = j_1(lambda*eta)
 *
 * eta >= 0.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_1_e(lambda:Tdouble; eta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_1(lambda:Tdouble; eta:Tdouble):Tdouble;cdecl;external;
{ l'th radial eigenfunction of the Laplacian on the
 * 3-dimensional hyperbolic space.
 *
 * Normalization:
 * Flat-Lim legendre_H3d_l(l,lambda,eta) = j_l(lambda*eta)
 *
 * eta >= 0.0, l >= 0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_e(l:longint; lambda:Tdouble; eta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d(l:longint; lambda:Tdouble; eta:Tdouble):Tdouble;cdecl;external;
{ Array of H3d(ell),  0 <= ell <= lmax
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_H3d_array(lmax:longint; lambda:Tdouble; eta:Tdouble; result_array:Pdouble):longint;cdecl;external;
{ associated legendre P_lm routines  }
type
  Pgsl_sf_legendre_t = ^Tgsl_sf_legendre_t;
  Tgsl_sf_legendre_t =  Longint;
  Const
    GSL_SF_LEGENDRE_SCHMIDT = 0;
    GSL_SF_LEGENDRE_SPHARM = 1;
    GSL_SF_LEGENDRE_FULL = 2;
    GSL_SF_LEGENDRE_NONE = 3;
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_legendre_array(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_array_e(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; csphase:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv_array(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv_array_e(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; csphase:Tdouble; result_array:Pdouble; 
           result_deriv_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv_alt_array(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv_alt_array_e(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; csphase:Tdouble; result_array:Pdouble; 
           result_deriv_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv2_array(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble; 
           result_deriv2_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv2_array_e(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; csphase:Tdouble; result_array:Pdouble; 
           result_deriv_array:Pdouble; result_deriv2_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv2_alt_array(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; result_array:Pdouble; result_deriv_array:Pdouble; 
           result_deriv2_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_deriv2_alt_array_e(norm:Tgsl_sf_legendre_t; lmax:Tsize_t; x:Tdouble; csphase:Tdouble; result_array:Pdouble; 
           result_deriv_array:Pdouble; result_deriv2_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_array_n(lmax:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_sf_legendre_nlm(lmax:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_legendre_array_index(l:Tsize_t; m:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ __GSL_SF_LEGENDRE_H__  }

implementation


end.
