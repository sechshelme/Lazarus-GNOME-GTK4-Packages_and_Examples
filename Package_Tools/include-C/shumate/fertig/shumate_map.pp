
unit shumate_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_map.h
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
PShumateLayer  = ^ShumateLayer;
PShumateMap  = ^ShumateMap;
PShumateMapSource  = ^ShumateMapSource;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2008 Pierre-Luc Beaudoin <pierre-luc@pierlux.com>
 * Copyright (C) 2010-2013 Jiri Techet <techet@gmail.com>
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
{$ifndef SHUMATE_MAP_H}
{$define SHUMATE_MAP_H}
{$include <shumate/shumate-layer.h>}
{$include <shumate/shumate-map-source.h>}
{$include <shumate/shumate-viewport.h>}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_MAP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateMap, shumate_map, SHUMATE, MAP, GtkWidget) }
function shumate_map_new:PShumateMap;cdecl;external;
function shumate_map_new_simple:PShumateMap;cdecl;external;
function shumate_map_get_viewport(self:PShumateMap):PShumateViewport;cdecl;external;
procedure shumate_map_center_on(self:PShumateMap; latitude:Tdouble; longitude:Tdouble);cdecl;external;
procedure shumate_map_go_to(self:PShumateMap; latitude:Tdouble; longitude:Tdouble);cdecl;external;
procedure shumate_map_go_to_full(self:PShumateMap; latitude:Tdouble; longitude:Tdouble; zoom_level:Tdouble);cdecl;external;
procedure shumate_map_go_to_full_with_duration(self:PShumateMap; latitude:Tdouble; longitude:Tdouble; zoom_level:Tdouble; duration_ms:Tguint);cdecl;external;
procedure shumate_map_zoom_in(self:PShumateMap);cdecl;external;
procedure shumate_map_zoom_out(self:PShumateMap);cdecl;external;
procedure shumate_map_stop_go_to(self:PShumateMap);cdecl;external;
function shumate_map_get_go_to_duration(self:PShumateMap):Tguint;cdecl;external;
procedure shumate_map_set_go_to_duration(self:PShumateMap; duration:Tguint);cdecl;external;
procedure shumate_map_set_map_source(self:PShumateMap; map_source:PShumateMapSource);cdecl;external;
procedure shumate_map_set_zoom_on_double_click(self:PShumateMap; value:Tgboolean);cdecl;external;
procedure shumate_map_set_animate_zoom(self:PShumateMap; value:Tgboolean);cdecl;external;
procedure shumate_map_add_layer(self:PShumateMap; layer:PShumateLayer);cdecl;external;
procedure shumate_map_remove_layer(self:PShumateMap; layer:PShumateLayer);cdecl;external;
procedure shumate_map_insert_layer_behind(self:PShumateMap; layer:PShumateLayer; next_sibling:PShumateLayer);cdecl;external;
procedure shumate_map_insert_layer_above(self:PShumateMap; layer:PShumateLayer; next_sibling:PShumateLayer);cdecl;external;
function shumate_map_get_zoom_on_double_click(self:PShumateMap):Tgboolean;cdecl;external;
function shumate_map_get_animate_zoom(self:PShumateMap):Tgboolean;cdecl;external;
function shumate_map_get_state(self:PShumateMap):TShumateState;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_MAP : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_MAP:=shumate_map_get_type;
  end;


end.
