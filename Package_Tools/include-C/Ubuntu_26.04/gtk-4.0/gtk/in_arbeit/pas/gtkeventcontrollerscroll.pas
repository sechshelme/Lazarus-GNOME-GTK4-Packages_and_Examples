unit gtkeventcontrollerscroll;

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
 * Author(s): Carlos Garnacho <carlosg@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkeventcontroller.h>}

type
{*
 * GtkEventControllerScrollFlags:
 * @GTK_EVENT_CONTROLLER_SCROLL_NONE: Don't emit scroll.
 * @GTK_EVENT_CONTROLLER_SCROLL_VERTICAL: Emit scroll with vertical deltas.
 * @GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL: Emit scroll with horizontal deltas.
 * @GTK_EVENT_CONTROLLER_SCROLL_DISCRETE: Only emit deltas that are multiples of 1.
 * @GTK_EVENT_CONTROLLER_SCROLL_KINETIC: Emit ::decelerate after continuous scroll finishes.
 * @GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES: Emit scroll on both axes.
 *
 * Describes the behavior of a `GtkEventControllerScroll`.
 * }
{*
 * GTK_EVENT_CONTROLLER_SCROLL_PHYSICAL_DIRECTION:
 *
 * A #GtkEventControllerScrollFlags value to prefer physical direction over
 * logical direction (i.e. oblivious to natural scroll).
 *
 * Since: 4.20
  }

  PGtkEventControllerScrollFlags = ^TGtkEventControllerScrollFlags;
  TGtkEventControllerScrollFlags =  Longint;
  Const
    GTK_EVENT_CONTROLLER_SCROLL_NONE = 0;
    GTK_EVENT_CONTROLLER_SCROLL_VERTICAL = 1 shl 0;
    GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL = 1 shl 1;
    GTK_EVENT_CONTROLLER_SCROLL_DISCRETE = 1 shl 2;
    GTK_EVENT_CONTROLLER_SCROLL_KINETIC = 1 shl 3;
    GTK_EVENT_CONTROLLER_SCROLL_PHYSICAL_DIRECTION = 1 shl 4;
    GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES = GTK_EVENT_CONTROLLER_SCROLL_VERTICAL or GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL;
;

function gtk_event_controller_scroll_get_type:TGType;cdecl;external libgtk4;
function gtk_event_controller_scroll_new(flags:TGtkEventControllerScrollFlags):PGtkEventController;cdecl;external libgtk4;
procedure gtk_event_controller_scroll_set_flags(scroll:PGtkEventControllerScroll; flags:TGtkEventControllerScrollFlags);cdecl;external libgtk4;
function gtk_event_controller_scroll_get_flags(scroll:PGtkEventControllerScroll):TGtkEventControllerScrollFlags;cdecl;external libgtk4;
function gtk_event_controller_scroll_get_unit(scroll:PGtkEventControllerScroll):TGdkScrollUnit;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:29:35 ===

function GTK_TYPE_EVENT_CONTROLLER_SCROLL : TGType;
function GTK_EVENT_CONTROLLER_SCROLL(obj : Pointer) : PGtkEventControllerScroll;
function GTK_EVENT_CONTROLLER_SCROLL_CLASS(klass : Pointer) : PGtkEventControllerScrollClass;
function GTK_IS_EVENT_CONTROLLER_SCROLL(obj : Pointer) : Tgboolean;
function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(klass : Pointer) : Tgboolean;
function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(obj : Pointer) : PGtkEventControllerScrollClass;

implementation

function GTK_TYPE_EVENT_CONTROLLER_SCROLL : TGType;
  begin
    GTK_TYPE_EVENT_CONTROLLER_SCROLL:=gtk_event_controller_scroll_get_type;
  end;

function GTK_EVENT_CONTROLLER_SCROLL(obj : Pointer) : PGtkEventControllerScroll;
begin
  Result := PGtkEventControllerScroll(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_SCROLL));
end;

function GTK_EVENT_CONTROLLER_SCROLL_CLASS(klass : Pointer) : PGtkEventControllerScrollClass;
begin
  Result := PGtkEventControllerScrollClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_SCROLL));
end;

function GTK_IS_EVENT_CONTROLLER_SCROLL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(obj : Pointer) : PGtkEventControllerScrollClass;
begin
  Result := PGtkEventControllerScrollClass(PGTypeInstance(obj)^.g_class);
end;



end.
