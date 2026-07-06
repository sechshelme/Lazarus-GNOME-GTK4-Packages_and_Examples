unit gtkgesturedrag;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2014, Red Hat, Inc.
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
 *
 * Author(s): Carlos Garnacho <carlosg@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkgesturesingle.h>}

type

function gtk_gesture_drag_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_drag_new:PGtkGesture;cdecl;external libgtk4;
function gtk_gesture_drag_get_start_point(gesture:PGtkGestureDrag; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_drag_get_offset(gesture:PGtkGestureDrag; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGestureDrag, g_object_unref) }

// === Konventiert am: 6-7-26 17:00:37 ===

function GTK_TYPE_GESTURE_DRAG : TGType;
function GTK_GESTURE_DRAG(obj : Pointer) : PGtkGestureDrag;
function GTK_GESTURE_DRAG_CLASS(klass : Pointer) : PGtkGestureDragClass;
function GTK_IS_GESTURE_DRAG(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_DRAG_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_DRAG_GET_CLASS(obj : Pointer) : PGtkGestureDragClass;

implementation

function GTK_TYPE_GESTURE_DRAG : TGType;
  begin
    GTK_TYPE_GESTURE_DRAG:=gtk_gesture_drag_get_type;
  end;

function GTK_GESTURE_DRAG(obj : Pointer) : PGtkGestureDrag;
begin
  Result := PGtkGestureDrag(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_DRAG));
end;

function GTK_GESTURE_DRAG_CLASS(klass : Pointer) : PGtkGestureDragClass;
begin
  Result := PGtkGestureDragClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_DRAG));
end;

function GTK_IS_GESTURE_DRAG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE_DRAG);
end;

function GTK_IS_GESTURE_DRAG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE_DRAG);
end;

function GTK_GESTURE_DRAG_GET_CLASS(obj : Pointer) : PGtkGestureDragClass;
begin
  Result := PGtkGestureDragClass(PGTypeInstance(obj)^.g_class);
end;



end.
