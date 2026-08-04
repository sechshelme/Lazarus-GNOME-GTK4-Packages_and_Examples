unit gspell_checker_dialog;

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
{$ifndef GSPELL_CHECKER_DIALOG_H}
{$define GSPELL_CHECKER_DIALOG_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$include <gspell/gspell-navigator.h>}

{G_DECLARE_DERIVABLE_TYPE (GspellCheckerDialog, gspell_checker_dialog, GSPELL, CHECKER_DIALOG, GtkDialog) }
{ Padding for future expansion  }
type
  PGspellCheckerDialogClass = ^TGspellCheckerDialogClass;
  TGspellCheckerDialogClass = record
      parent_class : TGtkDialogClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_checker_dialog_new(parent:PGtkWindow; navigator:PGspellNavigator):PGtkWidget;cdecl;external libgspell;
function gspell_checker_dialog_get_spell_navigator(dialog:PGspellCheckerDialog):PGspellNavigator;cdecl;external libgspell;
{$endif}
{ GSPELL_CHECKER_DIALOG_H  }

// === Konventiert am: 4-8-26 16:42:24 ===

function GSPELL_TYPE_CHECKER_DIALOG: TGType;
function GSPELL_CHECKER_DIALOG(obj: Pointer): PGspellCheckerDialog;
function GSPELL_IS_CHECKER_DIALOG(obj: Pointer): Tgboolean;
function GSPELL_CHECKER_DIALOG_CLASS(klass: Pointer): PGspellCheckerDialogClass;
function GSPELL_IS_CHECKER_DIALOG_CLASS(klass: Pointer): Tgboolean;
function GSPELL_CHECKER_DIALOG_GET_CLASS(obj: Pointer): PGspellCheckerDialogClass;

implementation

function GSPELL_TYPE_CHECKER_DIALOG: TGType;
begin
  Result := gspell_checker_dialog_get_type;
end;

function GSPELL_CHECKER_DIALOG(obj: Pointer): PGspellCheckerDialog;
begin
  Result := PGspellCheckerDialog(g_type_check_instance_cast(obj, GSPELL_TYPE_CHECKER_DIALOG));
end;

function GSPELL_IS_CHECKER_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_CHECKER_DIALOG);
end;

function GSPELL_CHECKER_DIALOG_CLASS(klass: Pointer): PGspellCheckerDialogClass;
begin
  Result := PGspellCheckerDialogClass(g_type_check_class_cast(klass, GSPELL_TYPE_CHECKER_DIALOG));
end;

function GSPELL_IS_CHECKER_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_CHECKER_DIALOG);
end;

function GSPELL_CHECKER_DIALOG_GET_CLASS(obj: Pointer): PGspellCheckerDialogClass;
begin
  Result := PGspellCheckerDialogClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellCheckerDialog = record
    parent_instance: TGtkDialog;
  end;
  PGspellCheckerDialog = ^TGspellCheckerDialog;

  PGspellCheckerDialogClass = type Pointer;

function gspell_checker_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
