
unit gsl_sf_lambert;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_lambert.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_lambert.h
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


{ specfunc/gsl_sf_lambert.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001 Gerard Jungman
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
{$ifndef __GSL_SF_LAMBERT_H__}
{$define __GSL_SF_LAMBERT_H__}
{$include <gsl/gsl_sf_result.h>}
{ Lambert's Function W_0(x)
 *
 * W_0(x) is the principal branch of the
 * implicit function defined by W e^W = x.
 *
 * -1/E < x < \infty
 *
 * exceptions: GSL_EMAXITER;
  }

function gsl_sf_lambert_W0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_lambert_W0(x:Tdouble):Tdouble;cdecl;external;
{ Lambert's Function W_-1(x)
 *
 * W_-1(x) is the second real branch of the
 * implicit function defined by W e^W = x.
 * It agrees with W_0(x) when x >= 0.
 *
 * -1/E < x < \infty
 *
 * exceptions: GSL_MAXITER;
  }
function gsl_sf_lambert_Wm1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_lambert_Wm1(x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_LAMBERT_H__  }

implementation


end.
