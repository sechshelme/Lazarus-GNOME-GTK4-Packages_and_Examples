unit gtksortlistmodel;

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
{$include <gio/gio.h>}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtksorter.h>}

{G_DECLARE_FINAL_TYPE (GtkSortListModel, gtk_sort_list_model, GTK, SORT_LIST_MODEL, GObject) }
function gtk_sort_list_model_new(model:PGListModel; sorter:PGtkSorter):PGtkSortListModel;cdecl;external libgtk4;
procedure gtk_sort_list_model_set_sorter(self:PGtkSortListModel; sorter:PGtkSorter);cdecl;external libgtk4;
function gtk_sort_list_model_get_sorter(self:PGtkSortListModel):PGtkSorter;cdecl;external libgtk4;
procedure gtk_sort_list_model_set_section_sorter(self:PGtkSortListModel; sorter:PGtkSorter);cdecl;external libgtk4;
function gtk_sort_list_model_get_section_sorter(self:PGtkSortListModel):PGtkSorter;cdecl;external libgtk4;
procedure gtk_sort_list_model_set_model(self:PGtkSortListModel; model:PGListModel);cdecl;external libgtk4;
function gtk_sort_list_model_get_model(self:PGtkSortListModel):PGListModel;cdecl;external libgtk4;
procedure gtk_sort_list_model_set_incremental(self:PGtkSortListModel; incremental:Tgboolean);cdecl;external libgtk4;
function gtk_sort_list_model_get_incremental(self:PGtkSortListModel):Tgboolean;cdecl;external libgtk4;
function gtk_sort_list_model_get_pending(self:PGtkSortListModel):Tguint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:29 ===

function GTK_TYPE_SORT_LIST_MODEL: TGType;
function GTK_SORT_LIST_MODEL(obj: Pointer): PGtkSortListModel;
function GTK_IS_SORT_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SORT_LIST_MODEL: TGType;
begin
  Result := gtk_sort_list_model_get_type;
end;

function GTK_SORT_LIST_MODEL(obj: Pointer): PGtkSortListModel;
begin
  Result := PGtkSortListModel(g_type_check_instance_cast(obj, GTK_TYPE_SORT_LIST_MODEL));
end;

function GTK_IS_SORT_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SORT_LIST_MODEL);
end;

type 
  PGtkSortListModel = type Pointer;

  TGtkSortListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSortListModelClass = ^TGtkSortListModelClass;

function gtk_sort_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
