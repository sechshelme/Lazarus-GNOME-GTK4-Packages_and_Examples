
unit WebKitContextMenu;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitContextMenu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitContextMenu.h
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
PGList  = ^GList;
PGVariant  = ^GVariant;
PWebKitContextMenu  = ^WebKitContextMenu;
PWebKitContextMenuItem  = ^WebKitContextMenuItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitContextMenu_h}
{$define WebKitContextMenu_h}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_CONTEXT_MENU : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenu, webkit_context_menu, WEBKIT, CONTEXT_MENU, GObject) }
type

function webkit_context_menu_new:PWebKitContextMenu;cdecl;external;
function webkit_context_menu_new_with_items(items:PGList):PWebKitContextMenu;cdecl;external;
procedure webkit_context_menu_prepend(menu:PWebKitContextMenu; item:PWebKitContextMenuItem);cdecl;external;
procedure webkit_context_menu_append(menu:PWebKitContextMenu; item:PWebKitContextMenuItem);cdecl;external;
procedure webkit_context_menu_insert(menu:PWebKitContextMenu; item:PWebKitContextMenuItem; position:Tgint);cdecl;external;
procedure webkit_context_menu_move_item(menu:PWebKitContextMenu; item:PWebKitContextMenuItem; position:Tgint);cdecl;external;
function webkit_context_menu_get_items(menu:PWebKitContextMenu):PGList;cdecl;external;
function webkit_context_menu_get_n_items(menu:PWebKitContextMenu):Tguint;cdecl;external;
function webkit_context_menu_first(menu:PWebKitContextMenu):PWebKitContextMenuItem;cdecl;external;
function webkit_context_menu_last(menu:PWebKitContextMenu):PWebKitContextMenuItem;cdecl;external;
function webkit_context_menu_get_item_at_position(menu:PWebKitContextMenu; position:Tguint):PWebKitContextMenuItem;cdecl;external;
procedure webkit_context_menu_remove(menu:PWebKitContextMenu; item:PWebKitContextMenuItem);cdecl;external;
procedure webkit_context_menu_remove_all(menu:PWebKitContextMenu);cdecl;external;
procedure webkit_context_menu_set_user_data(menu:PWebKitContextMenu; user_data:PGVariant);cdecl;external;
function webkit_context_menu_get_user_data(menu:PWebKitContextMenu):PGVariant;cdecl;external;
function webkit_context_menu_get_event(menu:PWebKitContextMenu):PGdkEvent;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_CONTEXT_MENU : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_CONTEXT_MENU:=webkit_context_menu_get_type;
  end;


end.
