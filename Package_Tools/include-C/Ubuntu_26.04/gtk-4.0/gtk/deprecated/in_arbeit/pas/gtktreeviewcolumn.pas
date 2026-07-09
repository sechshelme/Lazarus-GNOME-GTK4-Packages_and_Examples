unit gtktreeviewcolumn;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreeviewcolumn.h
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
{$include <gtk/deprecated/gtkcellrenderer.h>}
{$include <gtk/deprecated/gtktreemodel.h>}
{$include <gtk/deprecated/gtktreesortable.h>}
{$include <gtk/deprecated/gtkcellarea.h>}

type
{*
 * GtkTreeViewColumnSizing:
 * @GTK_TREE_VIEW_COLUMN_GROW_ONLY: Columns only get bigger in reaction to changes in the model
 * @GTK_TREE_VIEW_COLUMN_AUTOSIZE: Columns resize to be the optimal size every time the model changes.
 * @GTK_TREE_VIEW_COLUMN_FIXED: Columns are a fixed numbers of pixels wide.
 *
 * The sizing method the column uses to determine its width.  Please note
 * that %GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and
 * can make columns appear choppy.
 *
 * Deprecated: 4.20: There is no replacement.
  }

  PGtkTreeViewColumnSizing = ^TGtkTreeViewColumnSizing;
  TGtkTreeViewColumnSizing =  Longint;
  Const
    GTK_TREE_VIEW_COLUMN_GROW_ONLY = 0;
    GTK_TREE_VIEW_COLUMN_AUTOSIZE = 1;
    GTK_TREE_VIEW_COLUMN_FIXED = 2;
;
{*
 * GtkTreeCellDataFunc:
 * @tree_column: A `GtkTreeViewColumn`
 * @cell: The `GtkCellRenderer` that is being rendered by @tree_column
 * @tree_model: The `GtkTreeModel` being rendered
 * @iter: A `GtkTreeIter` of the current row rendered
 * @data: (closure): user data
 *
 * A function to set the properties of a cell instead of just using the
 * straight mapping between the cell and the model.
 *
 * This function is useful for customizing the cell renderer. For example,
 * a function might get an* integer from the @tree_model, and render it to
 * the “text” attribute of “cell” by converting it to its written equivalent.
 *
 * See also: gtk_tree_view_column_set_cell_data_func()
 *
 * Deprecated: 4.20: There is no replacement
  }
type

  TGtkTreeCellDataFunc = procedure (tree_column:PGtkTreeViewColumn; cell:PGtkCellRenderer; tree_model:PGtkTreeModel; iter:PGtkTreeIter; data:Tgpointer);cdecl;

function gtk_tree_view_column_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_new:PGtkTreeViewColumn;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_new_with_area(area:PGtkCellArea):PGtkTreeViewColumn;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_new_with_attributes(title:Pchar; cell:PGtkCellRenderer; args:array of const):PGtkTreeViewColumn;cdecl;external libgtk4;
function gtk_tree_view_column_new_with_attributes(title:Pchar; cell:PGtkCellRenderer):PGtkTreeViewColumn;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_pack_start(tree_column:PGtkTreeViewColumn; cell:PGtkCellRenderer; expand:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_pack_end(tree_column:PGtkTreeViewColumn; cell:PGtkCellRenderer; expand:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_clear(tree_column:PGtkTreeViewColumn);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_add_attribute(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer; attribute:Pchar; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_attributes(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer; args:array of const);cdecl;external libgtk4;
procedure gtk_tree_view_column_set_attributes(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_cell_data_func(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer; func:TGtkTreeCellDataFunc; func_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_clear_attributes(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_spacing(tree_column:PGtkTreeViewColumn; spacing:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_spacing(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_visible(tree_column:PGtkTreeViewColumn; visible:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_visible(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_resizable(tree_column:PGtkTreeViewColumn; resizable:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_resizable(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_sizing(tree_column:PGtkTreeViewColumn; _type:TGtkTreeViewColumnSizing);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_sizing(tree_column:PGtkTreeViewColumn):TGtkTreeViewColumnSizing;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_x_offset(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_width(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_fixed_width(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_fixed_width(tree_column:PGtkTreeViewColumn; fixed_width:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_min_width(tree_column:PGtkTreeViewColumn; min_width:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_min_width(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_max_width(tree_column:PGtkTreeViewColumn; max_width:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_max_width(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_clicked(tree_column:PGtkTreeViewColumn);cdecl;external libgtk4;
{ Options for manipulating the column headers
  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_title(tree_column:PGtkTreeViewColumn; title:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_title(tree_column:PGtkTreeViewColumn):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_expand(tree_column:PGtkTreeViewColumn; expand:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_expand(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_clickable(tree_column:PGtkTreeViewColumn; clickable:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_clickable(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_widget(tree_column:PGtkTreeViewColumn; widget:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_widget(tree_column:PGtkTreeViewColumn):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_alignment(tree_column:PGtkTreeViewColumn; xalign:single);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_alignment(tree_column:PGtkTreeViewColumn):single;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_reorderable(tree_column:PGtkTreeViewColumn; reorderable:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_reorderable(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{ You probably only want to use gtk_tree_view_column_set_sort_column_id.  The
 * other sorting functions exist primarily to let others do their own custom sorting.
  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_sort_column_id(tree_column:PGtkTreeViewColumn; sort_column_id:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_sort_column_id(tree_column:PGtkTreeViewColumn):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_sort_indicator(tree_column:PGtkTreeViewColumn; setting:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_sort_indicator(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_set_sort_order(tree_column:PGtkTreeViewColumn; order:TGtkSortType);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_sort_order(tree_column:PGtkTreeViewColumn):TGtkSortType;cdecl;external libgtk4;
{ These functions are meant primarily for interaction between the GtkTreeView and the column.
  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_cell_set_cell_data(tree_column:PGtkTreeViewColumn; tree_model:PGtkTreeModel; iter:PGtkTreeIter; is_expander:Tgboolean; is_expanded:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_cell_get_size(tree_column:PGtkTreeViewColumn; x_offset:Plongint; y_offset:Plongint; width:Plongint; height:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_cell_is_visible(tree_column:PGtkTreeViewColumn):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_focus_cell(tree_column:PGtkTreeViewColumn; cell:PGtkCellRenderer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_cell_get_position(tree_column:PGtkTreeViewColumn; cell_renderer:PGtkCellRenderer; x_offset:Plongint; width:Plongint):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
procedure gtk_tree_view_column_queue_resize(tree_column:PGtkTreeViewColumn);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_tree_view(tree_column:PGtkTreeViewColumn):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkColumnView and GtkColumnViewColumn) }
function gtk_tree_view_column_get_button(tree_column:PGtkTreeViewColumn):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeViewColumn, g_object_unref) }

// === Konventiert am: 9-7-26 19:51:51 ===

function GTK_TYPE_TREE_VIEW_COLUMN : TGType;
function GTK_TREE_VIEW_COLUMN(obj : Pointer) : PGtkTreeViewColumn;
function GTK_IS_TREE_VIEW_COLUMN(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_TREE_VIEW_COLUMN : TGType;
  begin
    GTK_TYPE_TREE_VIEW_COLUMN:=gtk_tree_view_column_get_type;
  end;

function GTK_TREE_VIEW_COLUMN(obj : Pointer) : PGtkTreeViewColumn;
begin
  Result := PGtkTreeViewColumn(g_type_check_instance_cast(obj, GTK_TYPE_TREE_VIEW_COLUMN));
end;

function GTK_IS_TREE_VIEW_COLUMN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TREE_VIEW_COLUMN);
end;



end.
