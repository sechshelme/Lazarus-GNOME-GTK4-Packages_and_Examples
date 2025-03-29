
unit gtksourcestyleschemechooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcestyleschemechooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcestyleschemechooser.h
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
PGtkSourceStyleScheme  = ^GtkSourceStyleScheme;
PGtkSourceStyleSchemeChooser  = ^GtkSourceStyleSchemeChooser;
PGtkSourceStyleSchemeChooserInterface  = ^GtkSourceStyleSchemeChooserInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2014 - Ignacio Casal Quinteiro
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
 * along with GtkSourceView. If not, see <http://www.gnu.org/licenses/>.
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSourceStyleSchemeChooser, gtk_source_style_scheme_chooser, GTK_SOURCE, STYLE_SCHEME_CHOOSER, GObject) }
{ Methods  }
{< private > }
type
  PGtkSourceStyleSchemeChooserInterface = ^TGtkSourceStyleSchemeChooserInterface;
  TGtkSourceStyleSchemeChooserInterface = record
      base_interface : TGTypeInterface;
      get_style_scheme : function (chooser:PGtkSourceStyleSchemeChooser):PGtkSourceStyleScheme;cdecl;
      set_style_scheme : procedure (chooser:PGtkSourceStyleSchemeChooser; scheme:PGtkSourceStyleScheme);cdecl;
      _reserved : array[0..11] of Tgpointer;
    end;


function gtk_source_style_scheme_chooser_get_style_scheme(chooser:PGtkSourceStyleSchemeChooser):PGtkSourceStyleScheme;cdecl;external;
procedure gtk_source_style_scheme_chooser_set_style_scheme(chooser:PGtkSourceStyleSchemeChooser; scheme:PGtkSourceStyleScheme);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER:=gtk_source_style_scheme_chooser_get_type;
  end;


end.
