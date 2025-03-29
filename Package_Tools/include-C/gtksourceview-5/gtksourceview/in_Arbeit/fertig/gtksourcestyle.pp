
unit gtksourcestyle;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcestyle.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcestyle.h
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
PGtkSourceStyle  = ^GtkSourceStyle;
PGtkTextTag  = ^GtkTextTag;
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
function GTK_SOURCE_TYPE_STYLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceStyle, gtk_source_style, GTK_SOURCE, STYLE, GObject) }
(* Const before type ignored *)
function gtk_source_style_copy(style:PGtkSourceStyle):PGtkSourceStyle;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_style_apply(style:PGtkSourceStyle; tag:PGtkTextTag);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_STYLE : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_STYLE:=gtk_source_style_get_type;
  end;


end.
