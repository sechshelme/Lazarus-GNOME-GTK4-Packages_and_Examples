
unit gtksourceutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceutils.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2013 - Sébastien Wilmet <swilmet@gnome.org>
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
{$include "gtksourceversion.h"}
(* Const before type ignored *)

function gtk_source_utils_unescape_search_text(text:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_utils_escape_search_text(text:Pgchar):Pgchar;cdecl;external;

implementation


end.
