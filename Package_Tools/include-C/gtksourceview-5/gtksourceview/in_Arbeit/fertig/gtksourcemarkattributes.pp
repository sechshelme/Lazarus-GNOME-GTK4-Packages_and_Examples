
unit gtksourcemarkattributes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcemarkattributes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcemarkattributes.h
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
PGdkRGBA  = ^GdkRGBA;
PGIcon  = ^GIcon;
PGtkSourceMark  = ^GtkSourceMark;
PGtkSourceMarkAttributes  = ^GtkSourceMarkAttributes;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
 * Copyright 2010 - Krzesimir Nowak
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
function GTK_SOURCE_TYPE_MARK_ATTRIBUTES : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceMarkAttributes, gtk_source_mark_attributes, GTK_SOURCE, MARK_ATTRIBUTES, GObject) }
function gtk_source_mark_attributes_new:PGtkSourceMarkAttributes;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_mark_attributes_set_background(attributes:PGtkSourceMarkAttributes; background:PGdkRGBA);cdecl;external;
function gtk_source_mark_attributes_get_background(attributes:PGtkSourceMarkAttributes; background:PGdkRGBA):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_mark_attributes_set_icon_name(attributes:PGtkSourceMarkAttributes; icon_name:Pgchar);cdecl;external;
(* Const before type ignored *)
function gtk_source_mark_attributes_get_icon_name(attributes:PGtkSourceMarkAttributes):Pgchar;cdecl;external;
procedure gtk_source_mark_attributes_set_gicon(attributes:PGtkSourceMarkAttributes; gicon:PGIcon);cdecl;external;
function gtk_source_mark_attributes_get_gicon(attributes:PGtkSourceMarkAttributes):PGIcon;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_mark_attributes_set_pixbuf(attributes:PGtkSourceMarkAttributes; pixbuf:PGdkPixbuf);cdecl;external;
(* Const before type ignored *)
function gtk_source_mark_attributes_get_pixbuf(attributes:PGtkSourceMarkAttributes):PGdkPixbuf;cdecl;external;
function gtk_source_mark_attributes_render_icon(attributes:PGtkSourceMarkAttributes; widget:PGtkWidget; size:Tgint):PGdkPaintable;cdecl;external;
function gtk_source_mark_attributes_get_tooltip_text(attributes:PGtkSourceMarkAttributes; mark:PGtkSourceMark):Pgchar;cdecl;external;
function gtk_source_mark_attributes_get_tooltip_markup(attributes:PGtkSourceMarkAttributes; mark:PGtkSourceMark):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_MARK_ATTRIBUTES : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_MARK_ATTRIBUTES:=gtk_source_mark_attributes_get_type;
  end;


end.
