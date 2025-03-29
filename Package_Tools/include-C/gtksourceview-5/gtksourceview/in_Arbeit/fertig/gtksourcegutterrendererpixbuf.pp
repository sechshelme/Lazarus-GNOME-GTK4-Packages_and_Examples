
unit gtksourcegutterrendererpixbuf;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcegutterrendererpixbuf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcegutterrendererpixbuf.h
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
PGdkPaintable  = ^GdkPaintable;
PGdkPixbuf  = ^GdkPixbuf;
PGIcon  = ^GIcon;
PGtkSourceGutterRenderer  = ^GtkSourceGutterRenderer;
PGtkSourceGutterRendererPixbuf  = ^GtkSourceGutterRendererPixbuf;
PGtkSourceGutterRendererPixbufClass  = ^GtkSourceGutterRendererPixbufClass;
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
function GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererPixbuf, gtk_source_gutter_renderer_pixbuf, GTK_SOURCE, GUTTER_RENDERER_PIXBUF, GtkSourceGutterRenderer) }
{< private > }
type
  PGtkSourceGutterRendererPixbufClass = ^TGtkSourceGutterRendererPixbufClass;
  TGtkSourceGutterRendererPixbufClass = record
      parent_class : TGtkSourceGutterRendererClass;
      _reserved : array[0..9] of Tgpointer;
    end;


function gtk_source_gutter_renderer_pixbuf_new:PGtkSourceGutterRenderer;cdecl;external;
procedure gtk_source_gutter_renderer_pixbuf_set_pixbuf(renderer:PGtkSourceGutterRendererPixbuf; pixbuf:PGdkPixbuf);cdecl;external;
function gtk_source_gutter_renderer_pixbuf_get_pixbuf(renderer:PGtkSourceGutterRendererPixbuf):PGdkPixbuf;cdecl;external;
procedure gtk_source_gutter_renderer_pixbuf_set_gicon(renderer:PGtkSourceGutterRendererPixbuf; icon:PGIcon);cdecl;external;
function gtk_source_gutter_renderer_pixbuf_get_gicon(renderer:PGtkSourceGutterRendererPixbuf):PGIcon;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_pixbuf_set_icon_name(renderer:PGtkSourceGutterRendererPixbuf; icon_name:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_gutter_renderer_pixbuf_get_icon_name(renderer:PGtkSourceGutterRendererPixbuf):Pgchar;cdecl;external;
function gtk_source_gutter_renderer_pixbuf_get_paintable(renderer:PGtkSourceGutterRendererPixbuf):PGdkPaintable;cdecl;external;
procedure gtk_source_gutter_renderer_pixbuf_set_paintable(renderer:PGtkSourceGutterRendererPixbuf; paintable:PGdkPaintable);cdecl;external;
procedure gtk_source_gutter_renderer_pixbuf_overlay_paintable(renderer:PGtkSourceGutterRendererPixbuf; paintable:PGdkPaintable);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF:=gtk_source_gutter_renderer_pixbuf_get_type;
  end;


end.
