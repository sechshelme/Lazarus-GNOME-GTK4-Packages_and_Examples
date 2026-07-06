
unit gtkurilauncher;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkurilauncher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkurilauncher.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGtkUriLauncher  = ^GtkUriLauncher;
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
function GTK_TYPE_URI_LAUNCHER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkUriLauncher, gtk_uri_launcher, GTK, URI_LAUNCHER, GObject) }
(* Const before type ignored *)
function gtk_uri_launcher_new(uri:Pchar):PGtkUriLauncher;cdecl;external;
(* Const before type ignored *)
function gtk_uri_launcher_get_uri(self:PGtkUriLauncher):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_uri_launcher_set_uri(self:PGtkUriLauncher; uri:Pchar);cdecl;external;
procedure gtk_uri_launcher_launch(self:PGtkUriLauncher; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_uri_launcher_launch_finish(self:PGtkUriLauncher; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function gtk_uri_launcher_can_launch(self:PGtkUriLauncher; parent:PGtkWindow):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_URI_LAUNCHER : longint; { return type might be wrong }
  begin
    GTK_TYPE_URI_LAUNCHER:=gtk_uri_launcher_get_type;
  end;


end.
