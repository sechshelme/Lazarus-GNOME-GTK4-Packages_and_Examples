
unit gsl_sf_ellint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_ellint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_ellint.h
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
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_ellint.h
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
{ Author: G. Jungman  }
{$ifndef __GSL_SF_ELLINT_H__}
{$define __GSL_SF_ELLINT_H__}
{$include <gsl/gsl_mode.h>}
{$include <gsl/gsl_sf_result.h>}
{ Legendre form of complete elliptic integrals
 *
 * K(k) = Integral[1/Sqrt[1 - k^2 Sin[t]^2], t, 0, Pi/2]
 * E(k) = Integral[  Sqrt[1 - k^2 Sin[t]^2], t, 0, Pi/2]
 *
 * exceptions: GSL_EDOM
  }

function gsl_sf_ellint_Kcomp_e(k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_Kcomp(k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_Ecomp_e(k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_Ecomp(k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_Pcomp_e(k:Tdouble; n:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_Pcomp(k:Tdouble; n:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_Dcomp_e(k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_Dcomp(k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ Legendre form of incomplete elliptic integrals
 *
 * F(phi,k)   = Integral[1/Sqrt[1 - k^2 Sin[t]^2], t, 0, phi]
 * E(phi,k)   = Integral[  Sqrt[1 - k^2 Sin[t]^2], t, 0, phi]
 * P(phi,k,n) = Integral[(1 + n Sin[t]^2)^(-1)/Sqrt[1 - k^2 Sin[t]^2], t, 0, phi]
 * D(phi,k,n) = R_D(1-Sin[phi]^2, 1-k^2 Sin[phi]^2, 1.0)
 *
 * F: [Carlson, Numerische Mathematik 33 (1979) 1, (4.1)]
 * E: [Carlson, ", (4.2)]
 * P: [Carlson, ", (4.3)]
 * D: [Carlson, ", (4.4)]
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_ellint_F_e(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_F(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_E_e(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_E(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_P_e(phi:Tdouble; k:Tdouble; n:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_P(phi:Tdouble; k:Tdouble; n:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_D_e(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_D(phi:Tdouble; k:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ Carlson's symmetric basis of functions
 *
 * RC(x,y)   = 1/2 Integral[(t+x)^(-1/2) (t+y)^(-1)], t,0,Inf]
 * RD(x,y,z) = 3/2 Integral[(t+x)^(-1/2) (t+y)^(-1/2) (t+z)^(-3/2), t,0,Inf]
 * RF(x,y,z) = 1/2 Integral[(t+x)^(-1/2) (t+y)^(-1/2) (t+z)^(-1/2), t,0,Inf]
 * RJ(x,y,z,p) = 3/2 Integral[(t+x)^(-1/2) (t+y)^(-1/2) (t+z)^(-1/2) (t+p)^(-1), t,0,Inf]
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_ellint_RC_e(x:Tdouble; y:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_RC(x:Tdouble; y:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_RD_e(x:Tdouble; y:Tdouble; z:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_RD(x:Tdouble; y:Tdouble; z:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_RF_e(x:Tdouble; y:Tdouble; z:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_RF(x:Tdouble; y:Tdouble; z:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
function gsl_sf_ellint_RJ_e(x:Tdouble; y:Tdouble; z:Tdouble; p:Tdouble; mode:Tgsl_mode_t; 
           result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_ellint_RJ(x:Tdouble; y:Tdouble; z:Tdouble; p:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_ELLINT_H__  }

implementation


end.
