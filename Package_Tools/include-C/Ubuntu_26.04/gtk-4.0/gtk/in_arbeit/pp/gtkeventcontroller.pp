
unit gtkeventcontroller;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkeventcontroller.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkeventcontroller
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGdkDevice  = ^GdkDevice;
PGdkEvent  = ^GdkEvent;
PGtkEventController  = ^GtkEventController;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_GET_CLASS(o : longint) : longint;

function gtk_event_controller_get_type:TGType;cdecl;external;
function gtk_event_controller_get_widget(controller:PGtkEventController):PGtkWidget;cdecl;external;
procedure gtk_event_controller_reset(controller:PGtkEventController);cdecl;external;
function gtk_event_controller_get_propagation_phase(controller:PGtkEventController):TGtkPropagationPhase;cdecl;external;
procedure gtk_event_controller_set_propagation_phase(controller:PGtkEventController; phase:TGtkPropagationPhase);cdecl;external;
function gtk_event_controller_get_propagation_limit(controller:PGtkEventController):TGtkPropagationLimit;cdecl;external;
procedure gtk_event_controller_set_propagation_limit(controller:PGtkEventController; limit:TGtkPropagationLimit);cdecl;external;
(* Const before type ignored *)
function gtk_event_controller_get_name(controller:PGtkEventController):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_event_controller_set_name(controller:PGtkEventController; name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_event_controller_set_static_name(controller:PGtkEventController; name:Pchar);cdecl;external;
function gtk_event_controller_get_current_event(controller:PGtkEventController):PGdkEvent;cdecl;external;
function gtk_event_controller_get_current_event_time(controller:PGtkEventController):Tguint32;cdecl;external;
function gtk_event_controller_get_current_event_device(controller:PGtkEventController):PGdkDevice;cdecl;external;
function gtk_event_controller_get_current_event_state(controller:PGtkEventController):TGdkModifierType;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEventController, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER : longint; { return type might be wrong }
  begin
    GTK_TYPE_EVENT_CONTROLLER:=gtk_event_controller_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_EVENT_CONTROLLER,GtkEventController);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_CLASS(k : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_EVENT_CONTROLLER,GtkEventControllerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER(o : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_EVENT_CONTROLLER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_CLASS(k : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_EVENT_CONTROLLER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_GET_CLASS(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_EVENT_CONTROLLER,GtkEventControllerClass);
end;


end.
