unit gtkurilauncher;

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

{G_DECLARE_FINAL_TYPE (GtkUriLauncher, gtk_uri_launcher, GTK, URI_LAUNCHER, GObject) }
function gtk_uri_launcher_new(uri:Pchar):PGtkUriLauncher;cdecl;external libgtk4;
function gtk_uri_launcher_get_uri(self:PGtkUriLauncher):Pchar;cdecl;external libgtk4;
procedure gtk_uri_launcher_set_uri(self:PGtkUriLauncher; uri:Pchar);cdecl;external libgtk4;
procedure gtk_uri_launcher_launch(self:PGtkUriLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_uri_launcher_launch_finish(self:PGtkUriLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gtk_uri_launcher_can_launch(self:PGtkUriLauncher; parent:PGtkWindow):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:59:55 ===

function GTK_TYPE_URI_LAUNCHER: TGType;
function GTK_URI_LAUNCHER(obj: Pointer): PGtkUriLauncher;
function GTK_IS_URI_LAUNCHER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_URI_LAUNCHER: TGType;
begin
  Result := gtk_uri_launcher_get_type;
end;

function GTK_URI_LAUNCHER(obj: Pointer): PGtkUriLauncher;
begin
  Result := PGtkUriLauncher(g_type_check_instance_cast(obj, GTK_TYPE_URI_LAUNCHER));
end;

function GTK_IS_URI_LAUNCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_URI_LAUNCHER);
end;

type 
  PGtkUriLauncher = type Pointer;

  TGtkUriLauncherClass = record
    parent_class: TGObjectClass;
  end;
  PGtkUriLauncherClass = ^TGtkUriLauncherClass;

function gtk_uri_launcher_get_type: TGType; cdecl; external libgxxxxxxx;



end.
