unit gtkviewport;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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

function gtk_viewport_get_type:TGType;cdecl;external libgtk4;
function gtk_viewport_new(hadjustment:PGtkAdjustment; vadjustment:PGtkAdjustment):PGtkWidget;cdecl;external libgtk4;
function gtk_viewport_get_scroll_to_focus(viewport:PGtkViewport):Tgboolean;cdecl;external libgtk4;
procedure gtk_viewport_set_scroll_to_focus(viewport:PGtkViewport; scroll_to_focus:Tgboolean);cdecl;external libgtk4;
procedure gtk_viewport_set_child(viewport:PGtkViewport; child:PGtkWidget);cdecl;external libgtk4;
function gtk_viewport_get_child(viewport:PGtkViewport):PGtkWidget;cdecl;external libgtk4;
procedure gtk_viewport_scroll_to(viewport:PGtkViewport; descendant:PGtkWidget; scroll:PGtkScrollInfo);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkViewport, g_object_unref) }

// === Konventiert am: 6-7-26 16:59:50 ===

function GTK_TYPE_VIEWPORT : TGType;
function GTK_VIEWPORT(obj : Pointer) : PGtkViewport;
function GTK_IS_VIEWPORT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_VIEWPORT : TGType;
  begin
    GTK_TYPE_VIEWPORT:=gtk_viewport_get_type;
  end;

function GTK_VIEWPORT(obj : Pointer) : PGtkViewport;
begin
  Result := PGtkViewport(g_type_check_instance_cast(obj, GTK_TYPE_VIEWPORT));
end;

function GTK_IS_VIEWPORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_VIEWPORT);
end;



end.
