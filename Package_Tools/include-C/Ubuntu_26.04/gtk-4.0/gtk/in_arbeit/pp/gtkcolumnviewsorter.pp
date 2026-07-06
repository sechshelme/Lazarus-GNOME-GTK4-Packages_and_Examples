
unit gtkcolumnviewsorter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolumnviewsorter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolumnviewsorter.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGtkColumnViewColumn  = ^GtkColumnViewColumn;
PGtkColumnViewSorter  = ^GtkColumnViewSorter;
PGtkSortType  = ^GtkSortType;
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

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_SORTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkColumnViewSorter, gtk_column_view_sorter, GTK, COLUMN_VIEW_SORTER, GtkSorter) }
function gtk_column_view_sorter_get_primary_sort_column(self:PGtkColumnViewSorter):PGtkColumnViewColumn;cdecl;external;
function gtk_column_view_sorter_get_primary_sort_order(self:PGtkColumnViewSorter):TGtkSortType;cdecl;external;
function gtk_column_view_sorter_get_n_sort_columns(self:PGtkColumnViewSorter):Tguint;cdecl;external;
function gtk_column_view_sorter_get_nth_sort_column(self:PGtkColumnViewSorter; position:Tguint; sort_order:PGtkSortType):PGtkColumnViewColumn;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_SORTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLUMN_VIEW_SORTER:=gtk_column_view_sorter_get_type;
  end;


end.
