unit nm_setting_vlan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_VLAN_SETTING_NAME = 'vlan';
  NM_SETTING_VLAN_PARENT = 'parent';
  NM_SETTING_VLAN_ID = 'id';
  NM_SETTING_VLAN_FLAGS = 'flags';
  NM_SETTING_VLAN_PROTOCOL = 'protocol';
  NM_SETTING_VLAN_INGRESS_PRIORITY_MAP = 'ingress-priority-map';
  NM_SETTING_VLAN_EGRESS_PRIORITY_MAP = 'egress-priority-map';

type
  PNMVlanPriorityMap = ^TNMVlanPriorityMap;
  TNMVlanPriorityMap = longint;

const
  NM_VLAN_INGRESS_MAP = 0;
  NM_VLAN_EGRESS_MAP = 1;

type
  PNMVlanFlags = ^TNMVlanFlags;
  TNMVlanFlags = longint;

const
  NM_VLAN_FLAG_REORDER_HEADERS = $1;
  NM_VLAN_FLAG_GVRP = $2;
  NM_VLAN_FLAG_LOOSE_BINDING = $4;
  NM_VLAN_FLAG_MVRP = $8;

const
  NM_VLAN_FLAGS_ALL = ((NM_VLAN_FLAG_REORDER_HEADERS or NM_VLAN_FLAG_GVRP) or NM_VLAN_FLAG_LOOSE_BINDING) or NM_VLAN_FLAG_MVRP;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingVlan = type Pointer;
  PNMSettingVlanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_vlan_get_type: TGType; cdecl; external libnm;
function nm_setting_vlan_new: PNMSetting; cdecl; external libnm;
function nm_setting_vlan_get_parent(setting: PNMSettingVlan): pchar; cdecl; external libnm;
function nm_setting_vlan_get_id(setting: PNMSettingVlan): Tguint32; cdecl; external libnm;
function nm_setting_vlan_get_flags(setting: PNMSettingVlan): Tguint32; cdecl; external libnm;
function nm_setting_vlan_get_protocol(setting: PNMSettingVlan): pchar; cdecl; external libnm;
function nm_setting_vlan_get_num_priorities(setting: PNMSettingVlan; map: TNMVlanPriorityMap): Tgint32; cdecl; external libnm;
function nm_setting_vlan_get_priority(setting: PNMSettingVlan; map: TNMVlanPriorityMap; idx: Tguint32; out_from: Pguint32; out_to: Pguint32): Tgboolean; cdecl; external libnm;
function nm_setting_vlan_add_priority(setting: PNMSettingVlan; map: TNMVlanPriorityMap; from: Tguint32; to_: Tguint32): Tgboolean; cdecl; external libnm;
procedure nm_setting_vlan_remove_priority(setting: PNMSettingVlan; map: TNMVlanPriorityMap; idx: Tguint32); cdecl; external libnm;
function nm_setting_vlan_remove_priority_by_value(setting: PNMSettingVlan; map: TNMVlanPriorityMap; from: Tguint32; to_: Tguint32): Tgboolean; cdecl; external libnm;
function nm_setting_vlan_remove_priority_str_by_value(setting: PNMSettingVlan; map: TNMVlanPriorityMap; str: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_vlan_clear_priorities(setting: PNMSettingVlan; map: TNMVlanPriorityMap); cdecl; external libnm;
function nm_setting_vlan_add_priority_str(setting: PNMSettingVlan; map: TNMVlanPriorityMap; str: pchar): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:21:44 ===

function NM_TYPE_SETTING_VLAN: TGType;
function NM_SETTING_VLAN(obj: Pointer): PNMSettingVlan;
function NM_SETTING_VLAN_CLASS(klass: Pointer): PNMSettingVlanClass;
function NM_IS_SETTING_VLAN(obj: Pointer): Tgboolean;
function NM_IS_SETTING_VLAN_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_VLAN_GET_CLASS(obj: Pointer): PNMSettingVlanClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_VLAN: TGType;
begin
  NM_TYPE_SETTING_VLAN := nm_setting_vlan_get_type;
end;

function NM_SETTING_VLAN(obj: Pointer): PNMSettingVlan;
begin
  Result := PNMSettingVlan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VLAN));
end;

function NM_SETTING_VLAN_CLASS(klass: Pointer): PNMSettingVlanClass;
begin
  Result := PNMSettingVlanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VLAN));
end;

function NM_IS_SETTING_VLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_VLAN);
end;

function NM_IS_SETTING_VLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_VLAN);
end;

function NM_SETTING_VLAN_GET_CLASS(obj: Pointer): PNMSettingVlanClass;
begin
  Result := PNMSettingVlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
