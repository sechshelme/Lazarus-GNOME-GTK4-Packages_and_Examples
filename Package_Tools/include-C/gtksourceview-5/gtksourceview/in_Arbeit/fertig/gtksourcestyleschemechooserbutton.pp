
unit gtksourcestyleschemechooserbutton;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcestyleschemechooserbutton.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcestyleschemechooserbutton.h
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
PGtkSourceStyleSchemeChooserButtonClass  = ^GtkSourceStyleSchemeChooserButtonClass;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2014 - Christian Hergert
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
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_BUTTON : longint; { return type might be wrong }

{< private > }
type
  PGtkSourceStyleSchemeChooserButtonClass = ^TGtkSourceStyleSchemeChooserButtonClass;
  TGtkSourceStyleSchemeChooserButtonClass = record
      parent : TGtkButtonClass;
      _reserved : array[0..9] of Tgpointer;
    end;

{G_DECLARE_DERIVABLE_TYPE (GtkSourceStyleSchemeChooserButton, gtk_source_style_scheme_chooser_button, GTK_SOURCE, STYLE_SCHEME_CHOOSER_BUTTON, GtkButton) }

function gtk_source_style_scheme_chooser_button_new:PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_BUTTON : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_BUTTON:=gtk_source_style_scheme_chooser_button_get_type;
  end;


end.
