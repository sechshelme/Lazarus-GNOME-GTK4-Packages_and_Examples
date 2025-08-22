
unit gsl_sf_hermite;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_hermite.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_hermite.h
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
Pdouble  = ^double;
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_sf_hermite.h
 * 
 * Copyright (C) 2011-2014 Konrad Griessinger
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
{----------------------------------------------------------------------*
 * (konradg(at)gmx.net)                                                 *
 *---------------------------------------------------------------------- }
{$ifndef __GSL_SF_HERMITE_H__}
{$define __GSL_SF_HERMITE_H__}
{$include <gsl/gsl_sf_result.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_hermite_prob_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob(n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_deriv_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_deriv(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite(n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_deriv_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_deriv(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func(n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_fast_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_fast(n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_array(nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_array_deriv(m:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_deriv_array(mmax:longint; n:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_series_e(n:longint; x:Tdouble; a:Pdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_series(n:longint; x:Tdouble; a:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_array(nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_array_deriv(m:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_deriv_array(mmax:longint; n:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_series_e(n:longint; x:Tdouble; a:Pdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_series(n:longint; x:Tdouble; a:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_array(nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_series_e(n:longint; x:Tdouble; a:Pdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_series(n:longint; x:Tdouble; a:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_der_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_der(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_zero_e(n:longint; s:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_zero(n:longint; s:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_zero_e(n:longint; s:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_zero(n:longint; s:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_zero_e(n:longint; s:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_func_zero(n:longint; s:longint):Tdouble;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_hermite_phys_e(n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys(n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_der_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_der(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_array(nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_series_e(n:longint; x:Tdouble; a:Pdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_series(n:longint; x:Tdouble; a:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_array_der(m:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_der_array(mmax:longint; n:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_zero_e(n:longint; s:longint; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_phys_zero(n:longint; s:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_array_der(m:longint; nmax:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_der_array(mmax:longint; n:longint; x:Tdouble; result_array:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_der_e(m:longint; n:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hermite_prob_der(m:longint; n:longint; x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ !GSL_DISABLE_DEPRECATED  }
{$endif}
{ __GSL_SF_HERMITE_H__  }

implementation


end.
