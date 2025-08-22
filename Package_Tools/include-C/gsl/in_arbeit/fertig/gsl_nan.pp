
unit gsl_nan;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_nan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_nan.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_nan.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_NAN_H__}
{$define __GSL_NAN_H__}

{ was #define dname def_expr }
function GSL_NAN : longint; { return type might be wrong }

{ was #define dname def_expr }
function GSL_POSZERO : longint; { return type might be wrong }

const
  GSL_NEGZERO = -(0.0);  
{$endif}
{ __GSL_NAN_H__  }

implementation

{ was #define dname def_expr }
function GSL_NAN : longint; { return type might be wrong }
  begin
    GSL_NAN:=gsl_nan;
  end;

{ was #define dname def_expr }
function GSL_POSZERO : longint; { return type might be wrong }
  begin
    GSL_POSZERO:=+(0.0);
  end;


end.
