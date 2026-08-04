
unit gspell_checker_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_checker_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_checker_dialog.h
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
PGspellCheckerDialog  = ^GspellCheckerDialog;
PGspellCheckerDialogClass  = ^GspellCheckerDialogClass;
PGspellNavigator  = ^GspellNavigator;
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
{$ifndef GSPELL_CHECKER_DIALOG_H}
{$define GSPELL_CHECKER_DIALOG_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$include <gspell/gspell-navigator.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_CHECKER_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellCheckerDialog, gspell_checker_dialog, GSPELL, CHECKER_DIALOG, GtkDialog) }
{ Padding for future expansion  }
type
  PGspellCheckerDialogClass = ^TGspellCheckerDialogClass;
  TGspellCheckerDialogClass = record
      parent_class : TGtkDialogClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_checker_dialog_new(parent:PGtkWindow; navigator:PGspellNavigator):PGtkWidget;cdecl;external;
function gspell_checker_dialog_get_spell_navigator(dialog:PGspellCheckerDialog):PGspellNavigator;cdecl;external;
{$endif}
{ GSPELL_CHECKER_DIALOG_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_CHECKER_DIALOG : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_CHECKER_DIALOG:=gspell_checker_dialog_get_type;
  end;


end.
