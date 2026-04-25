

  {$IFDEF read_enum}
const
  NM_SETTING_OVS_BRIDGE_SETTING_NAME = 'ovs-bridge';
  NM_SETTING_OVS_BRIDGE_FAIL_MODE = 'fail-mode';
  NM_SETTING_OVS_BRIDGE_MCAST_SNOOPING_ENABLE = 'mcast-snooping-enable';
  NM_SETTING_OVS_BRIDGE_RSTP_ENABLE = 'rstp-enable';
  NM_SETTING_OVS_BRIDGE_STP_ENABLE = 'stp-enable';
  NM_SETTING_OVS_BRIDGE_DATAPATH_TYPE = 'datapath-type';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingOvsBridge = type Pointer;
  PNMSettingOvsBridgeClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ovs_bridge_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_bridge_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_bridge_get_fail_mode(self: PNMSettingOvsBridge): pchar; cdecl; external libnm;
function nm_setting_ovs_bridge_get_mcast_snooping_enable(self: PNMSettingOvsBridge): Tgboolean; cdecl; external libnm;
function nm_setting_ovs_bridge_get_rstp_enable(self: PNMSettingOvsBridge): Tgboolean; cdecl; external libnm;
function nm_setting_ovs_bridge_get_stp_enable(self: PNMSettingOvsBridge): Tgboolean; cdecl; external libnm;
function nm_setting_ovs_bridge_get_datapath_type(self: PNMSettingOvsBridge): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:01 ===

function NM_TYPE_SETTING_OVS_BRIDGE: TGType;
function NM_SETTING_OVS_BRIDGE(obj: Pointer): PNMSettingOvsBridge;
function NM_SETTING_OVS_BRIDGE_CLASS(klass: Pointer): PNMSettingOvsBridgeClass;
function NM_IS_SETTING_OVS_BRIDGE(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj: Pointer): PNMSettingOvsBridgeClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_OVS_BRIDGE: TGType;
begin
  NM_TYPE_SETTING_OVS_BRIDGE := nm_setting_ovs_bridge_get_type;
end;

function NM_SETTING_OVS_BRIDGE(obj: Pointer): PNMSettingOvsBridge;
begin
  Result := PNMSettingOvsBridge(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_BRIDGE));
end;

function NM_SETTING_OVS_BRIDGE_CLASS(klass: Pointer): PNMSettingOvsBridgeClass;
begin
  Result := PNMSettingOvsBridgeClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_BRIDGE));
end;

function NM_IS_SETTING_OVS_BRIDGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_BRIDGE);
end;

function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_BRIDGE);
end;

function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj: Pointer): PNMSettingOvsBridgeClass;
begin
  Result := PNMSettingOvsBridgeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
