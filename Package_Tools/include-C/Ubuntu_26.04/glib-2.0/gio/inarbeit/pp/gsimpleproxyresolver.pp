
unit gsimpleproxyresolver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsimpleproxyresolver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsimpleproxyresolver.h
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
PGProxyResolver  = ^GProxyResolver;
PGSimpleProxyResolver  = ^GSimpleProxyResolver;
PGSimpleProxyResolverClass  = ^GSimpleProxyResolverClass;
PGSimpleProxyResolverPrivate  = ^GSimpleProxyResolverPrivate;
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

{ was #define dname def_expr }
function G_TYPE_SIMPLE_PROXY_RESOLVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_PROXY_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(o : longint) : longint;

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


function g_simple_proxy_resolver_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_simple_proxy_resolver_new(default_proxy:Pgchar; ignore_hosts:PPgchar):PGProxyResolver;cdecl;external;
(* Const before type ignored *)
procedure g_simple_proxy_resolver_set_default_proxy(resolver:PGSimpleProxyResolver; default_proxy:Pgchar);cdecl;external;
procedure g_simple_proxy_resolver_set_ignore_hosts(resolver:PGSimpleProxyResolver; ignore_hosts:PPgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_simple_proxy_resolver_set_uri_proxy(resolver:PGSimpleProxyResolver; uri_scheme:Pgchar; proxy:Pgchar);cdecl;external;
{$endif}
{ __G_SIMPLE_PROXY_RESOLVER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SIMPLE_PROXY_RESOLVER : longint; { return type might be wrong }
  begin
    G_TYPE_SIMPLE_PROXY_RESOLVER:=g_simple_proxy_resolver_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER(o : longint) : longint;
begin
  G_SIMPLE_PROXY_RESOLVER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SIMPLE_PROXY_RESOLVER,GSimpleProxyResolver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER_CLASS(k : longint) : longint;
begin
  G_SIMPLE_PROXY_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_SIMPLE_PROXY_RESOLVER,GSimpleProxyResolverClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_PROXY_RESOLVER(o : longint) : longint;
begin
  G_IS_SIMPLE_PROXY_RESOLVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_PROXY_RESOLVER_CLASS(k : longint) : longint;
begin
  G_IS_SIMPLE_PROXY_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_SIMPLE_PROXY_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_PROXY_RESOLVER_GET_CLASS(o : longint) : longint;
begin
  G_SIMPLE_PROXY_RESOLVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_SIMPLE_PROXY_RESOLVER,GSimpleProxyResolverClass);
end;


end.
