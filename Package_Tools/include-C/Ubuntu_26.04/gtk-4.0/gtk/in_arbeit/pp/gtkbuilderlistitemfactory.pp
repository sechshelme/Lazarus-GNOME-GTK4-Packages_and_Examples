
unit gtkbuilderlistitemfactory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkbuilderlistitemfactory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkbuilderlistitemfactory.h
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
PGBytes  = ^GBytes;
PGtkBuilderListItemFactory  = ^GtkBuilderListItemFactory;
PGtkBuilderScope  = ^GtkBuilderScope;
PGtkListItemFactory  = ^GtkListItemFactory;
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

{ was #define dname def_expr }
function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_BUILDER_LIST_ITEM_FACTORY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(o : longint) : longint;

type

function gtk_builder_list_item_factory_get_type:TGType;cdecl;external;
function gtk_builder_list_item_factory_new_from_bytes(scope:PGtkBuilderScope; bytes:PGBytes):PGtkListItemFactory;cdecl;external;
(* Const before type ignored *)
function gtk_builder_list_item_factory_new_from_resource(scope:PGtkBuilderScope; resource_path:Pchar):PGtkListItemFactory;cdecl;external;
function gtk_builder_list_item_factory_get_bytes(self:PGtkBuilderListItemFactory):PGBytes;cdecl;external;
(* Const before type ignored *)
function gtk_builder_list_item_factory_get_resource(self:PGtkBuilderListItemFactory):Pchar;cdecl;external;
function gtk_builder_list_item_factory_get_scope(self:PGtkBuilderListItemFactory):PGtkBuilderScope;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY : longint; { return type might be wrong }
  begin
    GTK_TYPE_BUILDER_LIST_ITEM_FACTORY:=gtk_builder_list_item_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY(o : longint) : longint;
begin
  GTK_BUILDER_LIST_ITEM_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_BUILDER_LIST_ITEM_FACTORY,GtkBuilderListItemFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(k : longint) : longint;
begin
  GTK_BUILDER_LIST_ITEM_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_BUILDER_LIST_ITEM_FACTORY,GtkBuilderListItemFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_BUILDER_LIST_ITEM_FACTORY(o : longint) : longint;
begin
  GTK_IS_BUILDER_LIST_ITEM_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(k : longint) : longint;
begin
  GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(o : longint) : longint;
begin
  GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_BUILDER_LIST_ITEM_FACTORY,GtkBuilderListItemFactoryClass);
end;


end.
