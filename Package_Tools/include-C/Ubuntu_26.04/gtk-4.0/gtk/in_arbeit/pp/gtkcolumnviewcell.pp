
unit gtkcolumnviewcell;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolumnviewcell.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolumnviewcell.h
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
PGtkColumnViewCell  = ^GtkColumnViewCell;
PGtkWidget  = ^GtkWidget;
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
{$include <gtk/gtklistitem.h>}

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_CELL : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE(GtkColumnViewCell, gtk_column_view_cell, GTK, COLUMN_VIEW_CELL, GtkListItem) }
function gtk_column_view_cell_get_item(self:PGtkColumnViewCell):Tgpointer;cdecl;external;
function gtk_column_view_cell_get_position(self:PGtkColumnViewCell):Tguint;cdecl;external;
function gtk_column_view_cell_get_selected(self:PGtkColumnViewCell):Tgboolean;cdecl;external;
function gtk_column_view_cell_get_focusable(self:PGtkColumnViewCell):Tgboolean;cdecl;external;
procedure gtk_column_view_cell_set_focusable(self:PGtkColumnViewCell; focusable:Tgboolean);cdecl;external;
procedure gtk_column_view_cell_set_child(self:PGtkColumnViewCell; child:PGtkWidget);cdecl;external;
function gtk_column_view_cell_get_child(self:PGtkColumnViewCell):PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW_CELL : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLUMN_VIEW_CELL:=gtk_column_view_cell_get_type;
  end;


end.
