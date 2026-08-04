
unit gspell_language;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_language.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_language
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGspellLanguage  = ^GspellLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2006 - Paolo Maggi
 * Copyright 2008 - Novell, Inc.
 * Copyright 2015, 2016 - Sébastien Wilmet
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
{ Based on GtkhtmlSpellLanguage (Novell), which was based on Marco Barisione's
 * GSpellLanguage, which was based on GeditSpellCheckerLanguage, which was based
 * partly on Epiphany's code.
  }
{$ifndef GSPELL_LANGUAGE_H}
{$define GSPELL_LANGUAGE_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gmodule.h>}
type

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE : longint; { return type might be wrong }

function gspell_language_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gspell_language_get_available:PGList;cdecl;external;
(* Const before type ignored *)
function gspell_language_get_default:PGspellLanguage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gspell_language_lookup(language_code:Pgchar):PGspellLanguage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gspell_language_get_code(language:PGspellLanguage):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gspell_language_get_name(language:PGspellLanguage):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gspell_language_compare(language_a:PGspellLanguage; language_b:PGspellLanguage):Tgint;cdecl;external;
(* Const before type ignored *)
function gspell_language_copy(language:PGspellLanguage):PGspellLanguage;cdecl;external;
procedure gspell_language_free(language:PGspellLanguage);cdecl;external;
{$endif}
{ GSPELL_LANGUAGE_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_LANGUAGE : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_LANGUAGE:=gspell_language_get_type;
  end;


end.
