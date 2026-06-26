unit gnetworkaddress;

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
{$ifndef __G_NETWORK_ADDRESS_H__}
{$define __G_NETWORK_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGNetworkAddress = ^TGNetworkAddress;
  TGNetworkAddress = record
      parent_instance : TGObject;
      priv : PGNetworkAddressPrivate;
    end;

  PGNetworkAddressClass = ^TGNetworkAddressClass;
  TGNetworkAddressClass = record
      parent_class : TGObjectClass;
    end;


function g_network_address_get_type:TGType;cdecl;external libgio2;
function g_network_address_new(hostname:Pgchar; port:Tguint16):PGSocketConnectable;cdecl;external libgio2;
function g_network_address_new_loopback(port:Tguint16):PGSocketConnectable;cdecl;external libgio2;
function g_network_address_parse(host_and_port:Pgchar; default_port:Tguint16; error:PPGError):PGSocketConnectable;cdecl;external libgio2;
function g_network_address_parse_uri(uri:Pgchar; default_port:Tguint16; error:PPGError):PGSocketConnectable;cdecl;external libgio2;
function g_network_address_get_hostname(addr:PGNetworkAddress):Pgchar;cdecl;external libgio2;
function g_network_address_get_port(addr:PGNetworkAddress):Tguint16;cdecl;external libgio2;
function g_network_address_get_scheme(addr:PGNetworkAddress):Pgchar;cdecl;external libgio2;
{$endif}
{ __G_NETWORK_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:43:54 ===

function G_TYPE_NETWORK_ADDRESS : TGType;
function G_NETWORK_ADDRESS(obj : Pointer) : PGNetworkAddress;
function G_NETWORK_ADDRESS_CLASS(klass : Pointer) : PGNetworkAddressClass;
function G_IS_NETWORK_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_NETWORK_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_NETWORK_ADDRESS_GET_CLASS(obj : Pointer) : PGNetworkAddressClass;

implementation

function G_TYPE_NETWORK_ADDRESS : TGType;
  begin
    G_TYPE_NETWORK_ADDRESS:=g_network_address_get_type;
  end;

function G_NETWORK_ADDRESS(obj : Pointer) : PGNetworkAddress;
begin
  Result := PGNetworkAddress(g_type_check_instance_cast(obj, G_TYPE_NETWORK_ADDRESS));
end;

function G_NETWORK_ADDRESS_CLASS(klass : Pointer) : PGNetworkAddressClass;
begin
  Result := PGNetworkAddressClass(g_type_check_class_cast(klass, G_TYPE_NETWORK_ADDRESS));
end;

function G_IS_NETWORK_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NETWORK_ADDRESS);
end;

function G_IS_NETWORK_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_NETWORK_ADDRESS);
end;

function G_NETWORK_ADDRESS_GET_CLASS(obj : Pointer) : PGNetworkAddressClass;
begin
  Result := PGNetworkAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
