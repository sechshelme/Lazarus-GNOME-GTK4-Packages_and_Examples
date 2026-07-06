unit gtklistitemfactory;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
type
{$include <gdk/gdk.h>}
{$include <gtk/gtktypes.h>}

function gtk_list_item_factory_get_type:TGType;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListItemFactory, g_object_unref) }

// === Konventiert am: 6-7-26 17:10:30 ===

function GTK_TYPE_LIST_ITEM_FACTORY : TGType;
function GTK_LIST_ITEM_FACTORY(obj : Pointer) : PGtkListItemFactory;
function GTK_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : PGtkListItemFactoryClass;
function GTK_IS_LIST_ITEM_FACTORY(obj : Pointer) : Tgboolean;
function GTK_IS_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : Tgboolean;
function GTK_LIST_ITEM_FACTORY_GET_CLASS(obj : Pointer) : PGtkListItemFactoryClass;

implementation

function GTK_TYPE_LIST_ITEM_FACTORY : TGType;
  begin
    GTK_TYPE_LIST_ITEM_FACTORY:=gtk_list_item_factory_get_type;
  end;

function GTK_LIST_ITEM_FACTORY(obj : Pointer) : PGtkListItemFactory;
begin
  Result := PGtkListItemFactory(g_type_check_instance_cast(obj, GTK_TYPE_LIST_ITEM_FACTORY));
end;

function GTK_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : PGtkListItemFactoryClass;
begin
  Result := PGtkListItemFactoryClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_ITEM_FACTORY));
end;

function GTK_IS_LIST_ITEM_FACTORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LIST_ITEM_FACTORY);
end;

function GTK_IS_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_LIST_ITEM_FACTORY);
end;

function GTK_LIST_ITEM_FACTORY_GET_CLASS(obj : Pointer) : PGtkListItemFactoryClass;
begin
  Result := PGtkListItemFactoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
