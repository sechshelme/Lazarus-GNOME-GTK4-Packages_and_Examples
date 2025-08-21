
unit gsl_monte;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_monte.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_monte.h
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
Pgsl_monte_function_struct  = ^gsl_monte_function_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ monte/gsl_monte.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Michael Booth
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
{ Some things common to all the Monte-Carlo implementations  }
{ Author: MJB  }
{$ifndef __GSL_MONTE_H__}
{$define __GSL_MONTE_H__}
{$include <stdlib.h>}
{ Hide the function type in a typedef so that we can use it in all our
   integration functions, and make it easy to change things.
 }
type
  Pgsl_monte_function_struct = ^Tgsl_monte_function_struct;
  Tgsl_monte_function_struct = record
      f : function (x_array:Pdouble; dim:Tsize_t; params:pointer):Tdouble;cdecl;
      dim : Tsize_t;
      params : pointer;
    end;

  Tgsl_monte_function_struct = Tgsl_monte_function;
{$endif}
{ __GSL_MONTE_H__  }

implementation


end.
