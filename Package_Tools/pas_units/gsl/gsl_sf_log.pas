unit gsl_sf_log;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_log.h
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
{$ifndef __GSL_SF_LOG_H__}
{$define __GSL_SF_LOG_H__}
{$include <gsl/gsl_sf_result.h>}
{ Provide a logarithm function with GSL semantics.
 *
 * exceptions: GSL_EDOM
  }

function gsl_sf_log_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_log(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log(|x|)
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_log_abs_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_log_abs(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Complex Logarithm
 *   exp(lnr + I theta) = zr + I zi
 * Returns argument in [-pi,pi].
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_complex_log_e(zr:Tdouble; zi:Tdouble; lnr:Pgsl_sf_result; theta:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Log(1 + x)
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_log_1plusx_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_log_1plusx(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log(1 + x) - x
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_log_1plusx_mx_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_log_1plusx_mx(x:Tdouble):Tdouble;cdecl;external libgsl;
{$endif}
{ __GSL_SF_LOG_H__  }

// === Konventiert am: 22-8-25 13:58:41 ===


implementation



end.
