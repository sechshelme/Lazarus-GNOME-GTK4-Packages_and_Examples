
unit gtkdirectorylist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkdirectorylist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkdirectorylist.h
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
PGError  = ^GError;
PGFile  = ^GFile;
PGtkDirectoryList  = ^GtkDirectoryList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{ for extern  }
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function GTK_TYPE_DIRECTORY_LIST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkDirectoryList, gtk_directory_list, GTK, DIRECTORY_LIST, GObject) }
(* Const before type ignored *)
function gtk_directory_list_new(attributes:Pchar; file:PGFile):PGtkDirectoryList;cdecl;external;
procedure gtk_directory_list_set_file(self:PGtkDirectoryList; file:PGFile);cdecl;external;
function gtk_directory_list_get_file(self:PGtkDirectoryList):PGFile;cdecl;external;
(* Const before type ignored *)
procedure gtk_directory_list_set_attributes(self:PGtkDirectoryList; attributes:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_directory_list_get_attributes(self:PGtkDirectoryList):Pchar;cdecl;external;
procedure gtk_directory_list_set_io_priority(self:PGtkDirectoryList; io_priority:longint);cdecl;external;
function gtk_directory_list_get_io_priority(self:PGtkDirectoryList):longint;cdecl;external;
function gtk_directory_list_is_loading(self:PGtkDirectoryList):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_directory_list_get_error(self:PGtkDirectoryList):PGError;cdecl;external;
procedure gtk_directory_list_set_monitored(self:PGtkDirectoryList; monitored:Tgboolean);cdecl;external;
function gtk_directory_list_get_monitored(self:PGtkDirectoryList):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_DIRECTORY_LIST : longint; { return type might be wrong }
  begin
    GTK_TYPE_DIRECTORY_LIST:=gtk_directory_list_get_type;
  end;


end.
