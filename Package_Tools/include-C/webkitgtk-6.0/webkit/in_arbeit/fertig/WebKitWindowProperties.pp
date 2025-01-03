
unit WebKitWindowProperties;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWindowProperties.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWindowProperties.h
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
PGdkRectangle  = ^GdkRectangle;
PWebKitWindowProperties  = ^WebKitWindowProperties;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011 Igalia S.L.
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
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitWindowProperties_h}
{$define WebKitWindowProperties_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WINDOW_PROPERTIES : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWindowProperties, webkit_window_properties, WEBKIT, WINDOW_PROPERTIES, GObject) }
procedure webkit_window_properties_get_geometry(window_properties:PWebKitWindowProperties; geometry:PGdkRectangle);cdecl;external;
function webkit_window_properties_get_toolbar_visible(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_statusbar_visible(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_scrollbars_visible(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_menubar_visible(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_locationbar_visible(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_resizable(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
function webkit_window_properties_get_fullscreen(window_properties:PWebKitWindowProperties):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WINDOW_PROPERTIES : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WINDOW_PROPERTIES:=webkit_window_properties_get_type;
  end;


end.
