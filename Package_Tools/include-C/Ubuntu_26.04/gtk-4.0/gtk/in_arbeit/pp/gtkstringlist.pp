
unit gtkstringlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkstringlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkstringlist.h
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
PGtkStringList  = ^GtkStringList;
PGtkStringObject  = ^GtkStringObject;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{ for extern  }
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function GTK_TYPE_STRING_OBJECT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkStringObject, gtk_string_object, GTK, STRING_OBJECT, GObject) }
(* Const before type ignored *)
function gtk_string_object_new(_string:Pchar):PGtkStringObject;cdecl;external;
(* Const before type ignored *)
function gtk_string_object_get_string(self:PGtkStringObject):Pchar;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_STRING_LIST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkStringList, gtk_string_list, GTK, STRING_LIST, GObject) }
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_string_list_new(strings:PPchar):PGtkStringList;cdecl;external;
(* Const before type ignored *)
procedure gtk_string_list_append(self:PGtkStringList; _string:Pchar);cdecl;external;
procedure gtk_string_list_take(self:PGtkStringList; _string:Pchar);cdecl;external;
procedure gtk_string_list_remove(self:PGtkStringList; position:Tguint);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_string_list_splice(self:PGtkStringList; position:Tguint; n_removals:Tguint; additions:PPchar);cdecl;external;
(* Const before type ignored *)
function gtk_string_list_get_string(self:PGtkStringList; position:Tguint):Pchar;cdecl;external;
(* Const before type ignored *)
function gtk_string_list_find(self:PGtkStringList; _string:Pchar):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_STRING_OBJECT : longint; { return type might be wrong }
  begin
    GTK_TYPE_STRING_OBJECT:=gtk_string_object_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_STRING_LIST : longint; { return type might be wrong }
  begin
    GTK_TYPE_STRING_LIST:=gtk_string_list_get_type;
  end;


end.
