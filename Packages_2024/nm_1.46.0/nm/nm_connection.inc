

  {$IFDEF read_enum}
const
  NM_CONNECTION_SECRETS_UPDATED = 'secrets-updated';
  NM_CONNECTION_SECRETS_CLEARED = 'secrets-cleared';
  NM_CONNECTION_CHANGED = 'changed';
  NM_CONNECTION_NORMALIZE_PARAM_IP4_CONFIG_METHOD = 'ip4-config-method';
  NM_CONNECTION_NORMALIZE_PARAM_IP6_CONFIG_METHOD = 'ip6-config-method';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMConnection = type Pointer;
  PNMConnectionClass = type Pointer;

  TNMConnectionInterface = record
    parent: TGTypeInterface;
    secrets_updated: procedure(connection: PNMConnection; setting: pchar); cdecl;
    secrets_cleared: procedure(connection: PNMConnection); cdecl;
    changed: procedure(connection: PNMConnection); cdecl;
  end;
  PNMConnectionInterface = ^TNMConnectionInterface;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_connection_get_type: TGType; cdecl; external libnm;
procedure nm_connection_add_setting(connection: PNMConnection; setting: PNMSetting); cdecl; external libnm;
procedure nm_connection_remove_setting(connection: PNMConnection; setting_type: TGType); cdecl; external libnm;
function nm_connection_get_setting(connection: PNMConnection; setting_type: TGType): PNMSetting; cdecl; external libnm;
function nm_connection_get_setting_by_name(connection: PNMConnection; name: pchar): PNMSetting; cdecl; external libnm;

function NM_VARIANT_TYPE_CONNECTION: PGVariantType;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_VARIANT_TYPE_SETTING : pchar = 'a{sv}' + '';

type
  PNMConnectionSerializationFlags = ^TNMConnectionSerializationFlags;
  TNMConnectionSerializationFlags = longint;

const
  NM_CONNECTION_SERIALIZE_ALL = $00000000;
  NM_CONNECTION_SERIALIZE_WITH_NON_SECRET = $00000001;
  NM_CONNECTION_SERIALIZE_NO_SECRETS = $00000001;
  NM_CONNECTION_SERIALIZE_WITH_SECRETS = $00000002;
  NM_CONNECTION_SERIALIZE_ONLY_SECRETS = $00000002;
  NM_CONNECTION_SERIALIZE_WITH_SECRETS_AGENT_OWNED = $00000004;
  NM_CONNECTION_SERIALIZE_WITH_SECRETS_SYSTEM_OWNED = $00000008;
  NM_CONNECTION_SERIALIZE_WITH_SECRETS_NOT_SAVED = $00000010;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_connection_to_dbus(connection: PNMConnection; flags: TNMConnectionSerializationFlags): PGVariant; cdecl; external libnm;
function nm_connection_replace_settings(connection: PNMConnection; new_settings: PGVariant; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_connection_replace_settings_from_connection(connection: PNMConnection; new_connection: PNMConnection); cdecl; external libnm;
procedure nm_connection_clear_settings(connection: PNMConnection); cdecl; external libnm;
function nm_connection_compare(a: PNMConnection; b: PNMConnection; flags: TNMSettingCompareFlags): Tgboolean; cdecl; external libnm;
function nm_connection_diff(a: PNMConnection; b: PNMConnection; flags: TNMSettingCompareFlags; out_settings: PPGHashTable): Tgboolean; cdecl; external libnm;
function nm_connection_verify(connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_connection_verify_secrets(connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_connection_normalize(connection: PNMConnection; parameters: PGHashTable; modified: Pgboolean; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_connection_need_secrets(connection: PNMConnection; hints: PPGPtrArray): pchar; cdecl; external libnm;
procedure nm_connection_clear_secrets(connection: PNMConnection); cdecl; external libnm;
procedure nm_connection_clear_secrets_with_flags(connection: PNMConnection; func: TNMSettingClearSecretsWithFlagsFn; user_data: Tgpointer); cdecl; external libnm;
function nm_connection_update_secrets(connection: PNMConnection; setting_name: pchar; secrets: PGVariant; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_connection_set_path(connection: PNMConnection; path: pchar); cdecl; external libnm;
function nm_connection_get_path(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_get_interface_name(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_is_type(connection: PNMConnection; _type: pchar): Tgboolean; cdecl; external libnm;
procedure nm_connection_for_each_setting_value(connection: PNMConnection; func: TNMSettingValueIterFn; user_data: Tgpointer); cdecl; external libnm;
function nm_connection_get_settings(connection: PNMConnection; out_length: Pguint): PPNMSetting; cdecl; external libnm;
procedure nm_connection_dump(connection: PNMConnection); cdecl; external libnm;

function nm_connection_get_uuid(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_get_id(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_get_connection_type(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_is_virtual(connection: PNMConnection): Tgboolean; cdecl; external libnm;
function nm_connection_get_virtual_device_description(connection: PNMConnection): pchar; cdecl; external libnm;
function nm_connection_get_setting_802_1x(connection: PNMConnection): PNMSetting8021x; cdecl; external libnm;
function nm_connection_get_setting_bluetooth(connection: PNMConnection): PNMSettingBluetooth; cdecl; external libnm;
function nm_connection_get_setting_bond(connection: PNMConnection): PNMSettingBond; cdecl; external libnm;
function nm_connection_get_setting_team(connection: PNMConnection): PNMSettingTeam; cdecl; external libnm;
function nm_connection_get_setting_team_port(connection: PNMConnection): PNMSettingTeamPort; cdecl; external libnm;
function nm_connection_get_setting_bridge(connection: PNMConnection): PNMSettingBridge; cdecl; external libnm;
function nm_connection_get_setting_bridge_port(connection: PNMConnection): PNMSettingBridgePort; cdecl; external libnm;
function nm_connection_get_setting_cdma(connection: PNMConnection): PNMSettingCdma; cdecl; external libnm;
function nm_connection_get_setting_connection(connection: PNMConnection): PNMSettingConnection; cdecl; external libnm;
function nm_connection_get_setting_dcb(connection: PNMConnection): PNMSettingDcb; cdecl; external libnm;
function nm_connection_get_setting_dummy(connection: PNMConnection): PNMSettingDummy; cdecl; external libnm;
function nm_connection_get_setting_generic(connection: PNMConnection): PNMSettingGeneric; cdecl; external libnm;
function nm_connection_get_setting_gsm(connection: PNMConnection): PNMSettingGsm; cdecl; external libnm;
function nm_connection_get_setting_infiniband(connection: PNMConnection): PNMSettingInfiniband; cdecl; external libnm;
function nm_connection_get_setting_ip_tunnel(connection: PNMConnection): PNMSettingIPTunnel; cdecl; external libnm;
function nm_connection_get_setting_ip4_config(connection: PNMConnection): PNMSettingIPConfig; cdecl; external libnm;
function nm_connection_get_setting_ip6_config(connection: PNMConnection): PNMSettingIPConfig; cdecl; external libnm;
function nm_connection_get_setting_macsec(connection: PNMConnection): PNMSettingMacsec; cdecl; external libnm;
function nm_connection_get_setting_macvlan(connection: PNMConnection): PNMSettingMacvlan; cdecl; external libnm;
function nm_connection_get_setting_olpc_mesh(connection: PNMConnection): PNMSettingOlpcMesh; cdecl; external libnm;
function nm_connection_get_setting_ovs_bridge(connection: PNMConnection): PNMSettingOvsBridge; cdecl; external libnm;
function nm_connection_get_setting_ovs_interface(connection: PNMConnection): PNMSettingOvsInterface; cdecl; external libnm;
function nm_connection_get_setting_ovs_patch(connection: PNMConnection): PNMSettingOvsPatch; cdecl; external libnm;
function nm_connection_get_setting_ovs_port(connection: PNMConnection): PNMSettingOvsPort; cdecl; external libnm;
function nm_connection_get_setting_ppp(connection: PNMConnection): PNMSettingPpp; cdecl; external libnm;
function nm_connection_get_setting_pppoe(connection: PNMConnection): PNMSettingPppoe; cdecl; external libnm;
function nm_connection_get_setting_proxy(connection: PNMConnection): PNMSettingProxy; cdecl; external libnm;
function nm_connection_get_setting_serial(connection: PNMConnection): PNMSettingSerial; cdecl; external libnm;
function nm_connection_get_setting_tc_config(connection: PNMConnection): PNMSettingTCConfig; cdecl; external libnm;
function nm_connection_get_setting_tun(connection: PNMConnection): PNMSettingTun; cdecl; external libnm;
function nm_connection_get_setting_vpn(connection: PNMConnection): PNMSettingVpn; cdecl; external libnm;
function nm_connection_get_setting_wimax(connection: PNMConnection): PNMSettingWimax; cdecl; external libnm;
function nm_connection_get_setting_adsl(connection: PNMConnection): PNMSettingAdsl; cdecl; external libnm;
function nm_connection_get_setting_wired(connection: PNMConnection): PNMSettingWired; cdecl; external libnm;
function nm_connection_get_setting_wireless(connection: PNMConnection): PNMSettingWireless; cdecl; external libnm;
function nm_connection_get_setting_wireless_security(connection: PNMConnection): PNMSettingWirelessSecurity; cdecl; external libnm;
function nm_connection_get_setting_vlan(connection: PNMConnection): PNMSettingVlan; cdecl; external libnm;
function nm_connection_get_setting_vxlan(connection: PNMConnection): PNMSettingVxlan; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:33:20 ===

function NM_TYPE_CONNECTION: TGType;
function NM_CONNECTION(obj: Pointer): PNMConnection;
function NM_IS_CONNECTION(obj: Pointer): Tgboolean;
function NM_CONNECTION_GET_INTERFACE(obj: Pointer): PNMConnectionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_CONNECTION: TGType;
begin
  NM_TYPE_CONNECTION := nm_connection_get_type;
end;

function NM_CONNECTION(obj: Pointer): PNMConnection;
begin
  Result := PNMConnection(g_type_check_instance_cast(obj, NM_TYPE_CONNECTION));
end;

function NM_IS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_CONNECTION);
end;

function NM_CONNECTION_GET_INTERFACE(obj: Pointer): PNMConnectionClass;
begin
  Result := g_type_interface_peek(obj, NM_TYPE_CONNECTION);
end;


function NM_VARIANT_TYPE_CONNECTION: PGVariantType;
begin
  NM_VARIANT_TYPE_CONNECTION := G_VARIANT_TYPE('a{sa{sv}}');
end;


{$ENDIF read_implementation}
