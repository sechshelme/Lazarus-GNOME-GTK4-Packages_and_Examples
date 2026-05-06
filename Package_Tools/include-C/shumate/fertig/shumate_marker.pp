
unit shumate_marker;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_marker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_marker
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
PGtkWidget  = ^GtkWidget;
PShumateMarker  = ^ShumateMarker;
PShumateMarkerClass  = ^ShumateMarkerClass;
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
{$ifndef SHUMATE_MARKER_H}
{$define SHUMATE_MARKER_H}
{$include <shumate/shumate-location.h>}
{$include <gdk/gdk.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_MARKER : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (ShumateMarker, shumate_marker, SHUMATE, MARKER, GtkWidget) }
{< private > }
type
  PShumateMarkerClass = ^TShumateMarkerClass;
  TShumateMarkerClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..15] of Tgpointer;
    end;


function shumate_marker_new:PShumateMarker;cdecl;external;
procedure shumate_marker_set_selectable(marker:PShumateMarker; value:Tgboolean);cdecl;external;
function shumate_marker_get_selectable(marker:PShumateMarker):Tgboolean;cdecl;external;
procedure shumate_marker_set_draggable(marker:PShumateMarker; value:Tgboolean);cdecl;external;
function shumate_marker_get_draggable(marker:PShumateMarker):Tgboolean;cdecl;external;
function shumate_marker_is_selected(marker:PShumateMarker):Tgboolean;cdecl;external;
procedure shumate_marker_animate_in(marker:PShumateMarker);cdecl;external;
procedure shumate_marker_animate_in_with_delay(marker:PShumateMarker; delay:Tguint);cdecl;external;
procedure shumate_marker_animate_out(marker:PShumateMarker);cdecl;external;
procedure shumate_marker_animate_out_with_delay(marker:PShumateMarker; delay:Tguint);cdecl;external;
function shumate_marker_get_child(marker:PShumateMarker):PGtkWidget;cdecl;external;
procedure shumate_marker_set_child(marker:PShumateMarker; child:PGtkWidget);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_MARKER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_MARKER:=shumate_marker_get_type;
  end;


end.
