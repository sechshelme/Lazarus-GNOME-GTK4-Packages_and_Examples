unit gdbusobjectproxy;

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
{$ifndef __G_DBUS_OBJECT_PROXY_H__}
{$define __G_DBUS_OBJECT_PROXY_H__}
{$include <gio/giotypes.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY_CLASS(klass : longint) : longint;

type
{< private > }
  PGDBusObjectProxy = ^TGDBusObjectProxy;
  TGDBusObjectProxy = record
      parent_instance : TGObject;
      priv : PGDBusObjectProxyPrivate;
    end;

{*
 * GDBusObjectProxyClass:
 * @parent_class: The parent class.
 *
 * Class structure for #GDBusObjectProxy.
 *
 * Since: 2.30
  }
{< private > }
  PGDBusObjectProxyClass = ^TGDBusObjectProxyClass;
  TGDBusObjectProxyClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function g_dbus_object_proxy_get_type:TGType;cdecl;external libgio2;
function g_dbus_object_proxy_new(connection:PGDBusConnection; object_path:Pgchar):PGDBusObjectProxy;cdecl;external libgio2;
function g_dbus_object_proxy_get_connection(proxy:PGDBusObjectProxy):PGDBusConnection;cdecl;external libgio2;
{$endif}
{ __G_DBUS_OBJECT_PROXY_H  }

// === Konventiert am: 26-6-26 16:48:16 ===

function G_TYPE_DBUS_OBJECT_PROXY : TGType;
function G_DBUS_OBJECT_PROXY(obj : Pointer) : PGDBusObjectProxy;
function G_DBUS_OBJECT_PROXY_CLASS(klass : Pointer) : PGDBusObjectProxyClass;
function G_DBUS_OBJECT_PROXY_GET_CLASS(obj : Pointer) : PGDBusObjectProxyClass;

implementation

function G_TYPE_DBUS_OBJECT_PROXY : TGType;
  begin
    G_TYPE_DBUS_OBJECT_PROXY:=g_dbus_object_proxy_get_type;
  end;

function G_DBUS_OBJECT_PROXY(obj : Pointer) : PGDBusObjectProxy;
begin
  Result := PGDBusObjectProxy(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_PROXY));
end;

function G_DBUS_OBJECT_PROXY_CLASS(klass : Pointer) : PGDBusObjectProxyClass;
begin
  Result := PGDBusObjectProxyClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_PROXY));
end;

function G_DBUS_OBJECT_PROXY_GET_CLASS(obj : Pointer) : PGDBusObjectProxyClass;
begin
  Result := PGDBusObjectProxyClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY(obj : longint) : longint;
begin
  G_IS_DBUS_OBJECT_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_PROXY_CLASS(klass : longint) : longint;
begin
  G_IS_DBUS_OBJECT_PROXY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_OBJECT_PROXY);
end;


end.
