unit gtkdirectorylist;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkDirectoryList, gtk_directory_list, GTK, DIRECTORY_LIST, GObject) }
function gtk_directory_list_new(attributes:Pchar; file:PGFile):PGtkDirectoryList;cdecl;external libgtk4;
procedure gtk_directory_list_set_file(self:PGtkDirectoryList; file:PGFile);cdecl;external libgtk4;
function gtk_directory_list_get_file(self:PGtkDirectoryList):PGFile;cdecl;external libgtk4;
procedure gtk_directory_list_set_attributes(self:PGtkDirectoryList; attributes:Pchar);cdecl;external libgtk4;
function gtk_directory_list_get_attributes(self:PGtkDirectoryList):Pchar;cdecl;external libgtk4;
procedure gtk_directory_list_set_io_priority(self:PGtkDirectoryList; io_priority:longint);cdecl;external libgtk4;
function gtk_directory_list_get_io_priority(self:PGtkDirectoryList):longint;cdecl;external libgtk4;
function gtk_directory_list_is_loading(self:PGtkDirectoryList):Tgboolean;cdecl;external libgtk4;
function gtk_directory_list_get_error(self:PGtkDirectoryList):PGError;cdecl;external libgtk4;
procedure gtk_directory_list_set_monitored(self:PGtkDirectoryList; monitored:Tgboolean);cdecl;external libgtk4;
function gtk_directory_list_get_monitored(self:PGtkDirectoryList):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:00 ===

function GTK_TYPE_DIRECTORY_LIST: TGType;
function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_DIRECTORY_LIST: TGType;
begin
  Result := gtk_directory_list_get_type;
end;

function GTK_DIRECTORY_LIST(obj: Pointer): PGtkDirectoryList;
begin
  Result := PGtkDirectoryList(g_type_check_instance_cast(obj, GTK_TYPE_DIRECTORY_LIST));
end;

function GTK_IS_DIRECTORY_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DIRECTORY_LIST);
end;

type 
  PGtkDirectoryList = type Pointer;

  TGtkDirectoryListClass = record
    parent_class: TGObjectClass;
  end;
  PGtkDirectoryListClass = ^TGtkDirectoryListClass;

function gtk_directory_list_get_type: TGType; cdecl; external libgxxxxxxx;



end.
