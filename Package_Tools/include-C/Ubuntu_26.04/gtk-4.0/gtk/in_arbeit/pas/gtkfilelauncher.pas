unit gtkfilelauncher;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2022 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkwindow.h>}

{G_DECLARE_FINAL_TYPE (GtkFileLauncher, gtk_file_launcher, GTK, FILE_LAUNCHER, GObject) }
function gtk_file_launcher_new(file:PGFile):PGtkFileLauncher;cdecl;external libgtk4;
function gtk_file_launcher_get_file(self:PGtkFileLauncher):PGFile;cdecl;external libgtk4;
procedure gtk_file_launcher_set_file(self:PGtkFileLauncher; file:PGFile);cdecl;external libgtk4;
function gtk_file_launcher_get_always_ask(self:PGtkFileLauncher):Tgboolean;cdecl;external libgtk4;
procedure gtk_file_launcher_set_always_ask(self:PGtkFileLauncher; always_ask:Tgboolean);cdecl;external libgtk4;
function gtk_file_launcher_get_writable(self:PGtkFileLauncher):Tgboolean;cdecl;external libgtk4;
procedure gtk_file_launcher_set_writable(self:PGtkFileLauncher; writable:Tgboolean);cdecl;external libgtk4;
procedure gtk_file_launcher_launch(self:PGtkFileLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_launcher_launch_finish(self:PGtkFileLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;
procedure gtk_file_launcher_open_containing_folder(self:PGtkFileLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_launcher_open_containing_folder_finish(self:PGtkFileLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:29:27 ===

function GTK_TYPE_FILE_LAUNCHER: TGType;
function GTK_FILE_LAUNCHER(obj: Pointer): PGtkFileLauncher;
function GTK_IS_FILE_LAUNCHER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FILE_LAUNCHER: TGType;
begin
  Result := gtk_file_launcher_get_type;
end;

function GTK_FILE_LAUNCHER(obj: Pointer): PGtkFileLauncher;
begin
  Result := PGtkFileLauncher(g_type_check_instance_cast(obj, GTK_TYPE_FILE_LAUNCHER));
end;

function GTK_IS_FILE_LAUNCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_LAUNCHER);
end;

type 
  PGtkFileLauncher = type Pointer;

  TGtkFileLauncherClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFileLauncherClass = ^TGtkFileLauncherClass;

function gtk_file_launcher_get_type: TGType; cdecl; external libgxxxxxxx;



end.
