
unit gspell_language_chooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_language_chooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_language_chooser
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGspellLanguage  = ^GspellLanguage;
PGspellLanguageChooser  = ^GspellLanguageChooser;
PGspellLanguageChooserInterface  = ^GspellLanguageChooserInterface;
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

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GspellLanguageChooser, gspell_language_chooser, GSPELL, LANGUAGE_CHOOSER, GObject) }
{ The return value is the same as get_language(), but there is the
	 * (optional) out parameter @default_language in addition.
	  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGspellLanguageChooserInterface = ^TGspellLanguageChooserInterface;
  TGspellLanguageChooserInterface = record
      parent_interface : TGTypeInterface;
      get_language_full : function (chooser:PGspellLanguageChooser; default_language:Pgboolean):PGspellLanguage;cdecl;
      set_language : procedure (chooser:PGspellLanguageChooser; language:PGspellLanguage);cdecl;
    end;

(* Const before type ignored *)

function gspell_language_chooser_get_language(chooser:PGspellLanguageChooser):PGspellLanguage;cdecl;external;
(* Const before type ignored *)
procedure gspell_language_chooser_set_language(chooser:PGspellLanguageChooser; language:PGspellLanguage);cdecl;external;
(* Const before type ignored *)
function gspell_language_chooser_get_language_code(chooser:PGspellLanguageChooser):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gspell_language_chooser_set_language_code(chooser:PGspellLanguageChooser; language_code:Pgchar);cdecl;external;
{$endif}
{ GSPELL_LANGUAGE_CHOOSER_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE_CHOOSER : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_LANGUAGE_CHOOSER:=gspell_language_chooser_get_type;
  end;


end.
