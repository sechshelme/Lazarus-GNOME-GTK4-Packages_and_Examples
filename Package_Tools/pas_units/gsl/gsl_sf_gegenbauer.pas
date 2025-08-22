unit gsl_sf_gegenbauer;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_gegenbauer.h
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
{$ifndef __GSL_SF_GEGENBAUER_H__}
{$define __GSL_SF_GEGENBAUER_H__}
{$include <gsl/gsl_sf_result.h>}
{ Evaluate Gegenbauer polynomials
 * using explicit representations.
 *
 * exceptions: none
  }

function gsl_sf_gegenpoly_1_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gegenpoly_2_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gegenpoly_3_e(lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gegenpoly_1(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_gegenpoly_2(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_gegenpoly_3(lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Evaluate Gegenbauer polynomials.
 *
 * lambda > -1/2, n >= 0
 * exceptions: GSL_EDOM
  }
function gsl_sf_gegenpoly_n_e(n:longint; lambda:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gegenpoly_n(n:longint; lambda:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Calculate array of Gegenbauer polynomials
 * for n = (0, 1, 2, ... nmax)
 *
 * lambda > -1/2, nmax >= 0
 * exceptions: GSL_EDOM
  }
function gsl_sf_gegenpoly_array(nmax:longint; lambda:Tdouble; x:Tdouble; result_array:Pdouble):longint;cdecl;external libgsl;
{$endif}
{ __GSL_SF_GEGENBAUER_H__  }

// === Konventiert am: 22-8-25 13:58:26 ===


implementation



end.
