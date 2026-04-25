

  {$IFDEF read_enum}
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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMActiveConnection = type Pointer;
  PNMActiveConnectionClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_active_connection_get_type: TGType; cdecl; external libnm;
function nm_active_connection_get_connection(connection: PNMActiveConnection): PNMRemoteConnection; cdecl; external libnm;
function nm_active_connection_get_id(connection: PNMActiveConnection): pchar; cdecl; external libnm;
function nm_active_connection_get_uuid(connection: PNMActiveConnection): pchar; cdecl; external libnm;
function nm_active_connection_get_connection_type(connection: PNMActiveConnection): pchar; cdecl; external libnm;
function nm_active_connection_get_specific_object_path(connection: PNMActiveConnection): pchar; cdecl; external libnm;
function nm_active_connection_get_devices(connection: PNMActiveConnection): PGPtrArray; cdecl; external libnm;
function nm_active_connection_get_state(connection: PNMActiveConnection): TNMActiveConnectionState; cdecl; external libnm;
function nm_active_connection_get_state_flags(connection: PNMActiveConnection): TNMActivationStateFlags; cdecl; external libnm;
function nm_active_connection_get_state_reason(connection: PNMActiveConnection): TNMActiveConnectionStateReason; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_function}
function nm_active_connection_get_master(connection: PNMActiveConnection): PNMDevice; cdecl; external libnm; deprecated;
function nm_active_connection_get_controller(connection: PNMActiveConnection): PNMDevice; cdecl; external libnm;
function nm_active_connection_get_default(connection: PNMActiveConnection): Tgboolean; cdecl; external libnm;
function nm_active_connection_get_ip4_config(connection: PNMActiveConnection): PNMIPConfig; cdecl; external libnm;
function nm_active_connection_get_dhcp4_config(connection: PNMActiveConnection): PNMDhcpConfig; cdecl; external libnm;
function nm_active_connection_get_default6(connection: PNMActiveConnection): Tgboolean; cdecl; external libnm;
function nm_active_connection_get_ip6_config(connection: PNMActiveConnection): PNMIPConfig; cdecl; external libnm;
function nm_active_connection_get_dhcp6_config(connection: PNMActiveConnection): PNMDhcpConfig; cdecl; external libnm;
function nm_active_connection_get_vpn(connection: PNMActiveConnection): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:34:36 ===

function NM_TYPE_ACTIVE_CONNECTION: TGType;
function NM_ACTIVE_CONNECTION(obj: Pointer): PNMActiveConnection;
function NM_ACTIVE_CONNECTION_CLASS(klass: Pointer): PNMActiveConnectionClass;
function NM_IS_ACTIVE_CONNECTION(obj: Pointer): Tgboolean;
function NM_IS_ACTIVE_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function NM_ACTIVE_CONNECTION_GET_CLASS(obj: Pointer): PNMActiveConnectionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_ACTIVE_CONNECTION: TGType;
begin
  NM_TYPE_ACTIVE_CONNECTION := nm_active_connection_get_type;
end;

function NM_ACTIVE_CONNECTION(obj: Pointer): PNMActiveConnection;
begin
  Result := PNMActiveConnection(g_type_check_instance_cast(obj, NM_TYPE_ACTIVE_CONNECTION));
end;

function NM_ACTIVE_CONNECTION_CLASS(klass: Pointer): PNMActiveConnectionClass;
begin
  Result := PNMActiveConnectionClass(g_type_check_class_cast(klass, NM_TYPE_ACTIVE_CONNECTION));
end;

function NM_IS_ACTIVE_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_ACTIVE_CONNECTION);
end;

function NM_IS_ACTIVE_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_ACTIVE_CONNECTION);
end;

function NM_ACTIVE_CONNECTION_GET_CLASS(obj: Pointer): PNMActiveConnectionClass;
begin
  Result := PNMActiveConnectionClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
