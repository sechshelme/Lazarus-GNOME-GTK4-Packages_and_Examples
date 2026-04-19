unit nm_setting_wireless;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_WIRELESS_H__}
{$define __NM_SETTING_WIRELESS_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-wireless-security.h"}

const
  NM_SETTING_WIRELESS_SETTING_NAME = '802-11-wireless';  
{*
 * NMSettingWirelessWakeOnWLan:
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_NONE: Wake-on-WLAN disabled
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_ANY: Wake on any activity
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_DISCONNECT: Wake on disconnect
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_MAGIC: Wake on magic packet
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_GTK_REKEY_FAILURE: Wake on GTK rekey failure
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_EAP_IDENTITY_REQUEST: Wake on EAP identity request
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_4WAY_HANDSHAKE: Wake on 4way handshake
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_RFKILL_RELEASE: Wake on rfkill release
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_ALL: Wake on all events. This does not
 *   include the exclusive flags @NM_SETTING_WIRELESS_WAKE_ON_WLAN_DEFAULT or
 *   @NM_SETTING_WIRELESS_WAKE_ON_WLAN_IGNORE.
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_DEFAULT: Use the default value
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_IGNORE: Don't change configured settings
 * @NM_SETTING_WIRELESS_WAKE_ON_WLAN_EXCLUSIVE_FLAGS: Mask of flags that are
 *   incompatible with other flags
 *
 * Options for #NMSettingWireless:wake-on-wlan. Note that not all options
 * are supported by all devices.
 *
 * Since: 1.12
  }
{ clang-format off  }
{< flags > }{< skip > }
{< skip > }
type
  PNMSettingWirelessWakeOnWLan = ^TNMSettingWirelessWakeOnWLan;
  TNMSettingWirelessWakeOnWLan =  Longint;
  Const
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
;
{ clang-format on  }
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
{*
 * NM_SETTING_WIRELESS_MODE_ADHOC:
 *
 * Indicates Ad-Hoc mode where no access point is expected to be present.
  }
  NM_SETTING_WIRELESS_MODE_ADHOC = 'adhoc';  
{*
 * NM_SETTING_WIRELESS_MODE_AP:
 *
 * Indicates AP/master mode where the wireless device is started as an access
 * point/hotspot.
  }
  NM_SETTING_WIRELESS_MODE_AP = 'ap';  
{*
 * NM_SETTING_WIRELESS_MODE_INFRA:
 *
 * Indicates infrastructure mode where an access point is expected to be present
 * for this connection.
  }
  NM_SETTING_WIRELESS_MODE_INFRA = 'infrastructure';  
{*
 * NM_SETTING_WIRELESS_MODE_MESH:
 *
 * Indicates that the connection should create a mesh point.
 *
 * Since: 1.20
  }
  NM_SETTING_WIRELESS_MODE_MESH = 'mesh';  
{*
 * NMSettingWirelessPowersave:
 * @NM_SETTING_WIRELESS_POWERSAVE_DEFAULT: use the default value
 * @NM_SETTING_WIRELESS_POWERSAVE_IGNORE: don't touch existing setting
 * @NM_SETTING_WIRELESS_POWERSAVE_DISABLE: disable powersave
 * @NM_SETTING_WIRELESS_POWERSAVE_ENABLE: enable powersave
 *
 * These flags indicate whether wireless powersave must be enabled.
 *
 * Since: 1.2
 * }
{< skip > }
{< skip > }
type
  PNMSettingWirelessPowersave = ^TNMSettingWirelessPowersave;
  TNMSettingWirelessPowersave =  Longint;
  Const
    NM_SETTING_WIRELESS_POWERSAVE_DEFAULT = 0;
    NM_SETTING_WIRELESS_POWERSAVE_IGNORE = 1;
    NM_SETTING_WIRELESS_POWERSAVE_DISABLE = 2;
    NM_SETTING_WIRELESS_POWERSAVE_ENABLE = 3;
    _NM_SETTING_WIRELESS_POWERSAVE_NUM = 4;
    NM_SETTING_WIRELESS_POWERSAVE_LAST = _NM_SETTING_WIRELESS_POWERSAVE_NUM-1;
;
type

function nm_setting_wireless_get_type:TGType;cdecl;external libnm;
function nm_setting_wireless_new:PNMSetting;cdecl;external libnm;
function nm_setting_wireless_get_ssid(setting:PNMSettingWireless):PGBytes;cdecl;external libnm;
function nm_setting_wireless_get_mode(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
function nm_setting_wireless_get_band(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
function nm_setting_wireless_get_channel(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_bssid(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_44 }
function nm_setting_wireless_get_rate(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_44 }
function nm_setting_wireless_get_tx_power(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_mac_address(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
function nm_setting_wireless_get_cloned_mac_address(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
function nm_setting_wireless_get_generate_mac_address_mask(setting:PNMSettingWireless):Pchar;cdecl;external libnm;
function nm_setting_wireless_get_mac_address_blacklist(setting:PNMSettingWireless):^Pchar;cdecl;external libnm;
function nm_setting_wireless_get_num_mac_blacklist_items(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_mac_blacklist_item(setting:PNMSettingWireless; idx:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_wireless_add_mac_blacklist_item(setting:PNMSettingWireless; mac:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_wireless_remove_mac_blacklist_item(setting:PNMSettingWireless; idx:Tguint32);cdecl;external libnm;
function nm_setting_wireless_remove_mac_blacklist_item_by_value(setting:PNMSettingWireless; mac:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_wireless_clear_mac_blacklist_items(setting:PNMSettingWireless);cdecl;external libnm;
function nm_setting_wireless_get_mtu(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_hidden(setting:PNMSettingWireless):Tgboolean;cdecl;external libnm;
function nm_setting_wireless_get_powersave(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_mac_address_randomization(setting:PNMSettingWireless):TNMSettingMacRandomization;cdecl;external libnm;
function nm_setting_wireless_add_seen_bssid(setting:PNMSettingWireless; bssid:Pchar):Tgboolean;cdecl;external libnm;
function nm_setting_wireless_get_num_seen_bssids(setting:PNMSettingWireless):Tguint32;cdecl;external libnm;
function nm_setting_wireless_get_seen_bssid(setting:PNMSettingWireless; i:Tguint32):Pchar;cdecl;external libnm;
function nm_setting_wireless_ap_security_compatible(s_wireless:PNMSettingWireless; s_wireless_sec:PNMSettingWirelessSecurity; ap_flags:TNM80211ApFlags; ap_wpa:TNM80211ApSecurityFlags; ap_rsn:TNM80211ApSecurityFlags; 
           ap_mode:TNM80211Mode):Tgboolean;cdecl;external libnm;
function nm_setting_wireless_get_wake_on_wlan(setting:PNMSettingWireless):TNMSettingWirelessWakeOnWLan;cdecl;external libnm;
function nm_setting_wireless_get_ap_isolation(setting:PNMSettingWireless):TNMTernary;cdecl;external libnm;
{$endif}
{ __NM_SETTING_WIRELESS_H__  }

// === Konventiert am: 19-4-26 19:20:58 ===

function NM_TYPE_SETTING_WIRELESS : TGType;
function NM_SETTING_WIRELESS(obj : Pointer) : PNMSettingWireless;
function NM_SETTING_WIRELESS_CLASS(klass : Pointer) : PNMSettingWirelessClass;
function NM_IS_SETTING_WIRELESS(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_WIRELESS_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_WIRELESS_GET_CLASS(obj : Pointer) : PNMSettingWirelessClass;

implementation

function NM_TYPE_SETTING_WIRELESS : TGType;
  begin
    NM_TYPE_SETTING_WIRELESS:=nm_setting_wireless_get_type;
  end;

function NM_SETTING_WIRELESS(obj : Pointer) : PNMSettingWireless;
begin
  Result := PNMSettingWireless(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIRELESS));
end;

function NM_SETTING_WIRELESS_CLASS(klass : Pointer) : PNMSettingWirelessClass;
begin
  Result := PNMSettingWirelessClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIRELESS));
end;

function NM_IS_SETTING_WIRELESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_WIRELESS);
end;

function NM_IS_SETTING_WIRELESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_WIRELESS);
end;

function NM_SETTING_WIRELESS_GET_CLASS(obj : Pointer) : PNMSettingWirelessClass;
begin
  Result := PNMSettingWirelessClass(PGTypeInstance(obj)^.g_class);
end;



end.
