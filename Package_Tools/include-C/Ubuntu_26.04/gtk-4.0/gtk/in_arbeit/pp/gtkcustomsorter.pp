
unit gtkcustomsorter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcustomsorter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcustomsorter.h
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
PGtkCustomSorter  = ^GtkCustomSorter;
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
function GTK_TYPE_CUSTOM_SORTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkCustomSorter, gtk_custom_sorter, GTK, CUSTOM_SORTER, GtkSorter) }
function gtk_custom_sorter_new(sort_func:TGCompareDataFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify):PGtkCustomSorter;cdecl;external;
procedure gtk_custom_sorter_set_sort_func(self:PGtkCustomSorter; sort_func:TGCompareDataFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_CUSTOM_SORTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_CUSTOM_SORTER:=gtk_custom_sorter_get_type;
  end;


end.
