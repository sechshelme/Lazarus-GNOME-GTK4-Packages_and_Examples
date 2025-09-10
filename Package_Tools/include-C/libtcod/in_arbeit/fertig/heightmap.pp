
unit heightmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from heightmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    heightmap.h
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
Plongint  = ^longint;
Psingle  = ^single;
PTCOD_heightmap_t  = ^TCOD_heightmap_t;
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
{$ifndef _TCOD_HEIGHTMAP_H}
{$define _TCOD_HEIGHTMAP_H}
{$include "mersenne_types.h"}
{$include "noise.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type
  PTCOD_heightmap_t = ^TTCOD_heightmap_t;
  TTCOD_heightmap_t = record
      w : longint;
      h : longint;
      values : Psingle;
    end;

function TCOD_heightmap_new(w:longint; h:longint):PTCOD_heightmap_t;cdecl;external;
procedure TCOD_heightmap_delete(hm:PTCOD_heightmap_t);cdecl;external;
(* Const before type ignored *)
function TCOD_heightmap_get_value(hm:PTCOD_heightmap_t; x:longint; y:longint):single;cdecl;external;
(* Const before type ignored *)
function TCOD_heightmap_get_interpolated_value(hm:PTCOD_heightmap_t; x:single; y:single):single;cdecl;external;
procedure TCOD_heightmap_set_value(hm:PTCOD_heightmap_t; x:longint; y:longint; value:single);cdecl;external;
(* Const before type ignored *)
function TCOD_heightmap_get_slope(hm:PTCOD_heightmap_t; x:longint; y:longint):single;cdecl;external;
(* Const before type ignored *)
procedure TCOD_heightmap_get_normal(hm:PTCOD_heightmap_t; x:single; y:single; n:array[0..2] of single; waterLevel:single);cdecl;external;
(* Const before type ignored *)
function TCOD_heightmap_count_cells(hm:PTCOD_heightmap_t; min:single; max:single):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_heightmap_has_land_on_border(hm:PTCOD_heightmap_t; waterLevel:single):Tbool;cdecl;external;
(* Const before type ignored *)
procedure TCOD_heightmap_get_minmax(hm:PTCOD_heightmap_t; min:Psingle; max:Psingle);cdecl;external;
(* Const before type ignored *)
procedure TCOD_heightmap_copy(hm_source:PTCOD_heightmap_t; hm_dest:PTCOD_heightmap_t);cdecl;external;
procedure TCOD_heightmap_add(hm:PTCOD_heightmap_t; value:single);cdecl;external;
procedure TCOD_heightmap_scale(hm:PTCOD_heightmap_t; value:single);cdecl;external;
procedure TCOD_heightmap_clamp(hm:PTCOD_heightmap_t; min:single; max:single);cdecl;external;
procedure TCOD_heightmap_normalize(hm:PTCOD_heightmap_t; min:single; max:single);cdecl;external;
procedure TCOD_heightmap_clear(hm:PTCOD_heightmap_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_heightmap_lerp_hm(hm1:PTCOD_heightmap_t; hm2:PTCOD_heightmap_t; out:PTCOD_heightmap_t; coef:single);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_heightmap_add_hm(hm1:PTCOD_heightmap_t; hm2:PTCOD_heightmap_t; out:PTCOD_heightmap_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_heightmap_multiply_hm(hm1:PTCOD_heightmap_t; hm2:PTCOD_heightmap_t; out:PTCOD_heightmap_t);cdecl;external;
procedure TCOD_heightmap_add_hill(hm:PTCOD_heightmap_t; hx:single; hy:single; h_radius:single; h_height:single);cdecl;external;
procedure TCOD_heightmap_dig_hill(hm:PTCOD_heightmap_t; hx:single; hy:single; h_radius:single; h_height:single);cdecl;external;
procedure TCOD_heightmap_dig_bezier(hm:PTCOD_heightmap_t; px:array[0..3] of longint; py:array[0..3] of longint; startRadius:single; startDepth:single; 
            endRadius:single; endDepth:single);cdecl;external;
procedure TCOD_heightmap_rain_erosion(hm:PTCOD_heightmap_t; nbDrops:longint; erosionCoef:single; sedimentationCoef:single; rnd:TTCOD_random_t);cdecl;external;
{  void TCOD_heightmap_heat_erosion(TCOD_heightmap_t *hm, int nbPass,float minSlope,float erosionCoef,float
 * sedimentationCoef,TCOD_random_t rnd);  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_heightmap_kernel_transform(hm:PTCOD_heightmap_t; kernelsize:longint; dx:Plongint; dy:Plongint; weight:Psingle; 
            minLevel:single; maxLevel:single);cdecl;external;
(* Const before type ignored *)
procedure TCOD_heightmap_add_voronoi(hm:PTCOD_heightmap_t; nbPoints:longint; nbCoef:longint; coef:Psingle; rnd:TTCOD_random_t);cdecl;external;
procedure TCOD_heightmap_mid_point_displacement(hm:PTCOD_heightmap_t; rnd:TTCOD_random_t; roughness:single);cdecl;external;
procedure TCOD_heightmap_add_fbm(hm:PTCOD_heightmap_t; noise:TTCOD_noise_t; mul_x:single; mul_y:single; add_x:single; 
            add_y:single; octaves:single; delta:single; scale:single);cdecl;external;
procedure TCOD_heightmap_scale_fbm(hm:PTCOD_heightmap_t; noise:TTCOD_noise_t; mul_x:single; mul_y:single; add_x:single; 
            add_y:single; octaves:single; delta:single; scale:single);cdecl;external;
procedure TCOD_heightmap_islandify(hm:PTCOD_heightmap_t; seaLevel:single; rnd:TTCOD_random_t);cdecl;external;
{ xxxxxx TCOD_DEPRECATED("This function does nothing and will be removed.") }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
