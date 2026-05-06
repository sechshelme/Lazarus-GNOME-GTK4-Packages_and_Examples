
unit shumate_simple_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_simple_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_simple_map.h
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
PShumateCompass  = ^ShumateCompass;
PShumateLayer  = ^ShumateLayer;
PShumateLicense  = ^ShumateLicense;
PShumateMap  = ^ShumateMap;
PShumateMapSource  = ^ShumateMapSource;
PShumateScale  = ^ShumateScale;
PShumateSimpleMap  = ^ShumateSimpleMap;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 James Westman <james@jwestman.net>
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
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtk.h>}
{$include <shumate/shumate-map.h>}
{$include <shumate/shumate-map-source.h>}
{$include <shumate/shumate-layer.h>}
{$include <shumate/shumate-compass.h>}
{$include <shumate/shumate-license.h>}
{$include <shumate/shumate-scale.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_SIMPLE_MAP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateSimpleMap, shumate_simple_map, SHUMATE, SIMPLE_MAP, GtkWidget) }
function shumate_simple_map_new:PShumateSimpleMap;cdecl;external;
function shumate_simple_map_get_viewport(self:PShumateSimpleMap):PShumateViewport;cdecl;external;
function shumate_simple_map_get_map_source(self:PShumateSimpleMap):PShumateMapSource;cdecl;external;
procedure shumate_simple_map_set_map_source(self:PShumateSimpleMap; map_source:PShumateMapSource);cdecl;external;
procedure shumate_simple_map_add_overlay_layer(self:PShumateSimpleMap; layer:PShumateLayer);cdecl;external;
procedure shumate_simple_map_insert_overlay_layer(self:PShumateSimpleMap; layer:PShumateLayer; idx:Tguint);cdecl;external;
procedure shumate_simple_map_remove_overlay_layer(self:PShumateSimpleMap; layer:PShumateLayer);cdecl;external;
function shumate_simple_map_get_compass(self:PShumateSimpleMap):PShumateCompass;cdecl;external;
function shumate_simple_map_get_license(self:PShumateSimpleMap):PShumateLicense;cdecl;external;
function shumate_simple_map_get_scale(self:PShumateSimpleMap):PShumateScale;cdecl;external;
function shumate_simple_map_get_show_zoom_buttons(self:PShumateSimpleMap):Tgboolean;cdecl;external;
procedure shumate_simple_map_set_show_zoom_buttons(self:PShumateSimpleMap; show_zoom_buttons:Tgboolean);cdecl;external;
function shumate_simple_map_get_map(self:PShumateSimpleMap):PShumateMap;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_SIMPLE_MAP : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_SIMPLE_MAP:=shumate_simple_map_get_type;
  end;


end.
