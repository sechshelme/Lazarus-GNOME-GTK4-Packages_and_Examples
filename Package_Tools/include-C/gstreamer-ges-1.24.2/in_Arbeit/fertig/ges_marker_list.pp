
unit ges_marker_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_marker_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_marker_list.h
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
PGESMarker  = ^GESMarker;
PGESMarkerList  = ^GESMarkerList;
PGList  = ^GList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services

 * Copyright (C) <2019> Mathieu Duponchelle <mathieu@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}

{ was #define dname def_expr }
function GES_TYPE_MARKER : longint; { return type might be wrong }

{*
 * GESMarker:
 *
 * A timed #GESMetaContainer object.
 *
 * Since: 1.18
  }
{extern }
{G_DECLARE_FINAL_TYPE (GESMarker, ges_marker, GES, MARKER, GObject) }
{ was #define dname def_expr }
function GES_TYPE_MARKER_LIST : longint; { return type might be wrong }

{*
 * GESMarkerList:
 *
 * A list of #GESMarker
 *
 * Since: 1.18
  }
{///extern }
{//////G_DECLARE_FINAL_TYPE (GESMarkerList, ges_marker_list, GES, MARKER_LIST, GObject) }
function ges_marker_list_new:PGESMarkerList;cdecl;external;
function ges_marker_list_add(list:PGESMarkerList; position:TGstClockTime):PGESMarker;cdecl;external;
function ges_marker_list_remove(list:PGESMarkerList; marker:PGESMarker):Tgboolean;cdecl;external;
function ges_marker_list_size(list:PGESMarkerList):Tguint;cdecl;external;
function ges_marker_list_get_markers(list:PGESMarkerList):PGList;cdecl;external;
function ges_marker_list_move(list:PGESMarkerList; marker:PGESMarker; position:TGstClockTime):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_MARKER : longint; { return type might be wrong }
  begin
    GES_TYPE_MARKER:=ges_marker_get_type;
  end;

{ was #define dname def_expr }
function GES_TYPE_MARKER_LIST : longint; { return type might be wrong }
  begin
    GES_TYPE_MARKER_LIST:=ges_marker_list_get_type;
  end;


end.
