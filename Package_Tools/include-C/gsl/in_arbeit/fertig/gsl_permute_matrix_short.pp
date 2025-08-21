
unit gsl_permute_matrix_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_permute_matrix_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_permute_matrix_short.h
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
Pgsl_matrix_short  = ^gsl_matrix_short;
Pgsl_permutation  = ^gsl_permutation;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ permutation/gsl_permute_matrix_short.h
 * 
 * Copyright (C) 2016 Patrick Alken
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
{$ifndef __GSL_PERMUTE_MATRIX_SHORT_H__}
{$define __GSL_PERMUTE_MATRIX_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_permutation.h>}
{$include <gsl/gsl_matrix_short.h>}
(* Const before type ignored *)

function gsl_permute_matrix_short(p:Pgsl_permutation; A:Pgsl_matrix_short):longint;cdecl;external;
{$endif}
{ __GSL_PERMUTE_MATRIX_SHORT_H__  }

implementation


end.
