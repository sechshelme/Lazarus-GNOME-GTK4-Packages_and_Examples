unit gtkfilterlistmodel;

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
{$include <gtk/gtkfilter.h>}

{G_DECLARE_FINAL_TYPE (GtkFilterListModel, gtk_filter_list_model, GTK, FILTER_LIST_MODEL, GObject) }
function gtk_filter_list_model_new(model:PGListModel; filter:PGtkFilter):PGtkFilterListModel;cdecl;external libgtk4;
procedure gtk_filter_list_model_set_filter(self:PGtkFilterListModel; filter:PGtkFilter);cdecl;external libgtk4;
function gtk_filter_list_model_get_filter(self:PGtkFilterListModel):PGtkFilter;cdecl;external libgtk4;
procedure gtk_filter_list_model_set_model(self:PGtkFilterListModel; model:PGListModel);cdecl;external libgtk4;
function gtk_filter_list_model_get_model(self:PGtkFilterListModel):PGListModel;cdecl;external libgtk4;
procedure gtk_filter_list_model_set_incremental(self:PGtkFilterListModel; incremental:Tgboolean);cdecl;external libgtk4;
function gtk_filter_list_model_get_incremental(self:PGtkFilterListModel):Tgboolean;cdecl;external libgtk4;
function gtk_filter_list_model_get_pending(self:PGtkFilterListModel):Tguint;cdecl;external libgtk4;
function gtk_filter_list_model_get_watch_items(self:PGtkFilterListModel):Tgboolean;cdecl;external libgtk4;
procedure gtk_filter_list_model_set_watch_items(self:PGtkFilterListModel; watch_items:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:54 ===

function GTK_TYPE_FILTER_LIST_MODEL: TGType;
function GTK_FILTER_LIST_MODEL(obj: Pointer): PGtkFilterListModel;
function GTK_IS_FILTER_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FILTER_LIST_MODEL: TGType;
begin
  Result := gtk_filter_list_model_get_type;
end;

function GTK_FILTER_LIST_MODEL(obj: Pointer): PGtkFilterListModel;
begin
  Result := PGtkFilterListModel(g_type_check_instance_cast(obj, GTK_TYPE_FILTER_LIST_MODEL));
end;

function GTK_IS_FILTER_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILTER_LIST_MODEL);
end;

type 
  PGtkFilterListModel = type Pointer;

  TGtkFilterListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFilterListModelClass = ^TGtkFilterListModelClass;

function gtk_filter_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
