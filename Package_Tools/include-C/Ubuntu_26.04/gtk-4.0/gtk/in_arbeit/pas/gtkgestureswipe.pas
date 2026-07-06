unit gtkgestureswipe;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2012, One Laptop Per Child.
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

function gtk_gesture_swipe_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_swipe_new:PGtkGesture;cdecl;external libgtk4;
function gtk_gesture_swipe_get_velocity(gesture:PGtkGestureSwipe; velocity_x:Pdouble; velocity_y:Pdouble):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGestureSwipe, g_object_unref) }

// === Konventiert am: 6-7-26 17:03:26 ===

function GTK_TYPE_GESTURE_SWIPE : TGType;
function GTK_GESTURE_SWIPE(obj : Pointer) : PGtkGestureSwipe;
function GTK_GESTURE_SWIPE_CLASS(klass : Pointer) : PGtkGestureSwipeClass;
function GTK_IS_GESTURE_SWIPE(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_SWIPE_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_SWIPE_GET_CLASS(obj : Pointer) : PGtkGestureSwipeClass;

implementation

function GTK_TYPE_GESTURE_SWIPE : TGType;
  begin
    GTK_TYPE_GESTURE_SWIPE:=gtk_gesture_swipe_get_type;
  end;

function GTK_GESTURE_SWIPE(obj : Pointer) : PGtkGestureSwipe;
begin
  Result := PGtkGestureSwipe(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_SWIPE));
end;

function GTK_GESTURE_SWIPE_CLASS(klass : Pointer) : PGtkGestureSwipeClass;
begin
  Result := PGtkGestureSwipeClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_SWIPE));
end;

function GTK_IS_GESTURE_SWIPE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE_SWIPE);
end;

function GTK_IS_GESTURE_SWIPE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE_SWIPE);
end;

function GTK_GESTURE_SWIPE_GET_CLASS(obj : Pointer) : PGtkGestureSwipeClass;
begin
  Result := PGtkGestureSwipeClass(PGTypeInstance(obj)^.g_class);
end;



end.
