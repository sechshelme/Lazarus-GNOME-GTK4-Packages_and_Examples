unit gproxyaddressenumerator;

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
 * Author: Nicolas Dufresne <nicolas.dufresne@collabora.co.uk>
  }
{$ifndef __G_PROXY_ADDRESS_ENUMERATOR_H__}
{$define __G_PROXY_ADDRESS_ENUMERATOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketaddressenumerator.h>}

type
{< private > }
  PGProxyAddressEnumerator = ^TGProxyAddressEnumerator;
  TGProxyAddressEnumerator = record
      parent_instance : TGSocketAddressEnumerator;
      priv : PGProxyAddressEnumeratorPrivate;
    end;

{*
 * GProxyAddressEnumeratorClass:
 *
 * Class structure for #GProxyAddressEnumerator.
  }
{< private > }
  PGProxyAddressEnumeratorClass = ^TGProxyAddressEnumeratorClass;
  TGProxyAddressEnumeratorClass = record
      parent_class : TGSocketAddressEnumeratorClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
      _g_reserved7 : procedure ;cdecl;
    end;


function g_proxy_address_enumerator_get_type:TGType;cdecl;external libgio2;
{$endif}
{ __G_PROXY_ADDRESS_ENUMERATOR_H__  }

// === Konventiert am: 26-6-26 19:48:06 ===

function G_TYPE_PROXY_ADDRESS_ENUMERATOR : TGType;
function G_PROXY_ADDRESS_ENUMERATOR(obj : Pointer) : PGProxyAddressEnumerator;
function G_PROXY_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : PGProxyAddressEnumeratorClass;
function G_IS_PROXY_ADDRESS_ENUMERATOR(obj : Pointer) : Tgboolean;
function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : Tgboolean;
function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(obj : Pointer) : PGProxyAddressEnumeratorClass;

implementation

function G_TYPE_PROXY_ADDRESS_ENUMERATOR : TGType;
  begin
    G_TYPE_PROXY_ADDRESS_ENUMERATOR:=g_proxy_address_enumerator_get_type;
  end;

function G_PROXY_ADDRESS_ENUMERATOR(obj : Pointer) : PGProxyAddressEnumerator;
begin
  Result := PGProxyAddressEnumerator(g_type_check_instance_cast(obj, G_TYPE_PROXY_ADDRESS_ENUMERATOR));
end;

function G_PROXY_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : PGProxyAddressEnumeratorClass;
begin
  Result := PGProxyAddressEnumeratorClass(g_type_check_class_cast(klass, G_TYPE_PROXY_ADDRESS_ENUMERATOR));
end;

function G_IS_PROXY_ADDRESS_ENUMERATOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(obj : Pointer) : PGProxyAddressEnumeratorClass;
begin
  Result := PGProxyAddressEnumeratorClass(PGTypeInstance(obj)^.g_class);
end;



end.
