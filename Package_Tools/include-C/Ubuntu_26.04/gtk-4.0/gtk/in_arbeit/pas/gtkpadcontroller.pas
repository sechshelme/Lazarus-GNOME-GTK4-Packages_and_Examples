unit gtkpadcontroller;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2016, Red Hat, Inc.
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
 * GtkPadActionType:
 * @GTK_PAD_ACTION_BUTTON: Action is triggered by a pad button
 * @GTK_PAD_ACTION_RING: Action is triggered by a pad ring
 * @GTK_PAD_ACTION_STRIP: Action is triggered by a pad strip
 * @GTK_PAD_ACTION_DIAL: Action is triggered by a pad dial
 *
 * The type of a pad action.
  }

  PGtkPadActionType = ^TGtkPadActionType;
  TGtkPadActionType =  Longint;
  Const
    GTK_PAD_ACTION_BUTTON = 0;
    GTK_PAD_ACTION_RING = 1;
    GTK_PAD_ACTION_STRIP = 2;
    GTK_PAD_ACTION_DIAL = 3;
;
{*
 * GtkPadActionEntry:
 * @type: the type of pad feature that will trigger this action entry.
 * @index: the 0-indexed button/ring/strip/dial number that will trigger this action
 *   entry.
 * @mode: the mode that will trigger this action entry, or -1 for all modes.
 * @label: Human readable description of this action entry, this string should
 *   be deemed user-visible.
 * @action_name: action name that will be activated in the `GActionGroup`.
 *
 * Struct defining a pad action entry.
  }
type
  PGtkPadActionEntry = ^TGtkPadActionEntry;
  TGtkPadActionEntry = record
      _type : TGtkPadActionType;
      index : longint;
      mode : longint;
      _label : Pchar;
      action_name : Pchar;
    end;


function gtk_pad_controller_get_type:TGType;cdecl;external libgtk4;
function gtk_pad_controller_new(group:PGActionGroup; pad:PGdkDevice):PGtkPadController;cdecl;external libgtk4;
procedure gtk_pad_controller_set_action_entries(controller:PGtkPadController; entries:PGtkPadActionEntry; n_entries:longint);cdecl;external libgtk4;
procedure gtk_pad_controller_set_action(controller:PGtkPadController; _type:TGtkPadActionType; index:longint; mode:longint; _label:Pchar; 
            action_name:Pchar);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:29:03 ===

function GTK_TYPE_PAD_CONTROLLER : TGType;
function GTK_PAD_CONTROLLER(obj : Pointer) : PGtkPadController;
function GTK_PAD_CONTROLLER_CLASS(klass : Pointer) : PGtkPadControllerClass;
function GTK_IS_PAD_CONTROLLER(obj : Pointer) : Tgboolean;
function GTK_IS_PAD_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
function GTK_PAD_CONTROLLER_GET_CLASS(obj : Pointer) : PGtkPadControllerClass;

implementation

function GTK_TYPE_PAD_CONTROLLER : TGType;
  begin
    GTK_TYPE_PAD_CONTROLLER:=gtk_pad_controller_get_type;
  end;

function GTK_PAD_CONTROLLER(obj : Pointer) : PGtkPadController;
begin
  Result := PGtkPadController(g_type_check_instance_cast(obj, GTK_TYPE_PAD_CONTROLLER));
end;

function GTK_PAD_CONTROLLER_CLASS(klass : Pointer) : PGtkPadControllerClass;
begin
  Result := PGtkPadControllerClass(g_type_check_class_cast(klass, GTK_TYPE_PAD_CONTROLLER));
end;

function GTK_IS_PAD_CONTROLLER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PAD_CONTROLLER);
end;

function GTK_IS_PAD_CONTROLLER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_PAD_CONTROLLER);
end;

function GTK_PAD_CONTROLLER_GET_CLASS(obj : Pointer) : PGtkPadControllerClass;
begin
  Result := PGtkPadControllerClass(PGTypeInstance(obj)^.g_class);
end;



end.
