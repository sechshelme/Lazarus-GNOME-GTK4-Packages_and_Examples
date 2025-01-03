
unit WebKitContextMenuItem;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitContextMenuItem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitContextMenuItem.h
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
PGAction  = ^GAction;
Pgchar  = ^gchar;
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
{$ifndef WebKitContextMenuItem_h}
{$define WebKitContextMenuItem_h}
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitContextMenu.h>}
{$include <webkit/WebKitContextMenuActions.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_CONTEXT_MENU_ITEM : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenuItem, webkit_context_menu_item, WEBKIT, CONTEXT_MENU_ITEM, GInitiallyUnowned) }
(* Const before type ignored *)
function webkit_context_menu_item_new_from_gaction(action:PGAction; _label:Pgchar; target:PGVariant):PWebKitContextMenuItem;cdecl;external;
function webkit_context_menu_item_new_from_stock_action(action:TWebKitContextMenuAction):PWebKitContextMenuItem;cdecl;external;
(* Const before type ignored *)
function webkit_context_menu_item_new_from_stock_action_with_label(action:TWebKitContextMenuAction; _label:Pgchar):PWebKitContextMenuItem;cdecl;external;
(* Const before type ignored *)
function webkit_context_menu_item_new_with_submenu(_label:Pgchar; submenu:PWebKitContextMenu):PWebKitContextMenuItem;cdecl;external;
function webkit_context_menu_item_new_separator:PWebKitContextMenuItem;cdecl;external;
function webkit_context_menu_item_get_gaction(item:PWebKitContextMenuItem):PGAction;cdecl;external;
function webkit_context_menu_item_get_stock_action(item:PWebKitContextMenuItem):TWebKitContextMenuAction;cdecl;external;
function webkit_context_menu_item_is_separator(item:PWebKitContextMenuItem):Tgboolean;cdecl;external;
procedure webkit_context_menu_item_set_submenu(item:PWebKitContextMenuItem; submenu:PWebKitContextMenu);cdecl;external;
function webkit_context_menu_item_get_submenu(item:PWebKitContextMenuItem):PWebKitContextMenu;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_CONTEXT_MENU_ITEM : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_CONTEXT_MENU_ITEM:=webkit_context_menu_item_get_type;
  end;


end.
