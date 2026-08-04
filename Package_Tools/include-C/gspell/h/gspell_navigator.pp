
unit gspell_navigator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_navigator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_navigator
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
PGError  = ^GError;
PGspellChecker  = ^GspellChecker;
PGspellNavigator  = ^GspellNavigator;
PGspellNavigatorInterface  = ^GspellNavigatorInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015, 2016 - Sébastien Wilmet <swilmet@gnome.org>
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
{$ifndef GSPELL_NAVIGATOR_H}
{$define GSPELL_NAVIGATOR_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gspell/gspell-checker.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_NAVIGATOR : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GspellNavigator, gspell_navigator, GSPELL, NAVIGATOR, GInitiallyUnowned) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGspellNavigatorInterface = ^TGspellNavigatorInterface;
  TGspellNavigatorInterface = record
      parent_interface : TGTypeInterface;
      goto_next : function (navigator:PGspellNavigator; word:PPgchar; spell_checker:PPGspellChecker; error:PPGError):Tgboolean;cdecl;
      change : procedure (navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;
      change_all : procedure (navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;
    end;


function gspell_navigator_goto_next(navigator:PGspellNavigator; word:PPgchar; spell_checker:PPGspellChecker; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gspell_navigator_change(navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gspell_navigator_change_all(navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;external;
{$endif}
{ GSPELL_NAVIGATOR_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_NAVIGATOR : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_NAVIGATOR:=gspell_navigator_get_type;
  end;


end.
