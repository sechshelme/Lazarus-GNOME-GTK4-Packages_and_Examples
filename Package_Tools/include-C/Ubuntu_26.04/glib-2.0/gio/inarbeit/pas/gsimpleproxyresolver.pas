unit gsimpleproxyresolver;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2010, 2013 Red Hat, Inc.
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
{$ifndef __G_SIMPLE_PROXY_RESOLVER_H__}
{$define __G_SIMPLE_PROXY_RESOLVER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gproxyresolver.h>}

type
{< private > }
  PGSimpleProxyResolver = ^TGSimpleProxyResolver;
  TGSimpleProxyResolver = record
      parent_instance : TGObject;
      priv : PGSimpleProxyResolverPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGSimpleProxyResolverClass = ^TGSimpleProxyResolverClass;
  TGSimpleProxyResolverClass = record
      parent_class : TGObjectClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_simple_proxy_resolver_get_type:TGType;cdecl;external libgio2;
function g_simple_proxy_resolver_new(default_proxy:Pgchar; ignore_hosts:PPgchar):PGProxyResolver;cdecl;external libgio2;
procedure g_simple_proxy_resolver_set_default_proxy(resolver:PGSimpleProxyResolver; default_proxy:Pgchar);cdecl;external libgio2;
procedure g_simple_proxy_resolver_set_ignore_hosts(resolver:PGSimpleProxyResolver; ignore_hosts:PPgchar);cdecl;external libgio2;
procedure g_simple_proxy_resolver_set_uri_proxy(resolver:PGSimpleProxyResolver; uri_scheme:Pgchar; proxy:Pgchar);cdecl;external libgio2;
{$endif}
{ __G_SIMPLE_PROXY_RESOLVER_H__  }

// === Konventiert am: 26-6-26 19:55:55 ===

function G_TYPE_SIMPLE_PROXY_RESOLVER : TGType;
function G_SIMPLE_PROXY_RESOLVER(obj : Pointer) : PGSimpleProxyResolver;
function G_SIMPLE_PROXY_RESOLVER_CLASS(klass : Pointer) : PGSimpleProxyResolverClass;
function G_IS_SIMPLE_PROXY_RESOLVER(obj : Pointer) : Tgboolean;
function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(klass : Pointer) : Tgboolean;
function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(obj : Pointer) : PGSimpleProxyResolverClass;

implementation

function G_TYPE_SIMPLE_PROXY_RESOLVER : TGType;
  begin
    G_TYPE_SIMPLE_PROXY_RESOLVER:=g_simple_proxy_resolver_get_type;
  end;

function G_SIMPLE_PROXY_RESOLVER(obj : Pointer) : PGSimpleProxyResolver;
begin
  Result := PGSimpleProxyResolver(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_PROXY_RESOLVER));
end;

function G_SIMPLE_PROXY_RESOLVER_CLASS(klass : Pointer) : PGSimpleProxyResolverClass;
begin
  Result := PGSimpleProxyResolverClass(g_type_check_class_cast(klass, G_TYPE_SIMPLE_PROXY_RESOLVER));
end;

function G_IS_SIMPLE_PROXY_RESOLVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(obj : Pointer) : PGSimpleProxyResolverClass;
begin
  Result := PGSimpleProxyResolverClass(PGTypeInstance(obj)^.g_class);
end;



end.
