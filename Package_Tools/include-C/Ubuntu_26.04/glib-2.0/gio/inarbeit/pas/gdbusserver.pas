unit gdbusserver;

interface

uses
  fp_glib2;

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

function g_dbus_server_get_type:TGType;cdecl;external libgio2;
function g_dbus_server_new_sync(address:Pgchar; flags:TGDBusServerFlags; guid:Pgchar; observer:PGDBusAuthObserver; cancellable:PGCancellable; 
           error:PPGError):PGDBusServer;cdecl;external libgio2;
function g_dbus_server_get_client_address(server:PGDBusServer):Pgchar;cdecl;external libgio2;
function g_dbus_server_get_guid(server:PGDBusServer):Pgchar;cdecl;external libgio2;
function g_dbus_server_get_flags(server:PGDBusServer):TGDBusServerFlags;cdecl;external libgio2;
procedure g_dbus_server_start(server:PGDBusServer);cdecl;external libgio2;
procedure g_dbus_server_stop(server:PGDBusServer);cdecl;external libgio2;
function g_dbus_server_is_active(server:PGDBusServer):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_DBUS_SERVER_H__  }

// === Konventiert am: 26-6-26 19:18:18 ===

function G_TYPE_DBUS_SERVER : TGType;
function G_DBUS_SERVER(obj : Pointer) : PGDBusServer;
function G_IS_DBUS_SERVER(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_DBUS_SERVER : TGType;
  begin
    G_TYPE_DBUS_SERVER:=g_dbus_server_get_type;
  end;

function G_DBUS_SERVER(obj : Pointer) : PGDBusServer;
begin
  Result := PGDBusServer(g_type_check_instance_cast(obj, G_TYPE_DBUS_SERVER));
end;

function G_IS_DBUS_SERVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_SERVER);
end;



end.
