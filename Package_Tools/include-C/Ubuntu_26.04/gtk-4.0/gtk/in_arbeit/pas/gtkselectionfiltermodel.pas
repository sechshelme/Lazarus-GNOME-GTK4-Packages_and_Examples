unit gtkselectionfiltermodel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
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
 * Authors: Matthias Clasen
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include <gtk/gtkselectionmodel.h>}

{G_DECLARE_FINAL_TYPE (GtkSelectionFilterModel, gtk_selection_filter_model, GTK, SELECTION_FILTER_MODEL, GObject) }
function gtk_selection_filter_model_new(model:PGtkSelectionModel):PGtkSelectionFilterModel;cdecl;external libgtk4;
procedure gtk_selection_filter_model_set_model(self:PGtkSelectionFilterModel; model:PGtkSelectionModel);cdecl;external libgtk4;
function gtk_selection_filter_model_get_model(self:PGtkSelectionFilterModel):PGtkSelectionModel;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:22 ===

function GTK_TYPE_SELECTION_FILTER_MODEL: TGType;
function GTK_SELECTION_FILTER_MODEL(obj: Pointer): PGtkSelectionFilterModel;
function GTK_IS_SELECTION_FILTER_MODEL(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SELECTION_FILTER_MODEL: TGType;
begin
  Result := gtk_selection_filter_model_get_type;
end;

function GTK_SELECTION_FILTER_MODEL(obj: Pointer): PGtkSelectionFilterModel;
begin
  Result := PGtkSelectionFilterModel(g_type_check_instance_cast(obj, GTK_TYPE_SELECTION_FILTER_MODEL));
end;

function GTK_IS_SELECTION_FILTER_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SELECTION_FILTER_MODEL);
end;

type 
  PGtkSelectionFilterModel = type Pointer;

  TGtkSelectionFilterModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSelectionFilterModelClass = ^TGtkSelectionFilterModelClass;

function gtk_selection_filter_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
