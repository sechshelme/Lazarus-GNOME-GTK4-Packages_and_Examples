

  {$IFDEF read_enum}
const
  NM_SETTING_MACVLAN_SETTING_NAME = 'macvlan';
  NM_SETTING_MACVLAN_PARENT = 'parent';
  NM_SETTING_MACVLAN_MODE = 'mode';
  NM_SETTING_MACVLAN_PROMISCUOUS = 'promiscuous';
  NM_SETTING_MACVLAN_TAP = 'tap';

type
  PNMSettingMacvlanMode = ^TNMSettingMacvlanMode;
  TNMSettingMacvlanMode = longint;

const
  NM_SETTING_MACVLAN_MODE_UNKNOWN = 0;
  NM_SETTING_MACVLAN_MODE_VEPA = 1;
  NM_SETTING_MACVLAN_MODE_BRIDGE = 2;
  NM_SETTING_MACVLAN_MODE_PRIVATE = 3;
  NM_SETTING_MACVLAN_MODE_PASSTHRU = 4;
  NM_SETTING_MACVLAN_MODE_SOURCE = 5;
  _NM_SETTING_MACVLAN_MODE_NUM = 6;
  NM_SETTING_MACVLAN_MODE_LAST = _NM_SETTING_MACVLAN_MODE_NUM - 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingMacvlan = type Pointer;
  PNMSettingMacvlanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_macvlan_get_type: TGType; cdecl; external libnm;
function nm_setting_macvlan_new: PNMSetting; cdecl; external libnm;
function nm_setting_macvlan_get_parent(setting: PNMSettingMacvlan): pchar; cdecl; external libnm;
function nm_setting_macvlan_get_mode(setting: PNMSettingMacvlan): TNMSettingMacvlanMode; cdecl; external libnm;
function nm_setting_macvlan_get_promiscuous(setting: PNMSettingMacvlan): Tgboolean; cdecl; external libnm;
function nm_setting_macvlan_get_tap(setting: PNMSettingMacvlan): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:13 ===

function NM_TYPE_SETTING_MACVLAN: TGType;
function NM_SETTING_MACVLAN(obj: Pointer): PNMSettingMacvlan;
function NM_SETTING_MACVLAN_CLASS(klass: Pointer): PNMSettingMacvlanClass;
function NM_IS_SETTING_MACVLAN(obj: Pointer): Tgboolean;
function NM_IS_SETTING_MACVLAN_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_MACVLAN_GET_CLASS(obj: Pointer): PNMSettingMacvlanClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_MACVLAN: TGType;
begin
  NM_TYPE_SETTING_MACVLAN := nm_setting_macvlan_get_type;
end;

function NM_SETTING_MACVLAN(obj: Pointer): PNMSettingMacvlan;
begin
  Result := PNMSettingMacvlan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_MACVLAN));
end;

function NM_SETTING_MACVLAN_CLASS(klass: Pointer): PNMSettingMacvlanClass;
begin
  Result := PNMSettingMacvlanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_MACVLAN));
end;

function NM_IS_SETTING_MACVLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_MACVLAN);
end;

function NM_IS_SETTING_MACVLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_MACVLAN);
end;

function NM_SETTING_MACVLAN_GET_CLASS(obj: Pointer): PNMSettingMacvlanClass;
begin
  Result := PNMSettingMacvlanClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
