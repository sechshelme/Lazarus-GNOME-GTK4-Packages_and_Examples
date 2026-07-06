
unit gtklistitem;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklistitem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklistitem.h
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
Pchar  = ^char;
PGtkListItem  = ^GtkListItem;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_LIST_ITEM : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkListItem, gtk_list_item, GTK, LIST_ITEM, GObject) }
function gtk_list_item_get_item(self:PGtkListItem):Tgpointer;cdecl;external;
function gtk_list_item_get_position(self:PGtkListItem):Tguint;cdecl;external;
function gtk_list_item_get_selected(self:PGtkListItem):Tgboolean;cdecl;external;
function gtk_list_item_get_selectable(self:PGtkListItem):Tgboolean;cdecl;external;
procedure gtk_list_item_set_selectable(self:PGtkListItem; selectable:Tgboolean);cdecl;external;
function gtk_list_item_get_activatable(self:PGtkListItem):Tgboolean;cdecl;external;
procedure gtk_list_item_set_activatable(self:PGtkListItem; activatable:Tgboolean);cdecl;external;
function gtk_list_item_get_focusable(self:PGtkListItem):Tgboolean;cdecl;external;
procedure gtk_list_item_set_focusable(self:PGtkListItem; focusable:Tgboolean);cdecl;external;
procedure gtk_list_item_set_child(self:PGtkListItem; child:PGtkWidget);cdecl;external;
function gtk_list_item_get_child(self:PGtkListItem):PGtkWidget;cdecl;external;
(* Const before type ignored *)
procedure gtk_list_item_set_accessible_description(self:PGtkListItem; description:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_list_item_get_accessible_description(self:PGtkListItem):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_list_item_set_accessible_label(self:PGtkListItem; _label:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_list_item_get_accessible_label(self:PGtkListItem):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_LIST_ITEM : longint; { return type might be wrong }
  begin
    GTK_TYPE_LIST_ITEM:=gtk_list_item_get_type;
  end;


end.
