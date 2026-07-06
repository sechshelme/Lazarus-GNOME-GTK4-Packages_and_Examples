unit gtkcustomsorter;

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

{G_DECLARE_FINAL_TYPE (GtkCustomSorter, gtk_custom_sorter, GTK, CUSTOM_SORTER, GtkSorter) }
function gtk_custom_sorter_new(sort_func:TGCompareDataFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify):PGtkCustomSorter;cdecl;external libgtk4;
procedure gtk_custom_sorter_set_sort_func(self:PGtkCustomSorter; sort_func:TGCompareDataFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:19 ===

function GTK_TYPE_CUSTOM_SORTER: TGType;
function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CUSTOM_SORTER: TGType;
begin
  Result := gtk_custom_sorter_get_type;
end;

function GTK_CUSTOM_SORTER(obj: Pointer): PGtkCustomSorter;
begin
  Result := PGtkCustomSorter(g_type_check_instance_cast(obj, GTK_TYPE_CUSTOM_SORTER));
end;

function GTK_IS_CUSTOM_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CUSTOM_SORTER);
end;

type 
  PGtkCustomSorter = type Pointer;

  TGtkCustomSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkCustomSorterClass = ^TGtkCustomSorterClass;

function gtk_custom_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
