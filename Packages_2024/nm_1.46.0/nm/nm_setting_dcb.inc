
  {$IFDEF read_enum}
const
  NM_SETTING_DCB_SETTING_NAME = 'dcb';

type
  PNMSettingDcbFlags = ^TNMSettingDcbFlags;
  TNMSettingDcbFlags = longint;

const
  NM_SETTING_DCB_FLAG_NONE = $00000000;
  NM_SETTING_DCB_FLAG_ENABLE = $00000001;
  NM_SETTING_DCB_FLAG_ADVERTISE = $00000002;
  NM_SETTING_DCB_FLAG_WILLING = $00000004;

const
  NM_SETTING_DCB_FCOE_MODE_FABRIC = 'fabric';
  NM_SETTING_DCB_FCOE_MODE_VN2VN = 'vn2vn';
  NM_SETTING_DCB_APP_FCOE_FLAGS = 'app-fcoe-flags';
  NM_SETTING_DCB_APP_FCOE_PRIORITY = 'app-fcoe-priority';
  NM_SETTING_DCB_APP_FCOE_MODE = 'app-fcoe-mode';
  NM_SETTING_DCB_APP_ISCSI_FLAGS = 'app-iscsi-flags';
  NM_SETTING_DCB_APP_ISCSI_PRIORITY = 'app-iscsi-priority';
  NM_SETTING_DCB_APP_FIP_FLAGS = 'app-fip-flags';
  NM_SETTING_DCB_APP_FIP_PRIORITY = 'app-fip-priority';
  NM_SETTING_DCB_PRIORITY_FLOW_CONTROL_FLAGS = 'priority-flow-control-flags';
  NM_SETTING_DCB_PRIORITY_FLOW_CONTROL = 'priority-flow-control';
  NM_SETTING_DCB_PRIORITY_GROUP_FLAGS = 'priority-group-flags';
  NM_SETTING_DCB_PRIORITY_GROUP_ID = 'priority-group-id';
  NM_SETTING_DCB_PRIORITY_GROUP_BANDWIDTH = 'priority-group-bandwidth';
  NM_SETTING_DCB_PRIORITY_BANDWIDTH = 'priority-bandwidth';
  NM_SETTING_DCB_PRIORITY_STRICT_BANDWIDTH = 'priority-strict-bandwidth';
  NM_SETTING_DCB_PRIORITY_TRAFFIC_CLASS = 'priority-traffic-class';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingDcb = type Pointer;
  PNMSettingDcbClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_dcb_get_type: TGType; cdecl; external libnm;
function nm_setting_dcb_new: PNMSetting; cdecl; external libnm;
function nm_setting_dcb_get_app_fcoe_flags(setting: PNMSettingDcb): TNMSettingDcbFlags; cdecl; external libnm;
function nm_setting_dcb_get_app_fcoe_priority(setting: PNMSettingDcb): longint; cdecl; external libnm;
function nm_setting_dcb_get_app_fcoe_mode(setting: PNMSettingDcb): pchar; cdecl; external libnm;
function nm_setting_dcb_get_app_iscsi_flags(setting: PNMSettingDcb): TNMSettingDcbFlags; cdecl; external libnm;
function nm_setting_dcb_get_app_iscsi_priority(setting: PNMSettingDcb): longint; cdecl; external libnm;
function nm_setting_dcb_get_app_fip_flags(setting: PNMSettingDcb): TNMSettingDcbFlags; cdecl; external libnm;
function nm_setting_dcb_get_app_fip_priority(setting: PNMSettingDcb): longint; cdecl; external libnm;

function nm_setting_dcb_get_priority_flow_control_flags(setting: PNMSettingDcb): TNMSettingDcbFlags; cdecl; external libnm;
function nm_setting_dcb_get_priority_flow_control(setting: PNMSettingDcb; user_priority: Tguint): Tgboolean; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_flow_control(setting: PNMSettingDcb; user_priority: Tguint; enabled: Tgboolean); cdecl; external libnm;

function nm_setting_dcb_get_priority_group_flags(setting: PNMSettingDcb): TNMSettingDcbFlags; cdecl; external libnm;
function nm_setting_dcb_get_priority_group_id(setting: PNMSettingDcb; user_priority: Tguint): Tguint; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_group_id(setting: PNMSettingDcb; user_priority: Tguint; group_id: Tguint); cdecl; external libnm;
function nm_setting_dcb_get_priority_group_bandwidth(setting: PNMSettingDcb; group_id: Tguint): Tguint; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_group_bandwidth(setting: PNMSettingDcb; group_id: Tguint; bandwidth_percent: Tguint); cdecl; external libnm;
function nm_setting_dcb_get_priority_bandwidth(setting: PNMSettingDcb; user_priority: Tguint): Tguint; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_bandwidth(setting: PNMSettingDcb; user_priority: Tguint; bandwidth_percent: Tguint); cdecl; external libnm;
function nm_setting_dcb_get_priority_strict_bandwidth(setting: PNMSettingDcb; user_priority: Tguint): Tgboolean; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_strict_bandwidth(setting: PNMSettingDcb; user_priority: Tguint; strict: Tgboolean); cdecl; external libnm;
function nm_setting_dcb_get_priority_traffic_class(setting: PNMSettingDcb; user_priority: Tguint): Tguint; cdecl; external libnm;
procedure nm_setting_dcb_set_priority_traffic_class(setting: PNMSettingDcb; user_priority: Tguint; traffic_class: Tguint); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:27:38 ===

function NM_TYPE_SETTING_DCB: TGType;
function NM_SETTING_DCB(obj: Pointer): PNMSettingDcb;
function NM_SETTING_DCB_CLASS(klass: Pointer): PNMSettingDcbClass;
function NM_IS_SETTING_DCB(obj: Pointer): Tgboolean;
function NM_IS_SETTING_DCB_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_DCB_GET_CLASS(obj: Pointer): PNMSettingDcbClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_DCB: TGType;
begin
  NM_TYPE_SETTING_DCB := nm_setting_dcb_get_type;
end;

function NM_SETTING_DCB(obj: Pointer): PNMSettingDcb;
begin
  Result := PNMSettingDcb(g_type_check_instance_cast(obj, NM_TYPE_SETTING_DCB));
end;

function NM_SETTING_DCB_CLASS(klass: Pointer): PNMSettingDcbClass;
begin
  Result := PNMSettingDcbClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_DCB));
end;

function NM_IS_SETTING_DCB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_DCB);
end;

function NM_IS_SETTING_DCB_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_DCB);
end;

function NM_SETTING_DCB_GET_CLASS(obj: Pointer): PNMSettingDcbClass;
begin
  Result := PNMSettingDcbClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
