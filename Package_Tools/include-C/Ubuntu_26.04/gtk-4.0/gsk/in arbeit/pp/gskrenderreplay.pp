
unit gskrenderreplay;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskrenderreplay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskrenderreplay.h
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
PGdkTexture  = ^GdkTexture;
PGskRenderNode  = ^GskRenderNode;
PGskRenderReplay  = ^GskRenderReplay;
PGskRenderReplayFontFilter  = ^GskRenderReplayFontFilter;
PGskRenderReplayNodeFilter  = ^GskRenderReplayNodeFilter;
PGskRenderReplayTextureFilter  = ^GskRenderReplayTextureFilter;
PPangoFont  = ^PangoFont;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2025  Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}
{*
 * GskRenderReplayNodeFilter:
 * @replay: The replay object used to replay the node
 * @node: The node to replay
 * @user_data: The user data
 *
 * A function to replay a node.
 *
 * The node may be returned unmodified.
 *
 * The node may be discarded by returning %NULL.
 *
 * If you do not want to do any handling yourself, call
 * [method@Gsk.RenderReplay.default] to use the default handler
 * that calls your function on the children of the node.
 *
 * Returns: (transfer full) (nullable): The replayed node
 *
 * Since: 4.22
  }
type
  PGskRenderReplayNodeFilter = ^TGskRenderReplayNodeFilter;
  TGskRenderReplayNodeFilter = function (replay:PGskRenderReplay; node:PGskRenderNode; user_data:Tgpointer):PGskRenderNode;cdecl;
{*
 * GskRenderReplayTextureFilter:
 * @replay: The replay object used to replay the node
 * @texture: The texture to filter
 * @user_data: The user data
 *
 * A function that filters textures.
 *
 * The function will be called by the default replay function for
 * all nodes with textures. They will then generate a node using the
 * returned texture.
 *
 * It is valid for the function to return the passed in texture if
 * the texture shuld not be modified.
 *
 * Returns: (transfer full): The filtered texture
 *
 * Since: 4.22
  }

  PGskRenderReplayTextureFilter = ^TGskRenderReplayTextureFilter;
  TGskRenderReplayTextureFilter = function (replay:PGskRenderReplay; texture:PGdkTexture; user_data:Tgpointer):PGdkTexture;cdecl;
{*
 * GskRenderReplayFontFilter:
 * @replay: The replay object used to replay the node
 * @font: The font to filter
 * @user_data: The user data
 *
 * A function that filters fonts.
 *
 * The function will be called by the default replay function for
 * all nodes with fonts. They will then generate a node using the
 * returned font.
 *
 * It is valid for the function to return the passed in font if
 * the font shuld not be modified.
 *
 * Returns: (transfer full): The filtered font
 *
 * Since: 4.22
  }

  PGskRenderReplayFontFilter = ^TGskRenderReplayFontFilter;
  TGskRenderReplayFontFilter = function (replay:PGskRenderReplay; font:PPangoFont; user_data:Tgpointer):PPangoFont;cdecl;

function gsk_render_replay_get_type:TGType;cdecl;external;
function gsk_render_replay_new:PGskRenderReplay;cdecl;external;
procedure gsk_render_replay_free(self:PGskRenderReplay);cdecl;external;
procedure gsk_render_replay_set_node_filter(self:PGskRenderReplay; filter:TGskRenderReplayNodeFilter; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external;
function gsk_render_replay_filter_node(self:PGskRenderReplay; node:PGskRenderNode):PGskRenderNode;cdecl;external;
function gsk_render_replay_default(self:PGskRenderReplay; node:PGskRenderNode):PGskRenderNode;cdecl;external;
procedure gsk_render_replay_set_texture_filter(self:PGskRenderReplay; filter:TGskRenderReplayTextureFilter; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external;
function gsk_render_replay_filter_texture(self:PGskRenderReplay; texture:PGdkTexture):PGdkTexture;cdecl;external;
procedure gsk_render_replay_set_font_filter(self:PGskRenderReplay; filter:TGskRenderReplayFontFilter; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external;
function gsk_render_replay_filter_font(self:PGskRenderReplay; font:PPangoFont):PPangoFont;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskRenderReplay, gsk_render_replay_free) }

implementation


end.
