
unit gtklockbutton;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklockbutton.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklockbutton.h
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
PGPermission  = ^GPermission;
PGtkLockButton  = ^GtkLockButton;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_LOCK_BUTTON : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LOCK_BUTTON(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LOCK_BUTTON(o : longint) : longint;

type

function gtk_lock_button_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_lock_button_new(permission:PGPermission):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_lock_button_get_permission(button:PGtkLockButton):PGPermission;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_lock_button_set_permission(button:PGtkLockButton; permission:PGPermission);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkLockButton, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_LOCK_BUTTON : longint; { return type might be wrong }
  begin
    GTK_TYPE_LOCK_BUTTON:=gtk_lock_button_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_LOCK_BUTTON(o : longint) : longint;
begin
  GTK_LOCK_BUTTON:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_LOCK_BUTTON,GtkLockButton);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_LOCK_BUTTON(o : longint) : longint;
begin
  GTK_IS_LOCK_BUTTON:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_LOCK_BUTTON);
end;


end.
