unit gtkcolumnviewcell;

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
{$include <gtk/gtklistitem.h>}

{GDK_DECLARE_INTERNAL_TYPE(GtkColumnViewCell, gtk_column_view_cell, GTK, COLUMN_VIEW_CELL, GtkListItem) }
function gtk_column_view_cell_get_item(self:PGtkColumnViewCell):Tgpointer;cdecl;external libgtk4;
function gtk_column_view_cell_get_position(self:PGtkColumnViewCell):Tguint;cdecl;external libgtk4;
function gtk_column_view_cell_get_selected(self:PGtkColumnViewCell):Tgboolean;cdecl;external libgtk4;
function gtk_column_view_cell_get_focusable(self:PGtkColumnViewCell):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_cell_set_focusable(self:PGtkColumnViewCell; focusable:Tgboolean);cdecl;external libgtk4;
procedure gtk_column_view_cell_set_child(self:PGtkColumnViewCell; child:PGtkWidget);cdecl;external libgtk4;
function gtk_column_view_cell_get_child(self:PGtkColumnViewCell):PGtkWidget;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:02:23 ===

function GTK_TYPE_COLUMN_VIEW_CELL: TGType;
function GTK_COLUMN_VIEW_CELL(obj: Pointer): PGtkColumnViewCell;
function GTK_IS_COLUMN_VIEW_CELL(obj: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_CELL_CLASS(klass: Pointer): PGtkColumnViewCellClass;
function GTK_IS_COLUMN_VIEW_CELL_CLASS(klass: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_CELL_GET_CLASS(obj: Pointer): PGtkColumnViewCellClass;

implementation

function GTK_TYPE_COLUMN_VIEW_CELL: TGType;
begin
  Result := gtk_column_view_cell_get_type;
end;

function GTK_COLUMN_VIEW_CELL(obj: Pointer): PGtkColumnViewCell;
begin
  Result := PGtkColumnViewCell(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_CELL));
end;

function GTK_IS_COLUMN_VIEW_CELL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLUMN_VIEW_CELL);
end;

function GTK_COLUMN_VIEW_CELL_CLASS(klass: Pointer): PGtkColumnViewCellClass;
begin
  Result := PGtkColumnViewCellClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW_CELL));
end;

function GTK_IS_COLUMN_VIEW_CELL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_COLUMN_VIEW_CELL);
end;

function GTK_COLUMN_VIEW_CELL_GET_CLASS(obj: Pointer): PGtkColumnViewCellClass;
begin
  Result := PGtkColumnViewCellClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkColumnViewCell = type Pointer;

  TGtkColumnViewCellClass = record
  end;
  PGtkColumnViewCellClass = ^TGtkColumnViewCellClass;

function gtk_column_view_cell_get_type: TGType; cdecl; external libgxxxxxxx;



end.
