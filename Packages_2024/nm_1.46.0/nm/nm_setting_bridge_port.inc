

  {$IFDEF read_enum}
const
  NM_SETTING_BRIDGE_PORT_SETTING_NAME = 'bridge-port';
  NM_SETTING_BRIDGE_PORT_PRIORITY = 'priority';
  NM_SETTING_BRIDGE_PORT_PATH_COST = 'path-cost';
  NM_SETTING_BRIDGE_PORT_HAIRPIN_MODE = 'hairpin-mode';
  NM_SETTING_BRIDGE_PORT_VLANS = 'vlans';
  {$ENDIF read_enum}
  {$IFDEF read_struct}
type
  PNMSettingBridgePort = type Pointer;
  PNMSettingBridgePortClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_bridge_port_get_type: TGType; cdecl; external libnm;
function nm_setting_bridge_port_new: PNMSetting; cdecl; external libnm;
function nm_setting_bridge_port_get_priority(setting: PNMSettingBridgePort): Tguint16; cdecl; external libnm;
function nm_setting_bridge_port_get_path_cost(setting: PNMSettingBridgePort): Tguint16; cdecl; external libnm;
function nm_setting_bridge_port_get_hairpin_mode(setting: PNMSettingBridgePort): Tgboolean; cdecl; external libnm;
procedure nm_setting_bridge_port_add_vlan(setting: PNMSettingBridgePort; vlan: PNMBridgeVlan); cdecl; external libnm;
function nm_setting_bridge_port_get_num_vlans(setting: PNMSettingBridgePort): Tguint; cdecl; external libnm;
function nm_setting_bridge_port_get_vlan(setting: PNMSettingBridgePort; idx: Tguint): PNMBridgeVlan; cdecl; external libnm;
procedure nm_setting_bridge_port_remove_vlan(setting: PNMSettingBridgePort; idx: Tguint); cdecl; external libnm;
function nm_setting_bridge_port_remove_vlan_by_vid(setting: PNMSettingBridgePort; vid_start: Tguint16; vid_end: Tguint16): Tgboolean; cdecl; external libnm;
procedure nm_setting_bridge_port_clear_vlans(setting: PNMSettingBridgePort); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:52 ===

function NM_TYPE_SETTING_BRIDGE_PORT: TGType;
function NM_SETTING_BRIDGE_PORT(obj: Pointer): PNMSettingBridgePort;
function NM_SETTING_BRIDGE_PORT_CLASS(klass: Pointer): PNMSettingBridgePortClass;
function NM_IS_SETTING_BRIDGE_PORT(obj: Pointer): Tgboolean;
function NM_IS_SETTING_BRIDGE_PORT_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_BRIDGE_PORT_GET_CLASS(obj: Pointer): PNMSettingBridgePortClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_BRIDGE_PORT: TGType;
begin
  NM_TYPE_SETTING_BRIDGE_PORT := nm_setting_bridge_port_get_type;
end;

function NM_SETTING_BRIDGE_PORT(obj: Pointer): PNMSettingBridgePort;
begin
  Result := PNMSettingBridgePort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BRIDGE_PORT));
end;

function NM_SETTING_BRIDGE_PORT_CLASS(klass: Pointer): PNMSettingBridgePortClass;
begin
  Result := PNMSettingBridgePortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BRIDGE_PORT));
end;

function NM_IS_SETTING_BRIDGE_PORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_BRIDGE_PORT);
end;

function NM_IS_SETTING_BRIDGE_PORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_BRIDGE_PORT);
end;

function NM_SETTING_BRIDGE_PORT_GET_CLASS(obj: Pointer): PNMSettingBridgePortClass;
begin
  Result := PNMSettingBridgePortClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
