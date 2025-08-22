
unit gsl_sf_debye;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_debye.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_debye.h
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


{ specfunc/gsl_sf_debye.h
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
{ augmented by D_5(x) and D_6(x) by Richard J. Mathar, 2005-11-08  }
{$ifndef __GSL_SF_DEBYE_H__}
{$define __GSL_SF_DEBYE_H__}
{$include <gsl/gsl_sf_result.h>}
{ D_n(x) := n/x^n Integrate[t^n/(e^t - 1), t,0,x]  }
{ D_1(x)
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)

function gsl_sf_debye_1_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_1(x:Tdouble):Tdouble;cdecl;external;
{ D_2(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_debye_2_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_2(x:Tdouble):Tdouble;cdecl;external;
{ D_3(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_debye_3_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_3(x:Tdouble):Tdouble;cdecl;external;
{ D_4(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_debye_4_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_4(x:Tdouble):Tdouble;cdecl;external;
{ D_5(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_debye_5_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_5(x:Tdouble):Tdouble;cdecl;external;
{ D_6(x)
 *
 * exceptions: GSL_EDOM, GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_debye_6_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_debye_6(x:Tdouble):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_DEBYE_H__  }

implementation


end.
