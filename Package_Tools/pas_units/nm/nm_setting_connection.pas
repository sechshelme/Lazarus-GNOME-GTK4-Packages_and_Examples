unit nm_setting_connection;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_CONNECTION_H__}
{$define __NM_SETTING_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_CONNECTION_SETTING_NAME = 'connection';  
  NM_SETTING_CONNECTION_AUTOCONNECT_PRIORITY_MIN = -(999);  
  NM_SETTING_CONNECTION_AUTOCONNECT_PRIORITY_MAX = 999;  
  NM_SETTING_CONNECTION_AUTOCONNECT_PRIORITY_DEFAULT = 0;  
  NM_SETTING_CONNECTION_ID = 'id';  
  NM_SETTING_CONNECTION_UUID = 'uuid';  
  NM_SETTING_CONNECTION_STABLE_ID = 'stable-id';  
  NM_SETTING_CONNECTION_INTERFACE_NAME = 'interface-name';  
  NM_SETTING_CONNECTION_TYPE = 'type';  
  NM_SETTING_CONNECTION_AUTOCONNECT = 'autoconnect';  
  NM_SETTING_CONNECTION_AUTOCONNECT_PRIORITY = 'autoconnect-priority';  
  NM_SETTING_CONNECTION_AUTOCONNECT_RETRIES = 'autoconnect-retries';  
  NM_SETTING_CONNECTION_MULTI_CONNECT = 'multi-connect';  
  NM_SETTING_CONNECTION_TIMESTAMP = 'timestamp';  
  NM_SETTING_CONNECTION_READ_ONLY = 'read-only';  
  NM_SETTING_CONNECTION_PERMISSIONS = 'permissions';  
  NM_SETTING_CONNECTION_ZONE = 'zone';  
  NM_SETTING_CONNECTION_MASTER = 'master';  
  NM_SETTING_CONNECTION_CONTROLLER = 'controller';  
  NM_SETTING_CONNECTION_SLAVE_TYPE = 'slave-type';  
  NM_SETTING_CONNECTION_PORT_TYPE = 'port-type';  
  NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES = 'autoconnect-slaves';  
  NM_SETTING_CONNECTION_AUTOCONNECT_PORTS = 'autoconnect-ports';  
  NM_SETTING_CONNECTION_SECONDARIES = 'secondaries';  
  NM_SETTING_CONNECTION_GATEWAY_PING_TIMEOUT = 'gateway-ping-timeout';  
  NM_SETTING_CONNECTION_METERED = 'metered';  
  NM_SETTING_CONNECTION_LLDP = 'lldp';  
  NM_SETTING_CONNECTION_AUTH_RETRIES = 'auth-retries';  
  NM_SETTING_CONNECTION_MDNS = 'mdns';  
  NM_SETTING_CONNECTION_LLMNR = 'llmnr';  
  NM_SETTING_CONNECTION_DNS_OVER_TLS = 'dns-over-tls';  
  NM_SETTING_CONNECTION_MPTCP_FLAGS = 'mptcp-flags';  
  NM_SETTING_CONNECTION_WAIT_DEVICE_TIMEOUT = 'wait-device-timeout';  
  NM_SETTING_CONNECTION_MUD_URL = 'mud-url';  
  NM_SETTING_CONNECTION_WAIT_ACTIVATION_DELAY = 'wait-activation-delay';  
{ Types for property values  }
{*
 * NMSettingConnectionAutoconnectSlaves:
 * @NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_DEFAULT: default value
 * @NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_NO: slaves are not brought up when
 *   master is activated
 * @NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_YES: slaves are brought up when
 *   master is activated
 *
 * #NMSettingConnectionAutoconnectSlaves values indicate whether slave connections
 * should be activated when master is activated.
 *
 * Since: 1.2
 *
 * Deprecated: 1.46
  }
{xxxx NM_DEPRECATED_IN__1_46 }
type
  PNMSettingConnectionAutoconnectSlaves = ^TNMSettingConnectionAutoconnectSlaves;
  TNMSettingConnectionAutoconnectSlaves =  Longint;
  Const
    NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_DEFAULT = -(1);
    NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_NO = 0;
    NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_YES = 1;
;
{*
 * NMSettingConnectionLldp:
 * @NM_SETTING_CONNECTION_LLDP_DEFAULT: default value
 * @NM_SETTING_CONNECTION_LLDP_DISABLE: disable LLDP
 * @NM_SETTING_CONNECTION_LLDP_ENABLE_RX: enable reception of LLDP frames
 *
 * #NMSettingConnectionLldp values indicate whether LLDP should be enabled.
 *
 * Since: 1.2
  }
type
  PNMSettingConnectionLldp = ^TNMSettingConnectionLldp;
  TNMSettingConnectionLldp =  Longint;
  Const
    NM_SETTING_CONNECTION_LLDP_DEFAULT = -(1);
    NM_SETTING_CONNECTION_LLDP_DISABLE = 0;
    NM_SETTING_CONNECTION_LLDP_ENABLE_RX = 1;
;
{*
 * NMSettingConnectionMdns:
 * @NM_SETTING_CONNECTION_MDNS_DEFAULT: default value
 * @NM_SETTING_CONNECTION_MDNS_NO: disable mDNS
 * @NM_SETTING_CONNECTION_MDNS_RESOLVE: support only resolving, do not register hostname
 * @NM_SETTING_CONNECTION_MDNS_YES: enable mDNS
 *
 * #NMSettingConnectionMdns values indicate whether mDNS should be enabled.
 *
 * Since: 1.12
  }
type
  PNMSettingConnectionMdns = ^TNMSettingConnectionMdns;
  TNMSettingConnectionMdns =  Longint;
  Const
    NM_SETTING_CONNECTION_MDNS_DEFAULT = -(1);
    NM_SETTING_CONNECTION_MDNS_NO = 0;
    NM_SETTING_CONNECTION_MDNS_RESOLVE = 1;
    NM_SETTING_CONNECTION_MDNS_YES = 2;
;
{*
 * NMSettingConnectionLlmnr:
 * @NM_SETTING_CONNECTION_LLMNR_DEFAULT: default value
 * @NM_SETTING_CONNECTION_LLMNR_NO: disable LLMNR
 * @NM_SETTING_CONNECTION_LLMNR_RESOLVE: support only resolving, do not register hostname
 * @NM_SETTING_CONNECTION_LLMNR_YES: enable LLMNR
 *
 * #NMSettingConnectionLlmnr values indicate whether LLMNR should be enabled.
 *
 * Since: 1.14
  }
type
  PNMSettingConnectionLlmnr = ^TNMSettingConnectionLlmnr;
  TNMSettingConnectionLlmnr =  Longint;
  Const
    NM_SETTING_CONNECTION_LLMNR_DEFAULT = -(1);
    NM_SETTING_CONNECTION_LLMNR_NO = 0;
    NM_SETTING_CONNECTION_LLMNR_RESOLVE = 1;
    NM_SETTING_CONNECTION_LLMNR_YES = 2;
;
{*
 * NMSettingConnectionDnsOverTls:
 * @NM_SETTING_CONNECTION_DNS_OVER_TLS_DEFAULT: default value
 * @NM_SETTING_CONNECTION_DNS_OVER_TLS_NO: disable DNSOverTls
 * @NM_SETTING_CONNECTION_DNS_OVER_TLS_OPPORTUNISTIC: enable opportunistic mode
 * @NM_SETTING_CONNECTION_DNS_OVER_TLS_YES: enable strict mode
 *
 * #NMSettingConnectionDnsOverTls values indicate whether DNSOverTls should be enabled.
 *
 * Since: 1.34
  }
type
  PNMSettingConnectionDnsOverTls = ^TNMSettingConnectionDnsOverTls;
  TNMSettingConnectionDnsOverTls =  Longint;
  Const
    NM_SETTING_CONNECTION_DNS_OVER_TLS_DEFAULT = -(1);
    NM_SETTING_CONNECTION_DNS_OVER_TLS_NO = 0;
    NM_SETTING_CONNECTION_DNS_OVER_TLS_OPPORTUNISTIC = 1;
    NM_SETTING_CONNECTION_DNS_OVER_TLS_YES = 2;
;
type

function nm_setting_connection_get_type:TGType;cdecl;external libnm;
function nm_setting_connection_new:PNMSetting;cdecl;external libnm;
function nm_setting_connection_get_id(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_uuid(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_stable_id(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_interface_name(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_connection_type(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_autoconnect(setting:PNMSettingConnection):Tgboolean;cdecl;external libnm;
function nm_setting_connection_get_autoconnect_priority(setting:PNMSettingConnection):longint;cdecl;external libnm;
function nm_setting_connection_get_autoconnect_retries(setting:PNMSettingConnection):longint;cdecl;external libnm;
function nm_setting_connection_get_multi_connect(setting:PNMSettingConnection):TNMConnectionMultiConnect;cdecl;external libnm;
function nm_setting_connection_get_timestamp(setting:PNMSettingConnection):Tguint64;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_44 }
function nm_setting_connection_get_read_only(setting:PNMSettingConnection):Tgboolean;cdecl;external libnm;
function nm_setting_connection_get_num_permissions(setting:PNMSettingConnection):Tguint32;cdecl;external libnm;
function nm_setting_connection_get_permission(setting:PNMSettingConnection; idx:Tguint32; out_ptype:PPchar; out_pitem:PPchar; out_detail:PPchar):Tgboolean;cdecl;external libnm;
function nm_setting_connection_get_zone(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_permissions_user_allowed(setting:PNMSettingConnection; uname:Pchar):Tgboolean;cdecl;external libnm;
function nm_setting_connection_add_permission(setting:PNMSettingConnection; ptype:Pchar; pitem:Pchar; detail:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_connection_remove_permission(setting:PNMSettingConnection; idx:Tguint32);cdecl;external libnm;
function nm_setting_connection_remove_permission_by_value(setting:PNMSettingConnection; ptype:Pchar; pitem:Pchar; detail:Pchar):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_46 }
function nm_setting_connection_get_master(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_controller(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_46 }
function nm_setting_connection_is_slave_type(setting:PNMSettingConnection; _type:Pchar):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_46 }
function nm_setting_connection_get_slave_type(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
function nm_setting_connection_get_port_type(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_46 }
function nm_setting_connection_get_autoconnect_slaves(setting:PNMSettingConnection):TNMSettingConnectionAutoconnectSlaves;cdecl;external libnm;
function nm_setting_connection_get_autoconnect_ports(setting:PNMSettingConnection):TNMTernary;cdecl;external libnm;
function nm_setting_connection_get_num_secondaries(setting:PNMSettingConnection):Tguint32;cdecl;external libnm;
function nm_setting_connection_get_secondary(setting:PNMSettingConnection; idx:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_connection_add_secondary(setting:PNMSettingConnection; sec_uuid:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_connection_remove_secondary(setting:PNMSettingConnection; idx:Tguint32);cdecl;external libnm;
function nm_setting_connection_remove_secondary_by_value(setting:PNMSettingConnection; sec_uuid:Pchar):Tgboolean;cdecl;external libnm;
function nm_setting_connection_get_gateway_ping_timeout(setting:PNMSettingConnection):Tguint32;cdecl;external libnm;
function nm_setting_connection_get_metered(setting:PNMSettingConnection):TNMMetered;cdecl;external libnm;
function nm_setting_connection_get_lldp(setting:PNMSettingConnection):TNMSettingConnectionLldp;cdecl;external libnm;
function nm_setting_connection_get_auth_retries(setting:PNMSettingConnection):longint;cdecl;external libnm;
function nm_setting_connection_get_mdns(setting:PNMSettingConnection):TNMSettingConnectionMdns;cdecl;external libnm;
function nm_setting_connection_get_llmnr(setting:PNMSettingConnection):TNMSettingConnectionLlmnr;cdecl;external libnm;
function nm_setting_connection_get_dns_over_tls(setting:PNMSettingConnection):TNMSettingConnectionDnsOverTls;cdecl;external libnm;
function nm_setting_connection_get_mptcp_flags(setting:PNMSettingConnection):TNMMptcpFlags;cdecl;external libnm;
function nm_setting_connection_get_wait_device_timeout(setting:PNMSettingConnection):Tgint32;cdecl;external libnm;
function nm_setting_connection_get_wait_activation_delay(setting:PNMSettingConnection):Tgint32;cdecl;external libnm;
function nm_setting_connection_get_mud_url(setting:PNMSettingConnection):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_CONNECTION_H__  }

// === Konventiert am: 19-4-26 19:27:42 ===

function NM_TYPE_SETTING_CONNECTION : TGType;
function NM_SETTING_CONNECTION(obj : Pointer) : PNMSettingConnection;
function NM_SETTING_CONNECTION_CLASS(klass : Pointer) : PNMSettingConnectionClass;
function NM_IS_SETTING_CONNECTION(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_CONNECTION_GET_CLASS(obj : Pointer) : PNMSettingConnectionClass;

implementation

function NM_TYPE_SETTING_CONNECTION : TGType;
  begin
    NM_TYPE_SETTING_CONNECTION:=nm_setting_connection_get_type;
  end;

function NM_SETTING_CONNECTION(obj : Pointer) : PNMSettingConnection;
begin
  Result := PNMSettingConnection(g_type_check_instance_cast(obj, NM_TYPE_SETTING_CONNECTION));
end;

function NM_SETTING_CONNECTION_CLASS(klass : Pointer) : PNMSettingConnectionClass;
begin
  Result := PNMSettingConnectionClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_CONNECTION));
end;

function NM_IS_SETTING_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_CONNECTION);
end;

function NM_IS_SETTING_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_CONNECTION);
end;

function NM_SETTING_CONNECTION_GET_CLASS(obj : Pointer) : PNMSettingConnectionClass;
begin
  Result := PNMSettingConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
