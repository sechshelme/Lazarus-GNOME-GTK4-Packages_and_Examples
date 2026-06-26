
unit gdbusactiongroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusactiongroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusactiongroup.h
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
Pgchar  = ^gchar;
PGDBusActionGroup  = ^GDBusActionGroup;
PGDBusConnection  = ^GDBusConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
 * Copyright © 2011 Canonical Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_DBUS_ACTION_GROUP_H__}
{$define __G_DBUS_ACTION_GROUP_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include "giotypes.h"}

{ was #define dname def_expr }
function G_TYPE_DBUS_ACTION_GROUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_ACTION_GROUP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_ACTION_GROUP_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP_GET_CLASS(inst : longint) : longint;

function g_dbus_action_group_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_action_group_get(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar):PGDBusActionGroup;cdecl;external;
{$endif}
{ __G_DBUS_ACTION_GROUP_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_ACTION_GROUP : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_ACTION_GROUP:=g_dbus_action_group_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP(inst : longint) : longint;
begin
  G_DBUS_ACTION_GROUP:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_DBUS_ACTION_GROUP,GDBusActionGroup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP_CLASS(_class : longint) : longint;
begin
  G_DBUS_ACTION_GROUP_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_DBUS_ACTION_GROUP,GDBusActionGroupClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_ACTION_GROUP(inst : longint) : longint;
begin
  G_IS_DBUS_ACTION_GROUP:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_DBUS_ACTION_GROUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_ACTION_GROUP_CLASS(_class : longint) : longint;
begin
  G_IS_DBUS_ACTION_GROUP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_DBUS_ACTION_GROUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_ACTION_GROUP_GET_CLASS(inst : longint) : longint;
begin
  G_DBUS_ACTION_GROUP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_DBUS_ACTION_GROUP,GDBusActionGroupClass);
end;


end.
