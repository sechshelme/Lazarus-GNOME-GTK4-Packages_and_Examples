unit gsocketconnectable;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Red Hat, Inc.
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
  }
{$ifndef __G_SOCKET_CONNECTABLE_H__}
{$define __G_SOCKET_CONNECTABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GSocketConnectableIface:
 * @g_iface: The parent interface.
 * @enumerate: Creates a #GSocketAddressEnumerator
 * @proxy_enumerate: Creates a #GProxyAddressEnumerator
 * @to_string: Format the connectable’s address as a string for debugging.
 *    Implementing this is optional. (Since: 2.48)
 *
 * Provides an interface for returning a #GSocketAddressEnumerator
 * and #GProxyAddressEnumerator
  }
{ Virtual Table  }
  PGSocketConnectableIface = ^TGSocketConnectableIface;
  TGSocketConnectableIface = record
      g_iface : TGTypeInterface;
      enumerate : function (connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;
      proxy_enumerate : function (connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;
      to_string : function (connectable:PGSocketConnectable):Pgchar;cdecl;
    end;


function g_socket_connectable_get_type:TGType;cdecl;external libgio2;
function g_socket_connectable_enumerate(connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;external libgio2;
function g_socket_connectable_proxy_enumerate(connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;external libgio2;
function g_socket_connectable_to_string(connectable:PGSocketConnectable):Pgchar;cdecl;external libgio2;
{$endif}
{ __G_SOCKET_CONNECTABLE_H__  }

// === Konventiert am: 26-6-26 19:55:33 ===

function G_TYPE_SOCKET_CONNECTABLE : TGType;
function G_SOCKET_CONNECTABLE(obj : Pointer) : PGSocketConnectable;
function G_IS_SOCKET_CONNECTABLE(obj : Pointer) : Tgboolean;
function G_SOCKET_CONNECTABLE_GET_IFACE(obj : Pointer) : PGSocketConnectableIface;

implementation

function G_TYPE_SOCKET_CONNECTABLE : TGType;
  begin
    G_TYPE_SOCKET_CONNECTABLE:=g_socket_connectable_get_type;
  end;

function G_SOCKET_CONNECTABLE(obj : Pointer) : PGSocketConnectable;
begin
  Result := PGSocketConnectable(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONNECTABLE));
end;

function G_IS_SOCKET_CONNECTABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_CONNECTABLE);
end;

function G_SOCKET_CONNECTABLE_GET_IFACE(obj : Pointer) : PGSocketConnectableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_SOCKET_CONNECTABLE);
end;



end.
