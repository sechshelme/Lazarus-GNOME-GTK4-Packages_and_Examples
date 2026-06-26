unit gproxyresolver;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Collabora, Ltd.
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
{$ifndef __G_PROXY_RESOLVER_H__}
{$define __G_PROXY_RESOLVER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{*
 * G_PROXY_RESOLVER_EXTENSION_POINT_NAME:
 *
 * Extension point for proxy resolving functionality.
 * See [Extending GIO](overview.html#extending-gio).
  }
const
  G_PROXY_RESOLVER_EXTENSION_POINT_NAME = 'gio-proxy-resolver';  
type
{ Virtual Table  }
  PGProxyResolverInterface = ^TGProxyResolverInterface;
  TGProxyResolverInterface = record
      g_iface : TGTypeInterface;
      is_supported : function (resolver:PGProxyResolver):Tgboolean;cdecl;
      lookup : function (resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; error:PPGError):PPgchar;cdecl;
      lookup_async : procedure (resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_finish : function (resolver:PGProxyResolver; result:PGAsyncResult; error:PPGError):PPgchar;cdecl;
    end;


function g_proxy_resolver_get_type:TGType;cdecl;external libgio2;
function g_proxy_resolver_get_default:PGProxyResolver;cdecl;external libgio2;
function g_proxy_resolver_is_supported(resolver:PGProxyResolver):Tgboolean;cdecl;external libgio2;
function g_proxy_resolver_lookup(resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external libgio2;
procedure g_proxy_resolver_lookup_async(resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_proxy_resolver_lookup_finish(resolver:PGProxyResolver; result:PGAsyncResult; error:PPGError):^Pgchar;cdecl;external libgio2;
{$endif}
{ __G_PROXY_RESOLVER_H__  }

// === Konventiert am: 26-6-26 19:48:00 ===

function G_TYPE_PROXY_RESOLVER : TGType;
function G_PROXY_RESOLVER(obj : Pointer) : PGProxyResolver;
function G_IS_PROXY_RESOLVER(obj : Pointer) : Tgboolean;
function G_PROXY_RESOLVER_GET_IFACE(obj : Pointer) : PGProxyResolverInterface;

implementation

function G_TYPE_PROXY_RESOLVER : TGType;
  begin
    G_TYPE_PROXY_RESOLVER:=g_proxy_resolver_get_type;
  end;

function G_PROXY_RESOLVER(obj : Pointer) : PGProxyResolver;
begin
  Result := PGProxyResolver(g_type_check_instance_cast(obj, G_TYPE_PROXY_RESOLVER));
end;

function G_IS_PROXY_RESOLVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_PROXY_RESOLVER);
end;

function G_PROXY_RESOLVER_GET_IFACE(obj : Pointer) : PGProxyResolverInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_PROXY_RESOLVER);
end;



end.
