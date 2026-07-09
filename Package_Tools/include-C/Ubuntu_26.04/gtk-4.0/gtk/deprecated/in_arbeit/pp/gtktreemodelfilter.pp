
unit gtktreemodelfilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreemodelfilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreemodelfilter.h
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
PGtkTreeModelFilter  = ^GtkTreeModelFilter;
PGtkTreeModelFilterClass  = ^GtkTreeModelFilterClass;
PGtkTreeModelFilterPrivate  = ^GtkTreeModelFilterPrivate;
PGtkTreePath  = ^GtkTreePath;
PGType  = ^GType;
PGValue  = ^GValue;
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

{ was #define dname def_expr }
function GTK_TYPE_TREE_MODEL_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_FILTER_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER_GET_CLASS(obj : longint) : longint;

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

function gtk_tree_model_filter_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_new(child_model:PGtkTreeModel; root:PGtkTreePath):PGtkTreeModel;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_visible_func(filter:PGtkTreeModelFilter; func:TGtkTreeModelFilterVisibleFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_modify_func(filter:PGtkTreeModelFilter; n_columns:longint; types:PGType; func:TGtkTreeModelFilterModifyFunc; data:Tgpointer; 
            destroy:TGDestroyNotify);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_set_visible_column(filter:PGtkTreeModelFilter; column:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_get_model(filter:PGtkTreeModelFilter):PGtkTreeModel;cdecl;external;
{ conversion  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_child_iter_to_iter(filter:PGtkTreeModelFilter; filter_iter:PGtkTreeIter; child_iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_convert_iter_to_child_iter(filter:PGtkTreeModelFilter; child_iter:PGtkTreeIter; filter_iter:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_child_path_to_path(filter:PGtkTreeModelFilter; child_path:PGtkTreePath):PGtkTreePath;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
function gtk_tree_model_filter_convert_path_to_child_path(filter:PGtkTreeModelFilter; filter_path:PGtkTreePath):PGtkTreePath;cdecl;external;
{ extras  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_refilter(filter:PGtkTreeModelFilter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkFilterListModel) }
procedure gtk_tree_model_filter_clear_cache(filter:PGtkTreeModelFilter);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeModelFilter, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_MODEL_FILTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_MODEL_FILTER:=gtk_tree_model_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER(obj : longint) : longint;
begin
  GTK_TREE_MODEL_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_TREE_MODEL_FILTER,GtkTreeModelFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER_CLASS(vtable : longint) : longint;
begin
  GTK_TREE_MODEL_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GTK_TYPE_TREE_MODEL_FILTER,GtkTreeModelFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_FILTER(obj : longint) : longint;
begin
  GTK_IS_TREE_MODEL_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_TREE_MODEL_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_MODEL_FILTER_CLASS(vtable : longint) : longint;
begin
  GTK_IS_TREE_MODEL_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GTK_TYPE_TREE_MODEL_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_MODEL_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GTK_TREE_MODEL_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_TREE_MODEL_FILTER,GtkTreeModelFilterClass);
end;


end.
