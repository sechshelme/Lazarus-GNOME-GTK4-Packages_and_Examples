
  {$IFDEF read_enum}
const
  NM_SETTING_WIRELESS_SECURITY_SETTING_NAME = '802-11-wireless-security';

type
  PNMWepKeyType = ^TNMWepKeyType;
  TNMWepKeyType = longint;

const
  NM_WEP_KEY_TYPE_UNKNOWN = 0;
  NM_WEP_KEY_TYPE_KEY = 1;
  NM_WEP_KEY_TYPE_PASSPHRASE = 2;
  NM_WEP_KEY_TYPE_LAST = NM_WEP_KEY_TYPE_PASSPHRASE;

type
  PNMSettingWirelessSecurityPmf = ^TNMSettingWirelessSecurityPmf;
  TNMSettingWirelessSecurityPmf = longint;

const
  NM_SETTING_WIRELESS_SECURITY_PMF_DEFAULT = 0;
  NM_SETTING_WIRELESS_SECURITY_PMF_DISABLE = 1;
  NM_SETTING_WIRELESS_SECURITY_PMF_OPTIONAL = 2;
  NM_SETTING_WIRELESS_SECURITY_PMF_REQUIRED = 3;
  _NM_SETTING_WIRELESS_SECURITY_PMF_NUM = 4;
  NM_SETTING_WIRELESS_SECURITY_PMF_LAST = _NM_SETTING_WIRELESS_SECURITY_PMF_NUM - 1;

type
  PNMSettingWirelessSecurityWpsMethod = ^TNMSettingWirelessSecurityWpsMethod;
  TNMSettingWirelessSecurityWpsMethod = longint;

const
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DEFAULT = $00000000;
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DISABLED = $00000001;
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_AUTO = $00000002;
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PBC = $00000004;
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PIN = $00000008;

type
  PNMSettingWirelessSecurityFils = ^TNMSettingWirelessSecurityFils;
  TNMSettingWirelessSecurityFils = longint;

const
  NM_SETTING_WIRELESS_SECURITY_FILS_DEFAULT = 0;
  NM_SETTING_WIRELESS_SECURITY_FILS_DISABLE = 1;
  NM_SETTING_WIRELESS_SECURITY_FILS_OPTIONAL = 2;
  NM_SETTING_WIRELESS_SECURITY_FILS_REQUIRED = 3;
  _NM_SETTING_WIRELESS_SECURITY_FILS_NUM = 4;
  NM_SETTING_WIRELESS_SECURITY_FILS_LAST = _NM_SETTING_WIRELESS_SECURITY_FILS_NUM - 1;

const
  NM_SETTING_WIRELESS_SECURITY_KEY_MGMT = 'key-mgmt';
  NM_SETTING_WIRELESS_SECURITY_WEP_TX_KEYIDX = 'wep-tx-keyidx';
  NM_SETTING_WIRELESS_SECURITY_AUTH_ALG = 'auth-alg';
  NM_SETTING_WIRELESS_SECURITY_PROTO = 'proto';
  NM_SETTING_WIRELESS_SECURITY_PAIRWISE = 'pairwise';
  NM_SETTING_WIRELESS_SECURITY_GROUP = 'group';
  NM_SETTING_WIRELESS_SECURITY_PMF = 'pmf';
  NM_SETTING_WIRELESS_SECURITY_LEAP_USERNAME = 'leap-username';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY0 = 'wep-key0';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY1 = 'wep-key1';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY2 = 'wep-key2';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY3 = 'wep-key3';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY_FLAGS = 'wep-key-flags';
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY_TYPE = 'wep-key-type';
  NM_SETTING_WIRELESS_SECURITY_PSK = 'psk';
  NM_SETTING_WIRELESS_SECURITY_PSK_FLAGS = 'psk-flags';
  NM_SETTING_WIRELESS_SECURITY_LEAP_PASSWORD = 'leap-password';
  NM_SETTING_WIRELESS_SECURITY_LEAP_PASSWORD_FLAGS = 'leap-password-flags';
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD = 'wps-method';
  NM_SETTING_WIRELESS_SECURITY_FILS = 'fils';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWirelessSecurity = type Pointer;
  PNMSettingWirelessSecurityClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wireless_security_get_type: TGType; cdecl; external libnm;
function nm_setting_wireless_security_new: PNMSetting; cdecl; external libnm;
function nm_setting_wireless_security_get_key_mgmt(setting: PNMSettingWirelessSecurity): pchar; cdecl; external libnm;
function nm_setting_wireless_security_get_num_protos(setting: PNMSettingWirelessSecurity): Tguint32; cdecl; external libnm;
function nm_setting_wireless_security_get_proto(setting: PNMSettingWirelessSecurity; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_wireless_security_add_proto(setting: PNMSettingWirelessSecurity; proto: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_remove_proto(setting: PNMSettingWirelessSecurity; i: Tguint32); cdecl; external libnm;
function nm_setting_wireless_security_remove_proto_by_value(setting: PNMSettingWirelessSecurity; proto: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_clear_protos(setting: PNMSettingWirelessSecurity); cdecl; external libnm;
function nm_setting_wireless_security_get_num_pairwise(setting: PNMSettingWirelessSecurity): Tguint32; cdecl; external libnm;
function nm_setting_wireless_security_get_pairwise(setting: PNMSettingWirelessSecurity; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_wireless_security_add_pairwise(setting: PNMSettingWirelessSecurity; pairwise: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_remove_pairwise(setting: PNMSettingWirelessSecurity; i: Tguint32); cdecl; external libnm;
function nm_setting_wireless_security_remove_pairwise_by_value(setting: PNMSettingWirelessSecurity; pairwise: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_clear_pairwise(setting: PNMSettingWirelessSecurity); cdecl; external libnm;
function nm_setting_wireless_security_get_num_groups(setting: PNMSettingWirelessSecurity): Tguint32; cdecl; external libnm;
function nm_setting_wireless_security_get_group(setting: PNMSettingWirelessSecurity; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_wireless_security_add_group(setting: PNMSettingWirelessSecurity; group: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_remove_group(setting: PNMSettingWirelessSecurity; i: Tguint32); cdecl; external libnm;
function nm_setting_wireless_security_remove_group_by_value(setting: PNMSettingWirelessSecurity; group: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_security_clear_groups(setting: PNMSettingWirelessSecurity); cdecl; external libnm;
function nm_setting_wireless_security_get_pmf(setting: PNMSettingWirelessSecurity): TNMSettingWirelessSecurityPmf; cdecl; external libnm;
function nm_setting_wireless_security_get_psk(setting: PNMSettingWirelessSecurity): pchar; cdecl; external libnm;
function nm_setting_wireless_security_get_psk_flags(setting: PNMSettingWirelessSecurity): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_wireless_security_get_leap_username(setting: PNMSettingWirelessSecurity): pchar; cdecl; external libnm;
function nm_setting_wireless_security_get_leap_password(setting: PNMSettingWirelessSecurity): pchar; cdecl; external libnm;
function nm_setting_wireless_security_get_leap_password_flags(setting: PNMSettingWirelessSecurity): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_wireless_security_get_wep_key(setting: PNMSettingWirelessSecurity; idx: Tguint32): pchar; cdecl; external libnm;
procedure nm_setting_wireless_security_set_wep_key(setting: PNMSettingWirelessSecurity; idx: Tguint32; key: pchar); cdecl; external libnm;
function nm_setting_wireless_security_get_wep_tx_keyidx(setting: PNMSettingWirelessSecurity): Tguint32; cdecl; external libnm;
function nm_setting_wireless_security_get_auth_alg(setting: PNMSettingWirelessSecurity): pchar; cdecl; external libnm;
function nm_setting_wireless_security_get_wep_key_flags(setting: PNMSettingWirelessSecurity): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_wireless_security_get_wep_key_type(setting: PNMSettingWirelessSecurity): TNMWepKeyType; cdecl; external libnm;
function nm_setting_wireless_security_get_wps_method(setting: PNMSettingWirelessSecurity): TNMSettingWirelessSecurityWpsMethod; cdecl; external libnm;
function nm_setting_wireless_security_get_fils(setting: PNMSettingWirelessSecurity): TNMSettingWirelessSecurityFils; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:20:52 ===

function NM_TYPE_SETTING_WIRELESS_SECURITY: TGType;
function NM_SETTING_WIRELESS_SECURITY(obj: Pointer): PNMSettingWirelessSecurity;
function NM_SETTING_WIRELESS_SECURITY_CLASS(klass: Pointer): PNMSettingWirelessSecurityClass;
function NM_IS_SETTING_WIRELESS_SECURITY(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WIRELESS_SECURITY_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WIRELESS_SECURITY_GET_CLASS(obj: Pointer): PNMSettingWirelessSecurityClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_WIRELESS_SECURITY: TGType;
begin
  NM_TYPE_SETTING_WIRELESS_SECURITY := nm_setting_wireless_security_get_type;
end;

function NM_SETTING_WIRELESS_SECURITY(obj: Pointer): PNMSettingWirelessSecurity;
begin
  Result := PNMSettingWirelessSecurity(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIRELESS_SECURITY));
end;

function NM_SETTING_WIRELESS_SECURITY_CLASS(klass: Pointer): PNMSettingWirelessSecurityClass;
begin
  Result := PNMSettingWirelessSecurityClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIRELESS_SECURITY));
end;

function NM_IS_SETTING_WIRELESS_SECURITY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WIRELESS_SECURITY);
end;

function NM_IS_SETTING_WIRELESS_SECURITY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WIRELESS_SECURITY);
end;

function NM_SETTING_WIRELESS_SECURITY_GET_CLASS(obj: Pointer): PNMSettingWirelessSecurityClass;
begin
  Result := PNMSettingWirelessSecurityClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
