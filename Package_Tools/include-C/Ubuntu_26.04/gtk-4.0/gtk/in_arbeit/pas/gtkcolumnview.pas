unit gtkcolumnview;

interface

uses
  fp_glib2, fp_gtk4;

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
{$include <gtk/gtktypes.h>}
{$include <gtk/gtksortlistmodel.h>}
{$include <gtk/gtkselectionmodel.h>}
{$include <gtk/gtksorter.h>}

type
{ forward declaration  }

function gtk_column_view_get_type:TGType;cdecl;external libgtk4;
function gtk_column_view_new(model:PGtkSelectionModel):PGtkWidget;cdecl;external libgtk4;
function gtk_column_view_get_columns(self:PGtkColumnView):PGListModel;cdecl;external libgtk4;
procedure gtk_column_view_append_column(self:PGtkColumnView; column:PGtkColumnViewColumn);cdecl;external libgtk4;
procedure gtk_column_view_remove_column(self:PGtkColumnView; column:PGtkColumnViewColumn);cdecl;external libgtk4;
procedure gtk_column_view_insert_column(self:PGtkColumnView; position:Tguint; column:PGtkColumnViewColumn);cdecl;external libgtk4;
function gtk_column_view_get_model(self:PGtkColumnView):PGtkSelectionModel;cdecl;external libgtk4;
procedure gtk_column_view_set_model(self:PGtkColumnView; model:PGtkSelectionModel);cdecl;external libgtk4;
function gtk_column_view_get_show_row_separators(self:PGtkColumnView):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_set_show_row_separators(self:PGtkColumnView; show_row_separators:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_get_show_column_separators(self:PGtkColumnView):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_set_show_column_separators(self:PGtkColumnView; show_column_separators:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_get_sorter(self:PGtkColumnView):PGtkSorter;cdecl;external libgtk4;
procedure gtk_column_view_sort_by_column(self:PGtkColumnView; column:PGtkColumnViewColumn; direction:TGtkSortType);cdecl;external libgtk4;
procedure gtk_column_view_set_single_click_activate(self:PGtkColumnView; single_click_activate:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_get_single_click_activate(self:PGtkColumnView):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_set_reorderable(self:PGtkColumnView; reorderable:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_get_reorderable(self:PGtkColumnView):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_set_enable_rubberband(self:PGtkColumnView; enable_rubberband:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_get_enable_rubberband(self:PGtkColumnView):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_set_tab_behavior(self:PGtkColumnView; tab_behavior:TGtkListTabBehavior);cdecl;external libgtk4;
function gtk_column_view_get_tab_behavior(self:PGtkColumnView):TGtkListTabBehavior;cdecl;external libgtk4;
procedure gtk_column_view_set_row_factory(self:PGtkColumnView; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_column_view_get_row_factory(self:PGtkColumnView):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_column_view_set_header_factory(self:PGtkColumnView; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_column_view_get_header_factory(self:PGtkColumnView):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_column_view_scroll_to(self:PGtkColumnView; pos:Tguint; column:PGtkColumnViewColumn; flags:TGtkListScrollFlags; scroll:PGtkScrollInfo);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:02:32 ===

function GTK_TYPE_COLUMN_VIEW : TGType;
function GTK_COLUMN_VIEW(obj : Pointer) : PGtkColumnView;
function GTK_COLUMN_VIEW_CLASS(klass : Pointer) : PGtkColumnViewClass;
function GTK_IS_COLUMN_VIEW(obj : Pointer) : Tgboolean;
function GTK_IS_COLUMN_VIEW_CLASS(klass : Pointer) : Tgboolean;
function GTK_COLUMN_VIEW_GET_CLASS(obj : Pointer) : PGtkColumnViewClass;

implementation

function GTK_TYPE_COLUMN_VIEW : TGType;
  begin
    GTK_TYPE_COLUMN_VIEW:=gtk_column_view_get_type;
  end;

function GTK_COLUMN_VIEW(obj : Pointer) : PGtkColumnView;
begin
  Result := PGtkColumnView(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW));
end;

function GTK_COLUMN_VIEW_CLASS(klass : Pointer) : PGtkColumnViewClass;
begin
  Result := PGtkColumnViewClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW));
end;

function GTK_IS_COLUMN_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COLUMN_VIEW);
end;

function GTK_IS_COLUMN_VIEW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_COLUMN_VIEW);
end;

function GTK_COLUMN_VIEW_GET_CLASS(obj : Pointer) : PGtkColumnViewClass;
begin
  Result := PGtkColumnViewClass(PGTypeInstance(obj)^.g_class);
end;



end.
