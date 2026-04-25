
  {$IFDEF read_enum}
const
  NM_SETTING_WIMAX_SETTING_NAME = 'wimax';
  NM_SETTING_WIMAX_NETWORK_NAME = 'network-name';
  NM_SETTING_WIMAX_MAC_ADDRESS = 'mac-address';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWimax = type Pointer;
  PNMSettingWimaxClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wimax_get_type: TGType; cdecl; external libnm; deprecated;
function nm_setting_wimax_new: PNMSetting; cdecl; external libnm; deprecated;
function nm_setting_wimax_get_network_name(setting: PNMSettingWimax): pchar; cdecl; external libnm; deprecated;
function nm_setting_wimax_get_mac_address(setting: PNMSettingWimax): pchar; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:21:18 ===

function NM_TYPE_SETTING_WIMAX: TGType;
function NM_SETTING_WIMAX(obj: Pointer): PNMSettingWimax;
function NM_SETTING_WIMAX_CLASS(klass: Pointer): PNMSettingWimaxClass;
function NM_IS_SETTING_WIMAX(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WIMAX_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WIMAX_GET_CLASS(obj: Pointer): PNMSettingWimaxClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_WIMAX: TGType;
begin
  NM_TYPE_SETTING_WIMAX := nm_setting_wimax_get_type;
end;

function NM_SETTING_WIMAX(obj: Pointer): PNMSettingWimax;
begin
  Result := PNMSettingWimax(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIMAX));
end;

function NM_SETTING_WIMAX_CLASS(klass: Pointer): PNMSettingWimaxClass;
begin
  Result := PNMSettingWimaxClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIMAX));
end;

function NM_IS_SETTING_WIMAX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WIMAX);
end;

function NM_IS_SETTING_WIMAX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WIMAX);
end;

function NM_SETTING_WIMAX_GET_CLASS(obj: Pointer): PNMSettingWimaxClass;
begin
  Result := PNMSettingWimaxClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
