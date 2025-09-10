
unit renderer_gl;
interface

{
  Automatically converted by H2Pas 1.0.0 from renderer_gl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    renderer_gl.h
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
PSDL_Window  = ^SDL_Window;
PTCOD_RendererGLCommon  = ^TCOD_RendererGLCommon;
PTCOD_Tileset  = ^TCOD_Tileset;
PTCOD_TilesetAtlasOpenGL  = ^TCOD_TilesetAtlasOpenGL;
PTCOD_TilesetObserver  = ^TCOD_TilesetObserver;
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
{$ifndef LIBTCOD_RENDERER_GL_H_}
{$define LIBTCOD_RENDERER_GL_H_}
{$include <stdint.h>}
{$include "config.h"}
{$include "tileset.h"}
type
  PTCOD_TilesetAtlasOpenGL = ^TTCOD_TilesetAtlasOpenGL;
  TTCOD_TilesetAtlasOpenGL = record
      tileset : PTCOD_Tileset;
      observer : PTCOD_TilesetObserver;
      texture : Tuint32_t;
      texture_size : longint;
      texture_columns : longint;
      texture_rows : longint;
    end;

{ Mouse cursor transform values of the last viewport used. }
  PTCOD_RendererGLCommon = ^TTCOD_RendererGLCommon;
  TTCOD_RendererGLCommon = record
      window : PSDL_Window;
      glcontext : pointer;
      atlas : PTCOD_TilesetAtlasOpenGL;
      sdl_subsystems : Tuint32_t;
      last_offset_x : Tdouble;
      last_offset_y : Tdouble;
      last_scale_x : Tdouble;
      last_scale_y : Tdouble;
    end;

{ C++ extern C conditionnal removed }
{ __cplusplus }

function TCOD_gl_atlas_new(tileset:PTCOD_Tileset):PTCOD_TilesetAtlasOpenGL;cdecl;external;
procedure TCOD_gl_atlas_delete(atlas:PTCOD_TilesetAtlasOpenGL);cdecl;external;
{ __cplusplus }
{$endif}
{ LIBTCOD_RENDERER_GL_H_ }

implementation


end.
