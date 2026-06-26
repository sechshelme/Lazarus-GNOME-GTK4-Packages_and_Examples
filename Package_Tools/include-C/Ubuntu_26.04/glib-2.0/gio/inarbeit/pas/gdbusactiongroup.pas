unit gdbusactiongroup;

interface

uses
  fp_glib2;

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

function g_dbus_action_group_get_type:TGType;cdecl;external libgio2;
function g_dbus_action_group_get(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar):PGDBusActionGroup;cdecl;external libgio2;
{$endif}
{ __G_DBUS_ACTION_GROUP_H__  }

// === Konventiert am: 26-6-26 16:43:51 ===

function G_TYPE_DBUS_ACTION_GROUP : TGType;
function G_DBUS_ACTION_GROUP(obj : Pointer) : PGDBusActionGroup;
function G_DBUS_ACTION_GROUP_CLASS(klass : Pointer) : PGDBusActionGroupClass;
function G_IS_DBUS_ACTION_GROUP(obj : Pointer) : Tgboolean;
function G_IS_DBUS_ACTION_GROUP_CLASS(klass : Pointer) : Tgboolean;
function G_DBUS_ACTION_GROUP_GET_CLASS(obj : Pointer) : PGDBusActionGroupClass;

implementation

function G_TYPE_DBUS_ACTION_GROUP : TGType;
  begin
    G_TYPE_DBUS_ACTION_GROUP:=g_dbus_action_group_get_type;
  end;

function G_DBUS_ACTION_GROUP(obj : Pointer) : PGDBusActionGroup;
begin
  Result := PGDBusActionGroup(g_type_check_instance_cast(obj, G_TYPE_DBUS_ACTION_GROUP));
end;

function G_DBUS_ACTION_GROUP_CLASS(klass : Pointer) : PGDBusActionGroupClass;
begin
  Result := PGDBusActionGroupClass(g_type_check_class_cast(klass, G_TYPE_DBUS_ACTION_GROUP));
end;

function G_IS_DBUS_ACTION_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_ACTION_GROUP);
end;

function G_IS_DBUS_ACTION_GROUP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_DBUS_ACTION_GROUP);
end;

function G_DBUS_ACTION_GROUP_GET_CLASS(obj : Pointer) : PGDBusActionGroupClass;
begin
  Result := PGDBusActionGroupClass(PGTypeInstance(obj)^.g_class);
end;



end.
