
unit nm-active-connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-active-connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-active-connection.h
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
PGPtrArray  = ^GPtrArray;
PNMActiveConnection  = ^NMActiveConnection;
PNMDevice  = ^NMDevice;
PNMDhcpConfig  = ^NMDhcpConfig;
PNMIPConfig  = ^NMIPConfig;
PNMRemoteConnection  = ^NMRemoteConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2008 Novell, Inc.
  }
{$ifndef __NM_ACTIVE_CONNECTION_H__}
{$define __NM_ACTIVE_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{ was #define dname def_expr }
function NM_TYPE_ACTIVE_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACTIVE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACTIVE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION_GET_CLASS(obj : longint) : longint;

const
  NM_ACTIVE_CONNECTION_CONNECTION = 'connection';  
  NM_ACTIVE_CONNECTION_ID = 'id';  
  NM_ACTIVE_CONNECTION_UUID = 'uuid';  
  NM_ACTIVE_CONNECTION_TYPE = 'type';  
  NM_ACTIVE_CONNECTION_SPECIFIC_OBJECT_PATH = 'specific-object-path';  
  NM_ACTIVE_CONNECTION_DEVICES = 'devices';  
  NM_ACTIVE_CONNECTION_STATE = 'state';  
  NM_ACTIVE_CONNECTION_STATE_FLAGS = 'state-flags';  
  NM_ACTIVE_CONNECTION_DEFAULT = 'default';  
  NM_ACTIVE_CONNECTION_IP4_CONFIG = 'ip4-config';  
  NM_ACTIVE_CONNECTION_DHCP4_CONFIG = 'dhcp4-config';  
  NM_ACTIVE_CONNECTION_DEFAULT6 = 'default6';  
  NM_ACTIVE_CONNECTION_IP6_CONFIG = 'ip6-config';  
  NM_ACTIVE_CONNECTION_DHCP6_CONFIG = 'dhcp6-config';  
  NM_ACTIVE_CONNECTION_VPN = 'vpn';  
  NM_ACTIVE_CONNECTION_MASTER = 'master';  
  NM_ACTIVE_CONNECTION_CONTROLLER = 'controller';  
{*
 * NMActiveConnection:
  }
type

function nm_active_connection_get_type:TGType;cdecl;external;
function nm_active_connection_get_connection(connection:PNMActiveConnection):PNMRemoteConnection;cdecl;external;
(* Const before type ignored *)
function nm_active_connection_get_id(connection:PNMActiveConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_active_connection_get_uuid(connection:PNMActiveConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_active_connection_get_connection_type(connection:PNMActiveConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_active_connection_get_specific_object_path(connection:PNMActiveConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_active_connection_get_devices(connection:PNMActiveConnection):PGPtrArray;cdecl;external;
function nm_active_connection_get_state(connection:PNMActiveConnection):TNMActiveConnectionState;cdecl;external;
function nm_active_connection_get_state_flags(connection:PNMActiveConnection):TNMActivationStateFlags;cdecl;external;
function nm_active_connection_get_state_reason(connection:PNMActiveConnection):TNMActiveConnectionStateReason;cdecl;external;
type
  PNMDevice = ^TNMDevice;
  TNMDevice = record
      {undefined structure}
    end;

{xxxxxxxxxxxxxx_NM_DEPRECATED_INCLUSIVE_LANGUAGE_1_44 }

function nm_active_connection_get_master(connection:PNMActiveConnection):PNMDevice;cdecl;external;
function nm_active_connection_get_controller(connection:PNMActiveConnection):PNMDevice;cdecl;external;
function nm_active_connection_get_default(connection:PNMActiveConnection):Tgboolean;cdecl;external;
function nm_active_connection_get_ip4_config(connection:PNMActiveConnection):PNMIPConfig;cdecl;external;
function nm_active_connection_get_dhcp4_config(connection:PNMActiveConnection):PNMDhcpConfig;cdecl;external;
function nm_active_connection_get_default6(connection:PNMActiveConnection):Tgboolean;cdecl;external;
function nm_active_connection_get_ip6_config(connection:PNMActiveConnection):PNMIPConfig;cdecl;external;
function nm_active_connection_get_dhcp6_config(connection:PNMActiveConnection):PNMDhcpConfig;cdecl;external;
function nm_active_connection_get_vpn(connection:PNMActiveConnection):Tgboolean;cdecl;external;
{$endif}
{ __NM_ACTIVE_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_ACTIVE_CONNECTION : longint; { return type might be wrong }
  begin
    NM_TYPE_ACTIVE_CONNECTION:=nm_active_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION(obj : longint) : longint;
begin
  NM_ACTIVE_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_ACTIVE_CONNECTION,NMActiveConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_ACTIVE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_ACTIVE_CONNECTION,NMActiveConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACTIVE_CONNECTION(obj : longint) : longint;
begin
  NM_IS_ACTIVE_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_ACTIVE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_ACTIVE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_IS_ACTIVE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_ACTIVE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ACTIVE_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  NM_ACTIVE_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_ACTIVE_CONNECTION,NMActiveConnectionClass);
end;


end.
