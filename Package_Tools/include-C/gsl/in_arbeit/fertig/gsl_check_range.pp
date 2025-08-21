
unit gsl_check_range;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_check_range.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_check_range.h
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


{ vector/gsl_check_range.h
 * 
 * Copyright (C) 2003, 2004, 2007 Brian Gough
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
{$ifndef __GSL_CHECK_RANGE_H__}
{$define __GSL_CHECK_RANGE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
  var
    gsl_check_range : longint;cvar;external;
{ Turn range checking on by default, unless the user defines
   GSL_RANGE_CHECK_OFF, or defines GSL_RANGE_CHECK to 0 explicitly  }

const
  GSL_RANGE_CHECK = 0;  
{$endif}
{ __GSL_CHECK_RANGE_H__  }

implementation


end.
