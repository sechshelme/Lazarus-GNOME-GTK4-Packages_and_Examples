unit gproxyaddress;

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
 * Authors: Nicolas Dufresne <nicolas.dufresne@collabora.co.uk>
  }
{$ifndef __G_PROXY_ADDRESS_H__}
{$define __G_PROXY_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/ginetsocketaddress.h>}

type
{< private > }
  PGProxyAddress = ^TGProxyAddress;
  TGProxyAddress = record
      parent_instance : TGInetSocketAddress;
      priv : PGProxyAddressPrivate;
    end;

  PGProxyAddressClass = ^TGProxyAddressClass;
  TGProxyAddressClass = record
      parent_class : TGInetSocketAddressClass;
    end;


function g_proxy_address_get_type:TGType;cdecl;external libgio2;
function g_proxy_address_new(inetaddr:PGInetAddress; port:Tguint16; protocol:Pgchar; dest_hostname:Pgchar; dest_port:Tguint16; 
           username:Pgchar; password:Pgchar):PGSocketAddress;cdecl;external libgio2;
function g_proxy_address_get_protocol(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
function g_proxy_address_get_destination_protocol(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
function g_proxy_address_get_destination_hostname(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
function g_proxy_address_get_destination_port(proxy:PGProxyAddress):Tguint16;cdecl;external libgio2;
function g_proxy_address_get_username(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
function g_proxy_address_get_password(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
function g_proxy_address_get_uri(proxy:PGProxyAddress):Pgchar;cdecl;external libgio2;
{$endif}
{ __G_PROXY_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:48:11 ===

function G_TYPE_PROXY_ADDRESS : TGType;
function G_PROXY_ADDRESS(obj : Pointer) : PGProxyAddress;
function G_PROXY_ADDRESS_CLASS(klass : Pointer) : PGProxyAddressClass;
function G_IS_PROXY_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_PROXY_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_PROXY_ADDRESS_GET_CLASS(obj : Pointer) : PGProxyAddressClass;

implementation

function G_TYPE_PROXY_ADDRESS : TGType;
  begin
    G_TYPE_PROXY_ADDRESS:=g_proxy_address_get_type;
  end;

function G_PROXY_ADDRESS(obj : Pointer) : PGProxyAddress;
begin
  Result := PGProxyAddress(g_type_check_instance_cast(obj, G_TYPE_PROXY_ADDRESS));
end;

function G_PROXY_ADDRESS_CLASS(klass : Pointer) : PGProxyAddressClass;
begin
  Result := PGProxyAddressClass(g_type_check_class_cast(klass, G_TYPE_PROXY_ADDRESS));
end;

function G_IS_PROXY_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_PROXY_ADDRESS);
end;

function G_IS_PROXY_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_PROXY_ADDRESS);
end;

function G_PROXY_ADDRESS_GET_CLASS(obj : Pointer) : PGProxyAddressClass;
begin
  Result := PGProxyAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
