
unit gegl_random;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_random.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_random.h
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
PGeglRandom  = ^GeglRandom;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2006 Øyvind Kolås
 * Copyright 2013 Téo Mazars <teomazars@gmail.com>
  }
{$ifndef __GEGL_RANDOM_H__}
{$define __GEGL_RANDOM_H__}
{$include "gegl-types.h"}
{**
 * Random numbers:
 *
 * GEGL provides functions to generate deterministic random numbers,
 * based on a seed and on 2D coordinates. It allows to reproduce the
 * same sequence of random numbers in both CPU and GPU devices where
 * operations are not done in the same order.
  }
{*
 * gegl_random_new_with_seed:
 * @seed: an integer seed, change for different permutation.
 *
 * Return an opaque structure associated to the seed.
 * This structure needs to be freed by the user with gegl_random_free();
  }

function gegl_random_new_with_seed(seed:Tguint32):PGeglRandom;cdecl;external;
{*
 * gegl_random_new:
 *
 * Creates a new random number generator initialized with a random seed.
 * This structure needs to be freed by the user with gegl_random_free();
  }
function gegl_random_new:PGeglRandom;cdecl;external;
{*
 * gegl_random_duplicate:
 * @rand: The GeglRandom to duplicate
 *
 * Return a new copy of an existing GeglRandom
  }
function gegl_random_duplicate(rand:PGeglRandom):PGeglRandom;cdecl;external;
{*
 * gegl_random_free:
 * @rand: The GeglRandom structure to free
 *
 * Free a GeglRandom structure created with gegl_random_new() or
 * gegl_random_new_with_seed()
  }
procedure gegl_random_free(rand:PGeglRandom);cdecl;external;
{*
 * gegl_random_set_seed:
 * @rand: The GeglRandom to set
 * @seed: an integer seed, change for different permutation.
 *
 * Change the seed of an existing GeglRandom.
  }
procedure gegl_random_set_seed(rand:PGeglRandom; seed:Tguint32);cdecl;external;
{*
 * gegl_random_float_range:
 * @rand: a GeglRandom
 * @x: x coordinate
 * @y: y coordinate
 * @z: z coordinate (mipmap level)
 * @n: number no (each x,y coordinate provides its own sequence of
 * numbers
 * @min: minimum value
 * @max: maximum value
 *
 * Return a random floating point number in the range specified,
 * for the given x,y coordinates and GeglRandom provided, if multiple different
 * numbers are needed pass in incrementing n's.
  }
(* Const before type ignored *)
function gegl_random_float_range(rand:PGeglRandom; x:Tgint; y:Tgint; z:Tgint; n:Tgint; 
           min:Tgfloat; max:Tgfloat):Tgfloat;cdecl;external;
{*
 * gegl_random_int_range:
 * @rand: a GeglRandom
 * @x: x coordinate
 * @y: y coordinate
 * @z: z coordinate (mipmap level)
 * @n: number no (each x,y coordinate provides its own sequence of
 * numbers
 * @min: minimum value
 * @max: maximum value+1
 *
 * Return a random integer point number in the range specified,
 * for the given x,y coordinates and GeglRandom provided, if multiple different
 * numbers are needed pass in incrementing n's.
  }
(* Const before type ignored *)
function gegl_random_int_range(rand:PGeglRandom; x:Tgint; y:Tgint; z:Tgint; n:Tgint; 
           min:Tgint; max:Tgint):Tgint32;cdecl;external;
{*
 * gegl_random_int:
 * @rand: a GeglRandom
 * @x: x coordinate
 * @y: y coordinate
 * @z: z coordinate (mipmap level)
 * @n: number no (each x,y coordinate provides its own sequence of
 * numbers
 *
 * Return a random integer number in range 0 .. MAX_UINT
  }
(* Const before type ignored *)
function gegl_random_int(rand:PGeglRandom; x:Tgint; y:Tgint; z:Tgint; n:Tgint):Tguint32;cdecl;external;
{*
 * gegl_random_float:
 * @rand: a GeglRandom
 * @x: x coordinate
 * @y: y coordinate
 * @z: z coordinate (mipmap level)
 * @n: number no (each x,y coordinate provides its own sequence of
 * numbers
 *
 * Return a random floating point number in range 0.0 .. 1.0.
  }
(* Const before type ignored *)
function gegl_random_float(rand:PGeglRandom; x:Tgint; y:Tgint; z:Tgint; n:Tgint):Tgfloat;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GeglRandom, gegl_random_free) }
{$endif}
{ __GEGL_RANDOM_H__  }

implementation


end.
