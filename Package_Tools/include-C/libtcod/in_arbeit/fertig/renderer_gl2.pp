
unit renderer_gl2;
interface

{
  Automatically converted by H2Pas 1.0.0 from renderer_gl2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    renderer_gl2.h
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
PSDL_Window  = ^SDL_Window;
PTCOD_Context  = ^TCOD_Context;
PTCOD_RendererGL2  = ^TCOD_RendererGL2;
PTCOD_Tileset  = ^TCOD_Tileset;
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
{$ifndef LIBTCOD_RENDERER_GL2_H_}
{$define LIBTCOD_RENDERER_GL2_H_}
{$include <stdbool.h>}
{$include "config.h"}
{$include "renderer_gl.h"}
{$include "tileset.h"}
type
  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
      {undefined structure}
    end;

{ ch, fg, bg }
  PTCOD_RendererGL2 = ^TTCOD_RendererGL2;
  TTCOD_RendererGL2 = record
      common : TTCOD_RendererGLCommon;
      program : Tuint32_t;
      console_textures : array[0..2] of Tuint32_t;
      console_width : longint;
      console_height : longint;
      vertex_buffer : Tuint32_t;
    end;

(* Const before type ignored *)

function TCOD_renderer_new_gl2(x:longint; y:longint; width:longint; height:longint; title:Pchar; 
           window_flags:longint; vsync:longint; tileset:PTCOD_Tileset):PTCOD_Context;cdecl;external;
{$endif}
{ LIBTCOD_RENDERER_GL2_H_ }

implementation


end.
