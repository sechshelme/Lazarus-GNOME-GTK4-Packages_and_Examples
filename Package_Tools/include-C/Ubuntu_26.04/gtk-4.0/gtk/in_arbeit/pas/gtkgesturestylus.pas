unit gtkgesturestylus;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2017-2018, Red Hat, Inc.
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
{$include <gtk/gtkgesture.h>}
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}

type

function gtk_gesture_stylus_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_stylus_new:PGtkGesture;cdecl;external libgtk4;
function gtk_gesture_stylus_get_stylus_only(gesture:PGtkGestureStylus):Tgboolean;cdecl;external libgtk4;
procedure gtk_gesture_stylus_set_stylus_only(gesture:PGtkGestureStylus; stylus_only:Tgboolean);cdecl;external libgtk4;
function gtk_gesture_stylus_get_axis(gesture:PGtkGestureStylus; axis:TGdkAxisUse; value:Pdouble):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_stylus_get_axes(gesture:PGtkGestureStylus; axes:PGdkAxisUse; values:PPdouble):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_stylus_get_backlog(gesture:PGtkGestureStylus; backlog:PPGdkTimeCoord; n_elems:Pguint):Tgboolean;cdecl;external libgtk4;
function gtk_gesture_stylus_get_device_tool(gesture:PGtkGestureStylus):PGdkDeviceTool;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:47 ===

function GTK_TYPE_GESTURE_STYLUS : TGType;
function GTK_GESTURE_STYLUS(obj : Pointer) : PGtkGestureStylus;
function GTK_GESTURE_STYLUS_CLASS(klass : Pointer) : PGtkGestureStylusClass;
function GTK_IS_GESTURE_STYLUS(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_STYLUS_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_STYLUS_GET_CLASS(obj : Pointer) : PGtkGestureStylusClass;

implementation

function GTK_TYPE_GESTURE_STYLUS : TGType;
  begin
    GTK_TYPE_GESTURE_STYLUS:=gtk_gesture_stylus_get_type;
  end;

function GTK_GESTURE_STYLUS(obj : Pointer) : PGtkGestureStylus;
begin
  Result := PGtkGestureStylus(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_STYLUS));
end;

function GTK_GESTURE_STYLUS_CLASS(klass : Pointer) : PGtkGestureStylusClass;
begin
  Result := PGtkGestureStylusClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_STYLUS));
end;

function GTK_IS_GESTURE_STYLUS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE_STYLUS);
end;

function GTK_IS_GESTURE_STYLUS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE_STYLUS);
end;

function GTK_GESTURE_STYLUS_GET_CLASS(obj : Pointer) : PGtkGestureStylusClass;
begin
  Result := PGtkGestureStylusClass(PGTypeInstance(obj)^.g_class);
end;



end.
