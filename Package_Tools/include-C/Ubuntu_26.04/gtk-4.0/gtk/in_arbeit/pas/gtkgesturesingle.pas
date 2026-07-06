unit gtkgesturesingle;

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
{$include <gtk/gtkgesture.h>}

type

function gtk_gesture_single_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_single_get_touch_only(gesture:PGtkGestureSingle):Tgboolean;cdecl;external libgtk4;
procedure gtk_gesture_single_set_touch_only(gesture:PGtkGestureSingle; touch_only:Tgboolean);cdecl;external libgtk4;
function gtk_gesture_single_get_exclusive(gesture:PGtkGestureSingle):Tgboolean;cdecl;external libgtk4;
procedure gtk_gesture_single_set_exclusive(gesture:PGtkGestureSingle; exclusive:Tgboolean);cdecl;external libgtk4;
function gtk_gesture_single_get_button(gesture:PGtkGestureSingle):Tguint;cdecl;external libgtk4;
procedure gtk_gesture_single_set_button(gesture:PGtkGestureSingle; button:Tguint);cdecl;external libgtk4;
function gtk_gesture_single_get_current_button(gesture:PGtkGestureSingle):Tguint;cdecl;external libgtk4;
function gtk_gesture_single_get_current_sequence(gesture:PGtkGestureSingle):PGdkEventSequence;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGestureSingle, g_object_unref) }

// === Konventiert am: 6-7-26 16:45:49 ===

function GTK_TYPE_GESTURE_SINGLE : TGType;
function GTK_GESTURE_SINGLE(obj : Pointer) : PGtkGestureSingle;
function GTK_GESTURE_SINGLE_CLASS(klass : Pointer) : PGtkGestureSingleClass;
function GTK_IS_GESTURE_SINGLE(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_SINGLE_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_SINGLE_GET_CLASS(obj : Pointer) : PGtkGestureSingleClass;

implementation

function GTK_TYPE_GESTURE_SINGLE : TGType;
  begin
    GTK_TYPE_GESTURE_SINGLE:=gtk_gesture_single_get_type;
  end;

function GTK_GESTURE_SINGLE(obj : Pointer) : PGtkGestureSingle;
begin
  Result := PGtkGestureSingle(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_SINGLE));
end;

function GTK_GESTURE_SINGLE_CLASS(klass : Pointer) : PGtkGestureSingleClass;
begin
  Result := PGtkGestureSingleClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_SINGLE));
end;

function GTK_IS_GESTURE_SINGLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE_SINGLE);
end;

function GTK_IS_GESTURE_SINGLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE_SINGLE);
end;

function GTK_GESTURE_SINGLE_GET_CLASS(obj : Pointer) : PGtkGestureSingleClass;
begin
  Result := PGtkGestureSingleClass(PGTypeInstance(obj)^.g_class);
end;



end.
