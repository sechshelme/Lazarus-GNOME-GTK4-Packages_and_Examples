
unit gtkeventcontrollerfocus;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkeventcontrollerfocus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkeventcontrollerfocus.h
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
PGtkEventControllerFocus  = ^GtkEventControllerFocus;
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

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER_FOCUS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_FOCUS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(o : longint) : longint;

type

function gtk_event_controller_focus_get_type:TGType;cdecl;external;
function gtk_event_controller_focus_new:PGtkEventController;cdecl;external;
function gtk_event_controller_focus_contains_focus(self:PGtkEventControllerFocus):Tgboolean;cdecl;external;
function gtk_event_controller_focus_is_focus(self:PGtkEventControllerFocus):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_EVENT_CONTROLLER_FOCUS : longint; { return type might be wrong }
  begin
    GTK_TYPE_EVENT_CONTROLLER_FOCUS:=gtk_event_controller_focus_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_FOCUS:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_EVENT_CONTROLLER_FOCUS,GtkEventControllerFocus);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS_CLASS(k : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_FOCUS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_EVENT_CONTROLLER_FOCUS,GtkEventControllerFocusClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_FOCUS(o : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER_FOCUS:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(k : longint) : longint;
begin
  GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(o : longint) : longint;
begin
  GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_EVENT_CONTROLLER_FOCUS,GtkEventControllerFocusClass);
end;


end.
