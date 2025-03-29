
unit gtksourcegutterlines;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcegutterlines.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcegutterlines.h
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
Pgchar  = ^gchar;
Pgint  = ^gint;
PGtkSourceGutterLines  = ^GtkSourceGutterLines;
PGtkTextBuffer  = ^GtkTextBuffer;
PGtkTextIter  = ^GtkTextIter;
PGtkTextView  = ^GtkTextView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2019 - Christian Hergert <chergert@redhat.com>
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
{$include "gtksourcegutterrenderer.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_LINES : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceGutterLines, gtk_source_gutter_lines, GTK_SOURCE, GUTTER_LINES, GObject) }
function gtk_source_gutter_lines_get_first(lines:PGtkSourceGutterLines):Tguint;cdecl;external;
function gtk_source_gutter_lines_get_last(lines:PGtkSourceGutterLines):Tguint;cdecl;external;
procedure gtk_source_gutter_lines_get_iter_at_line(lines:PGtkSourceGutterLines; iter:PGtkTextIter; line:Tguint);cdecl;external;
function gtk_source_gutter_lines_get_view(lines:PGtkSourceGutterLines):PGtkTextView;cdecl;external;
function gtk_source_gutter_lines_get_buffer(lines:PGtkSourceGutterLines):PGtkTextBuffer;cdecl;external;
procedure gtk_source_gutter_lines_add_qclass(lines:PGtkSourceGutterLines; line:Tguint; qname:TGQuark);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_lines_add_class(lines:PGtkSourceGutterLines; line:Tguint; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_lines_remove_class(lines:PGtkSourceGutterLines; line:Tguint; name:Pgchar);cdecl;external;
procedure gtk_source_gutter_lines_remove_qclass(lines:PGtkSourceGutterLines; line:Tguint; qname:TGQuark);cdecl;external;
(* Const before type ignored *)
function gtk_source_gutter_lines_has_class(lines:PGtkSourceGutterLines; line:Tguint; name:Pgchar):Tgboolean;cdecl;external;
function gtk_source_gutter_lines_has_qclass(lines:PGtkSourceGutterLines; line:Tguint; qname:TGQuark):Tgboolean;cdecl;external;
function gtk_source_gutter_lines_is_cursor(lines:PGtkSourceGutterLines; line:Tguint):Tgboolean;cdecl;external;
function gtk_source_gutter_lines_is_prelit(lines:PGtkSourceGutterLines; line:Tguint):Tgboolean;cdecl;external;
function gtk_source_gutter_lines_is_selected(lines:PGtkSourceGutterLines; line:Tguint):Tgboolean;cdecl;external;
procedure gtk_source_gutter_lines_get_line_yrange(lines:PGtkSourceGutterLines; line:Tguint; mode:TGtkSourceGutterRendererAlignmentMode; y:Pgint; height:Pgint);cdecl;external;
function gtk_source_gutter_lines_has_any_class(lines:PGtkSourceGutterLines; line:Tguint):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_LINES : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_GUTTER_LINES:=gtk_source_gutter_lines_get_type;
  end;


end.
