
unit gproxyaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from gproxyaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gproxyaddress
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
Pgchar  = ^gchar;
PGInetAddress  = ^GInetAddress;
PGProxyAddress  = ^GProxyAddress;
PGProxyAddressClass  = ^GProxyAddressClass;
PGProxyAddressPrivate  = ^GProxyAddressPrivate;
PGSocketAddress  = ^GSocketAddress;
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

{ was #define dname def_expr }
function G_TYPE_PROXY_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_GET_CLASS(o : longint) : longint;

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


function g_proxy_address_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_proxy_address_new(inetaddr:PGInetAddress; port:Tguint16; protocol:Pgchar; dest_hostname:Pgchar; dest_port:Tguint16; 
           username:Pgchar; password:Pgchar):PGSocketAddress;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_protocol(proxy:PGProxyAddress):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_destination_protocol(proxy:PGProxyAddress):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_destination_hostname(proxy:PGProxyAddress):Pgchar;cdecl;external;
function g_proxy_address_get_destination_port(proxy:PGProxyAddress):Tguint16;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_username(proxy:PGProxyAddress):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_password(proxy:PGProxyAddress):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_proxy_address_get_uri(proxy:PGProxyAddress):Pgchar;cdecl;external;
{$endif}
{ __G_PROXY_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PROXY_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_PROXY_ADDRESS:=g_proxy_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS(o : longint) : longint;
begin
  G_PROXY_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_PROXY_ADDRESS,GProxyAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_CLASS(k : longint) : longint;
begin
  G_PROXY_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_PROXY_ADDRESS,GProxyAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS(o : longint) : longint;
begin
  G_IS_PROXY_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_PROXY_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PROXY_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_PROXY_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_PROXY_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PROXY_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_PROXY_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_PROXY_ADDRESS,GProxyAddressClass);
end;


end.
