unit gskshadownode;

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

type
{*
 * GskShadow:
 * @color: the color of the shadow
 * @dx: the horizontal offset of the shadow
 * @dy: the vertical offset of the shadow
 * @radius: the radius of the shadow
 *
 * The shadow parameters in a shadow node.
  }
  PGskShadow = ^TGskShadow;
  TGskShadow = record
      color : TGdkRGBA;
      dx : single;
      dy : single;
      radius : single;
    end;


function gsk_shadow_node_get_type:TGType;cdecl;external libgtk4;
function gsk_shadow_node_new(child:PGskRenderNode; shadows:PGskShadow; n_shadows:Tgsize):PGskRenderNode;cdecl;external libgtk4;
function gsk_shadow_node_get_child(node:PGskRenderNode):PGskRenderNode;cdecl;external libgtk4;
function gsk_shadow_node_get_shadow(node:PGskRenderNode; i:Tgsize):PGskShadow;cdecl;external libgtk4;
function gsk_shadow_node_get_n_shadows(node:PGskRenderNode):Tgsize;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 13:35:29 ===

function GSK_TYPE_SHADOW_NODE : TGType;

implementation

function GSK_TYPE_SHADOW_NODE : TGType;
  begin
    GSK_TYPE_SHADOW_NODE:=gsk_shadow_node_get_type;
  end;



end.
