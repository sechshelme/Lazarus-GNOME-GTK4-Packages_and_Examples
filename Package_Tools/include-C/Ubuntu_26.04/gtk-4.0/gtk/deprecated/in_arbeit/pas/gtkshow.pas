unit gtkshow;

interface

uses
  fp_glib2, fp_gtk4;

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

procedure gtk_show_uri_full(parent:PGtkWindow; uri:Pchar; timestamp:Tguint32; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gtk_uri_launcher_launch) }
function gtk_show_uri_full_finish(parent:PGtkWindow; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(gtk_uri_launcher_launch) }
procedure gtk_show_uri(parent:PGtkWindow; uri:Pchar; timestamp:Tguint32);cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:49:31 ===


implementation



end.
