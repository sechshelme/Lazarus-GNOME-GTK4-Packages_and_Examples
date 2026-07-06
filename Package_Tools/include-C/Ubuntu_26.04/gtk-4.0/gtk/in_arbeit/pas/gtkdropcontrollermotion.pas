unit gtkdropcontrollermotion;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkeventcontroller.h>}

type

function gtk_drop_controller_motion_get_type:TGType;cdecl;external libgtk4;
function gtk_drop_controller_motion_new:PGtkEventController;cdecl;external libgtk4;
function gtk_drop_controller_motion_contains_pointer(self:PGtkDropControllerMotion):Tgboolean;cdecl;external libgtk4;
function gtk_drop_controller_motion_get_drop(self:PGtkDropControllerMotion):PGdkDrop;cdecl;external libgtk4;
function gtk_drop_controller_motion_is_pointer(self:PGtkDropControllerMotion):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:00:41 ===

function GTK_TYPE_DROP_CONTROLLER_MOTION : TGType;
function GTK_DROP_CONTROLLER_MOTION(obj : Pointer) : PGtkDropControllerMotion;
function GTK_DROP_CONTROLLER_MOTION_CLASS(klass : Pointer) : PGtkDropControllerMotionClass;
function GTK_IS_DROP_CONTROLLER_MOTION(obj : Pointer) : Tgboolean;
function GTK_IS_DROP_CONTROLLER_MOTION_CLASS(klass : Pointer) : Tgboolean;
function GTK_DROP_CONTROLLER_MOTION_GET_CLASS(obj : Pointer) : PGtkDropControllerMotionClass;

implementation

function GTK_TYPE_DROP_CONTROLLER_MOTION : TGType;
  begin
    GTK_TYPE_DROP_CONTROLLER_MOTION:=gtk_drop_controller_motion_get_type;
  end;

function GTK_DROP_CONTROLLER_MOTION(obj : Pointer) : PGtkDropControllerMotion;
begin
  Result := PGtkDropControllerMotion(g_type_check_instance_cast(obj, GTK_TYPE_DROP_CONTROLLER_MOTION));
end;

function GTK_DROP_CONTROLLER_MOTION_CLASS(klass : Pointer) : PGtkDropControllerMotionClass;
begin
  Result := PGtkDropControllerMotionClass(g_type_check_class_cast(klass, GTK_TYPE_DROP_CONTROLLER_MOTION));
end;

function GTK_IS_DROP_CONTROLLER_MOTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_DROP_CONTROLLER_MOTION);
end;

function GTK_IS_DROP_CONTROLLER_MOTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_DROP_CONTROLLER_MOTION);
end;

function GTK_DROP_CONTROLLER_MOTION_GET_CLASS(obj : Pointer) : PGtkDropControllerMotionClass;
begin
  Result := PGtkDropControllerMotionClass(PGTypeInstance(obj)^.g_class);
end;



end.
