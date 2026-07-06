unit gtkpaned;

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

function gtk_paned_get_type:TGType;cdecl;external libgtk4;
function gtk_paned_new(orientation:TGtkOrientation):PGtkWidget;cdecl;external libgtk4;
procedure gtk_paned_set_start_child(paned:PGtkPaned; child:PGtkWidget);cdecl;external libgtk4;
function gtk_paned_get_start_child(paned:PGtkPaned):PGtkWidget;cdecl;external libgtk4;
procedure gtk_paned_set_resize_start_child(paned:PGtkPaned; resize:Tgboolean);cdecl;external libgtk4;
function gtk_paned_get_resize_start_child(paned:PGtkPaned):Tgboolean;cdecl;external libgtk4;
procedure gtk_paned_set_end_child(paned:PGtkPaned; child:PGtkWidget);cdecl;external libgtk4;
function gtk_paned_get_end_child(paned:PGtkPaned):PGtkWidget;cdecl;external libgtk4;
procedure gtk_paned_set_shrink_start_child(paned:PGtkPaned; resize:Tgboolean);cdecl;external libgtk4;
function gtk_paned_get_shrink_start_child(paned:PGtkPaned):Tgboolean;cdecl;external libgtk4;
procedure gtk_paned_set_resize_end_child(paned:PGtkPaned; resize:Tgboolean);cdecl;external libgtk4;
function gtk_paned_get_resize_end_child(paned:PGtkPaned):Tgboolean;cdecl;external libgtk4;
procedure gtk_paned_set_shrink_end_child(paned:PGtkPaned; resize:Tgboolean);cdecl;external libgtk4;
function gtk_paned_get_shrink_end_child(paned:PGtkPaned):Tgboolean;cdecl;external libgtk4;
function gtk_paned_get_position(paned:PGtkPaned):longint;cdecl;external libgtk4;
procedure gtk_paned_set_position(paned:PGtkPaned; position:longint);cdecl;external libgtk4;
procedure gtk_paned_set_wide_handle(paned:PGtkPaned; wide:Tgboolean);cdecl;external libgtk4;
function gtk_paned_get_wide_handle(paned:PGtkPaned):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPaned, g_object_unref) }

// === Konventiert am: 6-7-26 16:33:15 ===

function GTK_TYPE_PANED : TGType;
function GTK_PANED(obj : Pointer) : PGtkPaned;
function GTK_IS_PANED(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_PANED : TGType;
  begin
    GTK_TYPE_PANED:=gtk_paned_get_type;
  end;

function GTK_PANED(obj : Pointer) : PGtkPaned;
begin
  Result := PGtkPaned(g_type_check_instance_cast(obj, GTK_TYPE_PANED));
end;

function GTK_IS_PANED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PANED);
end;



end.
