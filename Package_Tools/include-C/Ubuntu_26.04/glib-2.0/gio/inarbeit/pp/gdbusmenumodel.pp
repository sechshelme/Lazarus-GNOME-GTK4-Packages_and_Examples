
unit gdbusmenumodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusmenumodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusmenumodel.h
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
PGDBusConnection  = ^GDBusConnection;
PGDBusMenuModel  = ^GDBusMenuModel;
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

{ was #define dname def_expr }
function G_TYPE_DBUS_MENU_MODEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_MENU_MODEL(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_MENU_MODEL(inst : longint) : longint;

type

function g_dbus_menu_model_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_menu_model_get(connection:PGDBusConnection; bus_name:Pgchar; object_path:Pgchar):PGDBusMenuModel;cdecl;external;
{$endif}
{ __G_DBUS_MENU_MODEL_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_MENU_MODEL : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_MENU_MODEL:=g_dbus_menu_model_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_MENU_MODEL(inst : longint) : longint;
begin
  G_DBUS_MENU_MODEL:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_DBUS_MENU_MODEL,GDBusMenuModel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_MENU_MODEL(inst : longint) : longint;
begin
  G_IS_DBUS_MENU_MODEL:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_DBUS_MENU_MODEL);
end;


end.
