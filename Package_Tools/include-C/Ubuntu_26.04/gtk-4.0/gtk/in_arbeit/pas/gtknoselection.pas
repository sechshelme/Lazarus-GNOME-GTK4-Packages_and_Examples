unit gtknoselection;

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
{$include <gtk/gtktypes.h>}

{G_DECLARE_FINAL_TYPE (GtkNoSelection, gtk_no_selection, GTK, NO_SELECTION, GObject) }
function gtk_no_selection_new(model:PGListModel):PGtkNoSelection;cdecl;external libgtk4;
function gtk_no_selection_get_model(self:PGtkNoSelection):PGListModel;cdecl;external libgtk4;
procedure gtk_no_selection_set_model(self:PGtkNoSelection; model:PGListModel);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:19 ===

function GTK_TYPE_NO_SELECTION: TGType;
function GTK_NO_SELECTION(obj: Pointer): PGtkNoSelection;
function GTK_IS_NO_SELECTION(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_NO_SELECTION: TGType;
begin
  Result := gtk_no_selection_get_type;
end;

function GTK_NO_SELECTION(obj: Pointer): PGtkNoSelection;
begin
  Result := PGtkNoSelection(g_type_check_instance_cast(obj, GTK_TYPE_NO_SELECTION));
end;

function GTK_IS_NO_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NO_SELECTION);
end;

type 
  PGtkNoSelection = type Pointer;

  TGtkNoSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkNoSelectionClass = ^TGtkNoSelectionClass;

function gtk_no_selection_get_type: TGType; cdecl; external libgxxxxxxx;



end.
