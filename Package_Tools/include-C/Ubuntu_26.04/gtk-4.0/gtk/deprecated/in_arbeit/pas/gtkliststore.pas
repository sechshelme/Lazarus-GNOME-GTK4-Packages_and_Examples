unit gtkliststore;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkliststore.h
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

type
{< private > }
  PGtkListStore = ^TGtkListStore;
  TGtkListStore = record
      parent : TGObject;
      priv : PGtkListStorePrivate;
    end;

{< private > }
  PGtkListStoreClass = ^TGtkListStoreClass;
  TGtkListStoreClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_list_store_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
function gtk_list_store_new(n_columns:longint; args:array of const):PGtkListStore;cdecl;external libgtk4;
function gtk_list_store_new(n_columns:longint):PGtkListStore;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
function gtk_list_store_newv(n_columns:longint; types:PGType):PGtkListStore;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_set_column_types(list_store:PGtkListStore; n_columns:longint; types:PGType);cdecl;external libgtk4;
{ NOTE: use gtk_tree_model_get to get values from a GtkListStore  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_set_value(list_store:PGtkListStore; iter:PGtkTreeIter; column:longint; value:PGValue);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_set(list_store:PGtkListStore; iter:PGtkTreeIter; args:array of const);cdecl;external libgtk4;
procedure gtk_list_store_set(list_store:PGtkListStore; iter:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_set_valuesv(list_store:PGtkListStore; iter:PGtkTreeIter; columns:Plongint; values:PGValue; n_values:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_set_valist(list_store:PGtkListStore; iter:PGtkTreeIter; var_args:Tva_list);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
function gtk_list_store_remove(list_store:PGtkListStore; iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_insert(list_store:PGtkListStore; iter:PGtkTreeIter; position:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_insert_before(list_store:PGtkListStore; iter:PGtkTreeIter; sibling:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_insert_after(list_store:PGtkListStore; iter:PGtkTreeIter; sibling:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_insert_with_values(list_store:PGtkListStore; iter:PGtkTreeIter; position:longint; args:array of const);cdecl;external libgtk4;
procedure gtk_list_store_insert_with_values(list_store:PGtkListStore; iter:PGtkTreeIter; position:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_insert_with_valuesv(list_store:PGtkListStore; iter:PGtkTreeIter; position:longint; columns:Plongint; values:PGValue; 
            n_values:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_prepend(list_store:PGtkListStore; iter:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_append(list_store:PGtkListStore; iter:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_clear(list_store:PGtkListStore);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
function gtk_list_store_iter_is_valid(list_store:PGtkListStore; iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_reorder(store:PGtkListStore; new_order:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_swap(store:PGtkListStore; a:PGtkTreeIter; b:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_move_after(store:PGtkListStore; iter:PGtkTreeIter; position:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GListStore) }
procedure gtk_list_store_move_before(store:PGtkListStore; iter:PGtkTreeIter; position:PGtkTreeIter);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListStore, g_object_unref) }

// === Konventiert am: 9-7-26 19:45:01 ===

function GTK_TYPE_LIST_STORE : TGType;
function GTK_LIST_STORE(obj : Pointer) : PGtkListStore;
function GTK_LIST_STORE_CLASS(klass : Pointer) : PGtkListStoreClass;
function GTK_IS_LIST_STORE(obj : Pointer) : Tgboolean;
function GTK_IS_LIST_STORE_CLASS(klass : Pointer) : Tgboolean;
function GTK_LIST_STORE_GET_CLASS(obj : Pointer) : PGtkListStoreClass;

implementation

function GTK_TYPE_LIST_STORE : TGType;
  begin
    GTK_TYPE_LIST_STORE:=gtk_list_store_get_type;
  end;

function GTK_LIST_STORE(obj : Pointer) : PGtkListStore;
begin
  Result := PGtkListStore(g_type_check_instance_cast(obj, GTK_TYPE_LIST_STORE));
end;

function GTK_LIST_STORE_CLASS(klass : Pointer) : PGtkListStoreClass;
begin
  Result := PGtkListStoreClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_STORE));
end;

function GTK_IS_LIST_STORE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LIST_STORE);
end;

function GTK_IS_LIST_STORE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_LIST_STORE);
end;

function GTK_LIST_STORE_GET_CLASS(obj : Pointer) : PGtkListStoreClass;
begin
  Result := PGtkListStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
