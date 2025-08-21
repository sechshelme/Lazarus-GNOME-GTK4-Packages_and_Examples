
unit gsl_fft_complex_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_fft_complex_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_fft_complex_float.h
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
Pgsl_complex_float  = ^gsl_complex_float;
Pgsl_fft_complex_wavetable_float  = ^gsl_fft_complex_wavetable_float;
Pgsl_fft_complex_workspace_float  = ^gsl_fft_complex_workspace_float;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fft/gsl_fft_complex_float.h
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
{$ifndef __GSL_FFT_COMPLEX_FLOAT_H__}
{$define __GSL_FFT_COMPLEX_FLOAT_H__}
{$include <stddef.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_complex.h>}
{$include <gsl/gsl_fft.h>}
{  Power of 2 routines   }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_fft_complex_float_radix2_forward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_backward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_inverse(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_transform(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; sign:Tgsl_fft_direction):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_dif_forward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_dif_backward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_dif_inverse(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_radix2_dif_transform(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; sign:Tgsl_fft_direction):longint;cdecl;external;
{  Mixed Radix general-N routines   }
type
  Pgsl_fft_complex_wavetable_float = ^Tgsl_fft_complex_wavetable_float;
  Tgsl_fft_complex_wavetable_float = record
      n : Tsize_t;
      nf : Tsize_t;
      factor : array[0..63] of Tsize_t;
      twiddle : array[0..63] of Pgsl_complex_float;
      trig : Pgsl_complex_float;
    end;

  Pgsl_fft_complex_workspace_float = ^Tgsl_fft_complex_workspace_float;
  Tgsl_fft_complex_workspace_float = record
      n : Tsize_t;
      scratch : Psingle;
    end;

function gsl_fft_complex_wavetable_float_alloc(n:Tsize_t):Pgsl_fft_complex_wavetable_float;cdecl;external;
procedure gsl_fft_complex_wavetable_float_free(wavetable:Pgsl_fft_complex_wavetable_float);cdecl;external;
function gsl_fft_complex_workspace_float_alloc(n:Tsize_t):Pgsl_fft_complex_workspace_float;cdecl;external;
procedure gsl_fft_complex_workspace_float_free(workspace:Pgsl_fft_complex_workspace_float);cdecl;external;
function gsl_fft_complex_float_memcpy(dest:Pgsl_fft_complex_wavetable_float; src:Pgsl_fft_complex_wavetable_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_forward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable_float; work:Pgsl_fft_complex_workspace_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_backward(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable_float; work:Pgsl_fft_complex_workspace_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_inverse(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable_float; work:Pgsl_fft_complex_workspace_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_fft_complex_float_transform(data:Tgsl_complex_packed_array_float; stride:Tsize_t; n:Tsize_t; wavetable:Pgsl_fft_complex_wavetable_float; work:Pgsl_fft_complex_workspace_float; 
           sign:Tgsl_fft_direction):longint;cdecl;external;
{$endif}
{ __GSL_FFT_COMPLEX_FLOAT_H__  }

implementation


end.
