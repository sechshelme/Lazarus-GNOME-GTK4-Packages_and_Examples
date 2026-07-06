
unit gtktreelistrowsorter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreelistrowsorter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreelistrowsorter.h
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
PGtkSorter  = ^GtkSorter;
PGtkTreeListRowSorter  = ^GtkTreeListRowSorter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Matthias Clasen
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
{$include <gtk/gtkexpression.h>}
{$include <gtk/gtksorter.h>}

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_ROW_SORTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkTreeListRowSorter, gtk_tree_list_row_sorter, GTK, TREE_LIST_ROW_SORTER, GtkSorter) }
function gtk_tree_list_row_sorter_new(sorter:PGtkSorter):PGtkTreeListRowSorter;cdecl;external;
function gtk_tree_list_row_sorter_get_sorter(self:PGtkTreeListRowSorter):PGtkSorter;cdecl;external;
procedure gtk_tree_list_row_sorter_set_sorter(self:PGtkTreeListRowSorter; sorter:PGtkSorter);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_ROW_SORTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_LIST_ROW_SORTER:=gtk_tree_list_row_sorter_get_type;
  end;


end.
