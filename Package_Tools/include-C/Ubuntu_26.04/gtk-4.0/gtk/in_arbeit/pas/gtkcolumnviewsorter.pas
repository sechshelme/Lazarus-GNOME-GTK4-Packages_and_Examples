unit gtkcolumnviewsorter;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2022 Matthias Clasen
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtksorter.h>}
{$include <gtk/gtkcolumnviewcolumn.h>}

{G_DECLARE_FINAL_TYPE (GtkColumnViewSorter, gtk_column_view_sorter, GTK, COLUMN_VIEW_SORTER, GtkSorter) }
function gtk_column_view_sorter_get_primary_sort_column(self:PGtkColumnViewSorter):PGtkColumnViewColumn;cdecl;external libgtk4;
function gtk_column_view_sorter_get_primary_sort_order(self:PGtkColumnViewSorter):TGtkSortType;cdecl;external libgtk4;
function gtk_column_view_sorter_get_n_sort_columns(self:PGtkColumnViewSorter):Tguint;cdecl;external libgtk4;
function gtk_column_view_sorter_get_nth_sort_column(self:PGtkColumnViewSorter; position:Tguint; sort_order:PGtkSortType):PGtkColumnViewColumn;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:01:59 ===

function GTK_TYPE_COLUMN_VIEW_SORTER: TGType;
function GTK_COLUMN_VIEW_SORTER(obj: Pointer): PGtkColumnViewSorter;
function GTK_IS_COLUMN_VIEW_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_COLUMN_VIEW_SORTER: TGType;
begin
  Result := gtk_column_view_sorter_get_type;
end;

function GTK_COLUMN_VIEW_SORTER(obj: Pointer): PGtkColumnViewSorter;
begin
  Result := PGtkColumnViewSorter(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_SORTER));
end;

function GTK_IS_COLUMN_VIEW_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLUMN_VIEW_SORTER);
end;

type 
  PGtkColumnViewSorter = type Pointer;

  TGtkColumnViewSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkColumnViewSorterClass = ^TGtkColumnViewSorterClass;

function gtk_column_view_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
