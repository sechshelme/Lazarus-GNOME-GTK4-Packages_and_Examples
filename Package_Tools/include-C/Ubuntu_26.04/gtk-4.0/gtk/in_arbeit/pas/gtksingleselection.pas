unit gtksingleselection;

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
{$include <gtk/gtktypes.h>}

{G_DECLARE_FINAL_TYPE (GtkSingleSelection, gtk_single_selection, GTK, SINGLE_SELECTION, GObject) }
function gtk_single_selection_new(model:PGListModel):PGtkSingleSelection;cdecl;external libgtk4;
function gtk_single_selection_get_model(self:PGtkSingleSelection):PGListModel;cdecl;external libgtk4;
procedure gtk_single_selection_set_model(self:PGtkSingleSelection; model:PGListModel);cdecl;external libgtk4;
function gtk_single_selection_get_selected(self:PGtkSingleSelection):Tguint;cdecl;external libgtk4;
procedure gtk_single_selection_set_selected(self:PGtkSingleSelection; position:Tguint);cdecl;external libgtk4;
function gtk_single_selection_get_selected_item(self:PGtkSingleSelection):Tgpointer;cdecl;external libgtk4;
function gtk_single_selection_get_autoselect(self:PGtkSingleSelection):Tgboolean;cdecl;external libgtk4;
procedure gtk_single_selection_set_autoselect(self:PGtkSingleSelection; autoselect:Tgboolean);cdecl;external libgtk4;
function gtk_single_selection_get_can_unselect(self:PGtkSingleSelection):Tgboolean;cdecl;external libgtk4;
procedure gtk_single_selection_set_can_unselect(self:PGtkSingleSelection; can_unselect:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:00:10 ===

function GTK_TYPE_SINGLE_SELECTION: TGType;
function GTK_SINGLE_SELECTION(obj: Pointer): PGtkSingleSelection;
function GTK_IS_SINGLE_SELECTION(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SINGLE_SELECTION: TGType;
begin
  Result := gtk_single_selection_get_type;
end;

function GTK_SINGLE_SELECTION(obj: Pointer): PGtkSingleSelection;
begin
  Result := PGtkSingleSelection(g_type_check_instance_cast(obj, GTK_TYPE_SINGLE_SELECTION));
end;

function GTK_IS_SINGLE_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SINGLE_SELECTION);
end;

type 
  PGtkSingleSelection = type Pointer;

  TGtkSingleSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSingleSelectionClass = ^TGtkSingleSelectionClass;

function gtk_single_selection_get_type: TGType; cdecl; external libgxxxxxxx;



end.
