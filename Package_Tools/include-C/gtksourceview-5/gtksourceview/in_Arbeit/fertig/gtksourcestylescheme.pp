
unit gtksourcestylescheme;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcestylescheme.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcestylescheme.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGtkSourceStyle  = ^GtkSourceStyle;
PGtkSourceStyleScheme  = ^GtkSourceStyleScheme;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2003 - Paolo Maggi <paolo.maggi@polito.it>
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

 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceStyleScheme, gtk_source_style_scheme, GTK_SOURCE, STYLE_SCHEME, GObject) }
(* Const before type ignored *)
function gtk_source_style_scheme_get_id(scheme:PGtkSourceStyleScheme):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_style_scheme_get_name(scheme:PGtkSourceStyleScheme):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_style_scheme_get_description(scheme:PGtkSourceStyleScheme):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_source_style_scheme_get_authors(scheme:PGtkSourceStyleScheme):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_style_scheme_get_filename(scheme:PGtkSourceStyleScheme):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_style_scheme_get_style(scheme:PGtkSourceStyleScheme; style_id:Pgchar):PGtkSourceStyle;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_style_scheme_get_metadata(scheme:PGtkSourceStyleScheme; name:Pchar):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE_SCHEME : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_STYLE_SCHEME:=gtk_source_style_scheme_get_type;
  end;


end.
