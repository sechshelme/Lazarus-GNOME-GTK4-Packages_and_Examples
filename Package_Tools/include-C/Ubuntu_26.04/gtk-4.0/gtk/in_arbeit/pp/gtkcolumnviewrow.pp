
unit gtkcolumnviewrow;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolumnviewrow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolumnviewrow.h
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
Pchar  = ^char;
PGtkColumnViewRow  = ^GtkColumnViewRow;
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

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_ROW : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE(GtkColumnViewRow, gtk_column_view_row, GTK, COLUMN_VIEW_ROW, GObject) }
function gtk_column_view_row_get_item(self:PGtkColumnViewRow):Tgpointer;cdecl;external;
function gtk_column_view_row_get_position(self:PGtkColumnViewRow):Tguint;cdecl;external;
function gtk_column_view_row_get_selected(self:PGtkColumnViewRow):Tgboolean;cdecl;external;
function gtk_column_view_row_get_selectable(self:PGtkColumnViewRow):Tgboolean;cdecl;external;
procedure gtk_column_view_row_set_selectable(self:PGtkColumnViewRow; selectable:Tgboolean);cdecl;external;
function gtk_column_view_row_get_activatable(self:PGtkColumnViewRow):Tgboolean;cdecl;external;
procedure gtk_column_view_row_set_activatable(self:PGtkColumnViewRow; activatable:Tgboolean);cdecl;external;
function gtk_column_view_row_get_focusable(self:PGtkColumnViewRow):Tgboolean;cdecl;external;
procedure gtk_column_view_row_set_focusable(self:PGtkColumnViewRow; focusable:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gtk_column_view_row_get_accessible_description(self:PGtkColumnViewRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_column_view_row_set_accessible_description(self:PGtkColumnViewRow; description:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_column_view_row_get_accessible_label(self:PGtkColumnViewRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_column_view_row_set_accessible_label(self:PGtkColumnViewRow; _label:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_ROW : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLUMN_VIEW_ROW:=gtk_column_view_row_get_type;
  end;


end.
