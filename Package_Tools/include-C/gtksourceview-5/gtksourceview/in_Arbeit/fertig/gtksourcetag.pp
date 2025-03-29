
unit gtksourcetag;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcetag.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcetag.h
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
PGtkSourceTagClass  = ^GtkSourceTagClass;
PGtkTextTag  = ^GtkTextTag;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2015 - Université Catholique de Louvain
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
 *
 * Author: Sébastien Wilmet
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_TAG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceTag, gtk_source_tag, GTK_SOURCE, TAG, GtkTextTag) }
{< private > }
type
  PGtkSourceTagClass = ^TGtkSourceTagClass;
  TGtkSourceTagClass = record
      parent_class : TGtkTextTagClass;
      _reserved : array[0..9] of Tgpointer;
    end;

(* Const before type ignored *)

function gtk_source_tag_new(name:Pgchar):PGtkTextTag;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_TAG : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_TAG:=gtk_source_tag_get_type;
  end;


end.
