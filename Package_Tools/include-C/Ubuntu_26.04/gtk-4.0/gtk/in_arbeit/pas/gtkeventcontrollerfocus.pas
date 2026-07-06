unit gtkeventcontrollerfocus;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2020, Red Hat, Inc.
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
{$include <gtk/gtkimcontext.h>}

type

function gtk_event_controller_focus_get_type:TGType;cdecl;external libgtk4;
function gtk_event_controller_focus_new:PGtkEventController;cdecl;external libgtk4;
function gtk_event_controller_focus_contains_focus(self:PGtkEventControllerFocus):Tgboolean;cdecl;external libgtk4;
function gtk_event_controller_focus_is_focus(self:PGtkEventControllerFocus):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:03:49 ===

function GTK_TYPE_EVENT_CONTROLLER_FOCUS : TGType;
function GTK_EVENT_CONTROLLER_FOCUS(obj : Pointer) : PGtkEventControllerFocus;
function GTK_EVENT_CONTROLLER_FOCUS_CLASS(klass : Pointer) : PGtkEventControllerFocusClass;
function GTK_IS_EVENT_CONTROLLER_FOCUS(obj : Pointer) : Tgboolean;
function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(klass : Pointer) : Tgboolean;
function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(obj : Pointer) : PGtkEventControllerFocusClass;

implementation

function GTK_TYPE_EVENT_CONTROLLER_FOCUS : TGType;
  begin
    GTK_TYPE_EVENT_CONTROLLER_FOCUS:=gtk_event_controller_focus_get_type;
  end;

function GTK_EVENT_CONTROLLER_FOCUS(obj : Pointer) : PGtkEventControllerFocus;
begin
  Result := PGtkEventControllerFocus(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_FOCUS));
end;

function GTK_EVENT_CONTROLLER_FOCUS_CLASS(klass : Pointer) : PGtkEventControllerFocusClass;
begin
  Result := PGtkEventControllerFocusClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_FOCUS));
end;

function GTK_IS_EVENT_CONTROLLER_FOCUS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(obj : Pointer) : PGtkEventControllerFocusClass;
begin
  Result := PGtkEventControllerFocusClass(PGTypeInstance(obj)^.g_class);
end;



end.
