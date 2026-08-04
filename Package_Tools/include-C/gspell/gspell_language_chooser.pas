unit gspell_language_chooser;

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
{$ifndef GSPELL_LANGUAGE_CHOOSER_H}
{$define GSPELL_LANGUAGE_CHOOSER_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gspell/gspell-language.h>}

{G_DECLARE_INTERFACE (GspellLanguageChooser, gspell_language_chooser, GSPELL, LANGUAGE_CHOOSER, GObject) }
{ The return value is the same as get_language(), but there is the
	 * (optional) out parameter @default_language in addition.
	  }
type
  PGspellLanguageChooserInterface = ^TGspellLanguageChooserInterface;
  TGspellLanguageChooserInterface = record
      parent_interface : TGTypeInterface;
      get_language_full : function (chooser:PGspellLanguageChooser; default_language:Pgboolean):PGspellLanguage;cdecl;
      set_language : procedure (chooser:PGspellLanguageChooser; language:PGspellLanguage);cdecl;
    end;


function gspell_language_chooser_get_language(chooser:PGspellLanguageChooser):PGspellLanguage;cdecl;external libgspell;
procedure gspell_language_chooser_set_language(chooser:PGspellLanguageChooser; language:PGspellLanguage);cdecl;external libgspell;
function gspell_language_chooser_get_language_code(chooser:PGspellLanguageChooser):Pgchar;cdecl;external libgspell;
procedure gspell_language_chooser_set_language_code(chooser:PGspellLanguageChooser; language_code:Pgchar);cdecl;external libgspell;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_H  }

// === Konventiert am: 4-8-26 16:42:07 ===

function GSPELL_TYPE_LANGUAGE_CHOOSER: TGType;
function GSPELL_LANGUAGE_CHOOSER(obj: Pointer): PGspellLanguageChooser;
function GSPELL_IS_LANGUAGE_CHOOSER(obj: Pointer): Tgboolean;
function GSPELL_LANGUAGE_CHOOSER_GET_IFACE(obj: Pointer): PGspellLanguageChooserInterface;

implementation

function GSPELL_TYPE_LANGUAGE_CHOOSER: TGType;
begin
  Result := gspell_language_chooser_get_type;
end;

function GSPELL_LANGUAGE_CHOOSER(obj: Pointer): PGspellLanguageChooser;
begin
  Result := PGspellLanguageChooser(g_type_check_instance_cast(obj, GSPELL_TYPE_LANGUAGE_CHOOSER));
end;

function GSPELL_IS_LANGUAGE_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_LANGUAGE_CHOOSER);
end;

function GSPELL_LANGUAGE_CHOOSER_GET_IFACE(obj: Pointer): PGspellLanguageChooserInterface;
begin
  Result := g_type_interface_peek(obj, GSPELL_TYPE_LANGUAGE_CHOOSER);
end;

type 
  PGspellLanguageChooser = type Pointer;

  PGspellLanguageChooserInterface = type Pointer

function gspell_language_chooser_get_type: TGType; cdecl; external libgxxxxxxx;



end.
