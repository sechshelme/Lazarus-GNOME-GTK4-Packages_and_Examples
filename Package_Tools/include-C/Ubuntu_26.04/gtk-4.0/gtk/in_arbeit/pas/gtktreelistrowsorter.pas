unit gtktreelistrowsorter;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkTreeListRowSorter, gtk_tree_list_row_sorter, GTK, TREE_LIST_ROW_SORTER, GtkSorter) }
function gtk_tree_list_row_sorter_new(sorter:PGtkSorter):PGtkTreeListRowSorter;cdecl;external libgtk4;
function gtk_tree_list_row_sorter_get_sorter(self:PGtkTreeListRowSorter):PGtkSorter;cdecl;external libgtk4;
procedure gtk_tree_list_row_sorter_set_sorter(self:PGtkTreeListRowSorter; sorter:PGtkSorter);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:02 ===

function GTK_TYPE_TREE_LIST_ROW_SORTER: TGType;
function GTK_TREE_LIST_ROW_SORTER(obj: Pointer): PGtkTreeListRowSorter;
function GTK_IS_TREE_LIST_ROW_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_TREE_LIST_ROW_SORTER: TGType;
begin
  Result := gtk_tree_list_row_sorter_get_type;
end;

function GTK_TREE_LIST_ROW_SORTER(obj: Pointer): PGtkTreeListRowSorter;
begin
  Result := PGtkTreeListRowSorter(g_type_check_instance_cast(obj, GTK_TYPE_TREE_LIST_ROW_SORTER));
end;

function GTK_IS_TREE_LIST_ROW_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_LIST_ROW_SORTER);
end;

type 
  PGtkTreeListRowSorter = type Pointer;

  TGtkTreeListRowSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkTreeListRowSorterClass = ^TGtkTreeListRowSorterClass;

function gtk_tree_list_row_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
