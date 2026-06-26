
unit gproxyresolver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gproxyresolver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gproxyresolver.h
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
PGProxyResolver  = ^GProxyResolver;
PGProxyResolverInterface  = ^GProxyResolverInterface;
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

{ was #define dname def_expr }
function G_TYPE_PROXY_RESOLVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_RESOLVER_GET_IFACE(o : longint) : longint;

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
(* Const before type ignored *)
(* Const before type ignored *)
  PGProxyResolverInterface = ^TGProxyResolverInterface;
  TGProxyResolverInterface = record
      g_iface : TGTypeInterface;
      is_supported : function (resolver:PGProxyResolver):Tgboolean;cdecl;
      lookup : function (resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; error:PPGError):PPgchar;cdecl;
      lookup_async : procedure (resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_finish : function (resolver:PGProxyResolver; result:PGAsyncResult; error:PPGError):PPgchar;cdecl;
    end;


function g_proxy_resolver_get_type:TGType;cdecl;external;
function g_proxy_resolver_get_default:PGProxyResolver;cdecl;external;
function g_proxy_resolver_is_supported(resolver:PGProxyResolver):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_proxy_resolver_lookup(resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_proxy_resolver_lookup_async(resolver:PGProxyResolver; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_proxy_resolver_lookup_finish(resolver:PGProxyResolver; result:PGAsyncResult; error:PPGError):^Pgchar;cdecl;external;
{$endif}
{ __G_PROXY_RESOLVER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PROXY_RESOLVER : longint; { return type might be wrong }
  begin
    G_TYPE_PROXY_RESOLVER:=g_proxy_resolver_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_RESOLVER(o : longint) : longint;
begin
  G_PROXY_RESOLVER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_PROXY_RESOLVER,GProxyResolver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_RESOLVER(o : longint) : longint;
begin
  G_IS_PROXY_RESOLVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_PROXY_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_RESOLVER_GET_IFACE(o : longint) : longint;
begin
  G_PROXY_RESOLVER_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(o,G_TYPE_PROXY_RESOLVER,GProxyResolverInterface);
end;


end.
