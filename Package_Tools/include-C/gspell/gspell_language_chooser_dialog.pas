unit gspell_language_chooser_dialog;

interface

uses
  fp_glib2;

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

{G_DECLARE_DERIVABLE_TYPE (GspellLanguageChooserDialog, gspell_language_chooser_dialog, GSPELL, LANGUAGE_CHOOSER_DIALOG, GtkDialog) }
{ Padding for future expansion  }
type
  PGspellLanguageChooserDialogClass = ^TGspellLanguageChooserDialogClass;
  TGspellLanguageChooserDialogClass = record
      parent_class : TGtkDialogClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_language_chooser_dialog_new(parent:PGtkWindow; current_language:PGspellLanguage; flags:TGtkDialogFlags):PGtkWidget;cdecl;external libgspell;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_DIALOG_H  }

// === Konventiert am: 4-8-26 16:42:00 ===

function GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG: TGType;
function GSPELL_LANGUAGE_CHOOSER_DIALOG(obj: Pointer): PGspellLanguageChooserDialog;
function GSPELL_IS_LANGUAGE_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
function GSPELL_LANGUAGE_CHOOSER_DIALOG_CLASS(klass: Pointer): PGspellLanguageChooserDialogClass;
function GSPELL_IS_LANGUAGE_CHOOSER_DIALOG_CLASS(klass: Pointer): Tgboolean;
function GSPELL_LANGUAGE_CHOOSER_DIALOG_GET_CLASS(obj: Pointer): PGspellLanguageChooserDialogClass;

implementation

function GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG: TGType;
begin
  Result := gspell_language_chooser_dialog_get_type;
end;

function GSPELL_LANGUAGE_CHOOSER_DIALOG(obj: Pointer): PGspellLanguageChooserDialog;
begin
  Result := PGspellLanguageChooserDialog(g_type_check_instance_cast(obj, GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG));
end;

function GSPELL_IS_LANGUAGE_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG);
end;

function GSPELL_LANGUAGE_CHOOSER_DIALOG_CLASS(klass: Pointer): PGspellLanguageChooserDialogClass;
begin
  Result := PGspellLanguageChooserDialogClass(g_type_check_class_cast(klass, GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG));
end;

function GSPELL_IS_LANGUAGE_CHOOSER_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_LANGUAGE_CHOOSER_DIALOG);
end;

function GSPELL_LANGUAGE_CHOOSER_DIALOG_GET_CLASS(obj: Pointer): PGspellLanguageChooserDialogClass;
begin
  Result := PGspellLanguageChooserDialogClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellLanguageChooserDialog = record
    parent_instance: TGtkDialog;
  end;
  PGspellLanguageChooserDialog = ^TGspellLanguageChooserDialog;

  PGspellLanguageChooserDialogClass = type Pointer;

function gspell_language_chooser_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
