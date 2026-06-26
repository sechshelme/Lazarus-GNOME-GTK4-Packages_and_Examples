
unit gnetworkaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnetworkaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnetworkaddress.h
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
PGError  = ^GError;
PGNetworkAddress  = ^GNetworkAddress;
PGNetworkAddressClass  = ^GNetworkAddressClass;
PGNetworkAddressPrivate  = ^GNetworkAddressPrivate;
PGSocketConnectable  = ^GSocketConnectable;
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

{ was #define dname def_expr }
function G_TYPE_NETWORK_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS_GET_CLASS(o : longint) : longint;

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


function g_network_address_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_network_address_new(hostname:Pgchar; port:Tguint16):PGSocketConnectable;cdecl;external;
function g_network_address_new_loopback(port:Tguint16):PGSocketConnectable;cdecl;external;
(* Const before type ignored *)
function g_network_address_parse(host_and_port:Pgchar; default_port:Tguint16; error:PPGError):PGSocketConnectable;cdecl;external;
(* Const before type ignored *)
function g_network_address_parse_uri(uri:Pgchar; default_port:Tguint16; error:PPGError):PGSocketConnectable;cdecl;external;
(* Const before type ignored *)
function g_network_address_get_hostname(addr:PGNetworkAddress):Pgchar;cdecl;external;
function g_network_address_get_port(addr:PGNetworkAddress):Tguint16;cdecl;external;
(* Const before type ignored *)
function g_network_address_get_scheme(addr:PGNetworkAddress):Pgchar;cdecl;external;
{$endif}
{ __G_NETWORK_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_NETWORK_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_NETWORK_ADDRESS:=g_network_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS(o : longint) : longint;
begin
  G_NETWORK_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_NETWORK_ADDRESS,GNetworkAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS_CLASS(k : longint) : longint;
begin
  G_NETWORK_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_NETWORK_ADDRESS,GNetworkAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_ADDRESS(o : longint) : longint;
begin
  G_IS_NETWORK_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_NETWORK_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_NETWORK_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_NETWORK_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_NETWORK_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_NETWORK_ADDRESS,GNetworkAddressClass);
end;


end.
