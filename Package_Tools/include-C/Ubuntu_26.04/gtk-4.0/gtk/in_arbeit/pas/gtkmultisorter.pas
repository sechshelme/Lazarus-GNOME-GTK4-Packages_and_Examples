unit gtkmultisorter;

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

{G_DECLARE_FINAL_TYPE (GtkMultiSorter, gtk_multi_sorter, GTK, MULTI_SORTER, GtkSorter) }
function gtk_multi_sorter_new:PGtkMultiSorter;cdecl;external libgtk4;
procedure gtk_multi_sorter_append(self:PGtkMultiSorter; sorter:PGtkSorter);cdecl;external libgtk4;
procedure gtk_multi_sorter_remove(self:PGtkMultiSorter; position:Tguint);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:33 ===

function GTK_TYPE_MULTI_SORTER: TGType;
function GTK_MULTI_SORTER(obj: Pointer): PGtkMultiSorter;
function GTK_IS_MULTI_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_MULTI_SORTER: TGType;
begin
  Result := gtk_multi_sorter_get_type;
end;

function GTK_MULTI_SORTER(obj: Pointer): PGtkMultiSorter;
begin
  Result := PGtkMultiSorter(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_SORTER));
end;

function GTK_IS_MULTI_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_SORTER);
end;

type 
  PGtkMultiSorter = type Pointer;

  TGtkMultiSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkMultiSorterClass = ^TGtkMultiSorterClass;

function gtk_multi_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
