
unit gsl_dft_complex;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_dft_complex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_dft_complex.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fft/gsl_dft_complex.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Brian Gough
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
{$ifndef __GSL_DFT_COMPLEX_H__}
{$define __GSL_DFT_COMPLEX_H__}
{$include <stddef.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_fft.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_dft_complex_forward(data:Pdouble; stride:Tsize_t; n:Tsize_t; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_dft_complex_backward(data:Pdouble; stride:Tsize_t; n:Tsize_t; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_dft_complex_inverse(data:Pdouble; stride:Tsize_t; n:Tsize_t; result:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_dft_complex_transform(data:Pdouble; stride:Tsize_t; n:Tsize_t; result:Pdouble; sign:Tgsl_fft_direction):longint;cdecl;external;
{$endif}
{ __GSL_DFT_COMPLEX_H__  }

implementation


end.
