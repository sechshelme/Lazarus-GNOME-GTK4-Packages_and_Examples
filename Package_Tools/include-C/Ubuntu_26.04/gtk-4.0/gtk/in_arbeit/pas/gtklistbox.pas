unit gtklistbox;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

{ was #define dname def_expr }
function GTK_TYPE_LIST_BOX_ROW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BOX_ROW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BOX_ROW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW_GET_CLASS(obj : longint) : longint;

type
  PGtkListBoxRow = ^TGtkListBoxRow;
  TGtkListBoxRow = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkListBoxRowClass:
 * @parent_class: The parent class.
 * @activate:
  }
{< public > }
{< private > }
  PGtkListBoxRowClass = ^TGtkListBoxRowClass;
  TGtkListBoxRowClass = record
      parent_class : TGtkWidgetClass;
      activate : procedure (row:PGtkListBoxRow);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

{*
 * GtkListBoxFilterFunc:
 * @row: the row that may be filtered
 * @user_data: (closure): user data
 *
 * Will be called whenever the row changes or is added and lets you control
 * if the row should be visible or not.
 *
 * Returns: %TRUE if the row should be visible, %FALSE otherwise
  }

  TGtkListBoxFilterFunc = function (row:PGtkListBoxRow; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GtkListBoxSortFunc:
 * @row1: the first row
 * @row2: the second row
 * @user_data: (closure): user data
 *
 * Compare two rows to determine which should be first.
 *
 * Returns: < 0 if @row1 should be before @row2, 0 if they are
 *   equal and > 0 otherwise
  }

  TGtkListBoxSortFunc = function (row1:PGtkListBoxRow; row2:PGtkListBoxRow; user_data:Tgpointer):longint;cdecl;
{*
 * GtkListBoxUpdateHeaderFunc:
 * @row: the row to update
 * @before: (nullable): the row before @row, or %NULL if it is first
 * @user_data: (closure): user data
 *
 * Whenever @row changes or which row is before @row changes this
 * is called, which lets you update the header on @row.
 *
 * You may remove or set a new one via [method@Gtk.ListBoxRow.set_header]
 * or just change the state of the current header widget.
  }

  TGtkListBoxUpdateHeaderFunc = procedure (row:PGtkListBoxRow; before:PGtkListBoxRow; user_data:Tgpointer);cdecl;
{*
 * GtkListBoxCreateWidgetFunc:
 * @item: (type GObject): the item from the model for which to create a widget for
 * @user_data: (closure): user data
 *
 * Called for list boxes that are bound to a `GListModel` with
 * gtk_list_box_bind_model() for each item that gets added to the model.
 *
 * If the widget returned is not a #GtkListBoxRow widget, then the widget
 * will be inserted as the child of an intermediate #GtkListBoxRow.
 *
 * Returns: (transfer full): a `GtkWidget` that represents @item
  }

  PGtkListBoxCreateWidgetFunc = ^TGtkListBoxCreateWidgetFunc;
  TGtkListBoxCreateWidgetFunc = function (item:Tgpointer; user_data:Tgpointer):PGtkWidget;cdecl;

function gtk_list_box_row_get_type:TGType;cdecl;external libgtk4;
function gtk_list_box_row_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_list_box_row_set_child(row:PGtkListBoxRow; child:PGtkWidget);cdecl;external libgtk4;
function gtk_list_box_row_get_child(row:PGtkListBoxRow):PGtkWidget;cdecl;external libgtk4;
function gtk_list_box_row_get_header(row:PGtkListBoxRow):PGtkWidget;cdecl;external libgtk4;
procedure gtk_list_box_row_set_header(row:PGtkListBoxRow; header:PGtkWidget);cdecl;external libgtk4;
function gtk_list_box_row_get_index(row:PGtkListBoxRow):longint;cdecl;external libgtk4;
procedure gtk_list_box_row_changed(row:PGtkListBoxRow);cdecl;external libgtk4;
function gtk_list_box_row_is_selected(row:PGtkListBoxRow):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_box_row_set_selectable(row:PGtkListBoxRow; selectable:Tgboolean);cdecl;external libgtk4;
function gtk_list_box_row_get_selectable(row:PGtkListBoxRow):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_box_row_set_activatable(row:PGtkListBoxRow; activatable:Tgboolean);cdecl;external libgtk4;
function gtk_list_box_row_get_activatable(row:PGtkListBoxRow):Tgboolean;cdecl;external libgtk4;
function gtk_list_box_get_type:TGType;cdecl;external libgtk4;
procedure gtk_list_box_prepend(box:PGtkListBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_list_box_append(box:PGtkListBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_list_box_insert(box:PGtkListBox; child:PGtkWidget; position:longint);cdecl;external libgtk4;
procedure gtk_list_box_remove(box:PGtkListBox; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_list_box_remove_all(box:PGtkListBox);cdecl;external libgtk4;
function gtk_list_box_get_selected_row(box:PGtkListBox):PGtkListBoxRow;cdecl;external libgtk4;
function gtk_list_box_get_row_at_index(box:PGtkListBox; index_:longint):PGtkListBoxRow;cdecl;external libgtk4;
function gtk_list_box_get_row_at_y(box:PGtkListBox; y:longint):PGtkListBoxRow;cdecl;external libgtk4;
procedure gtk_list_box_select_row(box:PGtkListBox; row:PGtkListBoxRow);cdecl;external libgtk4;
procedure gtk_list_box_set_placeholder(box:PGtkListBox; placeholder:PGtkWidget);cdecl;external libgtk4;
procedure gtk_list_box_set_adjustment(box:PGtkListBox; adjustment:PGtkAdjustment);cdecl;external libgtk4;
function gtk_list_box_get_adjustment(box:PGtkListBox):PGtkAdjustment;cdecl;external libgtk4;
type

  TGtkListBoxForeachFunc = procedure (box:PGtkListBox; row:PGtkListBoxRow; user_data:Tgpointer);cdecl;

procedure gtk_list_box_selected_foreach(box:PGtkListBox; func:TGtkListBoxForeachFunc; data:Tgpointer);cdecl;external libgtk4;
function gtk_list_box_get_selected_rows(box:PGtkListBox):PGList;cdecl;external libgtk4;
procedure gtk_list_box_unselect_row(box:PGtkListBox; row:PGtkListBoxRow);cdecl;external libgtk4;
procedure gtk_list_box_select_all(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_unselect_all(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_set_selection_mode(box:PGtkListBox; mode:TGtkSelectionMode);cdecl;external libgtk4;
function gtk_list_box_get_selection_mode(box:PGtkListBox):TGtkSelectionMode;cdecl;external libgtk4;
procedure gtk_list_box_set_filter_func(box:PGtkListBox; filter_func:TGtkListBoxFilterFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_list_box_set_header_func(box:PGtkListBox; update_header:TGtkListBoxUpdateHeaderFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_list_box_invalidate_filter(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_invalidate_sort(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_invalidate_headers(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_set_sort_func(box:PGtkListBox; sort_func:TGtkListBoxSortFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_list_box_set_activate_on_single_click(box:PGtkListBox; single:Tgboolean);cdecl;external libgtk4;
function gtk_list_box_get_activate_on_single_click(box:PGtkListBox):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_box_drag_unhighlight_row(box:PGtkListBox);cdecl;external libgtk4;
procedure gtk_list_box_drag_highlight_row(box:PGtkListBox; row:PGtkListBoxRow);cdecl;external libgtk4;
function gtk_list_box_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_list_box_bind_model(box:PGtkListBox; model:PGListModel; create_widget_func:TGtkListBoxCreateWidgetFunc; user_data:Tgpointer; user_data_free_func:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_list_box_set_show_separators(box:PGtkListBox; show_separators:Tgboolean);cdecl;external libgtk4;
function gtk_list_box_get_show_separators(box:PGtkListBox):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_box_set_tab_behavior(box:PGtkListBox; behavior:TGtkListTabBehavior);cdecl;external libgtk4;
function gtk_list_box_get_tab_behavior(box:PGtkListBox):TGtkListTabBehavior;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListBox, g_object_unref) }
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListBoxRow, g_object_unref) }

// === Konventiert am: 6-7-26 14:19:49 ===

function GTK_TYPE_LIST_BOX : TGType;
function GTK_LIST_BOX(obj : Pointer) : PGtkListBox;
function GTK_IS_LIST_BOX(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_LIST_BOX : TGType;
  begin
    GTK_TYPE_LIST_BOX:=gtk_list_box_get_type;
  end;

function GTK_LIST_BOX(obj : Pointer) : PGtkListBox;
begin
  Result := PGtkListBox(g_type_check_instance_cast(obj, GTK_TYPE_LIST_BOX));
end;

function GTK_IS_LIST_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LIST_BOX);
end;


{ was #define dname def_expr }
function GTK_TYPE_LIST_BOX_ROW : longint; { return type might be wrong }
  begin
    GTK_TYPE_LIST_BOX_ROW:=gtk_list_box_row_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW(obj : longint) : longint;
begin
  GTK_LIST_BOX_ROW:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_LIST_BOX_ROW,GtkListBoxRow);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW_CLASS(klass : longint) : longint;
begin
  GTK_LIST_BOX_ROW_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_LIST_BOX_ROW,GtkListBoxRowClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BOX_ROW(obj : longint) : longint;
begin
  GTK_IS_LIST_BOX_ROW:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_LIST_BOX_ROW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LIST_BOX_ROW_CLASS(klass : longint) : longint;
begin
  GTK_IS_LIST_BOX_ROW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_LIST_BOX_ROW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LIST_BOX_ROW_GET_CLASS(obj : longint) : longint;
begin
  GTK_LIST_BOX_ROW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_LIST_BOX_ROW,GtkListBoxRowClass);
end;


end.
