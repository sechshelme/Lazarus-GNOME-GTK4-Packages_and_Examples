
unit gskradialgradientnode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskradialgradientnode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskradialgradientnode.h
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
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
Pgsize  = ^gsize;
PGskColorStop  = ^GskColorStop;
PGskRenderNode  = ^GskRenderNode;
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
function GSK_TYPE_RADIAL_GRADIENT_NODE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE : longint; { return type might be wrong }

function gsk_radial_gradient_node_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_radial_gradient_node_new(bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; start:single; 
           end:single; color_stops:PGskColorStop; n_color_stops:Tgsize):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gsk_radial_gradient_node_get_n_color_stops(node:PGskRenderNode):Tgsize;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_radial_gradient_node_get_color_stops(node:PGskRenderNode; n_stops:Pgsize):PGskColorStop;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_radial_gradient_node_get_center(node:PGskRenderNode):Pgraphene_point_t;cdecl;external;
(* Const before type ignored *)
function gsk_radial_gradient_node_get_hradius(node:PGskRenderNode):single;cdecl;external;
(* Const before type ignored *)
function gsk_radial_gradient_node_get_vradius(node:PGskRenderNode):single;cdecl;external;
(* Const before type ignored *)
function gsk_radial_gradient_node_get_start(node:PGskRenderNode):single;cdecl;external;
(* Const before type ignored *)
function gsk_radial_gradient_node_get_end(node:PGskRenderNode):single;cdecl;external;
function gsk_repeating_radial_gradient_node_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_repeating_radial_gradient_node_new(bounds:Pgraphene_rect_t; center:Pgraphene_point_t; hradius:single; vradius:single; start:single; 
           end:single; color_stops:PGskColorStop; n_color_stops:Tgsize):PGskRenderNode;cdecl;external;

implementation

{ was #define dname def_expr }
function GSK_TYPE_RADIAL_GRADIENT_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_RADIAL_GRADIENT_NODE:=gsk_radial_gradient_node_get_type;
  end;

{ was #define dname def_expr }
function GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE:=gsk_repeating_radial_gradient_node_get_type;
  end;


end.
