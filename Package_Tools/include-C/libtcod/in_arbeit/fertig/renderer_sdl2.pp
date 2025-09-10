
unit renderer_sdl2;
interface

{
  Automatically converted by H2Pas 1.0.0 from renderer_sdl2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    renderer_sdl2.h
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
Pchar  = ^char;
PSDL_Renderer  = ^SDL_Renderer;
PSDL_Texture  = ^SDL_Texture;
PSDL_Window  = ^SDL_Window;
PTCOD_Console  = ^TCOD_Console;
PTCOD_Context  = ^TCOD_Context;
PTCOD_RendererSDL2  = ^TCOD_RendererSDL2;
PTCOD_Tileset  = ^TCOD_Tileset;
PTCOD_TilesetAtlasSDL2  = ^TCOD_TilesetAtlasSDL2;
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
{$ifndef LIBTCOD_RENDERER_SDL2_H_}
{$define LIBTCOD_RENDERER_SDL2_H_}
{$include <stdbool.h>}
{$include "config.h"}
{$include "console.h"}
{$include "context.h"}
{$include "error.h"}
{$include "tileset.h"}
type
  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
      {undefined structure}
    end;

  PSDL_Renderer = ^TSDL_Renderer;
  TSDL_Renderer = record
      {undefined structure}
    end;

  PSDL_Texture = ^TSDL_Texture;
  TSDL_Texture = record
      {undefined structure}
    end;

{*
    An SDL2 tileset atlas.  This prepares a tileset for use with SDL2.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
{* The renderer used to create this atlas.  }
{* The atlas texture.  }
{* The tileset used to create this atlas. Internal use only.  }
{* Internal use only.  }
{* Internal use only.  }
  PTCOD_TilesetAtlasSDL2 = ^TTCOD_TilesetAtlasSDL2;
  TTCOD_TilesetAtlasSDL2 = record
      renderer : PSDL_Renderer;
      texture : PSDL_Texture;
      tileset : PTCOD_Tileset;
      observer : PTCOD_TilesetObserver;
      texture_columns : longint;
    end;

{*
    The renderer data for an SDL2 rendering context.
    Internal use only.
  }
{ Mouse cursor transform values of the last viewport used. }
  PTCOD_RendererSDL2 = ^TTCOD_RendererSDL2;
  TTCOD_RendererSDL2 = record
      window : PSDL_Window;
      renderer : PSDL_Renderer;
      atlas : PTCOD_TilesetAtlasSDL2;
      cache_console : PTCOD_Console;
      cache_texture : PSDL_Texture;
      sdl_subsystems : Tuint32_t;
      last_offset_x : Tdouble;
      last_offset_y : Tdouble;
      last_scale_x : Tdouble;
      last_scale_y : Tdouble;
    end;

{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
    Return a libtcod rendering context using an SDL2 renderer.
  }
(* Const before type ignored *)

function TCOD_renderer_init_sdl2(x:longint; y:longint; width:longint; height:longint; title:Pchar; 
           window_flags:longint; renderer_flags:longint; tileset:PTCOD_Tileset):PTCOD_Context;cdecl;external;
{*
    Return a new SDL2 atlas created from a tileset for an SDL2 renderer.

    You may delete the tileset if you no longer have use for it.

    Will return NULL on an error, you can check the error with
    `TCOD_get_error`.
  }
function TCOD_sdl2_atlas_new(renderer:PSDL_Renderer; tileset:PTCOD_Tileset):PTCOD_TilesetAtlasSDL2;cdecl;external;
{*
    Delete an SDL2 tileset atlas.
  }
procedure TCOD_sdl2_atlas_delete(atlas:PTCOD_TilesetAtlasSDL2);cdecl;external;
{*
    Setup a cache and target texture for rendering.

    `atlas` is an SDL2 atlas created with `TCOD_sdl2_atlas_new`.
    The renderer used to make this `atlas` must support
    `SDL_RENDERER_TARGETTEXTURE`.

    `console` is a non-NULL pointer to the libtcod console you want to render.

    `cache` can be NULL, or be pointer to a console pointer.
    If `*cache` is NULL then a console will be created.
    If `*cache` isn't NULL then the console pointed to might be deleted or
    recreated if it does not match the size of `console`.

    `target` must be a pointer to where you want the output texture to be placed.
    The texture at `*target` may be deleted or recreated.  When this function
    is successful then the texture at `*target` will be non-NULL and will be
    exactly fitted to the size of `console` and the tile size of `atlas`.

    If SDL2 ever provides a `SDL_RENDER_TARGETS_RESET` event then the console
    at `*cache` must be deleted and set to NULL, or else the next render will
    only partially update the texture at `*target`.

    Returns a negative value on an error, check `TCOD_get_error`.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_sdl2_render_texture_setup(atlas:PTCOD_TilesetAtlasSDL2; console:PTCOD_Console; cache:PPTCOD_Console; target:PPSDL_Texture):TTCOD_Error;cdecl;external;
{*
    Render a console onto a managed target texture.

    This function assumes that `cache` and `target` are valid.
    You can use `TCOD_sdl2_render_texture_setup` to automatically prepare these
    objects for use with this function.

    `atlas` is an SDL2 atlas created with `TCOD_sdl2_atlas_new`.
    The renderer used to make this `atlas` must support
    `SDL_RENDERER_TARGETTEXTURE`, unless `target` is NULL.

    `console` is a non-NULL pointer to the libtcod console you want to render.

    `cache` can be NULL, or point to a console the same size as `console`.

    `target` can be NULL, or be pointer an SDL2 texture used as the output.
    If `target` is not NULL then it should be the size of the console times the
    size of the individual tiles to fit the entire output.

    If `target` is NULL then the current render target is used instead, the
    drawn area will not be scaled to fit the render target.

    If SDL2 ever provides a `SDL_RENDER_TARGETS_RESET` event then the console
    at `cache` must be cleared, or else the next render will only partially
    update the texture of `target`.

    Returns a negative value on an error, check `TCOD_get_error`.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_sdl2_render_texture(atlas:PTCOD_TilesetAtlasSDL2; console:PTCOD_Console; cache:PTCOD_Console; target:PSDL_Texture):TTCOD_Error;cdecl;external;
{ __cplusplus }
{$endif}
{ LIBTCOD_RENDERER_SDL2_H_ }

implementation


end.
