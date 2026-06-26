
unit gsocketconnectable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketconnectable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketconnectable.h
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
PGSocketAddressEnumerator  = ^GSocketAddressEnumerator;
PGSocketConnectable  = ^GSocketConnectable;
PGSocketConnectableIface  = ^GSocketConnectableIface;
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

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONNECTABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTABLE_GET_IFACE(obj : longint) : longint;

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


function g_socket_connectable_get_type:TGType;cdecl;external;
function g_socket_connectable_enumerate(connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;external;
function g_socket_connectable_proxy_enumerate(connectable:PGSocketConnectable):PGSocketAddressEnumerator;cdecl;external;
function g_socket_connectable_to_string(connectable:PGSocketConnectable):Pgchar;cdecl;external;
{$endif}
{ __G_SOCKET_CONNECTABLE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONNECTABLE : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_CONNECTABLE:=g_socket_connectable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTABLE(obj : longint) : longint;
begin
  G_SOCKET_CONNECTABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_SOCKET_CONNECTABLE,GSocketConnectable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTABLE(obj : longint) : longint;
begin
  G_IS_SOCKET_CONNECTABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_SOCKET_CONNECTABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTABLE_GET_IFACE(obj : longint) : longint;
begin
  G_SOCKET_CONNECTABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_SOCKET_CONNECTABLE,GSocketConnectableIface);
end;


end.
