

  {$IFDEF read_enum}
const
  NM_SETTING_WPAN_SETTING_NAME = 'wpan';
  NM_SETTING_WPAN_MAC_ADDRESS = 'mac-address';
  NM_SETTING_WPAN_PAN_ID = 'pan-id';
  NM_SETTING_WPAN_SHORT_ADDRESS = 'short-address';
  NM_SETTING_WPAN_PAGE = 'page';
  NM_SETTING_WPAN_CHANNEL = 'channel';
  NM_SETTING_WPAN_PAGE_DEFAULT = -(1);
  NM_SETTING_WPAN_CHANNEL_DEFAULT = -(1);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWpan = type Pointer;
  PNMSettingWpanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wpan_get_type: TGType; cdecl; external libnm;
function nm_setting_wpan_new: PNMSetting; cdecl; external libnm;
function nm_setting_wpan_get_mac_address(setting: PNMSettingWpan): pchar; cdecl; external libnm;
function nm_setting_wpan_get_pan_id(setting: PNMSettingWpan): Tguint16; cdecl; external libnm;
function nm_setting_wpan_get_short_address(setting: PNMSettingWpan): Tguint16; cdecl; external libnm;
function nm_setting_wpan_get_page(setting: PNMSettingWpan): Tgint16; cdecl; external libnm;
function nm_setting_wpan_get_channel(setting: PNMSettingWpan): Tgint16; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:20:47 ===

function NM_TYPE_SETTING_WPAN: TGType;
function NM_SETTING_WPAN(obj: Pointer): PNMSettingWpan;
function NM_SETTING_WPAN_CLASS(klass: Pointer): PNMSettingWpanClass;
function NM_IS_SETTING_WPAN(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WPAN_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WPAN_GET_CLASS(obj: Pointer): PNMSettingWpanClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_WPAN: TGType;
begin
  NM_TYPE_SETTING_WPAN := nm_setting_wpan_get_type;
end;

function NM_SETTING_WPAN(obj: Pointer): PNMSettingWpan;
begin
  Result := PNMSettingWpan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WPAN));
end;

function NM_SETTING_WPAN_CLASS(klass: Pointer): PNMSettingWpanClass;
begin
  Result := PNMSettingWpanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WPAN));
end;

function NM_IS_SETTING_WPAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WPAN);
end;

function NM_IS_SETTING_WPAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WPAN);
end;

function NM_SETTING_WPAN_GET_CLASS(obj: Pointer): PNMSettingWpanClass;
begin
  Result := PNMSettingWpanClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
