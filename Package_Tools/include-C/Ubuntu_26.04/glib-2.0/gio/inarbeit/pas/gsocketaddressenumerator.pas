unit gsocketaddressenumerator;

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
{$ifndef __G_SOCKET_ADDRESS_ENUMERATOR_H__}
{$define __G_SOCKET_ADDRESS_ENUMERATOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGSocketAddressEnumerator = ^TGSocketAddressEnumerator;
  TGSocketAddressEnumerator = record
      parent_instance : TGObject;
    end;

{*
 * GSocketAddressEnumeratorClass:
 * @next: Virtual method for g_socket_address_enumerator_next().
 * @next_async: Virtual method for g_socket_address_enumerator_next_async().
 * @next_finish: Virtual method for g_socket_address_enumerator_next_finish().
 *
 * Class structure for #GSocketAddressEnumerator.
  }
{< private > }
{< public > }
{ Virtual Table  }
  PGSocketAddressEnumeratorClass = ^TGSocketAddressEnumeratorClass;
  TGSocketAddressEnumeratorClass = record
      parent_class : TGObjectClass;
      next : function (enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; error:PPGError):PGSocketAddress;cdecl;
      next_async : procedure (enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      next_finish : function (enumerator:PGSocketAddressEnumerator; result:PGAsyncResult; error:PPGError):PGSocketAddress;cdecl;
    end;


function g_socket_address_enumerator_get_type:TGType;cdecl;external libgio2;
function g_socket_address_enumerator_next(enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; error:PPGError):PGSocketAddress;cdecl;external libgio2;
procedure g_socket_address_enumerator_next_async(enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_socket_address_enumerator_next_finish(enumerator:PGSocketAddressEnumerator; result:PGAsyncResult; error:PPGError):PGSocketAddress;cdecl;external libgio2;
{$endif}
{ __G_SOCKET_ADDRESS_ENUMERATOR_H__  }

// === Konventiert am: 26-6-26 19:55:43 ===

function G_TYPE_SOCKET_ADDRESS_ENUMERATOR : TGType;
function G_SOCKET_ADDRESS_ENUMERATOR(obj : Pointer) : PGSocketAddressEnumerator;
function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : PGSocketAddressEnumeratorClass;
function G_IS_SOCKET_ADDRESS_ENUMERATOR(obj : Pointer) : Tgboolean;
function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : Tgboolean;
function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(obj : Pointer) : PGSocketAddressEnumeratorClass;

implementation

function G_TYPE_SOCKET_ADDRESS_ENUMERATOR : TGType;
  begin
    G_TYPE_SOCKET_ADDRESS_ENUMERATOR:=g_socket_address_enumerator_get_type;
  end;

function G_SOCKET_ADDRESS_ENUMERATOR(obj : Pointer) : PGSocketAddressEnumerator;
begin
  Result := PGSocketAddressEnumerator(g_type_check_instance_cast(obj, G_TYPE_SOCKET_ADDRESS_ENUMERATOR));
end;

function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : PGSocketAddressEnumeratorClass;
begin
  Result := PGSocketAddressEnumeratorClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_ADDRESS_ENUMERATOR));
end;

function G_IS_SOCKET_ADDRESS_ENUMERATOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(obj : Pointer) : PGSocketAddressEnumeratorClass;
begin
  Result := PGSocketAddressEnumeratorClass(PGTypeInstance(obj)^.g_class);
end;



end.
