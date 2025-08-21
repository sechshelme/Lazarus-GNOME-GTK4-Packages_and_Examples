
unit gsl_fft_complex;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_fft_complex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_fft_complex.h
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
Pgsl_fft_complex_wavetable  = ^gsl_fft_complex_wavetable;
Pgsl_fft_complex_workspace  = ^gsl_fft_complex_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fft/gsl_fft_complex.h
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
{$ifndef __GSL_FFT_COMPLEX_H__}
{$define __GSL_FFT_COMPLEX_H__}
{$include <stddef.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_fft.h>}
{  Power of 2 routines   }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_fft_complex_radix2_forward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_backward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_inverse(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_transform(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; sign:Tgsl_fft_direction):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_dif_forward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_dif_backward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_dif_inverse(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_radix2_dif_transform(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; sign:Tgsl_fft_direction):longint;cdecl;external;
{  Mixed Radix general-N routines   }
type
  Pgsl_fft_complex_wavetable = ^Tgsl_fft_complex_wavetable;
  Tgsl_fft_complex_wavetable = record
      n : Tsize_t;
      nf : Tsize_t;
      factor : array[0..63] of Tsize_t;
      twiddle : array[0..63] of Pgsl_complex;
      trig : Pgsl_complex;
    end;

  Pgsl_fft_complex_workspace = ^Tgsl_fft_complex_workspace;
  Tgsl_fft_complex_workspace = record
      n : Tsize_t;
      scratch : Pdouble;
    end;

function gsl_fft_complex_wavetable_alloc(n:Tsize_t):Pgsl_fft_complex_wavetable;cdecl;external;
procedure gsl_fft_complex_wavetable_free(wavetable:Pgsl_fft_complex_wavetable);cdecl;external;
function gsl_fft_complex_workspace_alloc(n:Tsize_t):Pgsl_fft_complex_workspace;cdecl;external;
procedure gsl_fft_complex_workspace_free(workspace:Pgsl_fft_complex_workspace);cdecl;external;
function gsl_fft_complex_memcpy(dest:Pgsl_fft_complex_wavetable; src:Pgsl_fft_complex_wavetable):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_forward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable; work:Pgsl_fft_complex_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_backward(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable; work:Pgsl_fft_complex_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_inverse(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable; work:Pgsl_fft_complex_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_transform(data:Tgsl_complex_packed_array; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable; work:Pgsl_fft_complex_workspace; 
           sign:Tgsl_fft_direction):longint;cdecl;external;
{$endif}
{ __GSL_FFT_COMPLEX_H__  }

implementation


end.
