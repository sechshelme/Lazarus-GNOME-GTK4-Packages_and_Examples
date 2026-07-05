
unit gskrendernode;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskrendernode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskrendernode.h
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
Pcairo_t  = ^cairo_t;
Pchar  = ^char;
PGBytes  = ^GBytes;
PGError  = ^GError;
Pgraphene_rect_t  = ^graphene_rect_t;
Pgsize  = ^gsize;
PGskColorStop  = ^GskColorStop;
PGskParseLocation  = ^GskParseLocation;
PGskRenderNode  = ^GskRenderNode;
PGValue  = ^GValue;
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
{$include <gsk/gskroundedrect.h>}
{$include <gsk/gsktypes.h>}
{$include <gtk/css/gtkcss.h>}

{ was #define dname def_expr }
function GSK_TYPE_RENDER_NODE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_IS_RENDER_NODE(obj : longint) : longint;

{ was #define dname def_expr }
function GSK_SERIALIZATION_ERROR : longint; { return type might be wrong }

type
{*
 * GskColorStop:
 * @offset: the offset of the color stop
 * @color: the color at the given offset
 *
 * A color stop in a gradient node.
  }
  PGskColorStop = ^TGskColorStop;
  TGskColorStop = record
      offset : single;
      color : TGdkRGBA;
    end;

{*
 * GskParseLocation:
 * @bytes: the offset of the location in the parse buffer, as bytes
 * @chars: the offset of the location in the parse buffer, as characters
 * @lines: the line of the location in the parse buffer
 * @line_bytes: the position in the line, as bytes
 * @line_chars: the position in the line, as characters
 *
 * A location in a parse buffer.
  }
  PGskParseLocation = ^TGskParseLocation;
  TGskParseLocation = record
      bytes : Tgsize;
      chars : Tgsize;
      lines : Tgsize;
      line_bytes : Tgsize;
      line_chars : Tgsize;
    end;

{*
 * GskParseErrorFunc:
 * @start: start of the error location
 * @end: end of the error location
 * @error: the error
 * @user_data: user data
 *
 * Type of callback that is called when an error occurs
 * during node deserialization.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TGskParseErrorFunc = procedure (start:PGskParseLocation; end:PGskParseLocation; error:PGError; user_data:Tgpointer);cdecl;

function gsk_render_node_get_type:TGType;cdecl;external;
function gsk_serialization_error_quark:TGQuark;cdecl;external;
function gsk_render_node_ref(node:PGskRenderNode):PGskRenderNode;cdecl;external;
procedure gsk_render_node_unref(node:PGskRenderNode);cdecl;external;
(* Const before type ignored *)
function gsk_render_node_get_node_type(node:PGskRenderNode):TGskRenderNodeType;cdecl;external;
procedure gsk_render_node_get_bounds(node:PGskRenderNode; bounds:Pgraphene_rect_t);cdecl;external;
function gsk_render_node_get_children(self:PGskRenderNode; n_children:Pgsize):^PGskRenderNode;cdecl;external;
function gsk_render_node_get_opaque_rect(self:PGskRenderNode; out_opaque:Pgraphene_rect_t):Tgboolean;cdecl;external;
procedure gsk_render_node_draw(node:PGskRenderNode; cr:Pcairo_t);cdecl;external;
function gsk_render_node_serialize(node:PGskRenderNode):PGBytes;cdecl;external;
(* Const before type ignored *)
function gsk_render_node_write_to_file(node:PGskRenderNode; filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
function gsk_render_node_deserialize(bytes:PGBytes; error_func:TGskParseErrorFunc; user_data:Tgpointer):PGskRenderNode;cdecl;external;
{*
 * GSK_VALUE_HOLDS_RENDER_NODE:
 * @value: a `GValue`
 *
 * Evaluates to true if @value was initialized with `GSK_TYPE_RENDER_NODE`.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_VALUE_HOLDS_RENDER_NODE(value : longint) : longint;

procedure gsk_value_set_render_node(value:PGValue; node:PGskRenderNode);cdecl;external;
procedure gsk_value_take_render_node(value:PGValue; node:PGskRenderNode);cdecl;external;
(* Const before type ignored *)
function gsk_value_get_render_node(value:PGValue):PGskRenderNode;cdecl;external;
(* Const before type ignored *)
function gsk_value_dup_render_node(value:PGValue):PGskRenderNode;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskRenderNode, gsk_render_node_unref) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_RENDER_NODE : longint; { return type might be wrong }
  begin
    GSK_TYPE_RENDER_NODE:=gsk_render_node_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_IS_RENDER_NODE(obj : longint) : longint;
begin
  GSK_IS_RENDER_NODE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GSK_TYPE_RENDER_NODE);
end;

{ was #define dname def_expr }
function GSK_SERIALIZATION_ERROR : longint; { return type might be wrong }
  begin
    GSK_SERIALIZATION_ERROR:=gsk_serialization_error_quark;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSK_VALUE_HOLDS_RENDER_NODE(value : longint) : longint;
begin
  GSK_VALUE_HOLDS_RENDER_NODE:=G_VALUE_HOLDS(value,GSK_TYPE_RENDER_NODE);
end;


end.
