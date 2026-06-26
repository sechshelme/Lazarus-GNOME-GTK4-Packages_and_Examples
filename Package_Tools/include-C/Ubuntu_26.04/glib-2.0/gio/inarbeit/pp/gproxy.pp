
unit gproxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gproxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gproxy.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGIOStream  = ^GIOStream;
PGProxy  = ^GProxy;
PGProxyAddress  = ^GProxyAddress;
PGProxyInterface  = ^GProxyInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Collabora Ltd.
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
 * Author: Nicolas Dufresne <nicolas.dufresne@collabora.co.uk>
  }
{$ifndef __G_PROXY_H__}
{$define __G_PROXY_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_GET_IFACE(obj : longint) : longint;

{*
 * G_PROXY_EXTENSION_POINT_NAME:
 *
 * Extension point for proxy functionality.
 * See [Extending GIO](overview.html#extending-gio).
 *
 * Since: 2.26
  }
const
  G_PROXY_EXTENSION_POINT_NAME = 'gio-proxy';  
type
{*
 * GProxyInterface:
 * @g_iface: The parent interface.
 * @connect: Connect to proxy server and wrap (if required) the #connection
 *           to handle payload.
 * @connect_async: Same as connect() but asynchronous.
 * @connect_finish: Returns the result of connect_async()
 * @supports_hostname: Returns whether the proxy supports hostname lookups.
 *
 * Provides an interface for handling proxy connection and payload.
 *
 * Since: 2.26
  }
{ Virtual Table  }
  PGProxyInterface = ^TGProxyInterface;
  TGProxyInterface = record
      g_iface : TGTypeInterface;
      connect : function (proxy:PGProxy; connection:PGIOStream; proxy_address:PGProxyAddress; cancellable:PGCancellable; error:PPGError):PGIOStream;cdecl;
      connect_async : procedure (proxy:PGProxy; connection:PGIOStream; proxy_address:PGProxyAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      connect_finish : function (proxy:PGProxy; result:PGAsyncResult; error:PPGError):PGIOStream;cdecl;
      supports_hostname : function (proxy:PGProxy):Tgboolean;cdecl;
    end;


function g_proxy_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_proxy_get_default_for_protocol(protocol:Pgchar):PGProxy;cdecl;external;
function g_proxy_connect(proxy:PGProxy; connection:PGIOStream; proxy_address:PGProxyAddress; cancellable:PGCancellable; error:PPGError):PGIOStream;cdecl;external;
procedure g_proxy_connect_async(proxy:PGProxy; connection:PGIOStream; proxy_address:PGProxyAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_proxy_connect_finish(proxy:PGProxy; result:PGAsyncResult; error:PPGError):PGIOStream;cdecl;external;
function g_proxy_supports_hostname(proxy:PGProxy):Tgboolean;cdecl;external;
{$endif}
{ __G_PROXY_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PROXY : longint; { return type might be wrong }
  begin
    G_TYPE_PROXY:=g_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY(o : longint) : longint;
begin
  G_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_PROXY,GProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY(o : longint) : longint;
begin
  G_IS_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_GET_IFACE(obj : longint) : longint;
begin
  G_PROXY_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_PROXY,GProxyInterface);
end;


end.
