unit gtkstringlist;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkStringObject, gtk_string_object, GTK, STRING_OBJECT, GObject) }
function gtk_string_object_new(_string:Pchar):PGtkStringObject;cdecl;external libgtk4;
function gtk_string_object_get_string(self:PGtkStringObject):Pchar;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_STRING_LIST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkStringList, gtk_string_list, GTK, STRING_LIST, GObject) }
function gtk_string_list_new(strings:PPchar):PGtkStringList;cdecl;external libgtk4;
procedure gtk_string_list_append(self:PGtkStringList; _string:Pchar);cdecl;external libgtk4;
procedure gtk_string_list_take(self:PGtkStringList; _string:Pchar);cdecl;external libgtk4;
procedure gtk_string_list_remove(self:PGtkStringList; position:Tguint);cdecl;external libgtk4;
procedure gtk_string_list_splice(self:PGtkStringList; position:Tguint; n_removals:Tguint; additions:PPchar);cdecl;external libgtk4;
function gtk_string_list_get_string(self:PGtkStringList; position:Tguint):Pchar;cdecl;external libgtk4;
function gtk_string_list_find(self:PGtkStringList; _string:Pchar):Tguint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:25 ===

function GTK_TYPE_STRING_OBJECT: TGType;
function GTK_STRING_OBJECT(obj: Pointer): PGtkStringObject;
function GTK_IS_STRING_OBJECT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_STRING_OBJECT: TGType;
begin
  Result := gtk_string_object_get_type;
end;

function GTK_STRING_OBJECT(obj: Pointer): PGtkStringObject;
begin
  Result := PGtkStringObject(g_type_check_instance_cast(obj, GTK_TYPE_STRING_OBJECT));
end;

function GTK_IS_STRING_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_OBJECT);
end;

type 
  PGtkStringObject = type Pointer;

  TGtkStringObjectClass = record
    parent_class: TGObjectClass;
  end;
  PGtkStringObjectClass = ^TGtkStringObjectClass;

function gtk_string_object_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_STRING_LIST : longint; { return type might be wrong }
  begin
    GTK_TYPE_STRING_LIST:=gtk_string_list_get_type;
  end;


end.
