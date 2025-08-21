
unit gsl_fft_halfcomplex;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_fft_halfcomplex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_fft_halfcomplex.h
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
Pgsl_complex  = ^gsl_complex;
Pgsl_fft_halfcomplex_wavetable  = ^gsl_fft_halfcomplex_wavetable;
Pgsl_fft_real_workspace  = ^gsl_fft_real_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fft/gsl_fft_halfcomplex.h
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
{$ifndef __GSL_FFT_HALFCOMPLEX_H__}
{$define __GSL_FFT_HALFCOMPLEX_H__}
{$include <stddef.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_fft.h>}
{$include <gsl/gsl_fft_real.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_fft_halfcomplex_radix2_backward(data:Pdouble; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_radix2_inverse(data:Pdouble; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_radix2_transform(data:Pdouble; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
type
  Pgsl_fft_halfcomplex_wavetable = ^Tgsl_fft_halfcomplex_wavetable;
  Tgsl_fft_halfcomplex_wavetable = record
      n : Tsize_t;
      nf : Tsize_t;
      factor : array[0..63] of Tsize_t;
      twiddle : array[0..63] of Pgsl_complex;
      trig : Pgsl_complex;
    end;

function gsl_fft_halfcomplex_wavetable_alloc(n:Tsize_t):Pgsl_fft_halfcomplex_wavetable;cdecl;external;
procedure gsl_fft_halfcomplex_wavetable_free(wavetable:Pgsl_fft_halfcomplex_wavetable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_backward(data:Pdouble; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_halfcomplex_wavetable; work:Pgsl_fft_real_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_inverse(data:Pdouble; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_halfcomplex_wavetable; work:Pgsl_fft_real_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_transform(data:Pdouble; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_halfcomplex_wavetable; work:Pgsl_fft_real_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_unpack(halfcomplex_coefficient:Pdouble; complex_coefficient:Pdouble; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_halfcomplex_radix2_unpack(halfcomplex_coefficient:Pdouble; complex_coefficient:Pdouble; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
{$endif}
{ __GSL_FFT_HALFCOMPLEX_H__  }

implementation


end.
