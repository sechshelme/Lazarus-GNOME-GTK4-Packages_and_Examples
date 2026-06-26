unit gnativesocketaddress;

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
{$ifndef __G_NATIVE_SOCKET_ADDRESS_H__}
{$define __G_NATIVE_SOCKET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketaddress.h>}

type
{< private > }
  PGNativeSocketAddress = ^TGNativeSocketAddress;
  TGNativeSocketAddress = record
      parent_instance : TGSocketAddress;
      priv : PGNativeSocketAddressPrivate;
    end;

  PGNativeSocketAddressClass = ^TGNativeSocketAddressClass;
  TGNativeSocketAddressClass = record
      parent_class : TGSocketAddressClass;
    end;


function g_native_socket_address_get_type:TGType;cdecl;external libgio2;
function g_native_socket_address_new(native:Tgpointer; len:Tgsize):PGSocketAddress;cdecl;external libgio2;
{$endif}
{ __G_NATIVE_SOCKET_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:44:27 ===

function G_TYPE_NATIVE_SOCKET_ADDRESS : TGType;
function G_NATIVE_SOCKET_ADDRESS(obj : Pointer) : PGNativeSocketAddress;
function G_NATIVE_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGNativeSocketAddressClass;
function G_IS_NATIVE_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGNativeSocketAddressClass;

implementation

function G_TYPE_NATIVE_SOCKET_ADDRESS : TGType;
  begin
    G_TYPE_NATIVE_SOCKET_ADDRESS:=g_native_socket_address_get_type;
  end;

function G_NATIVE_SOCKET_ADDRESS(obj : Pointer) : PGNativeSocketAddress;
begin
  Result := PGNativeSocketAddress(g_type_check_instance_cast(obj, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_NATIVE_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_IS_NATIVE_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
