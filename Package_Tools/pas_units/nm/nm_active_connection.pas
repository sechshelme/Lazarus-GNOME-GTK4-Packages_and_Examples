unit nm_active_connection;

interface

uses
  fp_glib2, fp_nm;

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

function nm_active_connection_get_type:TGType;cdecl;external libnm;
function nm_active_connection_get_connection(connection:PNMActiveConnection):PNMRemoteConnection;cdecl;external libnm;
function nm_active_connection_get_id(connection:PNMActiveConnection):Pchar;cdecl;external libnm;
function nm_active_connection_get_uuid(connection:PNMActiveConnection):Pchar;cdecl;external libnm;
function nm_active_connection_get_connection_type(connection:PNMActiveConnection):Pchar;cdecl;external libnm;
function nm_active_connection_get_specific_object_path(connection:PNMActiveConnection):Pchar;cdecl;external libnm;
function nm_active_connection_get_devices(connection:PNMActiveConnection):PGPtrArray;cdecl;external libnm;
function nm_active_connection_get_state(connection:PNMActiveConnection):TNMActiveConnectionState;cdecl;external libnm;
function nm_active_connection_get_state_flags(connection:PNMActiveConnection):TNMActivationStateFlags;cdecl;external libnm;
function nm_active_connection_get_state_reason(connection:PNMActiveConnection):TNMActiveConnectionStateReason;cdecl;external libnm;
type
  PNMDevice = ^TNMDevice;
  TNMDevice = record
      {undefined structure}
    end;

{xxxxxxxxxxxxxx_NM_DEPRECATED_INCLUSIVE_LANGUAGE_1_44 }

function nm_active_connection_get_master(connection:PNMActiveConnection):PNMDevice;cdecl;external libnm;
function nm_active_connection_get_controller(connection:PNMActiveConnection):PNMDevice;cdecl;external libnm;
function nm_active_connection_get_default(connection:PNMActiveConnection):Tgboolean;cdecl;external libnm;
function nm_active_connection_get_ip4_config(connection:PNMActiveConnection):PNMIPConfig;cdecl;external libnm;
function nm_active_connection_get_dhcp4_config(connection:PNMActiveConnection):PNMDhcpConfig;cdecl;external libnm;
function nm_active_connection_get_default6(connection:PNMActiveConnection):Tgboolean;cdecl;external libnm;
function nm_active_connection_get_ip6_config(connection:PNMActiveConnection):PNMIPConfig;cdecl;external libnm;
function nm_active_connection_get_dhcp6_config(connection:PNMActiveConnection):PNMDhcpConfig;cdecl;external libnm;
function nm_active_connection_get_vpn(connection:PNMActiveConnection):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_ACTIVE_CONNECTION_H__  }

// === Konventiert am: 19-4-26 19:34:36 ===

function NM_TYPE_ACTIVE_CONNECTION : TGType;
function NM_ACTIVE_CONNECTION(obj : Pointer) : PNMActiveConnection;
function NM_ACTIVE_CONNECTION_CLASS(klass : Pointer) : PNMActiveConnectionClass;
function NM_IS_ACTIVE_CONNECTION(obj : Pointer) : Tgboolean;
function NM_IS_ACTIVE_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function NM_ACTIVE_CONNECTION_GET_CLASS(obj : Pointer) : PNMActiveConnectionClass;

implementation

function NM_TYPE_ACTIVE_CONNECTION : TGType;
  begin
    NM_TYPE_ACTIVE_CONNECTION:=nm_active_connection_get_type;
  end;

function NM_ACTIVE_CONNECTION(obj : Pointer) : PNMActiveConnection;
begin
  Result := PNMActiveConnection(g_type_check_instance_cast(obj, NM_TYPE_ACTIVE_CONNECTION));
end;

function NM_ACTIVE_CONNECTION_CLASS(klass : Pointer) : PNMActiveConnectionClass;
begin
  Result := PNMActiveConnectionClass(g_type_check_class_cast(klass, NM_TYPE_ACTIVE_CONNECTION));
end;

function NM_IS_ACTIVE_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_ACTIVE_CONNECTION);
end;

function NM_IS_ACTIVE_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_ACTIVE_CONNECTION);
end;

function NM_ACTIVE_CONNECTION_GET_CLASS(obj : Pointer) : PNMActiveConnectionClass;
begin
  Result := PNMActiveConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
