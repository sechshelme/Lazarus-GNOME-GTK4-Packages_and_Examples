
{$IFDEF read_function}
function nm_ethtool_optname_is_feature(optname: pchar): Tgboolean; cdecl; external libnm;
function nm_ethtool_optname_is_coalesce(optname: pchar): Tgboolean; cdecl; external libnm;
function nm_ethtool_optname_is_ring(optname: pchar): Tgboolean; cdecl; external libnm;
function nm_ethtool_optname_is_pause(optname: pchar): Tgboolean; cdecl; external libnm;
function nm_ethtool_optname_is_channels(optname: pchar): Tgboolean; cdecl; external libnm;
function nm_ethtool_optname_is_eee(optname: pchar): Tgboolean; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_SETTING_ETHTOOL_SETTING_NAME = 'ethtool';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingEthtool = type Pointer;
  PNMSettingEthtoolClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ethtool_get_type: TGType; cdecl; external libnm;
function nm_setting_ethtool_new: PNMSetting; cdecl; external libnm;
function nm_setting_ethtool_get_optnames(setting: PNMSettingEthtool; out_length: Pguint): PPchar; cdecl; external libnm; deprecated;
function nm_setting_ethtool_get_feature(setting: PNMSettingEthtool; optname: pchar): TNMTernary; cdecl; external libnm; deprecated;
procedure nm_setting_ethtool_set_feature(setting: PNMSettingEthtool; optname: pchar; value: TNMTernary); cdecl; external libnm; deprecated;
procedure nm_setting_ethtool_clear_features(setting: PNMSettingEthtool); cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:27:29 ===

function NM_TYPE_SETTING_ETHTOOL: TGType;
function NM_SETTING_ETHTOOL(obj: Pointer): PNMSettingEthtool;
function NM_SETTING_ETHTOOL_CLASS(klass: Pointer): PNMSettingEthtoolClass;
function NM_IS_SETTING_ETHTOOL(obj: Pointer): Tgboolean;
function NM_IS_SETTING_ETHTOOL_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_ETHTOOL_GET_CLASS(obj: Pointer): PNMSettingEthtoolClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_ETHTOOL: TGType;
begin
  NM_TYPE_SETTING_ETHTOOL := nm_setting_ethtool_get_type;
end;

function NM_SETTING_ETHTOOL(obj: Pointer): PNMSettingEthtool;
begin
  Result := PNMSettingEthtool(g_type_check_instance_cast(obj, NM_TYPE_SETTING_ETHTOOL));
end;

function NM_SETTING_ETHTOOL_CLASS(klass: Pointer): PNMSettingEthtoolClass;
begin
  Result := PNMSettingEthtoolClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_ETHTOOL));
end;

function NM_IS_SETTING_ETHTOOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_ETHTOOL);
end;

function NM_IS_SETTING_ETHTOOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_ETHTOOL);
end;

function NM_SETTING_ETHTOOL_GET_CLASS(obj: Pointer): PNMSettingEthtoolClass;
begin
  Result := PNMSettingEthtoolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
