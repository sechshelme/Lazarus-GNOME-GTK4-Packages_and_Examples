
unit gsl_sf_airy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_airy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_airy.h
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


{ specfunc/gsl_sf_airy.h
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
{$ifndef __GSL_SF_AIRY_H__}
{$define __GSL_SF_AIRY_H__}
{$include <gsl/gsl_mode.h>}
{$include <gsl/gsl_sf_result.h>}
{ Airy function Ai(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_sf_airy_Ai_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Ai(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ Airy function Bi(x)
 *
 * exceptions: GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_airy_Bi_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Bi(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ scaled Ai(x):
 *                     Ai(x)   x < 0
 *   exp(+2/3 x^3/2) Ai(x)   x > 0
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_airy_Ai_scaled_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Ai_scaled(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ scaled Bi(x):
 *                     Bi(x)   x < 0
 *   exp(-2/3 x^3/2) Bi(x)   x > 0
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_airy_Bi_scaled_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Bi_scaled(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ derivative Ai'(x)
 *
 * exceptions: GSL_EUNDRFLW
  }
(* Const before type ignored *)
function gsl_sf_airy_Ai_deriv_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Ai_deriv(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ derivative Bi'(x)
 *
 * exceptions: GSL_EOVRFLW
  }
(* Const before type ignored *)
function gsl_sf_airy_Bi_deriv_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Bi_deriv(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ scaled derivative Ai'(x):
 *                     Ai'(x)   x < 0
 *   exp(+2/3 x^3/2) Ai'(x)   x > 0
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_airy_Ai_deriv_scaled_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Ai_deriv_scaled(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ scaled derivative:
 *                     Bi'(x)   x < 0
 *   exp(-2/3 x^3/2) Bi'(x)   x > 0
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_airy_Bi_deriv_scaled_e(x:Tdouble; mode:Tgsl_mode_t; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_airy_Bi_deriv_scaled(x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
{ Zeros of Ai(x)
  }
function gsl_sf_airy_zero_Ai_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_airy_zero_Ai(s:dword):Tdouble;cdecl;external;
{ Zeros of Bi(x)
  }
function gsl_sf_airy_zero_Bi_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_airy_zero_Bi(s:dword):Tdouble;cdecl;external;
{ Zeros of Ai'(x)
  }
function gsl_sf_airy_zero_Ai_deriv_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_airy_zero_Ai_deriv(s:dword):Tdouble;cdecl;external;
{ Zeros of Bi'(x)
  }
function gsl_sf_airy_zero_Bi_deriv_e(s:dword; result:Pgsl_sf_result):longint;cdecl;external;
function gsl_sf_airy_zero_Bi_deriv(s:dword):Tdouble;cdecl;external;
{$endif}
{ __GSL_SF_AIRY_H__  }

implementation


end.
