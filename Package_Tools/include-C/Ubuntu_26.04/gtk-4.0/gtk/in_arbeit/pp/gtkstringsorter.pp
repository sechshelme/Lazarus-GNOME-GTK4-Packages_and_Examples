
unit gtkstringsorter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkstringsorter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkstringsorter.h
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
PGtkCollation  = ^GtkCollation;
PGtkExpression  = ^GtkExpression;
PGtkStringSorter  = ^GtkStringSorter;
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
function GTK_TYPE_STRING_SORTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkStringSorter, gtk_string_sorter, GTK, STRING_SORTER, GtkSorter) }
function gtk_string_sorter_new(expression:PGtkExpression):PGtkStringSorter;cdecl;external;
function gtk_string_sorter_get_expression(self:PGtkStringSorter):PGtkExpression;cdecl;external;
procedure gtk_string_sorter_set_expression(self:PGtkStringSorter; expression:PGtkExpression);cdecl;external;
function gtk_string_sorter_get_ignore_case(self:PGtkStringSorter):Tgboolean;cdecl;external;
procedure gtk_string_sorter_set_ignore_case(self:PGtkStringSorter; ignore_case:Tgboolean);cdecl;external;
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

procedure gtk_string_sorter_set_collation(self:PGtkStringSorter; collation:TGtkCollation);cdecl;external;
function gtk_string_sorter_get_collation(self:PGtkStringSorter):TGtkCollation;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_STRING_SORTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_STRING_SORTER:=gtk_string_sorter_get_type;
  end;


end.
