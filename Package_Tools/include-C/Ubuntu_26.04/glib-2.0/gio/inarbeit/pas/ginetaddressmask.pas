unit ginetaddressmask;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2011 Red Hat, Inc.
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
{$ifndef __G_INET_ADDRESS_MASK_H__}
{$define __G_INET_ADDRESS_MASK_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGInetAddressMask = ^TGInetAddressMask;
  TGInetAddressMask = record
      parent_instance : TGObject;
      priv : PGInetAddressMaskPrivate;
    end;

  PGInetAddressMaskClass = ^TGInetAddressMaskClass;
  TGInetAddressMaskClass = record
      parent_class : TGObjectClass;
    end;


function g_inet_address_mask_get_type:TGType;cdecl;external libgio2;
function g_inet_address_mask_new(addr:PGInetAddress; length:Tguint; error:PPGError):PGInetAddressMask;cdecl;external libgio2;
function g_inet_address_mask_new_from_string(mask_string:Pgchar; error:PPGError):PGInetAddressMask;cdecl;external libgio2;
function g_inet_address_mask_to_string(mask:PGInetAddressMask):Pgchar;cdecl;external libgio2;
function g_inet_address_mask_get_family(mask:PGInetAddressMask):TGSocketFamily;cdecl;external libgio2;
function g_inet_address_mask_get_address(mask:PGInetAddressMask):PGInetAddress;cdecl;external libgio2;
function g_inet_address_mask_get_length(mask:PGInetAddressMask):Tguint;cdecl;external libgio2;
function g_inet_address_mask_matches(mask:PGInetAddressMask; address:PGInetAddress):Tgboolean;cdecl;external libgio2;
function g_inet_address_mask_equal(mask:PGInetAddressMask; mask2:PGInetAddressMask):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_INET_ADDRESS_MASK_H__  }

// === Konventiert am: 26-6-26 19:26:07 ===

function G_TYPE_INET_ADDRESS_MASK : TGType;
function G_INET_ADDRESS_MASK(obj : Pointer) : PGInetAddressMask;
function G_INET_ADDRESS_MASK_CLASS(klass : Pointer) : PGInetAddressMaskClass;
function G_IS_INET_ADDRESS_MASK(obj : Pointer) : Tgboolean;
function G_IS_INET_ADDRESS_MASK_CLASS(klass : Pointer) : Tgboolean;
function G_INET_ADDRESS_MASK_GET_CLASS(obj : Pointer) : PGInetAddressMaskClass;

implementation

function G_TYPE_INET_ADDRESS_MASK : TGType;
  begin
    G_TYPE_INET_ADDRESS_MASK:=g_inet_address_mask_get_type;
  end;

function G_INET_ADDRESS_MASK(obj : Pointer) : PGInetAddressMask;
begin
  Result := PGInetAddressMask(g_type_check_instance_cast(obj, G_TYPE_INET_ADDRESS_MASK));
end;

function G_INET_ADDRESS_MASK_CLASS(klass : Pointer) : PGInetAddressMaskClass;
begin
  Result := PGInetAddressMaskClass(g_type_check_class_cast(klass, G_TYPE_INET_ADDRESS_MASK));
end;

function G_IS_INET_ADDRESS_MASK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_INET_ADDRESS_MASK);
end;

function G_IS_INET_ADDRESS_MASK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_INET_ADDRESS_MASK);
end;

function G_INET_ADDRESS_MASK_GET_CLASS(obj : Pointer) : PGInetAddressMaskClass;
begin
  Result := PGInetAddressMaskClass(PGTypeInstance(obj)^.g_class);
end;



end.
