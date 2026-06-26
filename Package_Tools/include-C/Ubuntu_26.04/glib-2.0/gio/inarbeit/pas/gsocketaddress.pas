unit gsocketaddress;

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
{$ifndef __G_SOCKET_ADDRESS_H__}
{$define __G_SOCKET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
  PGSocketAddress = ^TGSocketAddress;
  TGSocketAddress = record
      parent_instance : TGObject;
    end;

  PGSocketAddressClass = ^TGSocketAddressClass;
  TGSocketAddressClass = record
      parent_class : TGObjectClass;
      get_family : function (address:PGSocketAddress):TGSocketFamily;cdecl;
      get_native_size : function (address:PGSocketAddress):Tgssize;cdecl;
      to_native : function (address:PGSocketAddress; dest:Tgpointer; destlen:Tgsize; error:PPGError):Tgboolean;cdecl;
    end;


function g_socket_address_get_type:TGType;cdecl;external libgio2;
function g_socket_address_get_family(address:PGSocketAddress):TGSocketFamily;cdecl;external libgio2;
function g_socket_address_new_from_native(native:Tgpointer; len:Tgsize):PGSocketAddress;cdecl;external libgio2;
function g_socket_address_to_native(address:PGSocketAddress; dest:Tgpointer; destlen:Tgsize; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_socket_address_get_native_size(address:PGSocketAddress):Tgssize;cdecl;external libgio2;
{$endif}
{ __G_SOCKET_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:55:48 ===

function G_TYPE_SOCKET_ADDRESS : TGType;
function G_SOCKET_ADDRESS(obj : Pointer) : PGSocketAddress;
function G_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGSocketAddressClass;
function G_IS_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGSocketAddressClass;

implementation

function G_TYPE_SOCKET_ADDRESS : TGType;
  begin
    G_TYPE_SOCKET_ADDRESS:=g_socket_address_get_type;
  end;

function G_SOCKET_ADDRESS(obj : Pointer) : PGSocketAddress;
begin
  Result := PGSocketAddress(g_type_check_instance_cast(obj, G_TYPE_SOCKET_ADDRESS));
end;

function G_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGSocketAddressClass;
begin
  Result := PGSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_ADDRESS));
end;

function G_IS_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_ADDRESS);
end;

function G_IS_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SOCKET_ADDRESS);
end;

function G_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGSocketAddressClass;
begin
  Result := PGSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
