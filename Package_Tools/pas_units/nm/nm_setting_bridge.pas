unit nm_setting_bridge;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_BRIDGE_SETTING_NAME = 'bridge';
  NM_SETTING_BRIDGE_MAC_ADDRESS = 'mac-address';
  NM_SETTING_BRIDGE_STP = 'stp';
  NM_SETTING_BRIDGE_PRIORITY = 'priority';
  NM_SETTING_BRIDGE_FORWARD_DELAY = 'forward-delay';
  NM_SETTING_BRIDGE_HELLO_TIME = 'hello-time';
  NM_SETTING_BRIDGE_MAX_AGE = 'max-age';
  NM_SETTING_BRIDGE_AGEING_TIME = 'ageing-time';
  NM_SETTING_BRIDGE_GROUP_FORWARD_MASK = 'group-forward-mask';
  NM_SETTING_BRIDGE_MULTICAST_HASH_MAX = 'multicast-hash-max';
  NM_SETTING_BRIDGE_MULTICAST_LAST_MEMBER_COUNT = 'multicast-last-member-count';
  NM_SETTING_BRIDGE_MULTICAST_LAST_MEMBER_INTERVAL = 'multicast-last-member-interval';
  NM_SETTING_BRIDGE_MULTICAST_MEMBERSHIP_INTERVAL = 'multicast-membership-interval';
  NM_SETTING_BRIDGE_MULTICAST_SNOOPING = 'multicast-snooping';
  NM_SETTING_BRIDGE_MULTICAST_ROUTER = 'multicast-router';
  NM_SETTING_BRIDGE_MULTICAST_QUERIER = 'multicast-querier';
  NM_SETTING_BRIDGE_MULTICAST_QUERIER_INTERVAL = 'multicast-querier-interval';
  NM_SETTING_BRIDGE_MULTICAST_QUERY_INTERVAL = 'multicast-query-interval';
  NM_SETTING_BRIDGE_MULTICAST_QUERY_RESPONSE_INTERVAL = 'multicast-query-response-interval';
  NM_SETTING_BRIDGE_MULTICAST_QUERY_USE_IFADDR = 'multicast-query-use-ifaddr';
  NM_SETTING_BRIDGE_MULTICAST_STARTUP_QUERY_COUNT = 'multicast-startup-query-count';
  NM_SETTING_BRIDGE_MULTICAST_STARTUP_QUERY_INTERVAL = 'multicast-startup-query-interval';
  NM_SETTING_BRIDGE_VLAN_FILTERING = 'vlan-filtering';
  NM_SETTING_BRIDGE_VLAN_DEFAULT_PVID = 'vlan-default-pvid';
  NM_SETTING_BRIDGE_VLANS = 'vlans';
  NM_SETTING_BRIDGE_GROUP_ADDRESS = 'group-address';
  NM_SETTING_BRIDGE_VLAN_PROTOCOL = 'vlan-protocol';
  NM_SETTING_BRIDGE_VLAN_STATS_ENABLED = 'vlan-stats-enabled';
  NM_BRIDGE_VLAN_VID_MIN = 1;
  NM_BRIDGE_VLAN_VID_MAX = 4094;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingBridge = type Pointer;
  PNMSettingBridgeClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_bridge_get_type: TGType; cdecl; external libnm;
function nm_setting_bridge_new: PNMSetting; cdecl; external libnm;
function nm_setting_bridge_get_mac_address(setting: PNMSettingBridge): pchar; cdecl; external libnm;
function nm_setting_bridge_get_stp(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_priority(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
function nm_setting_bridge_get_forward_delay(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
function nm_setting_bridge_get_hello_time(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
function nm_setting_bridge_get_max_age(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
function nm_setting_bridge_get_ageing_time(setting: PNMSettingBridge): Tguint32; cdecl; external libnm;
function nm_setting_bridge_get_group_forward_mask(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
function nm_setting_bridge_get_multicast_snooping(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_vlan_filtering(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_vlan_default_pvid(setting: PNMSettingBridge): Tguint16; cdecl; external libnm;
procedure nm_setting_bridge_add_vlan(setting: PNMSettingBridge; vlan: PNMBridgeVlan); cdecl; external libnm;
function nm_setting_bridge_get_num_vlans(setting: PNMSettingBridge): Tguint; cdecl; external libnm;
function nm_setting_bridge_get_vlan(setting: PNMSettingBridge; idx: Tguint): PNMBridgeVlan; cdecl; external libnm;
procedure nm_setting_bridge_remove_vlan(setting: PNMSettingBridge; idx: Tguint); cdecl; external libnm;
function nm_setting_bridge_remove_vlan_by_vid(setting: PNMSettingBridge; vid_start: Tguint16; vid_end: Tguint16): Tgboolean; cdecl; external libnm;
procedure nm_setting_bridge_clear_vlans(setting: PNMSettingBridge); cdecl; external libnm;
function nm_bridge_vlan_get_type: TGType; cdecl; external libnm;
function nm_bridge_vlan_new(vid_start: Tguint16; vid_end: Tguint16): PNMBridgeVlan; cdecl; external libnm;
function nm_bridge_vlan_ref(vlan: PNMBridgeVlan): PNMBridgeVlan; cdecl; external libnm;
procedure nm_bridge_vlan_unref(vlan: PNMBridgeVlan); cdecl; external libnm;
function nm_bridge_vlan_new_clone(vlan: PNMBridgeVlan): PNMBridgeVlan; cdecl; external libnm;
function nm_bridge_vlan_cmp(a: PNMBridgeVlan; b: PNMBridgeVlan): longint; cdecl; external libnm;
procedure nm_bridge_vlan_seal(vlan: PNMBridgeVlan); cdecl; external libnm;
function nm_bridge_vlan_is_sealed(vlan: PNMBridgeVlan): Tgboolean; cdecl; external libnm;
procedure nm_bridge_vlan_set_untagged(vlan: PNMBridgeVlan; value: Tgboolean); cdecl; external libnm;
procedure nm_bridge_vlan_set_pvid(vlan: PNMBridgeVlan; value: Tgboolean); cdecl; external libnm;
function nm_bridge_vlan_get_vid_range(vlan: PNMBridgeVlan; vid_start: Pguint16; vid_end: Pguint16): Tgboolean; cdecl; external libnm;
function nm_bridge_vlan_is_untagged(vlan: PNMBridgeVlan): Tgboolean; cdecl; external libnm;
function nm_bridge_vlan_is_pvid(vlan: PNMBridgeVlan): Tgboolean; cdecl; external libnm;
function nm_bridge_vlan_to_str(vlan: PNMBridgeVlan; error: PPGError): pchar; cdecl; external libnm;
function nm_bridge_vlan_from_str(str: pchar; error: PPGError): PNMBridgeVlan; cdecl; external libnm;
function nm_setting_bridge_get_group_address(setting: PNMSettingBridge): pchar; cdecl; external libnm;
function nm_setting_bridge_get_vlan_protocol(setting: PNMSettingBridge): pchar; cdecl; external libnm;
function nm_setting_bridge_get_vlan_stats_enabled(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_multicast_router(setting: PNMSettingBridge): pchar; cdecl; external libnm;
function nm_setting_bridge_get_multicast_query_use_ifaddr(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_multicast_querier(setting: PNMSettingBridge): Tgboolean; cdecl; external libnm;
function nm_setting_bridge_get_multicast_hash_max(setting: PNMSettingBridge): Tguint32; cdecl; external libnm;
function nm_setting_bridge_get_multicast_last_member_count(setting: PNMSettingBridge): Tguint32; cdecl; external libnm;
function nm_setting_bridge_get_multicast_last_member_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;
function nm_setting_bridge_get_multicast_membership_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;
function nm_setting_bridge_get_multicast_querier_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;
function nm_setting_bridge_get_multicast_query_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;
function nm_setting_bridge_get_multicast_query_response_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;
function nm_setting_bridge_get_multicast_startup_query_count(setting: PNMSettingBridge): Tguint32; cdecl; external libnm;
function nm_setting_bridge_get_multicast_startup_query_interval(setting: PNMSettingBridge): Tguint64; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:54 ===

function NM_TYPE_SETTING_BRIDGE: TGType;
function NM_SETTING_BRIDGE(obj: Pointer): PNMSettingBridge;
function NM_SETTING_BRIDGE_CLASS(klass: Pointer): PNMSettingBridgeClass;
function NM_IS_SETTING_BRIDGE(obj: Pointer): Tgboolean;
function NM_IS_SETTING_BRIDGE_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_BRIDGE_GET_CLASS(obj: Pointer): PNMSettingBridgeClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_BRIDGE: TGType;
begin
  NM_TYPE_SETTING_BRIDGE := nm_setting_bridge_get_type;
end;

function NM_SETTING_BRIDGE(obj: Pointer): PNMSettingBridge;
begin
  Result := PNMSettingBridge(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BRIDGE));
end;

function NM_SETTING_BRIDGE_CLASS(klass: Pointer): PNMSettingBridgeClass;
begin
  Result := PNMSettingBridgeClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BRIDGE));
end;

function NM_IS_SETTING_BRIDGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_BRIDGE);
end;

function NM_IS_SETTING_BRIDGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_BRIDGE);
end;

function NM_SETTING_BRIDGE_GET_CLASS(obj: Pointer): PNMSettingBridgeClass;
begin
  Result := PNMSettingBridgeClass(PGTypeInstance(obj)^.g_class);
end;



end.
