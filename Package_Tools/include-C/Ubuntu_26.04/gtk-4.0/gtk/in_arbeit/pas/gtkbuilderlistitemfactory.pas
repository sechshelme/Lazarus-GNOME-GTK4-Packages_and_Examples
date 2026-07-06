unit gtkbuilderlistitemfactory;

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
{$include <gtk/gtklistitemfactory.h>}

type

function gtk_builder_list_item_factory_get_type:TGType;cdecl;external libgtk4;
function gtk_builder_list_item_factory_new_from_bytes(scope:PGtkBuilderScope; bytes:PGBytes):PGtkListItemFactory;cdecl;external libgtk4;
function gtk_builder_list_item_factory_new_from_resource(scope:PGtkBuilderScope; resource_path:Pchar):PGtkListItemFactory;cdecl;external libgtk4;
function gtk_builder_list_item_factory_get_bytes(self:PGtkBuilderListItemFactory):PGBytes;cdecl;external libgtk4;
function gtk_builder_list_item_factory_get_resource(self:PGtkBuilderListItemFactory):Pchar;cdecl;external libgtk4;
function gtk_builder_list_item_factory_get_scope(self:PGtkBuilderListItemFactory):PGtkBuilderScope;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 13:53:40 ===

function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY : TGType;
function GTK_BUILDER_LIST_ITEM_FACTORY(obj : Pointer) : PGtkBuilderListItemFactory;
function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : PGtkBuilderListItemFactoryClass;
function GTK_IS_BUILDER_LIST_ITEM_FACTORY(obj : Pointer) : Tgboolean;
function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : Tgboolean;
function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(obj : Pointer) : PGtkBuilderListItemFactoryClass;

implementation

function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY : TGType;
  begin
    GTK_TYPE_BUILDER_LIST_ITEM_FACTORY:=gtk_builder_list_item_factory_get_type;
  end;

function GTK_BUILDER_LIST_ITEM_FACTORY(obj : Pointer) : PGtkBuilderListItemFactory;
begin
  Result := PGtkBuilderListItemFactory(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY));
end;

function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : PGtkBuilderListItemFactoryClass;
begin
  Result := PGtkBuilderListItemFactoryClass(g_type_check_class_cast(klass, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY));
end;

function GTK_IS_BUILDER_LIST_ITEM_FACTORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(obj : Pointer) : PGtkBuilderListItemFactoryClass;
begin
  Result := PGtkBuilderListItemFactoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
