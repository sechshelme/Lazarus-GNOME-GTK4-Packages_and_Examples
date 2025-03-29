
unit gtksourcemark;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcemark.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcemark.h
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
PGtkSourceMark  = ^GtkSourceMark;
PGtkSourceMarkClass  = ^GtkSourceMarkClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2007 - Johannes Schmid <jhs@gnome.org>
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
function GTK_SOURCE_TYPE_MARK : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourceMark, gtk_source_mark, GTK_SOURCE, MARK, GtkTextMark) }
{< private > }
type
  PGtkSourceMarkClass = ^TGtkSourceMarkClass;
  TGtkSourceMarkClass = record
      parent_class : TGtkTextMarkClass;
      _reserved : array[0..9] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function gtk_source_mark_new(name:Pgchar; category:Pgchar):PGtkSourceMark;cdecl;external;
(* Const before type ignored *)
function gtk_source_mark_get_category(mark:PGtkSourceMark):Pgchar;cdecl;external;
(* Const before type ignored *)
function gtk_source_mark_next(mark:PGtkSourceMark; category:Pgchar):PGtkSourceMark;cdecl;external;
(* Const before type ignored *)
function gtk_source_mark_prev(mark:PGtkSourceMark; category:Pgchar):PGtkSourceMark;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_MARK : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_MARK:=gtk_source_mark_get_type;
  end;


end.
