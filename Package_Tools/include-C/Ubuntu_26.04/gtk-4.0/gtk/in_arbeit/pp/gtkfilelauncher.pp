
unit gtkfilelauncher;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkfilelauncher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkfilelauncher.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGFile  = ^GFile;
PGtkFileLauncher  = ^GtkFileLauncher;
PGtkWindow  = ^GtkWindow;
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

{ was #define dname def_expr }
function GTK_TYPE_FILE_LAUNCHER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkFileLauncher, gtk_file_launcher, GTK, FILE_LAUNCHER, GObject) }
function gtk_file_launcher_new(file:PGFile):PGtkFileLauncher;cdecl;external;
function gtk_file_launcher_get_file(self:PGtkFileLauncher):PGFile;cdecl;external;
procedure gtk_file_launcher_set_file(self:PGtkFileLauncher; file:PGFile);cdecl;external;
function gtk_file_launcher_get_always_ask(self:PGtkFileLauncher):Tgboolean;cdecl;external;
procedure gtk_file_launcher_set_always_ask(self:PGtkFileLauncher; always_ask:Tgboolean);cdecl;external;
function gtk_file_launcher_get_writable(self:PGtkFileLauncher):Tgboolean;cdecl;external;
procedure gtk_file_launcher_set_writable(self:PGtkFileLauncher; writable:Tgboolean);cdecl;external;
procedure gtk_file_launcher_launch(self:PGtkFileLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_file_launcher_launch_finish(self:PGtkFileLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure gtk_file_launcher_open_containing_folder(self:PGtkFileLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_file_launcher_open_containing_folder_finish(self:PGtkFileLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_FILE_LAUNCHER : longint; { return type might be wrong }
  begin
    GTK_TYPE_FILE_LAUNCHER:=gtk_file_launcher_get_type;
  end;


end.
