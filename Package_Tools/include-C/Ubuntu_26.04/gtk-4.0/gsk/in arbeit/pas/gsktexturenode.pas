unit gsktexturenode;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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
type

function gsk_texture_node_get_type:TGType;cdecl;external libgtk4;
function gsk_texture_node_new(texture:PGdkTexture; bounds:Pgraphene_rect_t):PGskRenderNode;cdecl;external libgtk4;
function gsk_texture_node_get_texture(node:PGskRenderNode):PGdkTexture;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 13:38:59 ===

function GSK_TYPE_TEXTURE_NODE : TGType;

implementation

function GSK_TYPE_TEXTURE_NODE : TGType;
  begin
    GSK_TYPE_TEXTURE_NODE:=gsk_texture_node_get_type;
  end;



end.
