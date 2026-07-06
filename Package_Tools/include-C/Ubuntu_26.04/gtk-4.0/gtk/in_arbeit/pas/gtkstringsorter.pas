unit gtkstringsorter;

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

{G_DECLARE_FINAL_TYPE (GtkStringSorter, gtk_string_sorter, GTK, STRING_SORTER, GtkSorter) }
function gtk_string_sorter_new(expression:PGtkExpression):PGtkStringSorter;cdecl;external libgtk4;
function gtk_string_sorter_get_expression(self:PGtkStringSorter):PGtkExpression;cdecl;external libgtk4;
procedure gtk_string_sorter_set_expression(self:PGtkStringSorter; expression:PGtkExpression);cdecl;external libgtk4;
function gtk_string_sorter_get_ignore_case(self:PGtkStringSorter):Tgboolean;cdecl;external libgtk4;
procedure gtk_string_sorter_set_ignore_case(self:PGtkStringSorter; ignore_case:Tgboolean);cdecl;external libgtk4;
{*
 * GtkCollation:
 * @GTK_COLLATION_NONE: Don't do any collation
 * @GTK_COLLATION_UNICODE: Use [func@GLib.utf8_collate_key]
 * @GTK_COLLATION_FILENAME: Use [func@GLib.utf8_collate_key_for_filename]
 *
 * Describes how a [class@Gtk.StringSorter] turns strings into sort keys to
 * compare them.
 *
 * Note that the result of sorting will in general depend on the current locale
 * unless the mode is @GTK_COLLATION_NONE.
 *
 * Since: 4.10
  }
type
  PGtkCollation = ^TGtkCollation;
  TGtkCollation =  Longint;
  Const
    GTK_COLLATION_NONE = 0;
    GTK_COLLATION_UNICODE = 1;
    GTK_COLLATION_FILENAME = 2;
;

procedure gtk_string_sorter_set_collation(self:PGtkStringSorter; collation:TGtkCollation);cdecl;external libgtk4;
function gtk_string_sorter_get_collation(self:PGtkStringSorter):TGtkCollation;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:19 ===

function GTK_TYPE_STRING_SORTER: TGType;
function GTK_STRING_SORTER(obj: Pointer): PGtkStringSorter;
function GTK_IS_STRING_SORTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_STRING_SORTER: TGType;
begin
  Result := gtk_string_sorter_get_type;
end;

function GTK_STRING_SORTER(obj: Pointer): PGtkStringSorter;
begin
  Result := PGtkStringSorter(g_type_check_instance_cast(obj, GTK_TYPE_STRING_SORTER));
end;

function GTK_IS_STRING_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_SORTER);
end;

type 
  PGtkStringSorter = type Pointer;

  TGtkStringSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkStringSorterClass = ^TGtkStringSorterClass;

function gtk_string_sorter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
