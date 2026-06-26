unit ginetaddress;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Christian Kellner, Samuel Cormier-Iijima
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
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
  }
{$ifndef __G_INET_ADDRESS_H__}
{$define __G_INET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGInetAddress = ^TGInetAddress;
  TGInetAddress = record
      parent_instance : TGObject;
      priv : PGInetAddressPrivate;
    end;

  PGInetAddressClass = ^TGInetAddressClass;
  TGInetAddressClass = record
      parent_class : TGObjectClass;
      to_string : function (address:PGInetAddress):Pgchar;cdecl;
      to_bytes : function (address:PGInetAddress):Pguint8;cdecl;
    end;


function g_inet_address_get_type:TGType;cdecl;external libgio2;
function g_inet_address_new_from_string(_string:Pgchar):PGInetAddress;cdecl;external libgio2;
function g_inet_address_new_from_bytes(bytes:Pguint8; family:TGSocketFamily):PGInetAddress;cdecl;external libgio2;
function g_inet_address_new_loopback(family:TGSocketFamily):PGInetAddress;cdecl;external libgio2;
function g_inet_address_new_from_bytes_with_ipv6_info(bytes:Pguint8; family:TGSocketFamily; flowinfo:Tguint32; scope_id:Tguint32):PGInetAddress;cdecl;external libgio2;
function g_inet_address_new_any(family:TGSocketFamily):PGInetAddress;cdecl;external libgio2;
function g_inet_address_equal(address:PGInetAddress; other_address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_to_string(address:PGInetAddress):Pgchar;cdecl;external libgio2;
function g_inet_address_to_bytes(address:PGInetAddress):Pguint8;cdecl;external libgio2;
function g_inet_address_get_native_size(address:PGInetAddress):Tgsize;cdecl;external libgio2;
function g_inet_address_get_family(address:PGInetAddress):TGSocketFamily;cdecl;external libgio2;
function g_inet_address_get_is_any(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_loopback(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_link_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_site_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_multicast(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_mc_global(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_mc_link_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_mc_node_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_mc_org_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_is_mc_site_local(address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_get_scope_id(address:PGInetAddress):Tguint32;cdecl;external libgio2;
function g_inet_address_get_flowinfo(address:PGInetAddress):Tguint32;cdecl;external libgio2;
{$endif}
{ __G_INET_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:26:12 ===

function G_TYPE_INET_ADDRESS : TGType;
function G_INET_ADDRESS(obj : Pointer) : PGInetAddress;
function G_INET_ADDRESS_CLASS(klass : Pointer) : PGInetAddressClass;
function G_IS_INET_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_INET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_INET_ADDRESS_GET_CLASS(obj : Pointer) : PGInetAddressClass;

implementation

function G_TYPE_INET_ADDRESS : TGType;
  begin
    G_TYPE_INET_ADDRESS:=g_inet_address_get_type;
  end;

function G_INET_ADDRESS(obj : Pointer) : PGInetAddress;
begin
  Result := PGInetAddress(g_type_check_instance_cast(obj, G_TYPE_INET_ADDRESS));
end;

function G_INET_ADDRESS_CLASS(klass : Pointer) : PGInetAddressClass;
begin
  Result := PGInetAddressClass(g_type_check_class_cast(klass, G_TYPE_INET_ADDRESS));
end;

function G_IS_INET_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_INET_ADDRESS);
end;

function G_IS_INET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_INET_ADDRESS);
end;

function G_INET_ADDRESS_GET_CLASS(obj : Pointer) : PGInetAddressClass;
begin
  Result := PGInetAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
