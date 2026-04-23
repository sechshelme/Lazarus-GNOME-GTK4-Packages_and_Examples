unit nm_setting_vxlan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_VXLAN_SETTING_NAME = 'vxlan';
  NM_SETTING_VXLAN_PARENT = 'parent';
  NM_SETTING_VXLAN_ID = 'id';
  NM_SETTING_VXLAN_LOCAL = 'local';
  NM_SETTING_VXLAN_REMOTE = 'remote';
  NM_SETTING_VXLAN_SOURCE_PORT_MIN = 'source-port-min';
  NM_SETTING_VXLAN_SOURCE_PORT_MAX = 'source-port-max';
  NM_SETTING_VXLAN_DESTINATION_PORT = 'destination-port';
  NM_SETTING_VXLAN_TOS = 'tos';
  NM_SETTING_VXLAN_TTL = 'ttl';
  NM_SETTING_VXLAN_AGEING = 'ageing';
  NM_SETTING_VXLAN_LIMIT = 'limit';
  NM_SETTING_VXLAN_PROXY = 'proxy';
  NM_SETTING_VXLAN_LEARNING = 'learning';
  NM_SETTING_VXLAN_RSC = 'rsc';
  NM_SETTING_VXLAN_L2_MISS = 'l2-miss';
  NM_SETTING_VXLAN_L3_MISS = 'l3-miss';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingVxlan = type Pointer;
  PNMSettingVxlanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_vxlan_get_type: TGType; cdecl; external libnm;
function nm_setting_vxlan_new: PNMSetting; cdecl; external libnm;
function nm_setting_vxlan_get_parent(setting: PNMSettingVxlan): pchar; cdecl; external libnm;
function nm_setting_vxlan_get_id(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_local(setting: PNMSettingVxlan): pchar; cdecl; external libnm;
function nm_setting_vxlan_get_remote(setting: PNMSettingVxlan): pchar; cdecl; external libnm;
function nm_setting_vxlan_get_source_port_min(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_source_port_max(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_destination_port(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_tos(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_ttl(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_ageing(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_limit(setting: PNMSettingVxlan): Tguint; cdecl; external libnm;
function nm_setting_vxlan_get_proxy(setting: PNMSettingVxlan): Tgboolean; cdecl; external libnm;
function nm_setting_vxlan_get_learning(setting: PNMSettingVxlan): Tgboolean; cdecl; external libnm;
function nm_setting_vxlan_get_rsc(setting: PNMSettingVxlan): Tgboolean; cdecl; external libnm;
function nm_setting_vxlan_get_l2_miss(setting: PNMSettingVxlan): Tgboolean; cdecl; external libnm;
function nm_setting_vxlan_get_l3_miss(setting: PNMSettingVxlan): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:21:29 ===

function NM_TYPE_SETTING_VXLAN: TGType;
function NM_SETTING_VXLAN(obj: Pointer): PNMSettingVxlan;
function NM_SETTING_VXLAN_CLASS(klass: Pointer): PNMSettingVxlanClass;
function NM_IS_SETTING_VXLAN(obj: Pointer): Tgboolean;
function NM_IS_SETTING_VXLAN_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_VXLAN_GET_CLASS(obj: Pointer): PNMSettingVxlanClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_VXLAN: TGType;
begin
  NM_TYPE_SETTING_VXLAN := nm_setting_vxlan_get_type;
end;

function NM_SETTING_VXLAN(obj: Pointer): PNMSettingVxlan;
begin
  Result := PNMSettingVxlan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VXLAN));
end;

function NM_SETTING_VXLAN_CLASS(klass: Pointer): PNMSettingVxlanClass;
begin
  Result := PNMSettingVxlanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VXLAN));
end;

function NM_IS_SETTING_VXLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_VXLAN);
end;

function NM_IS_SETTING_VXLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_VXLAN);
end;

function NM_SETTING_VXLAN_GET_CLASS(obj: Pointer): PNMSettingVxlanClass;
begin
  Result := PNMSettingVxlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
