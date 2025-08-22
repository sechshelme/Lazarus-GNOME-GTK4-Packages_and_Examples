unit gsl_sf_lambert;

interface

uses
  fp_gsl;

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

function gsl_sf_lambert_W0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lambert_W0(x:Tdouble):Tdouble;cdecl;external libgsl;
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
function gsl_sf_lambert_Wm1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lambert_Wm1(x:Tdouble):Tdouble;cdecl;external libgsl;
{$endif}
{ __GSL_SF_LAMBERT_H__  }

// === Konventiert am: 22-8-25 13:58:36 ===


implementation



end.
