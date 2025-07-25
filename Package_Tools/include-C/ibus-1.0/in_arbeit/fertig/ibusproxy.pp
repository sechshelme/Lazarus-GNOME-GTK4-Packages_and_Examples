
unit ibusproxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusproxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusproxy.h
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
PIBusProxy  = ^IBusProxy;
PIBusProxyClass  = ^IBusProxyClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2013 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_PROXY_H_}
{$define __IBUS_PROXY_H_}
{*
 * SECTION: ibusproxy
 * @short_description: Base proxy object.
 * @stability: Stable
 *
 * An IBusProxy is the base of all proxy objects,
 * which communicate the corresponding #IBusServices on the other end of
 * IBusConnection.
 * For example, IBus clients (such as editors, web browsers) invoke the proxy
 * object,
 * IBusInputContext to communicate with the InputContext service of the
 * ibus-daemon.
 *
 * Almost all services have corresponding proxies, except very simple services.
  }
{$include <gio/gio.h>}
{
 * Type macros.
  }
{ define GOBJECT macros  }

{ was #define dname def_expr }
function IBUS_TYPE_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROXY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_GET_CLASS(obj : longint) : longint;

type
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IBUS_PROXY_FLAGS(obj : longint) : longint;

{ xxxxxxxxxx }
{#define IBUS_PROXY_SET_FLAGS(obj,flag)    ((IBUS_PROXY_FLAGS (obj) |= (flag))) }
{#define IBUS_PROXY_UNSET_FLAGS(obj,flag)  ((IBUS_PROXY_FLAGS (obj) &= ~(flag))) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_DESTROYED(obj : longint) : longint;

{*
 * IBusProxy:
 *
 * An opaque data type representing an IBusProxy.
  }
{ instance members  }
type
  PIBusProxy = ^TIBusProxy;
  TIBusProxy = record
      parent : TGDBusProxy;
      flags : Tguint32;
      own : Tgboolean;
    end;

{ class members  }
{< private > }
{ padding  }
  PIBusProxyClass = ^TIBusProxyClass;
  TIBusProxyClass = record
      parent : TGDBusProxyClass;
      destroy : procedure (proxy:PIBusProxy);cdecl;
      pdummy : array[0..6] of Tgpointer;
    end;


function ibus_proxy_get_type:TGType;cdecl;external;
{*
 * ibus_proxy_destroy:
 * @proxy: An #IBusProxy
 *
 * Dispose the proxy object. If the dbus connection is alive and the own
 * variable above is TRUE (which is the default),
 * org.freedesktop.IBus.Service.Destroy method will be called.
 * Note that "destroy" signal might be emitted when ibus_proxy_destroy is
 * called or the underlying dbus connection for the proxy is terminated.
 * In the callback of the destroy signal, you might have to call something
 * like 'g_object_unref(the_proxy);'.
  }
procedure ibus_proxy_destroy(proxy:PIBusProxy);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function IBUS_TYPE_PROXY : longint; { return type might be wrong }
  begin
    IBUS_TYPE_PROXY:=ibus_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY(obj : longint) : longint;
begin
  IBUS_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(obj,IBUS_TYPE_PROXY,IBusProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_CLASS(klass : longint) : longint;
begin
  IBUS_PROXY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,IBUS_TYPE_PROXY,IBusProxyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROXY(obj : longint) : longint;
begin
  IBUS_IS_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,IBUS_TYPE_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_IS_PROXY_CLASS(klass : longint) : longint;
begin
  IBUS_IS_PROXY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,IBUS_TYPE_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_GET_CLASS(obj : longint) : longint;
begin
  IBUS_PROXY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,IBUS_TYPE_PROXY,IBusProxyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_FLAGS(obj : longint) : longint;
begin
  IBUS_PROXY_FLAGS:=(IBUS_PROXY(obj))^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_PROXY_DESTROYED(obj : longint) : longint;
begin
  IBUS_PROXY_DESTROYED:=(IBUS_PROXY_FLAGS(obj)) and IBUS_DESTROYED;
end;


end.
