
unit shumate_path_layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_path_layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_path_layer.h
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
PGList  = ^GList;
PShumateLocation  = ^ShumateLocation;
PShumatePathLayer  = ^ShumatePathLayer;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2008 Pierre-Luc Beaudoin <pierre-luc@pierlux.com>
 * Copyright (C) 2011-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$ifndef SHUMATE_PATH_LAYER_H}
{$define SHUMATE_PATH_LAYER_H}
{$include <shumate/shumate-layer.h>}
{$include <shumate/shumate-location.h>}
{$include <gdk/gdk.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_PATH_LAYER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumatePathLayer, shumate_path_layer, SHUMATE, PATH_LAYER, ShumateLayer) }
function shumate_path_layer_new(viewport:PShumateViewport):PShumatePathLayer;cdecl;external;
procedure shumate_path_layer_add_node(self:PShumatePathLayer; location:PShumateLocation);cdecl;external;
procedure shumate_path_layer_remove_node(self:PShumatePathLayer; location:PShumateLocation);cdecl;external;
procedure shumate_path_layer_remove_all(self:PShumatePathLayer);cdecl;external;
procedure shumate_path_layer_insert_node(self:PShumatePathLayer; location:PShumateLocation; position:Tguint);cdecl;external;
function shumate_path_layer_get_nodes(self:PShumatePathLayer):PGList;cdecl;external;
function shumate_path_layer_get_fill_color(self:PShumatePathLayer):PGdkRGBA;cdecl;external;
(* Const before type ignored *)
procedure shumate_path_layer_set_fill_color(self:PShumatePathLayer; color:PGdkRGBA);cdecl;external;
function shumate_path_layer_get_stroke_color(self:PShumatePathLayer):PGdkRGBA;cdecl;external;
(* Const before type ignored *)
procedure shumate_path_layer_set_stroke_color(self:PShumatePathLayer; color:PGdkRGBA);cdecl;external;
function shumate_path_layer_get_outline_color(self:PShumatePathLayer):PGdkRGBA;cdecl;external;
(* Const before type ignored *)
procedure shumate_path_layer_set_outline_color(self:PShumatePathLayer; color:PGdkRGBA);cdecl;external;
function shumate_path_layer_get_fill(self:PShumatePathLayer):Tgboolean;cdecl;external;
procedure shumate_path_layer_set_fill(self:PShumatePathLayer; value:Tgboolean);cdecl;external;
function shumate_path_layer_get_stroke(self:PShumatePathLayer):Tgboolean;cdecl;external;
procedure shumate_path_layer_set_stroke(self:PShumatePathLayer; value:Tgboolean);cdecl;external;
function shumate_path_layer_get_stroke_width(self:PShumatePathLayer):Tdouble;cdecl;external;
procedure shumate_path_layer_set_stroke_width(self:PShumatePathLayer; value:Tdouble);cdecl;external;
function shumate_path_layer_get_outline_width(self:PShumatePathLayer):Tdouble;cdecl;external;
procedure shumate_path_layer_set_outline_width(self:PShumatePathLayer; value:Tdouble);cdecl;external;
function shumate_path_layer_get_closed(self:PShumatePathLayer):Tgboolean;cdecl;external;
procedure shumate_path_layer_set_closed(self:PShumatePathLayer; value:Tgboolean);cdecl;external;
function shumate_path_layer_get_dash(self:PShumatePathLayer):PGList;cdecl;external;
procedure shumate_path_layer_set_dash(self:PShumatePathLayer; dash_pattern:PGList);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_PATH_LAYER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_PATH_LAYER:=shumate_path_layer_get_type;
  end;


end.
