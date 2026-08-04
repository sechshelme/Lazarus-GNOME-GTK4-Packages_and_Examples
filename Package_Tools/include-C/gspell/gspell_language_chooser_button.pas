unit gspell_language_chooser_button;

interface

uses
  fp_glib2;

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

{G_DECLARE_DERIVABLE_TYPE (GspellLanguageChooserButton, gspell_language_chooser_button, GSPELL, LANGUAGE_CHOOSER_BUTTON, GtkButton) }
{ Padding for future expansion  }
type
  PGspellLanguageChooserButtonClass = ^TGspellLanguageChooserButtonClass;
  TGspellLanguageChooserButtonClass = record
      parent_class : TGtkButtonClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_language_chooser_button_new(current_language:PGspellLanguage):PGtkWidget;cdecl;external libgspell;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_BUTTON_H  }

// === Konventiert am: 4-8-26 16:42:04 ===

function GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON: TGType;
function GSPELL_LANGUAGE_CHOOSER_BUTTON(obj: Pointer): PGspellLanguageChooserButton;
function GSPELL_IS_LANGUAGE_CHOOSER_BUTTON(obj: Pointer): Tgboolean;
function GSPELL_LANGUAGE_CHOOSER_BUTTON_CLASS(klass: Pointer): PGspellLanguageChooserButtonClass;
function GSPELL_IS_LANGUAGE_CHOOSER_BUTTON_CLASS(klass: Pointer): Tgboolean;
function GSPELL_LANGUAGE_CHOOSER_BUTTON_GET_CLASS(obj: Pointer): PGspellLanguageChooserButtonClass;

implementation

function GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON: TGType;
begin
  Result := gspell_language_chooser_button_get_type;
end;

function GSPELL_LANGUAGE_CHOOSER_BUTTON(obj: Pointer): PGspellLanguageChooserButton;
begin
  Result := PGspellLanguageChooserButton(g_type_check_instance_cast(obj, GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON));
end;

function GSPELL_IS_LANGUAGE_CHOOSER_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON);
end;

function GSPELL_LANGUAGE_CHOOSER_BUTTON_CLASS(klass: Pointer): PGspellLanguageChooserButtonClass;
begin
  Result := PGspellLanguageChooserButtonClass(g_type_check_class_cast(klass, GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON));
end;

function GSPELL_IS_LANGUAGE_CHOOSER_BUTTON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_LANGUAGE_CHOOSER_BUTTON);
end;

function GSPELL_LANGUAGE_CHOOSER_BUTTON_GET_CLASS(obj: Pointer): PGspellLanguageChooserButtonClass;
begin
  Result := PGspellLanguageChooserButtonClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellLanguageChooserButton = record
    parent_instance: TGtkButton;
  end;
  PGspellLanguageChooserButton = ^TGspellLanguageChooserButton;

  PGspellLanguageChooserButtonClass = type Pointer;

function gspell_language_chooser_button_get_type: TGType; cdecl; external libgxxxxxxx;



end.
