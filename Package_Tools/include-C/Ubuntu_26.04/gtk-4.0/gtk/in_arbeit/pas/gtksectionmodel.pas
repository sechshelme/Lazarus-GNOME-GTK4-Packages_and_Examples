unit gtksectionmodel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2022 Benjamin Otte
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
{$include <gtk/gtktypes.h>}

(* error 
G_DECLARE_INTERFACE (GtkSectionModel, gtk_section_model, GTK, SECTION_MODEL, GListModel)
 in declarator_list *)
(* error 
G_DECLARE_INTERFACE (GtkSectionModel, gtk_section_model, GTK, SECTION_MODEL, GListModel)
{*
 * GtkSectionModelInterface:
 * @get_section: Return the section that covers the given position. If
 *   the position is outside the number of items, returns a single range from
 *   n_items to G_MAXUINT
 *
 * The list of virtual functions for the `GtkSectionModel` interface.
 * No function must be implemented, but unless `GtkSectionModel::get_section()`
 * is implemented, the whole model will just be a single section.
 *
 * Since: 4.12
  }
 in declarator_list *)
{< private > }
(* error 
  GTypeInterface g_iface;
 in declarator_list *)
{< public > }
  var
    get_section : procedure (self:PGtkSectionModel; position:Tguint; out_start:Pguint; out_end:Pguint);cvar;public;
(* error 
};
in declaration at line 57 *)

procedure gtk_section_model_get_section(self:PGtkSectionModel; position:Tguint; out_start:Pguint; out_end:Pguint);cdecl;external libgtk4;
    { for implementations only  }
procedure gtk_section_model_sections_changed(self:PGtkSectionModel; position:Tguint; n_items:Tguint);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:33 ===

function GTK_TYPE_SECTION_MODEL: TGType;
function GTK_SECTION_MODEL(obj: Pointer): PGtkSectionModel;
function GTK_IS_SECTION_MODEL(obj: Pointer): Tgboolean;
function GTK_SECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSectionModelInterface;

implementation

function GTK_TYPE_SECTION_MODEL: TGType;
begin
  Result := gtk_section_model_get_type;
end;

function GTK_SECTION_MODEL(obj: Pointer): PGtkSectionModel;
begin
  Result := PGtkSectionModel(g_type_check_instance_cast(obj, GTK_TYPE_SECTION_MODEL));
end;

function GTK_IS_SECTION_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SECTION_MODEL);
end;

function GTK_SECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSectionModelInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SECTION_MODEL);
end;

type 
  PGtkSectionModel = type Pointer;

  PGtkSectionModelInterface = type Pointer

function gtk_section_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
