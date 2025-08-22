
unit gsl_sf_zeta;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_zeta.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_zeta.h
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


{ specfunc/gsl_sf_zeta.h
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
{$ifndef __GSL_SF_ZETA_H__}
{$define __GSL_SF_ZETA_H__}
{$include <gsl/gsl_sf_result.h>}
{ Riemann Zeta Function
 * zeta(n) = Sum[ k^(-n), k,1,Infinity ]
 *
 * n=integer, n != 1
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)

function gsl_sf_zeta_int_e(n:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_zeta_int(n:longint):Tdouble;cdecl;external;
{ Riemann Zeta Function
 * zeta(x) = Sum[ k^(-s), k,1,Infinity ], s != 1.0
 *
 * s != 1.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_zeta_e(s:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_zeta(s:Tdouble):Tdouble;cdecl;external;
{ Riemann Zeta Function minus 1
 *   useful for evaluating the fractional part
 *   of Riemann zeta for large argument
 *
 * s != 1.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_zetam1_e(s:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_zetam1(s:Tdouble):Tdouble;cdecl;external;
{ Riemann Zeta Function minus 1 for integer arg
 *   useful for evaluating the fractional part
 *   of Riemann zeta for large argument
 *
 * s != 1.0
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_zetam1_int_e(s:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_zetam1_int(s:longint):Tdouble;cdecl;external;
{ Hurwitz Zeta Function
 * zeta(s,q) = Sum[ (k+q)^(-s), k,0,Infinity ]
 *
 * s > 1.0, q > 0.0
 * exceptions: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hzeta_e(s:Tdouble; q:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hzeta(s:Tdouble; q:Tdouble):Tdouble;cdecl;external;
{ Eta Function
 * eta(n) = (1-2^(1-n)) zeta(n)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
function gsl_sf_eta_int_e(n:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_eta_int(n:longint):Tdouble;cdecl;external;
{ Eta Function
 * eta(s) = (1-2^(1-s)) zeta(s)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_eta_e(s:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_eta(s:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_ZETA_H__  }

implementation


end.
