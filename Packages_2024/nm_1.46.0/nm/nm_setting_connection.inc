

  {$IFDEF read_enum}
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

type
  PNMSettingConnectionAutoconnectSlaves = ^TNMSettingConnectionAutoconnectSlaves;
  TNMSettingConnectionAutoconnectSlaves = longint;

const
  NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_DEFAULT = -(1);
  NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_NO = 0;
  NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_YES = 1;

type
  PNMSettingConnectionLldp = ^TNMSettingConnectionLldp;
  TNMSettingConnectionLldp = longint;

const
  NM_SETTING_CONNECTION_LLDP_DEFAULT = -(1);
  NM_SETTING_CONNECTION_LLDP_DISABLE = 0;
  NM_SETTING_CONNECTION_LLDP_ENABLE_RX = 1;

type
  PNMSettingConnectionMdns = ^TNMSettingConnectionMdns;
  TNMSettingConnectionMdns = longint;

const
  NM_SETTING_CONNECTION_MDNS_DEFAULT = -(1);
  NM_SETTING_CONNECTION_MDNS_NO = 0;
  NM_SETTING_CONNECTION_MDNS_RESOLVE = 1;
  NM_SETTING_CONNECTION_MDNS_YES = 2;

type
  PNMSettingConnectionLlmnr = ^TNMSettingConnectionLlmnr;
  TNMSettingConnectionLlmnr = longint;

const
  NM_SETTING_CONNECTION_LLMNR_DEFAULT = -(1);
  NM_SETTING_CONNECTION_LLMNR_NO = 0;
  NM_SETTING_CONNECTION_LLMNR_RESOLVE = 1;
  NM_SETTING_CONNECTION_LLMNR_YES = 2;

type
  PNMSettingConnectionDnsOverTls = ^TNMSettingConnectionDnsOverTls;
  TNMSettingConnectionDnsOverTls = longint;

const
  NM_SETTING_CONNECTION_DNS_OVER_TLS_DEFAULT = -(1);
  NM_SETTING_CONNECTION_DNS_OVER_TLS_NO = 0;
  NM_SETTING_CONNECTION_DNS_OVER_TLS_OPPORTUNISTIC = 1;
  NM_SETTING_CONNECTION_DNS_OVER_TLS_YES = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingConnection = type Pointer;
  PNMSettingConnectionClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_connection_get_type: TGType; cdecl; external libnm;
function nm_setting_connection_new: PNMSetting; cdecl; external libnm;
function nm_setting_connection_get_id(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_uuid(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_stable_id(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_interface_name(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_connection_type(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_autoconnect(setting: PNMSettingConnection): Tgboolean; cdecl; external libnm;
function nm_setting_connection_get_autoconnect_priority(setting: PNMSettingConnection): longint; cdecl; external libnm;
function nm_setting_connection_get_autoconnect_retries(setting: PNMSettingConnection): longint; cdecl; external libnm;
function nm_setting_connection_get_multi_connect(setting: PNMSettingConnection): TNMConnectionMultiConnect; cdecl; external libnm;
function nm_setting_connection_get_timestamp(setting: PNMSettingConnection): Tguint64; cdecl; external libnm;
function nm_setting_connection_get_read_only(setting: PNMSettingConnection): Tgboolean; cdecl; external libnm; deprecated;
function nm_setting_connection_get_num_permissions(setting: PNMSettingConnection): Tguint32; cdecl; external libnm;
function nm_setting_connection_get_permission(setting: PNMSettingConnection; idx: Tguint32; out_ptype: PPchar; out_pitem: PPchar; out_detail: PPchar): Tgboolean; cdecl; external libnm;
function nm_setting_connection_get_zone(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_permissions_user_allowed(setting: PNMSettingConnection; uname: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_connection_add_permission(setting: PNMSettingConnection; ptype: pchar; pitem: pchar; detail: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_connection_remove_permission(setting: PNMSettingConnection; idx: Tguint32); cdecl; external libnm;
function nm_setting_connection_remove_permission_by_value(setting: PNMSettingConnection; ptype: pchar; pitem: pchar; detail: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_connection_get_master(setting: PNMSettingConnection): pchar; cdecl; external libnm; deprecated;
function nm_setting_connection_get_controller(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_is_slave_type(setting: PNMSettingConnection; _type: pchar): Tgboolean; cdecl; external libnm; deprecated;
function nm_setting_connection_get_slave_type(setting: PNMSettingConnection): pchar; cdecl; external libnm; deprecated;
function nm_setting_connection_get_port_type(setting: PNMSettingConnection): pchar; cdecl; external libnm;
function nm_setting_connection_get_autoconnect_slaves(setting: PNMSettingConnection): TNMSettingConnectionAutoconnectSlaves; cdecl; external libnm; deprecated;
function nm_setting_connection_get_autoconnect_ports(setting: PNMSettingConnection): TNMTernary; cdecl; external libnm;
function nm_setting_connection_get_num_secondaries(setting: PNMSettingConnection): Tguint32; cdecl; external libnm;
function nm_setting_connection_get_secondary(setting: PNMSettingConnection; idx: Tguint32): pchar; cdecl; external libnm;
function nm_setting_connection_add_secondary(setting: PNMSettingConnection; sec_uuid: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_connection_remove_secondary(setting: PNMSettingConnection; idx: Tguint32); cdecl; external libnm;
function nm_setting_connection_remove_secondary_by_value(setting: PNMSettingConnection; sec_uuid: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_connection_get_gateway_ping_timeout(setting: PNMSettingConnection): Tguint32; cdecl; external libnm;
function nm_setting_connection_get_metered(setting: PNMSettingConnection): TNMMetered; cdecl; external libnm;
function nm_setting_connection_get_lldp(setting: PNMSettingConnection): TNMSettingConnectionLldp; cdecl; external libnm;
function nm_setting_connection_get_auth_retries(setting: PNMSettingConnection): longint; cdecl; external libnm;
function nm_setting_connection_get_mdns(setting: PNMSettingConnection): TNMSettingConnectionMdns; cdecl; external libnm;
function nm_setting_connection_get_llmnr(setting: PNMSettingConnection): TNMSettingConnectionLlmnr; cdecl; external libnm;
function nm_setting_connection_get_dns_over_tls(setting: PNMSettingConnection): TNMSettingConnectionDnsOverTls; cdecl; external libnm;
function nm_setting_connection_get_mptcp_flags(setting: PNMSettingConnection): TNMMptcpFlags; cdecl; external libnm;
function nm_setting_connection_get_wait_device_timeout(setting: PNMSettingConnection): Tgint32; cdecl; external libnm;
function nm_setting_connection_get_wait_activation_delay(setting: PNMSettingConnection): Tgint32; cdecl; external libnm;
function nm_setting_connection_get_mud_url(setting: PNMSettingConnection): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:42 ===

function NM_TYPE_SETTING_CONNECTION: TGType;
function NM_SETTING_CONNECTION(obj: Pointer): PNMSettingConnection;
function NM_SETTING_CONNECTION_CLASS(klass: Pointer): PNMSettingConnectionClass;
function NM_IS_SETTING_CONNECTION(obj: Pointer): Tgboolean;
function NM_IS_SETTING_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_CONNECTION_GET_CLASS(obj: Pointer): PNMSettingConnectionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_CONNECTION: TGType;
begin
  NM_TYPE_SETTING_CONNECTION := nm_setting_connection_get_type;
end;

function NM_SETTING_CONNECTION(obj: Pointer): PNMSettingConnection;
begin
  Result := PNMSettingConnection(g_type_check_instance_cast(obj, NM_TYPE_SETTING_CONNECTION));
end;

function NM_SETTING_CONNECTION_CLASS(klass: Pointer): PNMSettingConnectionClass;
begin
  Result := PNMSettingConnectionClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_CONNECTION));
end;

function NM_IS_SETTING_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_CONNECTION);
end;

function NM_IS_SETTING_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_CONNECTION);
end;

function NM_SETTING_CONNECTION_GET_CLASS(obj: Pointer): PNMSettingConnectionClass;
begin
  Result := PNMSettingConnectionClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
