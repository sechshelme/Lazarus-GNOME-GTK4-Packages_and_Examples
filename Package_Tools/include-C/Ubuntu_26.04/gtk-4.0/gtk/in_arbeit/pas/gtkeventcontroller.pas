unit gtkeventcontroller;

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
type
{$include <gdk/gdk.h>}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkenums.h>}

function gtk_event_controller_get_type:TGType;cdecl;external libgtk4;
function gtk_event_controller_get_widget(controller:PGtkEventController):PGtkWidget;cdecl;external libgtk4;
procedure gtk_event_controller_reset(controller:PGtkEventController);cdecl;external libgtk4;
function gtk_event_controller_get_propagation_phase(controller:PGtkEventController):TGtkPropagationPhase;cdecl;external libgtk4;
procedure gtk_event_controller_set_propagation_phase(controller:PGtkEventController; phase:TGtkPropagationPhase);cdecl;external libgtk4;
function gtk_event_controller_get_propagation_limit(controller:PGtkEventController):TGtkPropagationLimit;cdecl;external libgtk4;
procedure gtk_event_controller_set_propagation_limit(controller:PGtkEventController; limit:TGtkPropagationLimit);cdecl;external libgtk4;
function gtk_event_controller_get_name(controller:PGtkEventController):Pchar;cdecl;external libgtk4;
procedure gtk_event_controller_set_name(controller:PGtkEventController; name:Pchar);cdecl;external libgtk4;
procedure gtk_event_controller_set_static_name(controller:PGtkEventController; name:Pchar);cdecl;external libgtk4;
function gtk_event_controller_get_current_event(controller:PGtkEventController):PGdkEvent;cdecl;external libgtk4;
function gtk_event_controller_get_current_event_time(controller:PGtkEventController):Tguint32;cdecl;external libgtk4;
function gtk_event_controller_get_current_event_device(controller:PGtkEventController):PGdkDevice;cdecl;external libgtk4;
function gtk_event_controller_get_current_event_state(controller:PGtkEventController):TGdkModifierType;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEventController, g_object_unref) }

// === Konventiert am: 6-7-26 16:29:39 ===

function GTK_TYPE_EVENT_CONTROLLER : TGType;
function GTK_EVENT_CONTROLLER(obj : Pointer) : PGtkEventController;
function GTK_EVENT_CONTROLLER_CLASS(klass : Pointer) : PGtkEventControllerClass;
function GTK_IS_EVENT_CONTROLLER(obj : Pointer) : Tgboolean;
function GTK_IS_EVENT_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
function GTK_EVENT_CONTROLLER_GET_CLASS(obj : Pointer) : PGtkEventControllerClass;

implementation

function GTK_TYPE_EVENT_CONTROLLER : TGType;
  begin
    GTK_TYPE_EVENT_CONTROLLER:=gtk_event_controller_get_type;
  end;

function GTK_EVENT_CONTROLLER(obj : Pointer) : PGtkEventController;
begin
  Result := PGtkEventController(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER));
end;

function GTK_EVENT_CONTROLLER_CLASS(klass : Pointer) : PGtkEventControllerClass;
begin
  Result := PGtkEventControllerClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER));
end;

function GTK_IS_EVENT_CONTROLLER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EVENT_CONTROLLER);
end;

function GTK_IS_EVENT_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_EVENT_CONTROLLER);
end;

function GTK_EVENT_CONTROLLER_GET_CLASS(obj : Pointer) : PGtkEventControllerClass;
begin
  Result := PGtkEventControllerClass(PGTypeInstance(obj)^.g_class);
end;



end.
