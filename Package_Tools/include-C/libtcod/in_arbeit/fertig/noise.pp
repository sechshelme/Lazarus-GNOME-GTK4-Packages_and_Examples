
unit noise;
interface

{
  Automatically converted by H2Pas 1.0.0 from noise.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    noise.h
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
Psingle  = ^single;
PTCOD_Noise  = ^TCOD_Noise;
PTCOD_noise_t  = ^TCOD_noise_t;
PTCOD_noise_type_t  = ^TCOD_noise_type_t;
PTCOD_Random  = ^TCOD_Random;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef _TCOD_PERLIN_H}
{$define _TCOD_PERLIN_H}
{$include "config.h"}
{$include "mersenne_types.h"}
{$include "noise_defaults.h"}
type
  PTCOD_noise_type_t = ^TTCOD_noise_type_t;
  TTCOD_noise_type_t =  Longint;
  Const
    TCOD_NOISE_PERLIN = 1;
    TCOD_NOISE_SIMPLEX = 2;
    TCOD_NOISE_WAVELET = 4;
    TCOD_NOISE_DEFAULT = 0;
;
{* Randomized map of indexes into buffer  }
{* Random 256 x ndim buffer  }
{ fractal stuff  }
{ noise type  }
type
  PTCOD_Noise = ^TTCOD_Noise;
  TTCOD_Noise = record
      ndim : longint;
      map : array[0..255] of byte;
      buffer : array[0..255] of array[0..(TCOD_NOISE_MAX_DIMENSIONS)-1] of single;
      H : single;
      lacunarity : single;
      exponent : array[0..(TCOD_NOISE_MAX_OCTAVES)-1] of single;
      waveletTileData : Psingle;
      rand : PTCOD_Random;
      noise_type : TTCOD_noise_type_t;
    end;

  PTCOD_noise_t = ^TTCOD_noise_t;
  TTCOD_noise_t = PTCOD_Noise;
{ C++ extern C conditionnal removed }
{ create a new noise object  }

function TCOD_noise_new(dimensions:longint; hurst:single; lacunarity:single; random:TTCOD_random_t):PTCOD_Noise;cdecl;external;
{ simplified API  }
procedure TCOD_noise_set_type(noise:PTCOD_Noise; _type:TTCOD_noise_type_t);cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get_ex(noise:PTCOD_Noise; f:Psingle; _type:TTCOD_noise_type_t):single;cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get_fbm_ex(noise:PTCOD_Noise; f:Psingle; octaves:single; _type:TTCOD_noise_type_t):single;cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get_turbulence_ex(noise:PTCOD_Noise; f:Psingle; octaves:single; _type:TTCOD_noise_type_t):single;cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get(noise:PTCOD_Noise; f:Psingle):single;cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get_fbm(noise:PTCOD_Noise; f:Psingle; octaves:single):single;cdecl;external;
(* Const before type ignored *)
function TCOD_noise_get_turbulence(noise:PTCOD_Noise; f:Psingle; octaves:single):single;cdecl;external;
{ delete the noise object  }
procedure TCOD_noise_delete(noise:PTCOD_Noise);cdecl;external;
{*
    Generate noise as a vectorized operation.

    `noise` is the TCOD_Noise object to be used.  Its dimensions will
    determine how many input arrays are required.

    `type` is which noise generator should be used.
    Can be `TCOD_NOISE_DEFAULT` to use the type set by the TCOD_Noise object.

    `n` is the length of the input and output arrrays.

    `x[n]`, `y[n]`, `z[n]`, `w[n]` are the input coordinates for the noise
    generator.  For a 2D generator you'd provide the `x[n]` and `y[n]` arrays
    and leave the remaining arrays as NULL.

    `out[n]` is the output array, which will receive the noise values.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
procedure TCOD_noise_get_vectorized(noise:PTCOD_Noise; _type:TTCOD_noise_type_t; n:longint; x:Psingle; y:Psingle; 
            z:Psingle; w:Psingle; out:Psingle);cdecl;external;
{*
    Generate noise as a vectorized operation with fractional Brownian motion.

    `octaves` are the number of samples to take.

    The remaining parameters are the same as `TCOD_noise_get_vectorized`.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
procedure TCOD_noise_get_fbm_vectorized(noise:PTCOD_Noise; _type:TTCOD_noise_type_t; octaves:single; n:longint; x:Psingle; 
            y:Psingle; z:Psingle; w:Psingle; out:Psingle);cdecl;external;
{*
    Generate noise as a vectorized operation with turbulence.

    `octaves` are the number of samples to take.

    The remaining parameters are the same as `TCOD_noise_get_vectorized`.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
procedure TCOD_noise_get_turbulence_vectorized(noise:PTCOD_Noise; _type:TTCOD_noise_type_t; octaves:single; n:longint; x:Psingle; 
            y:Psingle; z:Psingle; w:Psingle; out:Psingle);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
