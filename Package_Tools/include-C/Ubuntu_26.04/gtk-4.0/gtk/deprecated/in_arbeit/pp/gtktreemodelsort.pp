
unit gtktreemodelsort;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreemodelsort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreemodelsort.h
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
PGtkTreeModel  = ^GtkTreeModel;
PGtkTreeModelSort  = ^GtkTreeModelSort;
PGtkTreeModelSortClass  = ^GtkTreeModelSortClass;
PGtkTreeModelSortPrivate  = ^GtkTreeModelSortPrivate;
PGtkTreePath  = ^GtkTreePath;
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

{ was #define dname def_expr }
function GTK_TYPE_TREE_MODEL_SORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_SORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_SORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT_GET_CLASS(obj : longint) : longint;

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


function gtk_tree_model_sort_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_new_with_model(child_model:PGtkTreeModel):PGtkTreeModel;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_get_model(tree_model:PGtkTreeModelSort):PGtkTreeModel;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_child_path_to_path(tree_model_sort:PGtkTreeModelSort; child_path:PGtkTreePath):PGtkTreePath;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_child_iter_to_iter(tree_model_sort:PGtkTreeModelSort; sort_iter:PGtkTreeIter; child_iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_convert_path_to_child_path(tree_model_sort:PGtkTreeModelSort; sorted_path:PGtkTreePath):PGtkTreePath;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_convert_iter_to_child_iter(tree_model_sort:PGtkTreeModelSort; child_iter:PGtkTreeIter; sorted_iter:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_reset_default_sort_func(tree_model_sort:PGtkTreeModelSort);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_sort_clear_cache(tree_model_sort:PGtkTreeModelSort);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_sort_iter_is_valid(tree_model_sort:PGtkTreeModelSort; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeModelSort, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_MODEL_SORT : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_MODEL_SORT:=gtk_tree_model_sort_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT(obj : longint) : longint;
begin
  GTK_TREE_MODEL_SORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_TREE_MODEL_SORT,GtkTreeModelSort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT_CLASS(klass : longint) : longint;
begin
  GTK_TREE_MODEL_SORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_TREE_MODEL_SORT,GtkTreeModelSortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_SORT(obj : longint) : longint;
begin
  GTK_IS_TREE_MODEL_SORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_TREE_MODEL_SORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_SORT_CLASS(klass : longint) : longint;
begin
  GTK_IS_TREE_MODEL_SORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_TREE_MODEL_SORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_SORT_GET_CLASS(obj : longint) : longint;
begin
  GTK_TREE_MODEL_SORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_TREE_MODEL_SORT,GtkTreeModelSortClass);
end;


end.
