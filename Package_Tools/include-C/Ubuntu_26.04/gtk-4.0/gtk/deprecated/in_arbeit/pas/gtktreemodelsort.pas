unit gtktreemodelsort;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreemodelsort.h
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
{ < private >  }
  PGtkTreeModelSort = ^TGtkTreeModelSort;
  TGtkTreeModelSort = record
      parent : TGObject;
      priv : PGtkTreeModelSortPrivate;
    end;

{ < private >  }
  PGtkTreeModelSortClass = ^TGtkTreeModelSortClass;
  TGtkTreeModelSortClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_tree_model_sort_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_new_with_model(child_model:PGtkTreeModel):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_get_model(tree_model:PGtkTreeModelSort):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_child_path_to_path(tree_model_sort:PGtkTreeModelSort; child_path:PGtkTreePath):PGtkTreePath;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_child_iter_to_iter(tree_model_sort:PGtkTreeModelSort; sort_iter:PGtkTreeIter; child_iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_path_to_child_path(tree_model_sort:PGtkTreeModelSort; sorted_path:PGtkTreePath):PGtkTreePath;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_convert_iter_to_child_iter(tree_model_sort:PGtkTreeModelSort; child_iter:PGtkTreeIter; sorted_iter:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_reset_default_sort_func(tree_model_sort:PGtkTreeModelSort);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_clear_cache(tree_model_sort:PGtkTreeModelSort);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_iter_is_valid(tree_model_sort:PGtkTreeModelSort; iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeModelSort, g_object_unref) }

// === Konventiert am: 9-7-26 19:52:30 ===

function GTK_TYPE_TREE_MODEL_SORT : TGType;
function GTK_TREE_MODEL_SORT(obj : Pointer) : PGtkTreeModelSort;
function GTK_TREE_MODEL_SORT_CLASS(klass : Pointer) : PGtkTreeModelSortClass;
function GTK_IS_TREE_MODEL_SORT(obj : Pointer) : Tgboolean;
function GTK_IS_TREE_MODEL_SORT_CLASS(klass : Pointer) : Tgboolean;
function GTK_TREE_MODEL_SORT_GET_CLASS(obj : Pointer) : PGtkTreeModelSortClass;

implementation

function GTK_TYPE_TREE_MODEL_SORT : TGType;
  begin
    GTK_TYPE_TREE_MODEL_SORT:=gtk_tree_model_sort_get_type;
  end;

function GTK_TREE_MODEL_SORT(obj : Pointer) : PGtkTreeModelSort;
begin
  Result := PGtkTreeModelSort(g_type_check_instance_cast(obj, GTK_TYPE_TREE_MODEL_SORT));
end;

function GTK_TREE_MODEL_SORT_CLASS(klass : Pointer) : PGtkTreeModelSortClass;
begin
  Result := PGtkTreeModelSortClass(g_type_check_class_cast(klass, GTK_TYPE_TREE_MODEL_SORT));
end;

function GTK_IS_TREE_MODEL_SORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TREE_MODEL_SORT);
end;

function GTK_IS_TREE_MODEL_SORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TREE_MODEL_SORT);
end;

function GTK_TREE_MODEL_SORT_GET_CLASS(obj : Pointer) : PGtkTreeModelSortClass;
begin
  Result := PGtkTreeModelSortClass(PGTypeInstance(obj)^.g_class);
end;



end.
