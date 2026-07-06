unit gtklistitem;

interface

uses
  fp_glib2, fp_gtk4;

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

{GDK_DECLARE_INTERNAL_TYPE (GtkListItem, gtk_list_item, GTK, LIST_ITEM, GObject) }
function gtk_list_item_get_item(self:PGtkListItem):Tgpointer;cdecl;external libgtk4;
function gtk_list_item_get_position(self:PGtkListItem):Tguint;cdecl;external libgtk4;
function gtk_list_item_get_selected(self:PGtkListItem):Tgboolean;cdecl;external libgtk4;
function gtk_list_item_get_selectable(self:PGtkListItem):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_item_set_selectable(self:PGtkListItem; selectable:Tgboolean);cdecl;external libgtk4;
function gtk_list_item_get_activatable(self:PGtkListItem):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_item_set_activatable(self:PGtkListItem; activatable:Tgboolean);cdecl;external libgtk4;
function gtk_list_item_get_focusable(self:PGtkListItem):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_item_set_focusable(self:PGtkListItem; focusable:Tgboolean);cdecl;external libgtk4;
procedure gtk_list_item_set_child(self:PGtkListItem; child:PGtkWidget);cdecl;external libgtk4;
function gtk_list_item_get_child(self:PGtkListItem):PGtkWidget;cdecl;external libgtk4;
procedure gtk_list_item_set_accessible_description(self:PGtkListItem; description:Pchar);cdecl;external libgtk4;
function gtk_list_item_get_accessible_description(self:PGtkListItem):Pchar;cdecl;external libgtk4;
procedure gtk_list_item_set_accessible_label(self:PGtkListItem; _label:Pchar);cdecl;external libgtk4;
function gtk_list_item_get_accessible_label(self:PGtkListItem):Pchar;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:37:09 ===

function GTK_TYPE_LIST_ITEM: TGType;
function GTK_LIST_ITEM(obj: Pointer): PGtkListItem;
function GTK_IS_LIST_ITEM(obj: Pointer): Tgboolean;
function GTK_LIST_ITEM_CLASS(klass: Pointer): PGtkListItemClass;
function GTK_IS_LIST_ITEM_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_ITEM_GET_CLASS(obj: Pointer): PGtkListItemClass;

implementation

function GTK_TYPE_LIST_ITEM: TGType;
begin
  Result := gtk_list_item_get_type;
end;

function GTK_LIST_ITEM(obj: Pointer): PGtkListItem;
begin
  Result := PGtkListItem(g_type_check_instance_cast(obj, GTK_TYPE_LIST_ITEM));
end;

function GTK_IS_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_ITEM);
end;

function GTK_LIST_ITEM_CLASS(klass: Pointer): PGtkListItemClass;
begin
  Result := PGtkListItemClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_ITEM));
end;

function GTK_IS_LIST_ITEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_ITEM);
end;

function GTK_LIST_ITEM_GET_CLASS(obj: Pointer): PGtkListItemClass;
begin
  Result := PGtkListItemClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkListItem = type Pointer;

  TGtkListItemClass = record
  end;
  PGtkListItemClass = ^TGtkListItemClass;

function gtk_list_item_get_type: TGType; cdecl; external libgxxxxxxx;



end.
