unit gtktreemodelfilter;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreemodelfilter.h
 * Copyright (C) 2000,2001  Red Hat, Inc., Jonathan Blandford <jrb@redhat.com>
 * Copyright (C) 2001-2003  Kristian Rietveld <kris@gtk.org>
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
{$include <gtk/deprecated/gtktreemodel.h>}

{*
 * GtkTreeModelFilterVisibleFunc:
 * @model: the child model of the `GtkTreeModelFilter`
 * @iter: a `GtkTreeIter` pointing to the row in @model whose visibility
 *   is determined
 * @data: (closure): user data given to gtk_tree_model_filter_set_visible_func()
 *
 * A function which decides whether the row indicated by @iter is visible.
 *
 * Returns: Whether the row indicated by @iter is visible.
 *
 * Deprecated: 4.20: There is no replacement
  }
type

  TGtkTreeModelFilterVisibleFunc = function (model:PGtkTreeModel; iter:PGtkTreeIter; data:Tgpointer):Tgboolean;cdecl;
{*
 * GtkTreeModelFilterModifyFunc:
 * @model: the `GtkTreeModelFilter`
 * @iter: a `GtkTreeIter` pointing to the row whose display values are determined
 * @value: (out caller-allocates): A `GValue` which is already initialized for
 *  with the correct type for the column @column.
 * @column: the column whose display value is determined
 * @data: (closure): user data given to gtk_tree_model_filter_set_modify_func()
 *
 * A function which calculates display values from raw values in the model.
 * It must fill @value with the display value for the column @column in the
 * row indicated by @iter.
 *
 * Since this function is called for each data access, it’s not a
 * particularly efficient operation.
 *
 * Deprecated: 4.20: There is no replacement
  }

  TGtkTreeModelFilterModifyFunc = procedure (model:PGtkTreeModel; iter:PGtkTreeIter; value:PGValue; column:longint; data:Tgpointer);cdecl;
{< private > }
  PGtkTreeModelFilter = ^TGtkTreeModelFilter;
  TGtkTreeModelFilter = record
      parent : TGObject;cdecl;
      priv : PGtkTreeModelFilterPrivate;
    end;

{< private > }
  PGtkTreeModelFilterClass = ^TGtkTreeModelFilterClass;
  TGtkTreeModelFilterClass = record
      parent_class : TGObjectClass;
      visible : function (self:PGtkTreeModelFilter; child_model:PGtkTreeModel; iter:PGtkTreeIter):Tgboolean;cdecl;
      modify : procedure (self:PGtkTreeModelFilter; child_model:PGtkTreeModel; iter:PGtkTreeIter; value:PGValue; column:longint);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

{ base  }

function gtk_tree_model_filter_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_new(child_model:PGtkTreeModel; root:PGtkTreePath):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_visible_func(filter:PGtkTreeModelFilter; func:TGtkTreeModelFilterVisibleFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_modify_func(filter:PGtkTreeModelFilter; n_columns:longint; types:PGType; func:TGtkTreeModelFilterModifyFunc; data:Tgpointer; 
            destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_visible_column(filter:PGtkTreeModelFilter; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_get_model(filter:PGtkTreeModelFilter):PGtkTreeModel;cdecl;external libgtk4;
{ conversion  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_child_iter_to_iter(filter:PGtkTreeModelFilter; filter_iter:PGtkTreeIter; child_iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_convert_iter_to_child_iter(filter:PGtkTreeModelFilter; child_iter:PGtkTreeIter; filter_iter:PGtkTreeIter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_child_path_to_path(filter:PGtkTreeModelFilter; child_path:PGtkTreePath):PGtkTreePath;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_path_to_child_path(filter:PGtkTreeModelFilter; filter_path:PGtkTreePath):PGtkTreePath;cdecl;external libgtk4;
{ extras  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_refilter(filter:PGtkTreeModelFilter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_clear_cache(filter:PGtkTreeModelFilter);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeModelFilter, g_object_unref) }

// === Konventiert am: 9-7-26 19:52:36 ===

function GTK_TYPE_TREE_MODEL_FILTER : TGType;
function GTK_TREE_MODEL_FILTER(obj : Pointer) : PGtkTreeModelFilter;
function GTK_TREE_MODEL_FILTER_CLASS(klass : Pointer) : PGtkTreeModelFilterClass;
function GTK_IS_TREE_MODEL_FILTER(obj : Pointer) : Tgboolean;
function GTK_IS_TREE_MODEL_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GTK_TREE_MODEL_FILTER_GET_CLASS(obj : Pointer) : PGtkTreeModelFilterClass;

implementation

function GTK_TYPE_TREE_MODEL_FILTER : TGType;
  begin
    GTK_TYPE_TREE_MODEL_FILTER:=gtk_tree_model_filter_get_type;
  end;

function GTK_TREE_MODEL_FILTER(obj : Pointer) : PGtkTreeModelFilter;
begin
  Result := PGtkTreeModelFilter(g_type_check_instance_cast(obj, GTK_TYPE_TREE_MODEL_FILTER));
end;

function GTK_TREE_MODEL_FILTER_CLASS(klass : Pointer) : PGtkTreeModelFilterClass;
begin
  Result := PGtkTreeModelFilterClass(g_type_check_class_cast(klass, GTK_TYPE_TREE_MODEL_FILTER));
end;

function GTK_IS_TREE_MODEL_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TREE_MODEL_FILTER);
end;

function GTK_IS_TREE_MODEL_FILTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TREE_MODEL_FILTER);
end;

function GTK_TREE_MODEL_FILTER_GET_CLASS(obj : Pointer) : PGtkTreeModelFilterClass;
begin
  Result := PGtkTreeModelFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
