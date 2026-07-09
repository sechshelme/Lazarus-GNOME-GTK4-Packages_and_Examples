unit gtklockbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Red Hat, Inc.
 * Author: Matthias Clasen
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkbutton.h>}
{$include <gio/gio.h>}

type

function gtk_lock_button_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_lock_button_new(permission:PGPermission):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_lock_button_get_permission(button:PGtkLockButton):PGPermission;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_lock_button_set_permission(button:PGtkLockButton; permission:PGPermission);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkLockButton, g_object_unref) }

// === Konventiert am: 9-7-26 19:44:55 ===

function GTK_TYPE_LOCK_BUTTON : TGType;
function GTK_LOCK_BUTTON(obj : Pointer) : PGtkLockButton;
function GTK_IS_LOCK_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_LOCK_BUTTON : TGType;
  begin
    GTK_TYPE_LOCK_BUTTON:=gtk_lock_button_get_type;
  end;

function GTK_LOCK_BUTTON(obj : Pointer) : PGtkLockButton;
begin
  Result := PGtkLockButton(g_type_check_instance_cast(obj, GTK_TYPE_LOCK_BUTTON));
end;

function GTK_IS_LOCK_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LOCK_BUTTON);
end;



end.
