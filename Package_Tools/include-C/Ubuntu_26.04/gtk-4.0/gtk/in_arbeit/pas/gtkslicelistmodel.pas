unit gtkslicelistmodel;

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

(* error 
G_DECLARE_FINAL_TYPE (GtkSliceListModel, gtk_slice_list_model, GTK, SLICE_LIST_MODEL, GObject)
 in declarator_list *)
(* error 
G_DECLARE_FINAL_TYPE (GtkSliceListModel, gtk_slice_list_model, GTK, SLICE_LIST_MODEL, GObject)
(* error 
                                                                 guint                   offset,
(* error 
                                                                 guint                   size);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
procedure gtk_slice_list_model_set_model(self:PGtkSliceListModel; model:PGListModel);cdecl;external libgtk4;
function gtk_slice_list_model_get_model(self:PGtkSliceListModel):PGListModel;cdecl;external libgtk4;
procedure gtk_slice_list_model_set_offset(self:PGtkSliceListModel; offset:Tguint);cdecl;external libgtk4;
function gtk_slice_list_model_get_offset(self:PGtkSliceListModel):Tguint;cdecl;external libgtk4;
procedure gtk_slice_list_model_set_size(self:PGtkSliceListModel; size:Tguint);cdecl;external libgtk4;
function gtk_slice_list_model_get_size(self:PGtkSliceListModel):Tguint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:00:07 ===

function GTK_TYPE_SLICE_LIST_MODEL: TGType;
function GTK_SLICE_LIST_MODEL(obj: Pointer): PGtkSliceListModel;
function GTK_IS_SLICE_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SLICE_LIST_MODEL: TGType;
begin
  Result := gtk_slice_list_model_get_type;
end;

function GTK_SLICE_LIST_MODEL(obj: Pointer): PGtkSliceListModel;
begin
  Result := PGtkSliceListModel(g_type_check_instance_cast(obj, GTK_TYPE_SLICE_LIST_MODEL));
end;

function GTK_IS_SLICE_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SLICE_LIST_MODEL);
end;

type 
  PGtkSliceListModel = type Pointer;

  TGtkSliceListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSliceListModelClass = ^TGtkSliceListModelClass;

function gtk_slice_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
