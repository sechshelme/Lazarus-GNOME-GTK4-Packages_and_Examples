unit gtkmultiselection;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkselectionmodel.h>}

{G_DECLARE_FINAL_TYPE (GtkMultiSelection, gtk_multi_selection, GTK, MULTI_SELECTION, GObject) }
function gtk_multi_selection_new(model:PGListModel):PGtkMultiSelection;cdecl;external libgtk4;
function gtk_multi_selection_get_model(self:PGtkMultiSelection):PGListModel;cdecl;external libgtk4;
procedure gtk_multi_selection_set_model(self:PGtkMultiSelection; model:PGListModel);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:22 ===

function GTK_TYPE_MULTI_SELECTION: TGType;
function GTK_MULTI_SELECTION(obj: Pointer): PGtkMultiSelection;
function GTK_IS_MULTI_SELECTION(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_MULTI_SELECTION: TGType;
begin
  Result := gtk_multi_selection_get_type;
end;

function GTK_MULTI_SELECTION(obj: Pointer): PGtkMultiSelection;
begin
  Result := PGtkMultiSelection(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_SELECTION));
end;

function GTK_IS_MULTI_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_SELECTION);
end;

type 
  PGtkMultiSelection = type Pointer;

  TGtkMultiSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkMultiSelectionClass = ^TGtkMultiSelectionClass;

function gtk_multi_selection_get_type: TGType; cdecl; external libgxxxxxxx;



end.
