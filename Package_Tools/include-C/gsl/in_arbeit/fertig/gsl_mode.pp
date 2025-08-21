
unit gsl_mode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_mode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_mode.h
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
Pgsl_mode_t  = ^gsl_mode_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_mode.h
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
{ Author:  B. Gough and G. Jungman  }
{$ifndef __GSL_MODE_H__}
{$define __GSL_MODE_H__}
{$include <gsl/gsl_inline.h>}
{ Some functions can take a mode argument. This
 * is a rough method to do things like control
 * the precision of the algorithm. This mainly
 * occurs in special functions, but we figured
 * it was ok to have a general facility.
 *
 * The mode type is 32-bit field. Most of
 * the fields are currently unused. Users
 * '|' various predefined constants to get
 * a desired mode.
  }
type
  Pgsl_mode_t = ^Tgsl_mode_t;
  Tgsl_mode_t = dword;
{ Here are the predefined constants.
 * Note that the precision constants
 * are special because they are used
 * to index arrays, so do not change
 * them. The precision information is
 * in the low order 3 bits of gsl_mode_t
 * (the third bit is currently unused).
  }
{ Note that "0" is double precision,
 * so that you get that by default if
 * you forget a flag.
  }

const
  GSL_PREC_DOUBLE = 0;  
  GSL_PREC_SINGLE = 1;  
  GSL_PREC_APPROX = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GSL_MODE_PREC(mt : longint) : Tmt;

{ Here are some predefined generic modes.
  }
const
  GSL_MODE_DEFAULT = 0;  
{$endif}
{ __GSL_MODE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSL_MODE_PREC(mt : longint) : Tmt;
begin
  GSL_MODE_PREC:=Tmt(@(dword(7)));
end;


end.
