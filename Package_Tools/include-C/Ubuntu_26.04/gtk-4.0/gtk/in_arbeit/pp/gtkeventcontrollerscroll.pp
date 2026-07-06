
unit gtkeventcontrollerscroll;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkeventcontrollerscroll.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkeventcontrollerscroll.h
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
PGtkEventController  = ^GtkEventController;
PGtkEventControllerScroll  = ^GtkEventControllerScroll;
PGtkEventControllerScrollFlags  = ^GtkEventControllerScrollFlags;
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

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER_SCROLL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_SCROLL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(o : longint) : longint;

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

function gtk_event_controller_scroll_get_type:TGType;cdecl;external;
function gtk_event_controller_scroll_new(flags:TGtkEventControllerScrollFlags):PGtkEventController;cdecl;external;
procedure gtk_event_controller_scroll_set_flags(scroll:PGtkEventControllerScroll; flags:TGtkEventControllerScrollFlags);cdecl;external;
function gtk_event_controller_scroll_get_flags(scroll:PGtkEventControllerScroll):TGtkEventControllerScrollFlags;cdecl;external;
function gtk_event_controller_scroll_get_unit(scroll:PGtkEventControllerScroll):TGdkScrollUnit;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER_SCROLL : longint; { return type might be wrong }
  begin
    GTK_TYPE_EVENT_CONTROLLER_SCROLL:=gtk_event_controller_scroll_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_SCROLL:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_EVENT_CONTROLLER_SCROLL,GtkEventControllerScroll);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL_CLASS(k : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_SCROLL_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_EVENT_CONTROLLER_SCROLL,GtkEventControllerScrollClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_SCROLL(o : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER_SCROLL:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS(k : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER_SCROLL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_EVENT_CONTROLLER_SCROLL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_SCROLL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_EVENT_CONTROLLER_SCROLL,GtkEventControllerScrollClass);
end;


end.
