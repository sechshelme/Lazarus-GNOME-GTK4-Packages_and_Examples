
unit gspell_language_chooser_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_language_chooser_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_language_chooser_dialog.h
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
PGspellLanguageChooserDialogClass  = ^GspellLanguageChooserDialogClass;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2002 - Paolo Maggi
 * Copyright 2015 - Sébastien Wilmet
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
{$ifndef GSPELL_LANGUAGE_CHOOSER_DIALOG_H}
{$define GSPELL_LANGUAGE_CHOOSER_DIALOG_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$include <gspell/gspell-language.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellLanguageChooserDialog, gspell_language_chooser_dialog, GSPELL, LANGUAGE_CHOOSER_DIALOG, GtkDialog) }
{ Padding for future expansion  }
type
  PGspellLanguageChooserDialogClass = ^TGspellLanguageChooserDialogClass;
  TGspellLanguageChooserDialogClass = record
      parent_class : TGtkDialogClass;
      padding : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)

function gspell_language_chooser_dialog_new(parent:PGtkWindow; current_language:PGspellLanguage; flags:TGtkDialogFlags):PGtkWidget;cdecl;external;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_DIALOG_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG:=gspell_language_chooser_dialog_get_type;
  end;


end.
