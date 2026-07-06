unit gtkeventcontrollermotion;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2017, Red Hat, Inc.
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
 * Author(s): Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkeventcontroller.h>}

type

function gtk_event_controller_motion_get_type:TGType;cdecl;external libgtk4;
function gtk_event_controller_motion_new:PGtkEventController;cdecl;external libgtk4;
function gtk_event_controller_motion_contains_pointer(self:PGtkEventControllerMotion):Tgboolean;cdecl;external libgtk4;
function gtk_event_controller_motion_is_pointer(self:PGtkEventControllerMotion):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:03:37 ===

function GTK_TYPE_EVENT_CONTROLLER_MOTION : TGType;
function GTK_EVENT_CONTROLLER_MOTION(obj : Pointer) : PGtkEventControllerMotion;
function GTK_EVENT_CONTROLLER_MOTION_CLASS(klass : Pointer) : PGtkEventControllerMotionClass;
function GTK_IS_EVENT_CONTROLLER_MOTION(obj : Pointer) : Tgboolean;
function GTK_IS_EVENT_CONTROLLER_MOTION_CLASS(klass : Pointer) : Tgboolean;
function GTK_EVENT_CONTROLLER_MOTION_GET_CLASS(obj : Pointer) : PGtkEventControllerMotionClass;

implementation

function GTK_TYPE_EVENT_CONTROLLER_MOTION : TGType;
  begin
    GTK_TYPE_EVENT_CONTROLLER_MOTION:=gtk_event_controller_motion_get_type;
  end;

function GTK_EVENT_CONTROLLER_MOTION(obj : Pointer) : PGtkEventControllerMotion;
begin
  Result := PGtkEventControllerMotion(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_MOTION));
end;

function GTK_EVENT_CONTROLLER_MOTION_CLASS(klass : Pointer) : PGtkEventControllerMotionClass;
begin
  Result := PGtkEventControllerMotionClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_MOTION));
end;

function GTK_IS_EVENT_CONTROLLER_MOTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EVENT_CONTROLLER_MOTION);
end;

function GTK_IS_EVENT_CONTROLLER_MOTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_EVENT_CONTROLLER_MOTION);
end;

function GTK_EVENT_CONTROLLER_MOTION_GET_CLASS(obj : Pointer) : PGtkEventControllerMotionClass;
begin
  Result := PGtkEventControllerMotionClass(PGTypeInstance(obj)^.g_class);
end;



end.
