unit nm_setting_wireless;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting, nm_core_types, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_WIRELESS_SETTING_NAME = '802-11-wireless';

type
  PNMSettingWirelessWakeOnWLan = ^TNMSettingWirelessWakeOnWLan;
  TNMSettingWirelessWakeOnWLan = longint;

const
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_NONE = 0;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_ANY = $2;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_DISCONNECT = $4;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_MAGIC = $8;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_GTK_REKEY_FAILURE = $10;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_EAP_IDENTITY_REQUEST = $20;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_4WAY_HANDSHAKE = $40;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_RFKILL_RELEASE = $80;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_TCP = $100;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_ALL = $1FE;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_DEFAULT = $1;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_IGNORE = $8000;
  NM_SETTING_WIRELESS_WAKE_ON_WLAN_EXCLUSIVE_FLAGS = NM_SETTING_WIRELESS_WAKE_ON_WLAN_DEFAULT or NM_SETTING_WIRELESS_WAKE_ON_WLAN_IGNORE;

const
  NM_SETTING_WIRELESS_SSID = 'ssid';
  NM_SETTING_WIRELESS_MODE = 'mode';
  NM_SETTING_WIRELESS_BAND = 'band';
  NM_SETTING_WIRELESS_CHANNEL = 'channel';
  NM_SETTING_WIRELESS_BSSID = 'bssid';
  NM_SETTING_WIRELESS_RATE = 'rate';
  NM_SETTING_WIRELESS_TX_POWER = 'tx-power';
  NM_SETTING_WIRELESS_MAC_ADDRESS = 'mac-address';
  NM_SETTING_WIRELESS_CLONED_MAC_ADDRESS = 'cloned-mac-address';
  NM_SETTING_WIRELESS_GENERATE_MAC_ADDRESS_MASK = 'generate-mac-address-mask';
  NM_SETTING_WIRELESS_MAC_ADDRESS_BLACKLIST = 'mac-address-blacklist';
  NM_SETTING_WIRELESS_MTU = 'mtu';
  NM_SETTING_WIRELESS_SEEN_BSSIDS = 'seen-bssids';
  NM_SETTING_WIRELESS_HIDDEN = 'hidden';
  NM_SETTING_WIRELESS_POWERSAVE = 'powersave';
  NM_SETTING_WIRELESS_MAC_ADDRESS_RANDOMIZATION = 'mac-address-randomization';
  NM_SETTING_WIRELESS_WAKE_ON_WLAN = 'wake-on-wlan';
  NM_SETTING_WIRELESS_AP_ISOLATION = 'ap-isolation';
  NM_SETTING_WIRELESS_MODE_ADHOC = 'adhoc';
  NM_SETTING_WIRELESS_MODE_AP = 'ap';
  NM_SETTING_WIRELESS_MODE_INFRA = 'infrastructure';
  NM_SETTING_WIRELESS_MODE_MESH = 'mesh';

type
  PNMSettingWirelessPowersave = ^TNMSettingWirelessPowersave;
  TNMSettingWirelessPowersave = longint;

const
  NM_SETTING_WIRELESS_POWERSAVE_DEFAULT = 0;
  NM_SETTING_WIRELESS_POWERSAVE_IGNORE = 1;
  NM_SETTING_WIRELESS_POWERSAVE_DISABLE = 2;
  NM_SETTING_WIRELESS_POWERSAVE_ENABLE = 3;
  _NM_SETTING_WIRELESS_POWERSAVE_NUM = 4;
  NM_SETTING_WIRELESS_POWERSAVE_LAST = _NM_SETTING_WIRELESS_POWERSAVE_NUM - 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWireless = type Pointer;
  PNMSettingWirelessClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wireless_get_type: TGType; cdecl; external libnm;
function nm_setting_wireless_new: PNMSetting; cdecl; external libnm;
function nm_setting_wireless_get_ssid(setting: PNMSettingWireless): PGBytes; cdecl; external libnm;
function nm_setting_wireless_get_mode(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_band(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_channel(setting: PNMSettingWireless): Tguint32; cdecl; external libnm;
function nm_setting_wireless_get_bssid(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_rate(setting: PNMSettingWireless): Tguint32; cdecl; external libnm; deprecated;
function nm_setting_wireless_get_tx_power(setting: PNMSettingWireless): Tguint32; cdecl; external libnm; deprecated;
function nm_setting_wireless_get_mac_address(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_cloned_mac_address(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_generate_mac_address_mask(setting: PNMSettingWireless): pchar; cdecl; external libnm;
function nm_setting_wireless_get_mac_address_blacklist(setting: PNMSettingWireless): Ppchar; cdecl; external libnm;
function nm_setting_wireless_get_num_mac_blacklist_items(setting: PNMSettingWireless): Tguint32; cdecl; external libnm;
function nm_setting_wireless_get_mac_blacklist_item(setting: PNMSettingWireless; idx: Tguint32): pchar; cdecl; external libnm;
function nm_setting_wireless_add_mac_blacklist_item(setting: PNMSettingWireless; mac: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_remove_mac_blacklist_item(setting: PNMSettingWireless; idx: Tguint32); cdecl; external libnm;
function nm_setting_wireless_remove_mac_blacklist_item_by_value(setting: PNMSettingWireless; mac: pchar): Tgboolean; cdecl; external libnm;
procedure nm_setting_wireless_clear_mac_blacklist_items(setting: PNMSettingWireless); cdecl; external libnm;
function nm_setting_wireless_get_mtu(setting: PNMSettingWireless): Tguint32; cdecl; external libnm;
function nm_setting_wireless_get_hidden(setting: PNMSettingWireless): Tgboolean; cdecl; external libnm;
function nm_setting_wireless_get_powersave(setting: PNMSettingWireless): Tguint32; cdecl; external libnm;
function nm_setting_wireless_get_mac_address_randomization(setting: PNMSettingWireless): TNMSettingMacRandomization; cdecl; external libnm;
function nm_setting_wireless_add_seen_bssid(setting: PNMSettingWireless; bssid: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_wireless_get_num_seen_bssids(setting: PNMSettingWireless): Tguint32; cdecl; external libnm;
function nm_setting_wireless_get_seen_bssid(setting: PNMSettingWireless; i: Tguint32): pchar; cdecl; external libnm;
function nm_setting_wireless_ap_security_compatible(s_wireless: PNMSettingWireless; s_wireless_sec: PNMSettingWirelessSecurity; ap_flags: TNM80211ApFlags; ap_wpa: TNM80211ApSecurityFlags; ap_rsn: TNM80211ApSecurityFlags; ap_mode: TNM80211Mode): Tgboolean; cdecl; external libnm;
function nm_setting_wireless_get_wake_on_wlan(setting: PNMSettingWireless): TNMSettingWirelessWakeOnWLan; cdecl; external libnm;
function nm_setting_wireless_get_ap_isolation(setting: PNMSettingWireless): TNMTernary; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:20:58 ===

function NM_TYPE_SETTING_WIRELESS: TGType;
function NM_SETTING_WIRELESS(obj: Pointer): PNMSettingWireless;
function NM_SETTING_WIRELESS_CLASS(klass: Pointer): PNMSettingWirelessClass;
function NM_IS_SETTING_WIRELESS(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WIRELESS_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WIRELESS_GET_CLASS(obj: Pointer): PNMSettingWirelessClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_WIRELESS: TGType;
begin
  NM_TYPE_SETTING_WIRELESS := nm_setting_wireless_get_type;
end;

function NM_SETTING_WIRELESS(obj: Pointer): PNMSettingWireless;
begin
  Result := PNMSettingWireless(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIRELESS));
end;

function NM_SETTING_WIRELESS_CLASS(klass: Pointer): PNMSettingWirelessClass;
begin
  Result := PNMSettingWirelessClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIRELESS));
end;

function NM_IS_SETTING_WIRELESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WIRELESS);
end;

function NM_IS_SETTING_WIRELESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WIRELESS);
end;

function NM_SETTING_WIRELESS_GET_CLASS(obj: Pointer): PNMSettingWirelessClass;
begin
  Result := PNMSettingWirelessClass(PGTypeInstance(obj)^.g_class);
end;



end.
