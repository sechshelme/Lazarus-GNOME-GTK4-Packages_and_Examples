unit gtkstatusbar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 * GtkStatusbar Copyright (C) 1998 Shawn T. Amundson
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
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_statusbar_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_statusbar_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_statusbar_get_context_id(statusbar:PGtkStatusbar; context_description:Pchar):Tguint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_statusbar_push(statusbar:PGtkStatusbar; context_id:Tguint; text:Pchar):Tguint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_statusbar_pop(statusbar:PGtkStatusbar; context_id:Tguint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_statusbar_remove(statusbar:PGtkStatusbar; context_id:Tguint; message_id:Tguint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_statusbar_remove_all(statusbar:PGtkStatusbar; context_id:Tguint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStatusbar, g_object_unref) }

// === Konventiert am: 9-7-26 19:49:25 ===

function GTK_TYPE_STATUSBAR : TGType;
function GTK_STATUSBAR(obj : Pointer) : PGtkStatusbar;
function GTK_IS_STATUSBAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_STATUSBAR : TGType;
  begin
    GTK_TYPE_STATUSBAR:=gtk_statusbar_get_type;
  end;

function GTK_STATUSBAR(obj : Pointer) : PGtkStatusbar;
begin
  Result := PGtkStatusbar(g_type_check_instance_cast(obj, GTK_TYPE_STATUSBAR));
end;

function GTK_IS_STATUSBAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STATUSBAR);
end;



end.
