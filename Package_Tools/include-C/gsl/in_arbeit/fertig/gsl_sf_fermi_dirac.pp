
unit gsl_sf_fermi_dirac;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_fermi_dirac.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_fermi_dirac.h
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


{ specfunc/gsl_sf_fermi_dirac.h
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
{$ifndef __GSL_SF_FERMI_DIRAC_H__}
{$define __GSL_SF_FERMI_DIRAC_H__}
{$include <gsl/gsl_sf_result.h>}
{ Complete Fermi-Dirac Integrals:
 *
 *  F_j(x)   := 1/Gamma[j+1] Integral[ t^j /(Exp[t-x] + 1), t,0,Infinity]
 *
 *
 * Incomplete Fermi-Dirac Integrals:
 *
 *  F_j(x,b) := 1/Gamma[j+1] Integral[ t^j /(Exp[t-x] + 1), t,b,Infinity]
  }
{ Complete integral F_-1(x) = e^x / (1 + e^x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)

function gsl_sf_fermi_dirac_m1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_m1(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_0(x) = ln(1 + e^x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_0_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_0(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_1(x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_1(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_2(x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_2(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_j(x)
 * for integer j
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_fermi_dirac_int_e(j:longint; x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_fermi_dirac_int(j:longint; x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_-1/2(x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_mhalf_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_mhalf(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_1/2(x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_half_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_half(x:Tdouble):Tdouble;cdecl;external;
{ Complete integral F_3/2(x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_fermi_dirac_3half_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_fermi_dirac_3half(x:Tdouble):Tdouble;cdecl;external;
{ Incomplete integral F_0(x,b) = ln(1 + e^(b-x)) - (b-x)
 *
 * exceptions: GSL_EUNDRFLW, GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_fermi_dirac_inc_0_e(x:Tdouble; b:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_fermi_dirac_inc_0(x:Tdouble; b:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_FERMI_DIRAC_H__  }

implementation


end.
