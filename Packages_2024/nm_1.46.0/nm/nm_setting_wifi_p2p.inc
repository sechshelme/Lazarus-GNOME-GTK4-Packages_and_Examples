
  {$IFDEF read_enum}
const
  NM_SETTING_WIFI_P2P_SETTING_NAME = 'wifi-p2p';
  NM_SETTING_WIFI_P2P_PEER = 'peer';
  NM_SETTING_WIFI_P2P_WPS_METHOD = 'wps-method';
  NM_SETTING_WIFI_P2P_WFD_IES = 'wfd-ies';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWifiP2P = type Pointer;
  PNMSettingWifiP2PClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wifi_p2p_get_type: TGType; cdecl; external libnm;
function nm_setting_wifi_p2p_new: PNMSetting; cdecl; external libnm;
function nm_setting_wifi_p2p_get_peer(setting: PNMSettingWifiP2P): pchar; cdecl; external libnm;
function nm_setting_wifi_p2p_get_wps_method(setting: PNMSettingWifiP2P): TNMSettingWirelessSecurityWpsMethod; cdecl; external libnm;
function nm_setting_wifi_p2p_get_wfd_ies(setting: PNMSettingWifiP2P): PGBytes; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:21:22 ===

function NM_TYPE_SETTING_WIFI_P2P: TGType;
function NM_SETTING_WIFI_P2P(obj: Pointer): PNMSettingWifiP2P;
function NM_SETTING_WIFI_P2P_CLASS(klass: Pointer): PNMSettingWifiP2PClass;
function NM_IS_SETTING_WIFI_P2P(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WIFI_P2P_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WIFI_P2P_GET_CLASS(obj: Pointer): PNMSettingWifiP2PClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_WIFI_P2P: TGType;
begin
  NM_TYPE_SETTING_WIFI_P2P := nm_setting_wifi_p2p_get_type;
end;

function NM_SETTING_WIFI_P2P(obj: Pointer): PNMSettingWifiP2P;
begin
  Result := PNMSettingWifiP2P(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIFI_P2P));
end;

function NM_SETTING_WIFI_P2P_CLASS(klass: Pointer): PNMSettingWifiP2PClass;
begin
  Result := PNMSettingWifiP2PClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIFI_P2P));
end;

function NM_IS_SETTING_WIFI_P2P(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WIFI_P2P);
end;

function NM_IS_SETTING_WIFI_P2P_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WIFI_P2P);
end;

function NM_SETTING_WIFI_P2P_GET_CLASS(obj: Pointer): PNMSettingWifiP2PClass;
begin
  Result := PNMSettingWifiP2PClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
