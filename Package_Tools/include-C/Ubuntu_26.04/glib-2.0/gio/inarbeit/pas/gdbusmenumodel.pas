unit gdbusmenumodel;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Canonical Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_DBUS_MENU_MODEL_H__}
{$define __G_DBUS_MENU_MODEL_H__}
{$include <gio/gdbusconnection.h>}

type

function g_dbus_menu_model_get_type:TGType;cdecl;external libgio2;
function g_dbus_menu_model_get(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar):PGDBusMenuModel;cdecl;external libgio2;
{$endif}
{ __G_DBUS_MENU_MODEL_H__  }

// === Konventiert am: 26-6-26 16:49:49 ===

function G_TYPE_DBUS_MENU_MODEL : TGType;
function G_DBUS_MENU_MODEL(obj : Pointer) : PGDBusMenuModel;
function G_IS_DBUS_MENU_MODEL(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_DBUS_MENU_MODEL : TGType;
  begin
    G_TYPE_DBUS_MENU_MODEL:=g_dbus_menu_model_get_type;
  end;

function G_DBUS_MENU_MODEL(obj : Pointer) : PGDBusMenuModel;
begin
  Result := PGDBusMenuModel(g_type_check_instance_cast(obj, G_TYPE_DBUS_MENU_MODEL));
end;

function G_IS_DBUS_MENU_MODEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_MENU_MODEL);
end;



end.
