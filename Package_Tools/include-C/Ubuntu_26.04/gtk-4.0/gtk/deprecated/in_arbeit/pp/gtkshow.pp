
unit gtkshow;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkshow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkshow.h
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
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK - The GIMP Toolkit
 * Copyright (C) 2008  Jaap Haitsma <jaap@haitsma.org>
 *
 * All rights reserved.
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
{$include <gtk/gtkwindow.h>}
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gtk_uri_launcher_launch) }
(* Const before type ignored *)

procedure gtk_show_uri_full(parent:PGtkWindow; uri:Pchar; timestamp:Tguint32; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gtk_uri_launcher_launch) }
function gtk_show_uri_full_finish(parent:PGtkWindow; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gtk_uri_launcher_launch) }
(* Const before type ignored *)
procedure gtk_show_uri(parent:PGtkWindow; uri:Pchar; timestamp:Tguint32);cdecl;external;

implementation


end.
