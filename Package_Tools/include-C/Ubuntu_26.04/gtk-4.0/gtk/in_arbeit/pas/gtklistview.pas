unit gtklistview;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
{$include <gtk/gtklistbase.h>}

type

function gtk_list_view_get_type:TGType;cdecl;external libgtk4;
function gtk_list_view_new(model:PGtkSelectionModel; factory:PGtkListItemFactory):PGtkWidget;cdecl;external libgtk4;
function gtk_list_view_get_model(self:PGtkListView):PGtkSelectionModel;cdecl;external libgtk4;
procedure gtk_list_view_set_model(self:PGtkListView; model:PGtkSelectionModel);cdecl;external libgtk4;
procedure gtk_list_view_set_factory(self:PGtkListView; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_list_view_get_factory(self:PGtkListView):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_list_view_set_header_factory(self:PGtkListView; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_list_view_get_header_factory(self:PGtkListView):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_list_view_set_show_separators(self:PGtkListView; show_separators:Tgboolean);cdecl;external libgtk4;
function gtk_list_view_get_show_separators(self:PGtkListView):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_view_set_single_click_activate(self:PGtkListView; single_click_activate:Tgboolean);cdecl;external libgtk4;
function gtk_list_view_get_single_click_activate(self:PGtkListView):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_view_set_enable_rubberband(self:PGtkListView; enable_rubberband:Tgboolean);cdecl;external libgtk4;
function gtk_list_view_get_enable_rubberband(self:PGtkListView):Tgboolean;cdecl;external libgtk4;
procedure gtk_list_view_set_tab_behavior(self:PGtkListView; tab_behavior:TGtkListTabBehavior);cdecl;external libgtk4;
function gtk_list_view_get_tab_behavior(self:PGtkListView):TGtkListTabBehavior;cdecl;external libgtk4;
procedure gtk_list_view_scroll_to(self:PGtkListView; pos:Tguint; flags:TGtkListScrollFlags; scroll:PGtkScrollInfo);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListView, g_object_unref) }

// === Konventiert am: 6-7-26 16:25:07 ===

function GTK_TYPE_LIST_VIEW : TGType;
function GTK_LIST_VIEW(obj : Pointer) : PGtkListView;
function GTK_LIST_VIEW_CLASS(klass : Pointer) : PGtkListViewClass;
function GTK_IS_LIST_VIEW(obj : Pointer) : Tgboolean;
function GTK_IS_LIST_VIEW_CLASS(klass : Pointer) : Tgboolean;
function GTK_LIST_VIEW_GET_CLASS(obj : Pointer) : PGtkListViewClass;

implementation

function GTK_TYPE_LIST_VIEW : TGType;
  begin
    GTK_TYPE_LIST_VIEW:=gtk_list_view_get_type;
  end;

function GTK_LIST_VIEW(obj : Pointer) : PGtkListView;
begin
  Result := PGtkListView(g_type_check_instance_cast(obj, GTK_TYPE_LIST_VIEW));
end;

function GTK_LIST_VIEW_CLASS(klass : Pointer) : PGtkListViewClass;
begin
  Result := PGtkListViewClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_VIEW));
end;

function GTK_IS_LIST_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LIST_VIEW);
end;

function GTK_IS_LIST_VIEW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_LIST_VIEW);
end;

function GTK_LIST_VIEW_GET_CLASS(obj : Pointer) : PGtkListViewClass;
begin
  Result := PGtkListViewClass(PGTypeInstance(obj)^.g_class);
end;



end.
