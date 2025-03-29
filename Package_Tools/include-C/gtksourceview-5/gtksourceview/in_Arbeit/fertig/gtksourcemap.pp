
unit gtksourcemap;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcemap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcemap.h
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
PGtkSourceMap  = ^GtkSourceMap;
PGtkSourceMapClass  = ^GtkSourceMapClass;
PGtkSourceView  = ^GtkSourceView;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 Christian Hergert <christian@hergert.me>
 * Copyright 2015 Ignacio Casal Quinteiro <icq@gnome.org>
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
{$include "gtksourceview.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_MAP : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceMap, gtk_source_map, GTK_SOURCE, MAP, GtkSourceView) }
{< private > }
type
  PGtkSourceMapClass = ^TGtkSourceMapClass;
  TGtkSourceMapClass = record
      parent_class : TGtkSourceViewClass;
      _reserved : array[0..9] of Tgpointer;
    end;


function gtk_source_map_new:PGtkWidget;cdecl;external;
procedure gtk_source_map_set_view(map:PGtkSourceMap; view:PGtkSourceView);cdecl;external;
function gtk_source_map_get_view(map:PGtkSourceMap):PGtkSourceView;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_MAP : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_MAP:=gtk_source_map_get_type;
  end;


end.
