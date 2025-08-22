unit gsl_sf_transport;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_transport.h
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
{$ifndef __GSL_SF_TRANSPORT_H__}
{$define __GSL_SF_TRANSPORT_H__}
{$include <gsl/gsl_sf_result.h>}
{ Transport function:
 *   J(n,x) := Integral[ t^n e^t /(e^t - 1)^2, t,0,x]
  }
{ J(2,x)
 *
 * exceptions: GSL_EDOM
  }

function gsl_sf_transport_2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_transport_2(x:Tdouble):Tdouble;cdecl;external libgsl;
{ J(3,x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
function gsl_sf_transport_3_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_transport_3(x:Tdouble):Tdouble;cdecl;external libgsl;
{ J(4,x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
function gsl_sf_transport_4_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_transport_4(x:Tdouble):Tdouble;cdecl;external libgsl;
{ J(5,x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
function gsl_sf_transport_5_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_transport_5(x:Tdouble):Tdouble;cdecl;external libgsl;
{$endif}
{ __GSL_SF_TRANSPORT_H__  }

// === Konventiert am: 22-8-25 13:59:18 ===


implementation



end.
