
unit gtklistheader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklistheader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklistheader.h
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
PGtkListHeader  = ^GtkListHeader;
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

{ was #define dname def_expr }
function GTK_TYPE_LIST_HEADER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkListHeader, gtk_list_header, GTK, LIST_HEADER, GObject) }
function gtk_list_header_get_item(self:PGtkListHeader):Tgpointer;cdecl;external;
function gtk_list_header_get_start(self:PGtkListHeader):Tguint;cdecl;external;
function gtk_list_header_get_end(self:PGtkListHeader):Tguint;cdecl;external;
function gtk_list_header_get_n_items(self:PGtkListHeader):Tguint;cdecl;external;
procedure gtk_list_header_set_child(self:PGtkListHeader; child:PGtkWidget);cdecl;external;
function gtk_list_header_get_child(self:PGtkListHeader):PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_LIST_HEADER : longint; { return type might be wrong }
  begin
    GTK_TYPE_LIST_HEADER:=gtk_list_header_get_type;
  end;


end.
