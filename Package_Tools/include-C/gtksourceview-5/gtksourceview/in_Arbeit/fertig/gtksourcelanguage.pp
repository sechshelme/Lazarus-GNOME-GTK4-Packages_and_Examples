
unit gtksourcelanguage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcelanguage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcelanguage.h
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
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_LANGUAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceLanguage, gtk_source_language, GTK_SOURCE, LANGUAGE, GObject) }
(* Const before type ignored *)
function gtk_source_language_get_id(language:PGtkSourceLanguage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_language_get_name(language:PGtkSourceLanguage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_language_get_section(language:PGtkSourceLanguage):Pgchar;cdecl;external;
function gtk_source_language_get_hidden(language:PGtkSourceLanguage):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_language_get_metadata(language:PGtkSourceLanguage; name:Pgchar):Pgchar;cdecl;external;
function gtk_source_language_get_mime_types(language:PGtkSourceLanguage):^Pgchar;cdecl;external;
function gtk_source_language_get_globs(language:PGtkSourceLanguage):^Pgchar;cdecl;external;
function gtk_source_language_get_style_ids(language:PGtkSourceLanguage):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_language_get_style_name(language:PGtkSourceLanguage; style_id:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_language_get_style_fallback(language:PGtkSourceLanguage; style_id:Pgchar):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_LANGUAGE : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_LANGUAGE:=gtk_source_language_get_type;
  end;


end.
