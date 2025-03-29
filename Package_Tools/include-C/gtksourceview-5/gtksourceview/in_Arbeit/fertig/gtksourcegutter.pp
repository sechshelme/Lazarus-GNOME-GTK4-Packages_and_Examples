
unit gtksourcegutter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcegutter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcegutter.h
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
PGtkSourceGutter  = ^GtkSourceGutter;
PGtkSourceGutterRenderer  = ^GtkSourceGutterRenderer;
PGtkSourceView  = ^GtkSourceView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2009 - Jesse van den Kieboom
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
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceGutter, gtk_source_gutter, GTK_SOURCE, GUTTER, GtkWidget) }
function gtk_source_gutter_get_view(gutter:PGtkSourceGutter):PGtkSourceView;cdecl;external;
function gtk_source_gutter_insert(gutter:PGtkSourceGutter; renderer:PGtkSourceGutterRenderer; position:Tgint):Tgboolean;cdecl;external;
procedure gtk_source_gutter_reorder(gutter:PGtkSourceGutter; renderer:PGtkSourceGutterRenderer; position:Tgint);cdecl;external;
procedure gtk_source_gutter_remove(gutter:PGtkSourceGutter; renderer:PGtkSourceGutterRenderer);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_GUTTER:=gtk_source_gutter_get_type;
  end;


end.
