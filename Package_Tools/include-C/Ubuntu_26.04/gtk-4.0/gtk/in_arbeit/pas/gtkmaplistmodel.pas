unit gtkmaplistmodel;

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

{G_DECLARE_FINAL_TYPE (GtkMapListModel, gtk_map_list_model, GTK, MAP_LIST_MODEL, GObject) }
{*
 * GtkMapListModelMapFunc:
 * @item: (type GObject) (transfer full): The item to map
 * @user_data: user data
 *
 * User function that is called to map an @item of the original model to
 * an item expected by the map model.
 *
 * The returned items must conform to the item type of the model they are
 * used with.
 *
 * Returns: (type GObject) (transfer full): The item to map to
  }
type

  TGtkMapListModelMapFunc = function (item:Tgpointer; user_data:Tgpointer):Tgpointer;cdecl;

function gtk_map_list_model_new(model:PGListModel; map_func:TGtkMapListModelMapFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify):PGtkMapListModel;cdecl;external libgtk4;
procedure gtk_map_list_model_set_map_func(self:PGtkMapListModel; map_func:TGtkMapListModelMapFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_map_list_model_set_model(self:PGtkMapListModel; model:PGListModel);cdecl;external libgtk4;
function gtk_map_list_model_get_model(self:PGtkMapListModel):PGListModel;cdecl;external libgtk4;
function gtk_map_list_model_has_map(self:PGtkMapListModel):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:45:30 ===

function GTK_TYPE_MAP_LIST_MODEL: TGType;
function GTK_MAP_LIST_MODEL(obj: Pointer): PGtkMapListModel;
function GTK_IS_MAP_LIST_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_MAP_LIST_MODEL: TGType;
begin
  Result := gtk_map_list_model_get_type;
end;

function GTK_MAP_LIST_MODEL(obj: Pointer): PGtkMapListModel;
begin
  Result := PGtkMapListModel(g_type_check_instance_cast(obj, GTK_TYPE_MAP_LIST_MODEL));
end;

function GTK_IS_MAP_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MAP_LIST_MODEL);
end;

type 
  PGtkMapListModel = type Pointer;

  TGtkMapListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkMapListModelClass = ^TGtkMapListModelClass;

function gtk_map_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
