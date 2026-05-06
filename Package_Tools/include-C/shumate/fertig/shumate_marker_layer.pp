
unit shumate_marker_layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_marker_layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_marker_layer.h
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
PGList  = ^GList;
PShumateMarker  = ^ShumateMarker;
PShumateMarkerLayer  = ^ShumateMarkerLayer;
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
{$ifndef SHUMATE_MARKER_LAYER_H}
{$define SHUMATE_MARKER_LAYER_H}
{$include <shumate/shumate-marker.h>}
{$include <shumate/shumate-layer.h>}
{$include <shumate/shumate-viewport.h>}
{$include <gtk/gtk.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_MARKER_LAYER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateMarkerLayer, shumate_marker_layer, SHUMATE, MARKER_LAYER, ShumateLayer) }
function shumate_marker_layer_new(viewport:PShumateViewport):PShumateMarkerLayer;cdecl;external;
function shumate_marker_layer_new_full(viewport:PShumateViewport; mode:TGtkSelectionMode):PShumateMarkerLayer;cdecl;external;
procedure shumate_marker_layer_add_marker(self:PShumateMarkerLayer; marker:PShumateMarker);cdecl;external;
procedure shumate_marker_layer_remove_marker(self:PShumateMarkerLayer; marker:PShumateMarker);cdecl;external;
procedure shumate_marker_layer_remove_all(self:PShumateMarkerLayer);cdecl;external;
function shumate_marker_layer_get_markers(self:PShumateMarkerLayer):PGList;cdecl;external;
function shumate_marker_layer_get_selected(self:PShumateMarkerLayer):PGList;cdecl;external;
function shumate_marker_layer_select_marker(self:PShumateMarkerLayer; marker:PShumateMarker):Tgboolean;cdecl;external;
procedure shumate_marker_layer_unselect_marker(self:PShumateMarkerLayer; marker:PShumateMarker);cdecl;external;
procedure shumate_marker_layer_select_all_markers(self:PShumateMarkerLayer);cdecl;external;
procedure shumate_marker_layer_unselect_all_markers(self:PShumateMarkerLayer);cdecl;external;
procedure shumate_marker_layer_set_selection_mode(self:PShumateMarkerLayer; mode:TGtkSelectionMode);cdecl;external;
function shumate_marker_layer_get_selection_mode(self:PShumateMarkerLayer):TGtkSelectionMode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_MARKER_LAYER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_MARKER_LAYER:=shumate_marker_layer_get_type;
  end;


end.
