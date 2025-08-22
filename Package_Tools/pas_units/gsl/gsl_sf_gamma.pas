unit gsl_sf_gamma;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_gamma.h
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
{$ifndef __GSL_SF_GAMMA_H__}
{$define __GSL_SF_GAMMA_H__}
{$include <gsl/gsl_sf_result.h>}
{ Log[Gamma(x)], x not a negative integer
 * Uses real Lanczos method.
 * Returns the real part of Log[Gamma[x]] when x < 0,
 * i.e. Log[|Gamma[x]|].
 *
 * exceptions: GSL_EDOM, GSL_EROUND
  }

function gsl_sf_lngamma_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lngamma(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log[Gamma(x)], x not a negative integer
 * Uses real Lanczos method. Determines
 * the sign of Gamma[x] as well as Log[|Gamma[x]|] for x < 0.
 * So Gamma[x] = sgn * Exp[result_lg].
 *
 * exceptions: GSL_EDOM, GSL_EROUND
  }
function gsl_sf_lngamma_sgn_e(x:Tdouble; result_lg:Pgsl_sf_result; sgn:Pdouble):longint;cdecl;external libgsl;
{ Gamma(x), x not a negative integer
 * Uses real Lanczos method.
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EROUND
  }
function gsl_sf_gamma_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gamma(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Regulated Gamma Function, x > 0
 * Gamma^*(x) = Gamma(x)/(Sqrt[2Pi] x^(x-1/2) exp(-x))
 *            = (1 + 1/(12x) + ...),  x->Inf
 * A useful suggestion of Temme.
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_gammastar_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gammastar(x:Tdouble):Tdouble;cdecl;external libgsl;
{ 1/Gamma(x)
 * Uses real Lanczos method.
 *
 * exceptions: GSL_EUNDRFLW, GSL_EROUND
  }
function gsl_sf_gammainv_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gammainv(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log[Gamma(z)] for z complex, z not a negative integer
 * Uses complex Lanczos method. Note that the phase part (arg)
 * is not well-determined when |z| is very large, due
 * to inevitable roundoff in restricting to (-Pi,Pi].
 * This will raise the GSL_ELOSS exception when it occurs.
 * The absolute value part (lnr), however, never suffers.
 *
 * Calculates:
 *   lnr = log|Gamma(z)|
 *   arg = arg(Gamma(z))  in (-Pi, Pi]
 *
 * exceptions: GSL_EDOM, GSL_ELOSS
  }
function gsl_sf_lngamma_complex_e(zr:Tdouble; zi:Tdouble; lnr:Pgsl_sf_result; arg:Pgsl_sf_result):longint;cdecl;external libgsl;
{ x^n / n!
 *
 * x >= 0.0, n >= 0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
function gsl_sf_taylorcoeff_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_taylorcoeff(n:longint; x:Tdouble):Tdouble;cdecl;external libgsl;
{ n!
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_fact_e(n:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_fact(n:dword):Tdouble;cdecl;external libgsl;
{ n!! = n(n-2)(n-4) ... 
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_doublefact_e(n:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_doublefact(n:dword):Tdouble;cdecl;external libgsl;
{ log(n!) 
 * Faster than ln(Gamma(n+1)) for n < 170; defers for larger n.
 *
 * exceptions: none
  }
function gsl_sf_lnfact_e(n:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lnfact(n:dword):Tdouble;cdecl;external libgsl;
{ log(n!!) 
 *
 * exceptions: none
  }
function gsl_sf_lndoublefact_e(n:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lndoublefact(n:dword):Tdouble;cdecl;external libgsl;
{ log(n choose m)
 *
 * exceptions: GSL_EDOM 
  }
function gsl_sf_lnchoose_e(n:dword; m:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lnchoose(n:dword; m:dword):Tdouble;cdecl;external libgsl;
{ n choose m
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_choose_e(n:dword; m:dword; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_choose(n:dword; m:dword):Tdouble;cdecl;external libgsl;
{ Logarithm of Pochhammer (Apell) symbol
 *   log( (a)_x )
 *   where (a)_x := Gamma[a + x]/Gamma[a]
 *
 * a > 0, a+x > 0
 *
 * exceptions:  GSL_EDOM
  }
function gsl_sf_lnpoch_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lnpoch(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Logarithm of Pochhammer (Apell) symbol, with sign information.
 *   result = log( |(a)_x| )
 *   sgn    = sgn( (a)_x )
 *   where (a)_x := Gamma[a + x]/Gamma[a]
 *
 * a != neg integer, a+x != neg integer
 *
 * exceptions:  GSL_EDOM
  }
function gsl_sf_lnpoch_sgn_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result; sgn:Pdouble):longint;cdecl;external libgsl;
{ Pochhammer (Apell) symbol
 *   (a)_x := Gamma[a + x]/Gamma[x]
 *
 * a != neg integer, a+x != neg integer
 *
 * exceptions:  GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_poch_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_poch(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Relative Pochhammer (Apell) symbol
 *   ((a,x) - 1)/x
 *   where (a,x) = (a)_x := Gamma[a + x]/Gamma[a]
 *
 * exceptions:  GSL_EDOM
  }
function gsl_sf_pochrel_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_pochrel(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Normalized Incomplete Gamma Function
 *
 * Q(a,x) = 1/Gamma(a) Integral[ t^(a-1) e^(-t), t,x,Infinity ]
 *
 * a >= 0, x >= 0
 *   Q(a,0) := 1
 *   Q(0,x) := 0, x != 0
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_gamma_inc_Q_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gamma_inc_Q(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Complementary Normalized Incomplete Gamma Function
 *
 * P(a,x) = 1/Gamma(a) Integral[ t^(a-1) e^(-t), t,0,x ]
 *
 * a > 0, x >= 0
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_gamma_inc_P_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gamma_inc_P(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Non-normalized Incomplete Gamma Function
 *
 * Gamma(a,x) := Integral[ t^(a-1) e^(-t), t,x,Infinity ]
 *
 * x >= 0.0
 *   Gamma(a, 0) := Gamma(a)
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_gamma_inc_e(a:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_gamma_inc(a:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ Logarithm of Beta Function
 * Log[B(a,b)]
 *
 * a > 0, b > 0
 * exceptions: GSL_EDOM
  }
function gsl_sf_lnbeta_e(a:Tdouble; b:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lnbeta(a:Tdouble; b:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_lnbeta_sgn_e(x:Tdouble; y:Tdouble; result:Pgsl_sf_result; sgn:Pdouble):longint;cdecl;external libgsl;
{ Beta Function
 * B(a,b)
 *
 * a > 0, b > 0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
function gsl_sf_beta_e(a:Tdouble; b:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_beta(a:Tdouble; b:Tdouble):Tdouble;cdecl;external libgsl;
{ Normalized Incomplete Beta Function
 * B_x(a,b)/B(a,b)
 *
 * a > 0, b > 0, 0 <= x <= 1
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
function gsl_sf_beta_inc_e(a:Tdouble; b:Tdouble; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_beta_inc(a:Tdouble; b:Tdouble; x:Tdouble):Tdouble;cdecl;external libgsl;
{ The maximum x such that gamma(x) is not
 * considered an overflow.
  }
const
  GSL_SF_GAMMA_XMAX = 171.0;  
{ The maximum n such that gsl_sf_fact(n) does not give an overflow.  }
  GSL_SF_FACT_NMAX = 170;  
{ The maximum n such that gsl_sf_doublefact(n) does not give an overflow.  }
  GSL_SF_DOUBLEFACT_NMAX = 297;  
{$endif}
{ __GSL_SF_GAMMA_H__  }

// === Konventiert am: 22-8-25 14:04:41 ===


implementation



end.
