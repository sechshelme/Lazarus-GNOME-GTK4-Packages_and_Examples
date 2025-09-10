
unit fov_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from fov_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fov_types.h
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
PTCOD_fov_algorithm_t  = ^TCOD_fov_algorithm_t;
PTCOD_Map  = ^TCOD_Map;
PTCOD_map_t  = ^TCOD_map_t;
PTCOD_MapCell  = ^TCOD_MapCell;
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
{$ifndef TCOD_FOV_TYPES_H_}
{$define TCOD_FOV_TYPES_H_}
{$include "portability.h"}
{*
 *  Private map cell struct.
  }
type
  PTCOD_MapCell = ^TTCOD_MapCell;
  TTCOD_MapCell = record
      transparent : Tbool;
      walkable : Tbool;
      fov : Tbool;
    end;

{*
 *  Private map struct.
  }

  PTCOD_Map = ^TTCOD_Map;
  TTCOD_Map = record
      width : longint;
      height : longint;
      nbcells : longint;
      cells : PTCOD_MapCell;
    end;

  PTCOD_map_t = ^TTCOD_map_t;
  TTCOD_map_t = PTCOD_Map;
{*
    \rst
    Field-of-view options for :any:`TCOD_map_compute_fov`.
    \endrst
  }
{*
      Trace multiple Bresenham lines along the perimeter.

      Based on: http://www.roguebasin.com/index.php?title=Ray_casting
    }
{*
      Cast Bresenham line shadows on a per-tile basis.

      Based on: http://www.oocities.org/temerra/los_rays.html
    }
{*
      Recursive Shadowcast.

      Based on: http://www.roguebasin.com/index.php?title=FOV_using_recursive_shadowcasting
    }
{*
      Precise Permissive Field of View.

      Based on: http://www.roguebasin.com/index.php?title=Precise_Permissive_Field_of_View
    }
{*
      Mingos' Restrictive Precise Angle Shadowcasting (contribution by Mingos)

      Based on: http://www.roguebasin.com/index.php?title=Restrictive_Precise_Angle_Shadowcasting
    }
{*
      Symmetric Shadowcast.

      Based on: https://www.albertford.com/shadowcasting/
      \rst
      .. versionadded :: 1.16
      \endrst
    }

  PTCOD_fov_algorithm_t = ^TTCOD_fov_algorithm_t;
  TTCOD_fov_algorithm_t =  Longint;
  Const
    FOV_BASIC = 0;
    FOV_DIAMOND = 1;
    FOV_SHADOW = 2;
    FOV_PERMISSIVE_0 = 3;
    FOV_PERMISSIVE_1 = 4;
    FOV_PERMISSIVE_2 = 5;
    FOV_PERMISSIVE_3 = 6;
    FOV_PERMISSIVE_4 = 7;
    FOV_PERMISSIVE_5 = 8;
    FOV_PERMISSIVE_6 = 9;
    FOV_PERMISSIVE_7 = 10;
    FOV_PERMISSIVE_8 = 11;
    FOV_RESTRICTIVE = 12;
    FOV_SYMMETRIC_SHADOWCAST = 13;
    NB_FOV_ALGORITHMS = 14;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function FOV_PERMISSIVE(x : longint) : TTCOD_fov_algorithm_t;

{$endif}
{ TCOD_FOV_TYPES_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function FOV_PERMISSIVE(x : longint) : TTCOD_fov_algorithm_t;
begin
  FOV_PERMISSIVE:=TTCOD_fov_algorithm_t(FOV_PERMISSIVE_0+x);
end;


end.
