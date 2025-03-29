
unit gtksourceencoding;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceencoding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceencoding.h
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
PGSList  = ^GSList;
PGtkSourceEncoding  = ^GtkSourceEncoding;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2002-2005 - Paolo Maggi
 * Copyright 2014, 2015 - Sébastien Wilmet <swilmet@gnome.org>
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
{$include <glib.h>}
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_ENCODING : longint; { return type might be wrong }

function gtk_source_encoding_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_encoding_get_from_charset(charset:Pgchar):PGtkSourceEncoding;cdecl;external;
(* Const before type ignored *)
function gtk_source_encoding_to_string(enc:PGtkSourceEncoding):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_encoding_get_name(enc:PGtkSourceEncoding):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_encoding_get_charset(enc:PGtkSourceEncoding):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_encoding_get_utf8:PGtkSourceEncoding;cdecl;external;
(* Const before type ignored *)
function gtk_source_encoding_get_current:PGtkSourceEncoding;cdecl;external;
function gtk_source_encoding_get_all:PGSList;cdecl;external;
function gtk_source_encoding_get_default_candidates:PGSList;cdecl;external;
{ These should not be used, they are just to make python bindings happy  }
(* Const before type ignored *)
function gtk_source_encoding_copy(enc:PGtkSourceEncoding):PGtkSourceEncoding;cdecl;external;
procedure gtk_source_encoding_free(enc:PGtkSourceEncoding);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_ENCODING : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_ENCODING:=gtk_source_encoding_get_type;
  end;


end.
