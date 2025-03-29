
unit gtksourcecompletioncell;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcecompletioncell.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcecompletioncell.h
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
PGdkPaintable  = ^GdkPaintable;
PGIcon  = ^GIcon;
PGtkSourceCompletionCell  = ^GtkSourceCompletionCell;
PGtkSourceCompletionColumn  = ^GtkSourceCompletionColumn;
PGtkWidget  = ^GtkWidget;
PPangoAttrList  = ^PangoAttrList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2020 Christian Hergert <chergert@redhat.com>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_CELL : longint; { return type might be wrong }

type
  PGtkSourceCompletionColumn = ^TGtkSourceCompletionColumn;
  TGtkSourceCompletionColumn =  Longint;
  Const
    GTK_SOURCE_COMPLETION_COLUMN_ICON = 0;
    GTK_SOURCE_COMPLETION_COLUMN_BEFORE = 1;
    GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT = 2;
    GTK_SOURCE_COMPLETION_COLUMN_AFTER = 3;
    GTK_SOURCE_COMPLETION_COLUMN_COMMENT = 4;
    GTK_SOURCE_COMPLETION_COLUMN_DETAILS = 5;
;
{G_DECLARE_FINAL_TYPE (GtkSourceCompletionCell, gtk_source_completion_cell, GTK_SOURCE, COMPLETION_CELL, GtkWidget) }

function gtk_source_completion_cell_get_column(self:PGtkSourceCompletionCell):TGtkSourceCompletionColumn;cdecl;external;
function gtk_source_completion_cell_get_widget(self:PGtkSourceCompletionCell):PGtkWidget;cdecl;external;
procedure gtk_source_completion_cell_set_widget(self:PGtkSourceCompletionCell; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_completion_cell_set_markup(self:PGtkSourceCompletionCell; markup:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_completion_cell_set_icon_name(self:PGtkSourceCompletionCell; icon_name:Pchar);cdecl;external;
procedure gtk_source_completion_cell_set_gicon(self:PGtkSourceCompletionCell; gicon:PGIcon);cdecl;external;
procedure gtk_source_completion_cell_set_paintable(self:PGtkSourceCompletionCell; paintable:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_completion_cell_set_text(self:PGtkSourceCompletionCell; text:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_completion_cell_set_text_with_attributes(self:PGtkSourceCompletionCell; text:Pchar; attrs:PPangoAttrList);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_COMPLETION_CELL : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_COMPLETION_CELL:=gtk_source_completion_cell_get_type;
  end;


end.
