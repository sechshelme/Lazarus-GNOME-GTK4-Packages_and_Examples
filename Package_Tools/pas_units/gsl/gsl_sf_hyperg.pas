unit gsl_sf_hyperg;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_hyperg.h
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
{$ifndef __GSL_SF_HYPERG_H__}
{$define __GSL_SF_HYPERG_H__}
{$include <gsl/gsl_sf_result.h>}
{ Hypergeometric function related to Bessel functions
 * 0F1[c,x] =
 *            Gamma[c]    x^(1/2(1-c)) I_c-1(2 Sqrt[x])
 *            Gamma[c] (-x)^(1/2(1-c)) J_c-1(2 Sqrt[-x])
 *
 * exceptions: GSL_EOVRFLW, GSL_EUNDRFLW
  }

function gsl_sf_hyperg_0F1_e(c:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_0F1(c:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Confluent hypergeometric function  for integer parameters.
 * 1F1[m,n,x] = M(m,n,x)
 *
 * exceptions: 
  }
function gsl_sf_hyperg_1F1_int_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_1F1_int(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Confluent hypergeometric function.
 * 1F1[a,b,x] = M(a,b,x)
 *
 * exceptions:
  }
function gsl_sf_hyperg_1F1_e(a:Tdouble; b:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_1F1(a:Tdouble; b:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Confluent hypergeometric function for integer parameters.
 * U(m,n,x)
 *
 * exceptions:
  }
function gsl_sf_hyperg_U_int_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_U_int(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Confluent hypergeometric function for integer parameters.
 * U(m,n,x)
 *
 * exceptions:
  }
function gsl_sf_hyperg_U_int_e10_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result_e10):longint;cdecl;external libgsl;
{ Confluent hypergeometric function.
 * U(a,b,x)
 *
 * exceptions:
  }
function gsl_sf_hyperg_U_e(a:Tdouble; b:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_U(a:Tdouble; b:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Confluent hypergeometric function.
 * U(a,b,x)
 *
 * exceptions:
  }
function gsl_sf_hyperg_U_e10_e(a:Tdouble; b:Tdouble; x:Tdouble; result:Pgsl_sf_result_e10):longint;cdecl;external libgsl;
{ Gauss hypergeometric function 2F1[a,b,c,x]
 * |x| < 1
 *
 * exceptions:
  }
function gsl_sf_hyperg_2F1_e(a:Tdouble; b:Tdouble; c:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_2F1(a:Tdouble; b:Tdouble; c:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Gauss hypergeometric function
 * 2F1[aR + I aI, aR - I aI, c, x]
 * |x| < 1
 *
 * exceptions:
  }
function gsl_sf_hyperg_2F1_conj_e(aR:Tdouble; aI:Tdouble; c:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_2F1_conj(aR:Tdouble; aI:Tdouble; c:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Renormalized Gauss hypergeometric function
 * 2F1[a,b,c,x] / Gamma[c]
 * |x| < 1
 *
 * exceptions:
  }
function gsl_sf_hyperg_2F1_renorm_e(a:Tdouble; b:Tdouble; c:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_2F1_renorm(a:Tdouble; b:Tdouble; c:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Renormalized Gauss hypergeometric function
 * 2F1[aR + I aI, aR - I aI, c, x] / Gamma[c]
 * |x| < 1
 *
 * exceptions:
  }
function gsl_sf_hyperg_2F1_conj_renorm_e(aR:Tdouble; aI:Tdouble; c:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_2F1_conj_renorm(aR:Tdouble; aI:Tdouble; c:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Mysterious hypergeometric function. The series representation
 * is a divergent hypergeometric series. However, for x < 0 we
 * have 2F0(a,b,x) = (-1/x)^a U(a,1+a-b,-1/x)
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_hyperg_2F0_e(a:Tdouble; b:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hyperg_2F0(a:Tdouble; b:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{$endif}
{ __GSL_SF_HYPERG_H__  }

// === Konventiert am: 22-8-25 13:58:32 ===


implementation



end.
