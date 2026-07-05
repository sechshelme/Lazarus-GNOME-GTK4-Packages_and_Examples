
unit gsktextnode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsktextnode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsktextnode.h
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
PGdkRGBA  = ^GdkRGBA;
Pgraphene_point_t  = ^graphene_point_t;
PGskRenderNode  = ^GskRenderNode;
Pguint  = ^guint;
PPangoFont  = ^PangoFont;
PPangoGlyphInfo  = ^PangoGlyphInfo;
PPangoGlyphString  = ^PangoGlyphString;
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

{ was #define dname def_expr }
function GSK_TYPE_TEXT_NODE : longint; { return type might be wrong }

function gsk_text_node_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_text_node_new(font:PPangoFont; glyphs:PPangoGlyphString; color:PGdkRGBA; offset:Pgraphene_point_t):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gsk_text_node_get_font(node:PGskRenderNode):PPangoFont;cdecl;external;
(* Const before type ignored *)
function gsk_text_node_has_color_glyphs(node:PGskRenderNode):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsk_text_node_get_num_glyphs(node:PGskRenderNode):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_text_node_get_glyphs(node:PGskRenderNode; n_glyphs:Pguint):PPangoGlyphInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_text_node_get_color(node:PGskRenderNode):PGdkRGBA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_text_node_get_offset(node:PGskRenderNode):Pgraphene_point_t;cdecl;external;

implementation

{ was #define dname def_expr }
function GSK_TYPE_TEXT_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_TEXT_NODE:=gsk_text_node_get_type;
  end;


end.
