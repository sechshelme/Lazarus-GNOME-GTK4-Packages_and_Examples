
unit gspell_language_chooser_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_language_chooser_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_language_chooser_button.h
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
PGspellLanguage  = ^GspellLanguage;
PGspellLanguageChooserButtonClass  = ^GspellLanguageChooserButtonClass;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015 - Sébastien Wilmet <swilmet@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GSPELL_LANGUAGE_CHOOSER_BUTTON_H}
{$define GSPELL_LANGUAGE_CHOOSER_BUTTON_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$include <gspell/gspell-language.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellLanguageChooserButton, gspell_language_chooser_button, GSPELL, LANGUAGE_CHOOSER_BUTTON, GtkButton) }
{ Padding for future expansion  }
type
  PGspellLanguageChooserButtonClass = ^TGspellLanguageChooserButtonClass;
  TGspellLanguageChooserButtonClass = record
      parent_class : TGtkButtonClass;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)

function gspell_language_chooser_button_new(current_language:PGspellLanguage):PGtkWidget;cdecl;external;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_BUTTON_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON:=gspell_language_chooser_button_get_type;
  end;


end.
