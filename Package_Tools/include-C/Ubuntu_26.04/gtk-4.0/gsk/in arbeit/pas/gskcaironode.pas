unit gskcaironode;

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
{$include <cairo.h>}
type

function gsk_cairo_node_get_type:TGType;cdecl;external libgtk4;
function gsk_cairo_node_new(bounds:Pgraphene_rect_t):PGskRenderNode;cdecl;external libgtk4;
function gsk_cairo_node_get_draw_context(node:PGskRenderNode):Pcairo_t;cdecl;external libgtk4;
function gsk_cairo_node_get_surface(node:PGskRenderNode):Pcairo_surface_t;cdecl;external libgtk4;

// === Konventiert am: 4-7-26 20:09:33 ===

function GSK_TYPE_CAIRO_NODE : TGType;

implementation

function GSK_TYPE_CAIRO_NODE : TGType;
  begin
    GSK_TYPE_CAIRO_NODE:=gsk_cairo_node_get_type;
  end;



end.
