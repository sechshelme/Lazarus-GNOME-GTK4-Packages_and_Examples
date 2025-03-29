
unit gtksourcespacedrawer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcespacedrawer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcespacedrawer.h
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
PGSettings  = ^GSettings;
PGtkSourceSpaceDrawer  = ^GtkSourceSpaceDrawer;
PGtkSourceSpaceLocationFlags  = ^GtkSourceSpaceLocationFlags;
PGtkSourceSpaceTypeFlags  = ^GtkSourceSpaceTypeFlags;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2016 - Sébastien Wilmet <swilmet@gnome.org>
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
function GTK_SOURCE_TYPE_SPACE_DRAWER : longint; { return type might be wrong }

{*
 * GtkSourceSpaceTypeFlags:
 * @GTK_SOURCE_SPACE_TYPE_NONE: No flags.
 * @GTK_SOURCE_SPACE_TYPE_SPACE: Space character.
 * @GTK_SOURCE_SPACE_TYPE_TAB: Tab character.
 * @GTK_SOURCE_SPACE_TYPE_NEWLINE: Line break character. If the
 *   #GtkSourceBuffer:implicit-trailing-newline property is %TRUE,
 *   #GtkSourceSpaceDrawer also draws a line break at the end of the buffer.
 * @GTK_SOURCE_SPACE_TYPE_NBSP: Non-breaking space character.
 * @GTK_SOURCE_SPACE_TYPE_ALL: All white spaces.
 *
 * #GtkSourceSpaceTypeFlags contains flags for white space types.
  }
type
  PGtkSourceSpaceTypeFlags = ^TGtkSourceSpaceTypeFlags;
  TGtkSourceSpaceTypeFlags =  Longint;
  Const
    GTK_SOURCE_SPACE_TYPE_NONE = 0;
    GTK_SOURCE_SPACE_TYPE_SPACE = 1 shl 0;
    GTK_SOURCE_SPACE_TYPE_TAB = 1 shl 1;
    GTK_SOURCE_SPACE_TYPE_NEWLINE = 1 shl 2;
    GTK_SOURCE_SPACE_TYPE_NBSP = 1 shl 3;
    GTK_SOURCE_SPACE_TYPE_ALL = $f;
;
{*
 * GtkSourceSpaceLocationFlags:
 * @GTK_SOURCE_SPACE_LOCATION_NONE: No flags.
 * @GTK_SOURCE_SPACE_LOCATION_LEADING: Leading white spaces on a line, i.e. the
 *   indentation.
 * @GTK_SOURCE_SPACE_LOCATION_INSIDE_TEXT: White spaces inside a line of text.
 * @GTK_SOURCE_SPACE_LOCATION_TRAILING: Trailing white spaces on a line.
 * @GTK_SOURCE_SPACE_LOCATION_ALL: White spaces anywhere.
 *
 * #GtkSourceSpaceLocationFlags contains flags for white space locations.
 *
 * If a line contains only white spaces (no text), the white spaces match both
 * %GTK_SOURCE_SPACE_LOCATION_LEADING and %GTK_SOURCE_SPACE_LOCATION_TRAILING.
  }
type
  PGtkSourceSpaceLocationFlags = ^TGtkSourceSpaceLocationFlags;
  TGtkSourceSpaceLocationFlags =  Longint;
  Const
    GTK_SOURCE_SPACE_LOCATION_NONE = 0;
    GTK_SOURCE_SPACE_LOCATION_LEADING = 1 shl 0;
    GTK_SOURCE_SPACE_LOCATION_INSIDE_TEXT = 1 shl 1;
    GTK_SOURCE_SPACE_LOCATION_TRAILING = 1 shl 2;
    GTK_SOURCE_SPACE_LOCATION_ALL = $7;
;
{G_DECLARE_FINAL_TYPE (GtkSourceSpaceDrawer, gtk_source_space_drawer, GTK_SOURCE, SPACE_DRAWER, GObject) }

function gtk_source_space_drawer_new:PGtkSourceSpaceDrawer;cdecl;external;
function gtk_source_space_drawer_get_types_for_locations(drawer:PGtkSourceSpaceDrawer; locations:TGtkSourceSpaceLocationFlags):TGtkSourceSpaceTypeFlags;cdecl;external;
procedure gtk_source_space_drawer_set_types_for_locations(drawer:PGtkSourceSpaceDrawer; locations:TGtkSourceSpaceLocationFlags; types:TGtkSourceSpaceTypeFlags);cdecl;external;
function gtk_source_space_drawer_get_matrix(drawer:PGtkSourceSpaceDrawer):PGVariant;cdecl;external;
procedure gtk_source_space_drawer_set_matrix(drawer:PGtkSourceSpaceDrawer; matrix:PGVariant);cdecl;external;
function gtk_source_space_drawer_get_enable_matrix(drawer:PGtkSourceSpaceDrawer):Tgboolean;cdecl;external;
procedure gtk_source_space_drawer_set_enable_matrix(drawer:PGtkSourceSpaceDrawer; enable_matrix:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_space_drawer_bind_matrix_setting(drawer:PGtkSourceSpaceDrawer; settings:PGSettings; key:Pgchar; flags:TGSettingsBindFlags);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_SPACE_DRAWER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_SPACE_DRAWER:=gtk_source_space_drawer_get_type;
  end;


end.
