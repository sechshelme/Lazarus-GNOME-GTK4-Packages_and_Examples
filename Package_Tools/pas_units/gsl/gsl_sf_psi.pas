unit gsl_sf_psi;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_psi.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004 Gerard Jungman
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
{$ifndef __GSL_SF_PSI_H__}
{$define __GSL_SF_PSI_H__}
{$include <gsl/gsl_sf_result.h>}
{ Poly-Gamma Functions
 *
 * psi(m,x) := (d/dx)^m psi(0,x) = (d/dx)^m+1 log(gamma(x))
  }
{ Di-Gamma Function  psi(n) = psi(0,n)
 *
 * n > 0
 * exceptions: GSL_EDOM
  }

function gsl_sf_psi_int_e(n:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi_int(n:longint):Tdouble;cdecl;external libgsl;
{ Di-Gamma Function psi(x) = psi(0, x)
 *
 * x != 0.0, -1.0, -2.0, ...
 * exceptions: GSL_EDOM, GSL_ELOSS
  }
function gsl_sf_psi_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Di-Gamma Function Re[psi(1 + I y)]
 *
 * exceptions: none
  }
function gsl_sf_psi_1piy_e(y:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi_1piy(y:Tdouble):Tdouble;cdecl;external libgsl;
{ Di-Gamma Function psi(z) for general complex argument z = x + iy
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_complex_psi_e(x:Tdouble; y:Tdouble; result_re:Pgsl_sf_result; result_im:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Tri-Gamma Function psi^(1)(n)
 *
 * n > 0
 * exceptions: GSL_EDOM
  }
function gsl_sf_psi_1_int_e(n:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi_1_int(n:longint):Tdouble;cdecl;external libgsl;
{ Tri-Gamma Function psi^(1)(x)
 *
 * x != 0.0, -1.0, -2.0, ...
 * exceptions: GSL_EDOM, GSL_ELOSS
  }
function gsl_sf_psi_1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi_1(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Poly-Gamma Function psi^(n)(x)
 *
 * n >= 0, x > 0.0
 * exceptions: GSL_EDOM
  }
function gsl_sf_psi_n_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_psi_n(n:longint; x:Tdouble):Tdouble;cdecl;external libgsl;
{$endif}
{ __GSL_SF_PSI_H__  }

// === Konventiert am: 22-8-25 13:58:49 ===


implementation



end.
