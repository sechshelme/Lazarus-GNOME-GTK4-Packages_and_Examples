unit gtktreesortable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreesortable.h
 * Copyright (C) 2001  Red Hat, Inc.
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
{$include <gtk/gtkenums.h>}
{$include <gtk/deprecated/gtktreemodel.h>}

{*
 * GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID:
 *
 * Uses the default sort function in a [iface@Gtk.TreeSortable].
 *
 * See also: [method@Gtk.TreeSortable.set_sort_column_id]
 *
 * Deprecated: 4.20: There is no replacement
  }
const
  GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -(1);  
{*
 * GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID:
 *
 * Disables sorting in a [iface@Gtk.TreeSortable].
 *
 * See also: [method@Gtk.TreeSortable.set_sort_column_id]
 *
 * Deprecated: 4.20: There is no replacement
  }
  GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -(2);  
type
{ Dummy typedef  }
{*
 * GtkTreeIterCompareFunc:
 * @model: The `GtkTreeModel` the comparison is within
 * @a: A `GtkTreeIter` in @model
 * @b: Another `GtkTreeIter` in @model
 * @user_data: Data passed when the compare func is assigned e.g. by
 *  gtk_tree_sortable_set_sort_func()
 *
 * A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
 * integer if @a sorts before @b, @a sorts with @b, or @a sorts after @b
 * respectively.
 *
 * If two iters compare as equal, their order in the sorted model
 * is undefined. In order to ensure that the `GtkTreeSortable` behaves as
 * expected, the GtkTreeIterCompareFunc must define a partial order on
 * the model, i.e. it must be reflexive, antisymmetric and transitive.
 *
 * For example, if @model is a product catalogue, then a compare function
 * for the “price” column could be one which returns
 * `price_of(@a) - price_of(@b)`.
 *
 * Returns: a negative integer, zero or a positive integer depending on whether
 *   @a sorts before, with or after @b
 *
 * Deprecated: 4.20: There is no replacement
  }

  TGtkTreeIterCompareFunc = function (model:PGtkTreeModel; a:PGtkTreeIter; b:PGtkTreeIter; user_data:Tgpointer):longint;cdecl;
{*
 * GtkTreeSortableIface:
 * @sort_column_changed: Signal emitted when the sort column or sort
 *    order of sortable is changed.
 * @get_sort_column_id: Fills in sort_column_id and order with the
 *    current sort column and the order.
 * @set_sort_column_id: Sets the current sort column to be
 *    sort_column_id.
 * @set_sort_func: Sets the comparison function used when sorting to
 *    be sort_func.
 * @set_default_sort_func: Sets the default comparison function used
 *    when sorting to be sort_func.
 * @has_default_sort_func: %TRUE if the model has a default sort
 * function.
  }
{< private > }
{< public > }
{ signals  }
{ virtual table  }
  PGtkTreeSortableIface = ^TGtkTreeSortableIface;
  TGtkTreeSortableIface = record
      g_iface : TGTypeInterface;cdecl;
      sort_column_changed : procedure (sortable:PGtkTreeSortable);cdecl;
      get_sort_column_id : function (sortable:PGtkTreeSortable; sort_column_id:Plongint; order:PGtkSortType):Tgboolean;cdecl;
      set_sort_column_id : procedure (sortable:PGtkTreeSortable; sort_column_id:longint; order:TGtkSortType);cdecl;
      set_sort_func : procedure (sortable:PGtkTreeSortable; sort_column_id:longint; sort_func:TGtkTreeIterCompareFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;
      set_default_sort_func : procedure (sortable:PGtkTreeSortable; sort_func:TGtkTreeIterCompareFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;
      has_default_sort_func : function (sortable:PGtkTreeSortable):Tgboolean;cdecl;
    end;


function gtk_tree_sortable_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_sortable_sort_column_changed(sortable:PGtkTreeSortable);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_sortable_get_sort_column_id(sortable:PGtkTreeSortable; sort_column_id:Plongint; order:PGtkSortType):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_sortable_set_sort_column_id(sortable:PGtkTreeSortable; sort_column_id:longint; order:TGtkSortType);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_sortable_set_sort_func(sortable:PGtkTreeSortable; sort_column_id:longint; sort_func:TGtkTreeIterCompareFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_sortable_set_default_sort_func(sortable:PGtkTreeSortable; sort_func:TGtkTreeIterCompareFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_sortable_has_default_sort_func(sortable:PGtkTreeSortable):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeSortable, g_object_unref) }

// === Konventiert am: 9-7-26 19:52:19 ===

function GTK_TYPE_TREE_SORTABLE : TGType;
function GTK_TREE_SORTABLE(obj : Pointer) : PGtkTreeSortable;
function GTK_IS_TREE_SORTABLE(obj : Pointer) : Tgboolean;
function GTK_TREE_SORTABLE_GET_IFACE(obj : Pointer) : PGtkTreeSortableIface;

implementation

function GTK_TYPE_TREE_SORTABLE : TGType;
  begin
    GTK_TYPE_TREE_SORTABLE:=gtk_tree_sortable_get_type;
  end;

function GTK_TREE_SORTABLE(obj : Pointer) : PGtkTreeSortable;
begin
  Result := PGtkTreeSortable(g_type_check_instance_cast(obj, GTK_TYPE_TREE_SORTABLE));
end;

function GTK_IS_TREE_SORTABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TREE_SORTABLE);
end;

function GTK_TREE_SORTABLE_GET_IFACE(obj : Pointer) : PGtkTreeSortableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_TREE_SORTABLE);
end;



end.
