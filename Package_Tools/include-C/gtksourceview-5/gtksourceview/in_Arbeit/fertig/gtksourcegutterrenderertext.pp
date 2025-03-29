
unit gtksourcegutterrenderertext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcegutterrenderertext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcegutterrenderertext.h
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
PGtkSourceGutterRenderer  = ^GtkSourceGutterRenderer;
PGtkSourceGutterRendererText  = ^GtkSourceGutterRendererText;
PGtkSourceGutterRendererTextClass  = ^GtkSourceGutterRendererTextClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
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
{$include "gtksourcetypes.h"}
{$include "gtksourcegutterrenderer.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT : longint; { return type might be wrong }

{< private > }
type
  PGtkSourceGutterRendererTextClass = ^TGtkSourceGutterRendererTextClass;
  TGtkSourceGutterRendererTextClass = record
      parent_class : TGtkSourceGutterRendererClass;
      _reserved : array[0..9] of Tgpointer;
    end;

{G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererText, gtk_source_gutter_renderer_text, GTK_SOURCE, GUTTER_RENDERER_TEXT, GtkSourceGutterRenderer) }

function gtk_source_gutter_renderer_text_new:PGtkSourceGutterRenderer;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_text_set_markup(renderer:PGtkSourceGutterRendererText; markup:Pgchar; length:Tgint);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_text_set_text(renderer:PGtkSourceGutterRendererText; text:Pgchar; length:Tgint);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_text_measure(renderer:PGtkSourceGutterRendererText; text:Pgchar; width:Pgint; height:Pgint);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_text_measure_markup(renderer:PGtkSourceGutterRendererText; markup:Pgchar; width:Pgint; height:Pgint);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT:=gtk_source_gutter_renderer_text_get_type;
  end;


end.
