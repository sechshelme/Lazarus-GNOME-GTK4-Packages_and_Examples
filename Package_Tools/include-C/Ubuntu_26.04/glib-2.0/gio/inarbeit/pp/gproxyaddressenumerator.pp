
unit gproxyaddressenumerator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gproxyaddressenumerator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gproxyaddressenumerator.h
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
PGProxyAddressEnumerator  = ^GProxyAddressEnumerator;
PGProxyAddressEnumeratorClass  = ^GProxyAddressEnumeratorClass;
PGProxyAddressEnumeratorPrivate  = ^GProxyAddressEnumeratorPrivate;
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

{ was #define dname def_expr }
function G_TYPE_PROXY_ADDRESS_ENUMERATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(o : longint) : longint;

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


function g_proxy_address_enumerator_get_type:TGType;cdecl;external;
{$endif}
{ __G_PROXY_ADDRESS_ENUMERATOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PROXY_ADDRESS_ENUMERATOR : longint; { return type might be wrong }
  begin
    G_TYPE_PROXY_ADDRESS_ENUMERATOR:=g_proxy_address_enumerator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR(o : longint) : longint;
begin
  G_PROXY_ADDRESS_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_PROXY_ADDRESS_ENUMERATOR,GProxyAddressEnumerator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_PROXY_ADDRESS_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_PROXY_ADDRESS_ENUMERATOR,GProxyAddressEnumeratorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_ENUMERATOR(o : longint) : longint;
begin
  G_IS_PROXY_ADDRESS_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_IS_PROXY_ADDRESS_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_PROXY_ADDRESS_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS(o : longint) : longint;
begin
  G_PROXY_ADDRESS_ENUMERATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_PROXY_ADDRESS_ENUMERATOR,GProxyAddressEnumeratorClass);
end;


end.
