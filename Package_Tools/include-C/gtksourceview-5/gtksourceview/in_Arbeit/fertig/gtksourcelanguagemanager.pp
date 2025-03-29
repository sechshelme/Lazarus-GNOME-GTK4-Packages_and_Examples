
unit gtksourcelanguagemanager;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcelanguagemanager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcelanguagemanager.h
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
PGtkSourceLanguage  = ^GtkSourceLanguage;
PGtkSourceLanguageManager  = ^GtkSourceLanguageManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2003 - Paolo Maggi <paolo.maggi@polito.it>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_LANGUAGE_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceLanguageManager, gtk_source_language_manager, GTK_SOURCE, LANGUAGE_MANAGER, GObject) }
function gtk_source_language_manager_new:PGtkSourceLanguageManager;cdecl;external;
function gtk_source_language_manager_get_default:PGtkSourceLanguageManager;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_language_manager_get_search_path(lm:PGtkSourceLanguageManager):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_source_language_manager_set_search_path(lm:PGtkSourceLanguageManager; dirs:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_language_manager_append_search_path(lm:PGtkSourceLanguageManager; path:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_source_language_manager_prepend_search_path(lm:PGtkSourceLanguageManager; path:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_language_manager_get_language_ids(lm:PGtkSourceLanguageManager):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_language_manager_get_language(lm:PGtkSourceLanguageManager; id:Pgchar):PGtkSourceLanguage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_language_manager_guess_language(lm:PGtkSourceLanguageManager; filename:Pgchar; content_type:Pgchar):PGtkSourceLanguage;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_LANGUAGE_MANAGER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_LANGUAGE_MANAGER:=gtk_source_language_manager_get_type;
  end;


end.
