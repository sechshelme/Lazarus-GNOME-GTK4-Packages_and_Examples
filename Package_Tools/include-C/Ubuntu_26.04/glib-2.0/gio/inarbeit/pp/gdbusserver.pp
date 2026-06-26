
unit gdbusserver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusserver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusserver.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDBusAuthObserver  = ^GDBusAuthObserver;
PGDBusServer  = ^GDBusServer;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_DBUS_SERVER_H__}
{$define __G_DBUS_SERVER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_SERVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_SERVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_SERVER(o : longint) : longint;

function g_dbus_server_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_server_new_sync(address:Pgchar; flags:TGDBusServerFlags; guid:Pgchar; observer:PGDBusAuthObserver; cancellable:PGCancellable; 
           error:PPGError):PGDBusServer;cdecl;external;
(* Const before type ignored *)
function g_dbus_server_get_client_address(server:PGDBusServer):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_dbus_server_get_guid(server:PGDBusServer):Pgchar;cdecl;external;
function g_dbus_server_get_flags(server:PGDBusServer):TGDBusServerFlags;cdecl;external;
procedure g_dbus_server_start(server:PGDBusServer);cdecl;external;
procedure g_dbus_server_stop(server:PGDBusServer);cdecl;external;
function g_dbus_server_is_active(server:PGDBusServer):Tgboolean;cdecl;external;
{$endif}
{ __G_DBUS_SERVER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_SERVER : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_SERVER:=g_dbus_server_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_SERVER(o : longint) : longint;
begin
  G_DBUS_SERVER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_SERVER,GDBusServer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_SERVER(o : longint) : longint;
begin
  G_IS_DBUS_SERVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_SERVER);
end;


end.
