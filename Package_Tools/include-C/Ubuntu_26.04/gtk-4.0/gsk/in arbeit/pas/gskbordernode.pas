unit gskbordernode;

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

function gsk_border_node_get_type:TGType;cdecl;external libgtk4;
function gsk_border_node_new(outline:PGskRoundedRect; border_width:array[0..3] of single; border_color:array[0..3] of TGdkRGBA):PGskRenderNode;cdecl;external libgtk4;
function gsk_border_node_get_outline(node:PGskRenderNode):PGskRoundedRect;cdecl;external libgtk4;
function gsk_border_node_get_widths(node:PGskRenderNode):Psingle;cdecl;external libgtk4;
function gsk_border_node_get_colors(node:PGskRenderNode):PGdkRGBA;cdecl;external libgtk4;

// === Konventiert am: 4-7-26 20:09:37 ===

function GSK_TYPE_BORDER_NODE : TGType;

implementation

function GSK_TYPE_BORDER_NODE : TGType;
  begin
    GSK_TYPE_BORDER_NODE:=gsk_border_node_get_type;
  end;



end.
