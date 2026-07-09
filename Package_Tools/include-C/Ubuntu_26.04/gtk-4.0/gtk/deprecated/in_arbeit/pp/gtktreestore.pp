
unit gtktreestore;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreestore.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreestore.h
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
PGtkTreeIter  = ^GtkTreeIter;
PGtkTreeStore  = ^GtkTreeStore;
PGtkTreeStoreClass  = ^GtkTreeStoreClass;
PGtkTreeStorePrivate  = ^GtkTreeStorePrivate;
PGType  = ^GType;
PGValue  = ^GValue;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreestore.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
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
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/deprecated/gtktreemodel.h>}
{$include <gtk/deprecated/gtktreesortable.h>}
{$include <stdarg.h>}

{ was #define dname def_expr }
function GTK_TYPE_TREE_STORE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_STORE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_STORE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE_GET_CLASS(obj : longint) : longint;

type
  PGtkTreeStore = ^TGtkTreeStore;
  TGtkTreeStore = record
      parent : TGObject;
      priv : PGtkTreeStorePrivate;
    end;

{< private > }
  PGtkTreeStoreClass = ^TGtkTreeStoreClass;
  TGtkTreeStoreClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_tree_store_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_new(n_columns:longint; args:array of const):PGtkTreeStore;cdecl;external;
function gtk_tree_store_new(n_columns:longint):PGtkTreeStore;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_newv(n_columns:longint; types:PGType):PGtkTreeStore;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_set_column_types(tree_store:PGtkTreeStore; n_columns:longint; types:PGType);cdecl;external;
{ NOTE: use gtk_tree_model_get to get values from a GtkTreeStore  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_set_value(tree_store:PGtkTreeStore; iter:PGtkTreeIter; column:longint; value:PGValue);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_set(tree_store:PGtkTreeStore; iter:PGtkTreeIter; args:array of const);cdecl;external;
procedure gtk_tree_store_set(tree_store:PGtkTreeStore; iter:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_set_valuesv(tree_store:PGtkTreeStore; iter:PGtkTreeIter; columns:Plongint; values:PGValue; n_values:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_set_valist(tree_store:PGtkTreeStore; iter:PGtkTreeIter; var_args:Tva_list);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_remove(tree_store:PGtkTreeStore; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_insert(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; position:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_insert_before(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; sibling:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_insert_after(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; sibling:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_insert_with_values(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; position:longint; args:array of const);cdecl;external;
procedure gtk_tree_store_insert_with_values(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; position:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_insert_with_valuesv(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter; position:longint; columns:Plongint; 
            values:PGValue; n_values:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_prepend(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_append(tree_store:PGtkTreeStore; iter:PGtkTreeIter; parent:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_is_ancestor(tree_store:PGtkTreeStore; iter:PGtkTreeIter; descendant:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_iter_depth(tree_store:PGtkTreeStore; iter:PGtkTreeIter):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_clear(tree_store:PGtkTreeStore);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
function gtk_tree_store_iter_is_valid(tree_store:PGtkTreeStore; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_reorder(tree_store:PGtkTreeStore; parent:PGtkTreeIter; new_order:Plongint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_swap(tree_store:PGtkTreeStore; a:PGtkTreeIter; b:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_move_before(tree_store:PGtkTreeStore; iter:PGtkTreeIter; position:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel) }
procedure gtk_tree_store_move_after(tree_store:PGtkTreeStore; iter:PGtkTreeIter; position:PGtkTreeIter);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeStore, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_STORE : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_STORE:=gtk_tree_store_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE(obj : longint) : longint;
begin
  GTK_TREE_STORE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_TREE_STORE,GtkTreeStore);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE_CLASS(klass : longint) : longint;
begin
  GTK_TREE_STORE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_TREE_STORE,GtkTreeStoreClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_STORE(obj : longint) : longint;
begin
  GTK_IS_TREE_STORE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_TREE_STORE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_STORE_CLASS(klass : longint) : longint;
begin
  GTK_IS_TREE_STORE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_TREE_STORE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_STORE_GET_CLASS(obj : longint) : longint;
begin
  GTK_TREE_STORE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_TREE_STORE,GtkTreeStoreClass);
end;


end.
