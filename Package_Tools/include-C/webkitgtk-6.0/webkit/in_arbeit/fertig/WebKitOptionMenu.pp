
unit WebKitOptionMenu;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitOptionMenu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitOptionMenu.h
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
PGdkEvent  = ^GdkEvent;
PWebKitOptionMenu  = ^WebKitOptionMenu;
PWebKitOptionMenuItem  = ^WebKitOptionMenuItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017, 2020 Igalia S.L.
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
{$ifndef WebKitOptionMenu_h}
{$define WebKitOptionMenu_h}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitOptionMenuItem.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_OPTION_MENU : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitOptionMenu, webkit_option_menu, WEBKIT, OPTION_MENU, GObject) }
function webkit_option_menu_get_n_items(menu:PWebKitOptionMenu):Tguint;cdecl;external;
function webkit_option_menu_get_item(menu:PWebKitOptionMenu; index:Tguint):PWebKitOptionMenuItem;cdecl;external;
procedure webkit_option_menu_select_item(menu:PWebKitOptionMenu; index:Tguint);cdecl;external;
procedure webkit_option_menu_activate_item(menu:PWebKitOptionMenu; index:Tguint);cdecl;external;
procedure webkit_option_menu_close(menu:PWebKitOptionMenu);cdecl;external;
function webkit_option_menu_get_event(menu:PWebKitOptionMenu):PGdkEvent;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_OPTION_MENU : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_OPTION_MENU:=webkit_option_menu_get_type;
  end;


end.
