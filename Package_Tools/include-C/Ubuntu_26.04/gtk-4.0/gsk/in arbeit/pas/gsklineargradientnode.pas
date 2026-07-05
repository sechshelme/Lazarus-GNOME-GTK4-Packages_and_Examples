unit gsklineargradientnode;

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
{$include <gsk/gskrendernode.h>}
type

{ was #define dname def_expr }
function GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE : longint; { return type might be wrong }

function gsk_linear_gradient_node_get_type:TGType;cdecl;external libgtk4;
function gsk_linear_gradient_node_new(bounds:Pgraphene_rect_t; start:Pgraphene_point_t; end:Pgraphene_point_t; color_stops:PGskColorStop; n_color_stops:Tgsize):PGskRenderNode;cdecl;external libgtk4;
function gsk_linear_gradient_node_get_start(node:PGskRenderNode):Pgraphene_point_t;cdecl;external libgtk4;
function gsk_linear_gradient_node_get_end(node:PGskRenderNode):Pgraphene_point_t;cdecl;external libgtk4;
function gsk_linear_gradient_node_get_n_color_stops(node:PGskRenderNode):Tgsize;cdecl;external libgtk4;
function gsk_linear_gradient_node_get_color_stops(node:PGskRenderNode; n_stops:Pgsize):PGskColorStop;cdecl;external libgtk4;
function gsk_repeating_linear_gradient_node_get_type:TGType;cdecl;external libgtk4;
function gsk_repeating_linear_gradient_node_new(bounds:Pgraphene_rect_t; start:Pgraphene_point_t; end:Pgraphene_point_t; color_stops:PGskColorStop; n_color_stops:Tgsize):PGskRenderNode;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 13:31:52 ===

function GSK_TYPE_LINEAR_GRADIENT_NODE : TGType;

implementation

function GSK_TYPE_LINEAR_GRADIENT_NODE : TGType;
  begin
    GSK_TYPE_LINEAR_GRADIENT_NODE:=gsk_linear_gradient_node_get_type;
  end;


{ was #define dname def_expr }
function GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE:=gsk_repeating_linear_gradient_node_get_type;
  end;


end.
