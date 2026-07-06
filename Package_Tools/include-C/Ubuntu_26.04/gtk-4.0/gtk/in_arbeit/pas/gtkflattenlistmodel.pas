unit gtkflattenlistmodel;

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
{$include <gdk/gdk.h>}

{G_DECLARE_FINAL_TYPE (GtkFlattenListModel, gtk_flatten_list_model, GTK, FLATTEN_LIST_MODEL, GObject) }
function gtk_flatten_list_model_new(model:PGListModel):PGtkFlattenListModel;cdecl;external libgtk4;
procedure gtk_flatten_list_model_set_model(self:PGtkFlattenListModel; model:PGListModel);cdecl;external libgtk4;
function gtk_flatten_list_model_get_model(self:PGtkFlattenListModel):PGListModel;cdecl;external libgtk4;
function gtk_flatten_list_model_get_model_for_item(self:PGtkFlattenListModel; position:Tguint):PGListModel;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:40 ===

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
begin
  Result := gtk_flatten_list_model_get_type;
end;

function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
begin
  Result := PGtkFlattenListModel(g_type_check_instance_cast(obj, GTK_TYPE_FLATTEN_LIST_MODEL));
end;

function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FLATTEN_LIST_MODEL);
end;

type 
  PGtkFlattenListModel = type Pointer;

  TGtkFlattenListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFlattenListModelClass = ^TGtkFlattenListModelClass;

function gtk_flatten_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
