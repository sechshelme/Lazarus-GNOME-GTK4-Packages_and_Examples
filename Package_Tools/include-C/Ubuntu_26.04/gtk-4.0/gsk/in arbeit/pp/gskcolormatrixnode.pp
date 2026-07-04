
unit gskcolormatrixnode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskcolormatrixnode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskcolormatrixnode.h
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
Pgraphene_matrix_t  = ^graphene_matrix_t;
Pgraphene_vec4_t  = ^graphene_vec4_t;
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
{$include <cairo.h>}
type

{ was #define dname def_expr }
function GSK_TYPE_COLOR_MATRIX_NODE : longint; { return type might be wrong }

function gsk_color_matrix_node_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_color_matrix_node_new(child:PGskRenderNode; color_matrix:Pgraphene_matrix_t; color_offset:Pgraphene_vec4_t):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gsk_color_matrix_node_get_child(node:PGskRenderNode):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_color_matrix_node_get_color_matrix(node:PGskRenderNode):Pgraphene_matrix_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_color_matrix_node_get_color_offset(node:PGskRenderNode):Pgraphene_vec4_t;cdecl;external;

implementation

{ was #define dname def_expr }
function GSK_TYPE_COLOR_MATRIX_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_COLOR_MATRIX_NODE:=gsk_color_matrix_node_get_type;
  end;


end.
