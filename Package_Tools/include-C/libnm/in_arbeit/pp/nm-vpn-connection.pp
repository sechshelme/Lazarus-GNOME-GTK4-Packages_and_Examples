
unit nm-vpn-connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-connection.h
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
Pchar  = ^char;
PNMVpnConnection  = ^NMVpnConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2010 Red Hat, Inc.
  }
{$ifndef __NM_VPN_CONNECTION_H__}
{$define __NM_VPN_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-active-connection.h"}
{$include "nm-vpn-dbus-interface.h"}

{ was #define dname def_expr }
function NM_TYPE_VPN_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION_GET_CLASS(obj : longint) : longint;

const
  NM_VPN_CONNECTION_VPN_STATE = 'vpn-state';  
  NM_VPN_CONNECTION_BANNER = 'banner';  
{*
 * NMVpnConnection:
  }
type

function nm_vpn_connection_get_type:TGType;cdecl;external;
function nm_vpn_connection_get_vpn_state(vpn:PNMVpnConnection):TNMVpnConnectionState;cdecl;external;
(* Const before type ignored *)
function nm_vpn_connection_get_banner(vpn:PNMVpnConnection):Pchar;cdecl;external;
{$endif}
{ __NM_VPN_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_CONNECTION : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_CONNECTION:=nm_vpn_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION(obj : longint) : longint;
begin
  NM_VPN_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_CONNECTION,NMVpnConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_VPN_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_VPN_CONNECTION,NMVpnConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_CONNECTION(obj : longint) : longint;
begin
  NM_IS_VPN_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_IS_VPN_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_VPN_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  NM_VPN_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_VPN_CONNECTION,NMVpnConnectionClass);
end;


end.
