unit gtkgesture;

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
{$include <gtk/gtkeventcontroller.h>}
{$include <gtk/gtkenums.h>}

type

function gtk_gesture_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_get_device(gesture:PGtkGesture):PGdkDevice;cdecl;external libgtk4;
function gtk_gesture_set_state(gesture:PGtkGesture; state:TGtkEventSequenceState):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_get_sequence_state(gesture:PGtkGesture; sequence:PGdkEventSequence):TGtkEventSequenceState;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_gesture_set_sequence_state(gesture:PGtkGesture; sequence:PGdkEventSequence; state:TGtkEventSequenceState):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_get_sequences(gesture:PGtkGesture):PGList;cdecl;external libgtk4;
function gtk_gesture_get_last_updated_sequence(gesture:PGtkGesture):PGdkEventSequence;cdecl;external libgtk4;
function gtk_gesture_handles_sequence(gesture:PGtkGesture; sequence:PGdkEventSequence):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_get_last_event(gesture:PGtkGesture; sequence:PGdkEventSequence):PGdkEvent;cdecl;external libgtk4;
function gtk_gesture_get_point(gesture:PGtkGesture; sequence:PGdkEventSequence; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_get_bounding_box(gesture:PGtkGesture; rect:PGdkRectangle):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_get_bounding_box_center(gesture:PGtkGesture; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_is_active(gesture:PGtkGesture):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_is_recognized(gesture:PGtkGesture):Tgboolean;cdecl;external libgtk4;
procedure gtk_gesture_group(group_gesture:PGtkGesture; gesture:PGtkGesture);cdecl;external libgtk4;
procedure gtk_gesture_ungroup(gesture:PGtkGesture);cdecl;external libgtk4;
function gtk_gesture_get_group(gesture:PGtkGesture):PGList;cdecl;external libgtk4;
function gtk_gesture_is_grouped_with(gesture:PGtkGesture; other:PGtkGesture):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGesture, g_object_unref) }

// === Konventiert am: 6-7-26 16:25:26 ===

function GTK_TYPE_GESTURE : TGType;
function GTK_GESTURE(obj : Pointer) : PGtkGesture;
function GTK_GESTURE_CLASS(klass : Pointer) : PGtkGestureClass;
function GTK_IS_GESTURE(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_GET_CLASS(obj : Pointer) : PGtkGestureClass;

implementation

function GTK_TYPE_GESTURE : TGType;
  begin
    GTK_TYPE_GESTURE:=gtk_gesture_get_type;
  end;

function GTK_GESTURE(obj : Pointer) : PGtkGesture;
begin
  Result := PGtkGesture(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE));
end;

function GTK_GESTURE_CLASS(klass : Pointer) : PGtkGestureClass;
begin
  Result := PGtkGestureClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE));
end;

function GTK_IS_GESTURE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE);
end;

function GTK_IS_GESTURE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE);
end;

function GTK_GESTURE_GET_CLASS(obj : Pointer) : PGtkGestureClass;
begin
  Result := PGtkGestureClass(PGTypeInstance(obj)^.g_class);
end;



end.
