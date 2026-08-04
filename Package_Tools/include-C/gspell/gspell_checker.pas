unit gspell_checker;

interface

uses
  fp_glib2;

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


function gspell_checker_error_quark:TGQuark;cdecl;external libgspell;
function gspell_checker_new(language:PGspellLanguage):PGspellChecker;cdecl;external libgspell;
procedure gspell_checker_set_language(checker:PGspellChecker; language:PGspellLanguage);cdecl;external libgspell;
function gspell_checker_get_language(checker:PGspellChecker):PGspellLanguage;cdecl;external libgspell;
function gspell_checker_check_word(checker:PGspellChecker; word:Pgchar; word_length:Tgssize; error:PPGError):Tgboolean;cdecl;external libgspell;
function gspell_checker_get_suggestions(checker:PGspellChecker; word:Pgchar; word_length:Tgssize):PGSList;cdecl;external libgspell;
procedure gspell_checker_add_word_to_personal(checker:PGspellChecker; word:Pgchar; word_length:Tgssize);cdecl;external libgspell;
procedure gspell_checker_add_word_to_session(checker:PGspellChecker; word:Pgchar; word_length:Tgssize);cdecl;external libgspell;
procedure gspell_checker_clear_session(checker:PGspellChecker);cdecl;external libgspell;
procedure gspell_checker_set_correction(checker:PGspellChecker; word:Pgchar; word_length:Tgssize; replacement:Pgchar; replacement_length:Tgssize);cdecl;external libgspell;
function gspell_checker_get_enchant_dict(checker:PGspellChecker):PEnchantDict;cdecl;external libgspell;
{$endif}
{ GSPELL_CHECKER_H  }

// === Konventiert am: 4-8-26 16:42:29 ===

function GSPELL_TYPE_CHECKER: TGType;
function GSPELL_CHECKER(obj: Pointer): PGspellChecker;
function GSPELL_IS_CHECKER(obj: Pointer): Tgboolean;
function GSPELL_CHECKER_CLASS(klass: Pointer): PGspellCheckerClass;
function GSPELL_IS_CHECKER_CLASS(klass: Pointer): Tgboolean;
function GSPELL_CHECKER_GET_CLASS(obj: Pointer): PGspellCheckerClass;

implementation

function GSPELL_TYPE_CHECKER: TGType;
begin
  Result := gspell_checker_get_type;
end;

function GSPELL_CHECKER(obj: Pointer): PGspellChecker;
begin
  Result := PGspellChecker(g_type_check_instance_cast(obj, GSPELL_TYPE_CHECKER));
end;

function GSPELL_IS_CHECKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_CHECKER);
end;

function GSPELL_CHECKER_CLASS(klass: Pointer): PGspellCheckerClass;
begin
  Result := PGspellCheckerClass(g_type_check_class_cast(klass, GSPELL_TYPE_CHECKER));
end;

function GSPELL_IS_CHECKER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_CHECKER);
end;

function GSPELL_CHECKER_GET_CLASS(obj: Pointer): PGspellCheckerClass;
begin
  Result := PGspellCheckerClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellChecker = record
    parent_instance: TGObject;
  end;
  PGspellChecker = ^TGspellChecker;

  PGspellCheckerClass = type Pointer;

function gspell_checker_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GSPELL_CHECKER_ERROR : longint; { return type might be wrong }
  begin
    GSPELL_CHECKER_ERROR:=gspell_checker_error_quark;
  end;


end.
