unit gtkgestureclick;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2014 Red Hat, Inc.
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

function gtk_gesture_click_get_type:TGType;cdecl;external libgtk4;
function gtk_gesture_click_new:PGtkGesture;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGestureClick, g_object_unref) }

// === Konventiert am: 6-7-26 17:10:46 ===

function GTK_TYPE_GESTURE_CLICK : TGType;
function GTK_GESTURE_CLICK(obj : Pointer) : PGtkGestureClick;
function GTK_GESTURE_CLICK_CLASS(klass : Pointer) : PGtkGestureClickClass;
function GTK_IS_GESTURE_CLICK(obj : Pointer) : Tgboolean;
function GTK_IS_GESTURE_CLICK_CLASS(klass : Pointer) : Tgboolean;
function GTK_GESTURE_CLICK_GET_CLASS(obj : Pointer) : PGtkGestureClickClass;

implementation

function GTK_TYPE_GESTURE_CLICK : TGType;
  begin
    GTK_TYPE_GESTURE_CLICK:=gtk_gesture_click_get_type;
  end;

function GTK_GESTURE_CLICK(obj : Pointer) : PGtkGestureClick;
begin
  Result := PGtkGestureClick(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_CLICK));
end;

function GTK_GESTURE_CLICK_CLASS(klass : Pointer) : PGtkGestureClickClass;
begin
  Result := PGtkGestureClickClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_CLICK));
end;

function GTK_IS_GESTURE_CLICK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GESTURE_CLICK);
end;

function GTK_IS_GESTURE_CLICK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GESTURE_CLICK);
end;

function GTK_GESTURE_CLICK_GET_CLASS(obj : Pointer) : PGtkGestureClickClass;
begin
  Result := PGtkGestureClickClass(PGTypeInstance(obj)^.g_class);
end;



end.
