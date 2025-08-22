
unit gsl_precision;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_precision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_precision.h
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
Pgsl_prec_t  = ^gsl_prec_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_precision.h
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
{ Author:  B. Gough and G. Jungman  }
{$ifndef __GSL_PRECISION_H__}
{$define __GSL_PRECISION_H__}
{$include <gsl/gsl_types.h>}
{ A type for the precision indicator.
 * This is mainly for pedagogy.
  }
type
  Pgsl_prec_t = ^Tgsl_prec_t;
  Tgsl_prec_t = dword;
{ The number of precision types.
 * Remember that precision-mode
 * can index an array.
  }

const
  _GSL_PREC_T_NUM = 3;  
{ Arrays containing derived
 * precision constants for the
 * different precision levels.
  }
(* Const before type ignored *)
  var
    gsl_prec_eps : Pdouble;cvar;external;
(* Const before type ignored *)
    gsl_prec_sqrt_eps : Pdouble;cvar;external;
(* Const before type ignored *)
    gsl_prec_root3_eps : Pdouble;cvar;external;
(* Const before type ignored *)
    gsl_prec_root4_eps : Pdouble;cvar;external;
(* Const before type ignored *)
    gsl_prec_root5_eps : Pdouble;cvar;external;
(* Const before type ignored *)
    gsl_prec_root6_eps : Pdouble;cvar;external;
{$endif}
{ __GSL_PRECISION_H__  }

implementation


end.
