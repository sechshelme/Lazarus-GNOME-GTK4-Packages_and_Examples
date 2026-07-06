unit gtkcolumnviewrow;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2023 Benjamin Otte
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

{GDK_DECLARE_INTERNAL_TYPE(GtkColumnViewRow, gtk_column_view_row, GTK, COLUMN_VIEW_ROW, GObject) }
function gtk_column_view_row_get_item(self:PGtkColumnViewRow):Tgpointer;cdecl;external libgtk4;
function gtk_column_view_row_get_position(self:PGtkColumnViewRow):Tguint;cdecl;external libgtk4;
function gtk_column_view_row_get_selected(self:PGtkColumnViewRow):Tgboolean;cdecl;external libgtk4;
function gtk_column_view_row_get_selectable(self:PGtkColumnViewRow):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_row_set_selectable(self:PGtkColumnViewRow; selectable:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_row_get_activatable(self:PGtkColumnViewRow):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_row_set_activatable(self:PGtkColumnViewRow; activatable:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_row_get_focusable(self:PGtkColumnViewRow):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_row_set_focusable(self:PGtkColumnViewRow; focusable:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_row_get_accessible_description(self:PGtkColumnViewRow):Pchar;cdecl;external libgtk4;
procedure gtk_column_view_row_set_accessible_description(self:PGtkColumnViewRow; description:Pchar);cdecl;external libgtk4;
function gtk_column_view_row_get_accessible_label(self:PGtkColumnViewRow):Pchar;cdecl;external libgtk4;
procedure gtk_column_view_row_set_accessible_label(self:PGtkColumnViewRow; _label:Pchar);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:02:03 ===

function GTK_TYPE_COLUMN_VIEW_ROW: TGType;
function GTK_COLUMN_VIEW_ROW(obj: Pointer): PGtkColumnViewRow;
function GTK_IS_COLUMN_VIEW_ROW(obj: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_ROW_CLASS(klass: Pointer): PGtkColumnViewRowClass;
function GTK_IS_COLUMN_VIEW_ROW_CLASS(klass: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_ROW_GET_CLASS(obj: Pointer): PGtkColumnViewRowClass;

implementation

function GTK_TYPE_COLUMN_VIEW_ROW: TGType;
begin
  Result := gtk_column_view_row_get_type;
end;

function GTK_COLUMN_VIEW_ROW(obj: Pointer): PGtkColumnViewRow;
begin
  Result := PGtkColumnViewRow(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_ROW));
end;

function GTK_IS_COLUMN_VIEW_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLUMN_VIEW_ROW);
end;

function GTK_COLUMN_VIEW_ROW_CLASS(klass: Pointer): PGtkColumnViewRowClass;
begin
  Result := PGtkColumnViewRowClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW_ROW));
end;

function GTK_IS_COLUMN_VIEW_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_COLUMN_VIEW_ROW);
end;

function GTK_COLUMN_VIEW_ROW_GET_CLASS(obj: Pointer): PGtkColumnViewRowClass;
begin
  Result := PGtkColumnViewRowClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkColumnViewRow = type Pointer;

  TGtkColumnViewRowClass = record
  end;
  PGtkColumnViewRowClass = ^TGtkColumnViewRowClass;

function gtk_column_view_row_get_type: TGType; cdecl; external libgxxxxxxx;



end.
