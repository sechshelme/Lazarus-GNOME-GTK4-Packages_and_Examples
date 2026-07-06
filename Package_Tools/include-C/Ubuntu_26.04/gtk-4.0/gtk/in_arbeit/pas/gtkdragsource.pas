unit gtkdragsource;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; c-file-style: "gnu"; tab-width: 8 -*-  }
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

function gtk_drag_source_get_type:TGType;cdecl;external libgtk4;
function gtk_drag_source_new:PGtkDragSource;cdecl;external libgtk4;
procedure gtk_drag_source_set_content(source:PGtkDragSource; content:PGdkContentProvider);cdecl;external libgtk4;
function gtk_drag_source_get_content(source:PGtkDragSource):PGdkContentProvider;cdecl;external libgtk4;
procedure gtk_drag_source_set_actions(source:PGtkDragSource; actions:TGdkDragAction);cdecl;external libgtk4;
function gtk_drag_source_get_actions(source:PGtkDragSource):TGdkDragAction;cdecl;external libgtk4;
procedure gtk_drag_source_set_icon(source:PGtkDragSource; paintable:PGdkPaintable; hot_x:longint; hot_y:longint);cdecl;external libgtk4;
procedure gtk_drag_source_drag_cancel(source:PGtkDragSource);cdecl;external libgtk4;
function gtk_drag_source_get_drag(source:PGtkDragSource):PGdkDrag;cdecl;external libgtk4;
function gtk_drag_check_threshold(widget:PGtkWidget; start_x:longint; start_y:longint; current_x:longint; current_y:longint):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:33:39 ===

function GTK_TYPE_DRAG_SOURCE : TGType;
function GTK_DRAG_SOURCE(obj : Pointer) : PGtkDragSource;
function GTK_DRAG_SOURCE_CLASS(klass : Pointer) : PGtkDragSourceClass;
function GTK_IS_DRAG_SOURCE(obj : Pointer) : Tgboolean;
function GTK_IS_DRAG_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GTK_DRAG_SOURCE_GET_CLASS(obj : Pointer) : PGtkDragSourceClass;

implementation

function GTK_TYPE_DRAG_SOURCE : TGType;
  begin
    GTK_TYPE_DRAG_SOURCE:=gtk_drag_source_get_type;
  end;

function GTK_DRAG_SOURCE(obj : Pointer) : PGtkDragSource;
begin
  Result := PGtkDragSource(g_type_check_instance_cast(obj, GTK_TYPE_DRAG_SOURCE));
end;

function GTK_DRAG_SOURCE_CLASS(klass : Pointer) : PGtkDragSourceClass;
begin
  Result := PGtkDragSourceClass(g_type_check_class_cast(klass, GTK_TYPE_DRAG_SOURCE));
end;

function GTK_IS_DRAG_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_DRAG_SOURCE);
end;

function GTK_IS_DRAG_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_DRAG_SOURCE);
end;

function GTK_DRAG_SOURCE_GET_CLASS(obj : Pointer) : PGtkDragSourceClass;
begin
  Result := PGtkDragSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
