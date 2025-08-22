
unit gsl_sf_expint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_expint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_expint.h
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


{ specfunc/gsl_sf_expint.h
 * 
 * Copyright (C) 2007 Brian Gough
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002 Gerard Jungman
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
{$ifndef __GSL_SF_EXPINT_H__}
{$define __GSL_SF_EXPINT_H__}
{$include <gsl/gsl_sf_result.h>}
{ E_1(x) := Re[ Integrate[ Exp[-xt]/t, t,1,Infinity] ]
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)

function gsl_sf_expint_E1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_E1(x:Tdouble):Tdouble;cdecl;external;
{ E_2(x) := Re[ Integrate[ Exp[-xt]/t^2, t,1,Infinity] ]
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_expint_E2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_E2(x:Tdouble):Tdouble;cdecl;external;
{ E_n(x) := Re[ Integrate[ Exp[-xt]/t^n, t,1,Infinity] ]
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_expint_En_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_expint_En(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ E_1_scaled(x) := exp(x) E_1(x)
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_expint_E1_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_E1_scaled(x:Tdouble):Tdouble;cdecl;external;
{ E_2_scaled(x) := exp(x) E_2(x)
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_expint_E2_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_E2_scaled(x:Tdouble):Tdouble;cdecl;external;
{ E_n_scaled(x) := exp(x) E_n(x)
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_expint_En_scaled_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_expint_En_scaled(n:longint; x:Tdouble):Tdouble;cdecl;external;
{ Ei(x) := - PV Integrate[ Exp[-t]/t, t,-x,Infinity]
 *       :=   PV Integrate[ Exp[t]/t, t,-Infinity,x]
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_expint_Ei_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_Ei(x:Tdouble):Tdouble;cdecl;external;
{ Ei_scaled(x) := exp(-x) Ei(x)
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_expint_Ei_scaled_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_expint_Ei_scaled(x:Tdouble):Tdouble;cdecl;external;
{ Shi(x) := Integrate[ Sinh[t]/t, t,0,x]
 *
 * exceptions: GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_Shi_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_Shi(x:Tdouble):Tdouble;cdecl;external;
{ Chi(x) := Re[ M_EULER + log(x) + Integrate[(Cosh[t]-1)/t, t,0,x] ]
 *
 * x != 0.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_Chi_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_Chi(x:Tdouble):Tdouble;cdecl;external;
{ Ei_3(x) := Integral[ Exp[-t^3], t,0,x]
 *
 * x >= 0.0
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
function gsl_sf_expint_3_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_expint_3(x:Tdouble):Tdouble;cdecl;external;
{ Si(x) := Integrate[ Sin[t]/t, t,0,x]
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_Si_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_Si(x:Tdouble):Tdouble;cdecl;external;
{ Ci(x) := -Integrate[ Cos[t]/t, t,x,Infinity]
 *
 * x > 0.0
 * exceptions: GSL_EDOM 
  }
(* Const before type ignored *)
function gsl_sf_Ci_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_Ci(x:Tdouble):Tdouble;cdecl;external;
{ AtanInt(x) := Integral[ Arctan[t]/t, t,0,x]
 *
 *
 * exceptions:
  }
(* Const before type ignored *)
function gsl_sf_atanint_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_atanint(x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_EXPINT_H__  }

implementation


end.
