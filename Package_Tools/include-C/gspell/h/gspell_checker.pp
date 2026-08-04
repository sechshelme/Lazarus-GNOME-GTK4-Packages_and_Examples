
unit gspell_checker;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_checker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_checker
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
PEnchantDict  = ^EnchantDict;
Pgchar  = ^gchar;
PGError  = ^GError;
PGSList  = ^GSList;
PGspellChecker  = ^GspellChecker;
PGspellCheckerClass  = ^GspellCheckerClass;
PGspellCheckerError  = ^GspellCheckerError;
PGspellLanguage  = ^GspellLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2002-2006 - Paolo Maggi
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
{$ifndef GSPELL_CHECKER_H}
{$define GSPELL_CHECKER_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gmodule.h>}
{$include <enchant.h>}
{$include <gspell/gspell-language.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_CHECKER : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellChecker, gspell_checker, GSPELL, CHECKER, GObject) }
{*
 * GSPELL_CHECKER_ERROR:
 *
 * Error domain for the spell checker. Errors in this domain will be from the
 * #GspellCheckerError enumeration. See #GError for more information on
 * error domains.
  }
{ was #define dname def_expr }
function GSPELL_CHECKER_ERROR : longint; { return type might be wrong }

{*
 * GspellCheckerError:
 * @GSPELL_CHECKER_ERROR_DICTIONARY: dictionary error.
 * @GSPELL_CHECKER_ERROR_NO_LANGUAGE_SET: no language set.
 *
 * An error code used with %GSPELL_CHECKER_ERROR in a #GError returned
 * from a spell-checker-related function.
  }
type
  PGspellCheckerError = ^TGspellCheckerError;
  TGspellCheckerError =  Longint;
  Const
    GSPELL_CHECKER_ERROR_DICTIONARY = 0;
    GSPELL_CHECKER_ERROR_NO_LANGUAGE_SET = 1;
;
{ Signals  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Padding for future expansion  }
type
  PGspellCheckerClass = ^TGspellCheckerClass;
  TGspellCheckerClass = record
      parent_class : TGObjectClass;
      word_added_to_personal : procedure (checker:PGspellChecker; word:Pgchar);cdecl;
      word_added_to_session : procedure (checker:PGspellChecker; word:Pgchar);cdecl;
      session_cleared : procedure (checker:PGspellChecker);cdecl;
      padding : array[0..11] of Tgpointer;
    end;


function gspell_checker_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function gspell_checker_new(language:PGspellLanguage):PGspellChecker;cdecl;external;
(* Const before type ignored *)
procedure gspell_checker_set_language(checker:PGspellChecker; language:PGspellLanguage);cdecl;external;
(* Const before type ignored *)
function gspell_checker_get_language(checker:PGspellChecker):PGspellLanguage;cdecl;external;
(* Const before type ignored *)
function gspell_checker_check_word(checker:PGspellChecker; word:Pgchar; word_length:Tgssize; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gspell_checker_get_suggestions(checker:PGspellChecker; word:Pgchar; word_length:Tgssize):PGSList;cdecl;external;
(* Const before type ignored *)
procedure gspell_checker_add_word_to_personal(checker:PGspellChecker; word:Pgchar; word_length:Tgssize);cdecl;external;
(* Const before type ignored *)
procedure gspell_checker_add_word_to_session(checker:PGspellChecker; word:Pgchar; word_length:Tgssize);cdecl;external;
procedure gspell_checker_clear_session(checker:PGspellChecker);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gspell_checker_set_correction(checker:PGspellChecker; word:Pgchar; word_length:Tgssize; replacement:Pgchar; replacement_length:Tgssize);cdecl;external;
function gspell_checker_get_enchant_dict(checker:PGspellChecker):PEnchantDict;cdecl;external;
{$endif}
{ GSPELL_CHECKER_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_CHECKER : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_CHECKER:=gspell_checker_get_type;
  end;

{ was #define dname def_expr }
function GSPELL_CHECKER_ERROR : longint; { return type might be wrong }
  begin
    GSPELL_CHECKER_ERROR:=gspell_checker_error_quark;
  end;


end.
