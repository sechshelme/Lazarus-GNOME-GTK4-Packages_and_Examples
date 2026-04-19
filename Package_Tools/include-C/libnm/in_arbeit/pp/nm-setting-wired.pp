
unit nm-setting-wired;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wired.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wired.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PNMSetting  = ^NMSetting;
PNMSettingWired  = ^NMSettingWired;
PNMSettingWiredWakeOnLan  = ^NMSettingWiredWakeOnLan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_WIRED_H__}
{$define __NM_SETTING_WIRED_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIRED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WIRED_SETTING_NAME = '802-3-ethernet';  
{*
 * NMSettingWiredWakeOnLan:
 * @NM_SETTING_WIRED_WAKE_ON_LAN_NONE: Wake-on-LAN disabled
 * @NM_SETTING_WIRED_WAKE_ON_LAN_PHY: Wake on PHY activity
 * @NM_SETTING_WIRED_WAKE_ON_LAN_UNICAST: Wake on unicast messages
 * @NM_SETTING_WIRED_WAKE_ON_LAN_MULTICAST: Wake on multicast messages
 * @NM_SETTING_WIRED_WAKE_ON_LAN_BROADCAST: Wake on broadcast messages
 * @NM_SETTING_WIRED_WAKE_ON_LAN_ARP: Wake on ARP
 * @NM_SETTING_WIRED_WAKE_ON_LAN_MAGIC: Wake on magic packet
 * @NM_SETTING_WIRED_WAKE_ON_LAN_ALL: Wake on all events. This does not
 *   include the exclusive flags @NM_SETTING_WIRED_WAKE_ON_LAN_DEFAULT or
 *   @NM_SETTING_WIRED_WAKE_ON_LAN_IGNORE.
 * @NM_SETTING_WIRED_WAKE_ON_LAN_DEFAULT: Use the default value
 * @NM_SETTING_WIRED_WAKE_ON_LAN_IGNORE: Don't change configured settings
 * @NM_SETTING_WIRED_WAKE_ON_LAN_EXCLUSIVE_FLAGS: Mask of flags that are
 *   incompatible with other flags
 *
 * Options for #NMSettingWired:wake-on-lan. Note that not all options
 * are supported by all devices.
 *
 * Since: 1.2
  }
{< flags > }{< skip > }
{< skip > }
{< skip > }
type
  PNMSettingWiredWakeOnLan = ^TNMSettingWiredWakeOnLan;
  TNMSettingWiredWakeOnLan =  Longint;
  Const
    NM_SETTING_WIRED_WAKE_ON_LAN_NONE = 0;
    NM_SETTING_WIRED_WAKE_ON_LAN_PHY = $2;
    NM_SETTING_WIRED_WAKE_ON_LAN_UNICAST = $4;
    NM_SETTING_WIRED_WAKE_ON_LAN_MULTICAST = $8;
    NM_SETTING_WIRED_WAKE_ON_LAN_BROADCAST = $10;
    NM_SETTING_WIRED_WAKE_ON_LAN_ARP = $20;
    NM_SETTING_WIRED_WAKE_ON_LAN_MAGIC = $40;
    NM_SETTING_WIRED_WAKE_ON_LAN_ALL = $7E;
    NM_SETTING_WIRED_WAKE_ON_LAN_DEFAULT = $1;
    NM_SETTING_WIRED_WAKE_ON_LAN_IGNORE = $8000;
    NM_SETTING_WIRED_WAKE_ON_LAN_EXCLUSIVE_FLAGS = $8001;
;
  NM_SETTING_WIRED_PORT = 'port';  
  NM_SETTING_WIRED_SPEED = 'speed';  
  NM_SETTING_WIRED_DUPLEX = 'duplex';  
  NM_SETTING_WIRED_AUTO_NEGOTIATE = 'auto-negotiate';  
  NM_SETTING_WIRED_MAC_ADDRESS = 'mac-address';  
  NM_SETTING_WIRED_CLONED_MAC_ADDRESS = 'cloned-mac-address';  
  NM_SETTING_WIRED_GENERATE_MAC_ADDRESS_MASK = 'generate-mac-address-mask';  
  NM_SETTING_WIRED_MAC_ADDRESS_BLACKLIST = 'mac-address-blacklist';  
  NM_SETTING_WIRED_MTU = 'mtu';  
  NM_SETTING_WIRED_S390_SUBCHANNELS = 's390-subchannels';  
  NM_SETTING_WIRED_S390_NETTYPE = 's390-nettype';  
  NM_SETTING_WIRED_S390_OPTIONS = 's390-options';  
  NM_SETTING_WIRED_WAKE_ON_LAN = 'wake-on-lan';  
  NM_SETTING_WIRED_WAKE_ON_LAN_PASSWORD = 'wake-on-lan-password';  
  NM_SETTING_WIRED_ACCEPT_ALL_MAC_ADDRESSES = 'accept-all-mac-addresses';  
type

function nm_setting_wired_get_type:TGType;cdecl;external;
function nm_setting_wired_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_port(setting:PNMSettingWired):Pchar;cdecl;external;
function nm_setting_wired_get_speed(setting:PNMSettingWired):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_duplex(setting:PNMSettingWired):Pchar;cdecl;external;
function nm_setting_wired_get_auto_negotiate(setting:PNMSettingWired):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_mac_address(setting:PNMSettingWired):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_cloned_mac_address(setting:PNMSettingWired):Pchar;cdecl;external;
function nm_setting_wired_get_accept_all_mac_addresses(setting:PNMSettingWired):TNMTernary;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_generate_mac_address_mask(setting:PNMSettingWired):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_wired_get_mac_address_blacklist(setting:PNMSettingWired):^Pchar;cdecl;external;
function nm_setting_wired_get_num_mac_blacklist_items(setting:PNMSettingWired):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_mac_blacklist_item(setting:PNMSettingWired; idx:Tguint32):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_add_mac_blacklist_item(setting:PNMSettingWired; mac:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wired_remove_mac_blacklist_item(setting:PNMSettingWired; idx:Tguint32);cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_remove_mac_blacklist_item_by_value(setting:PNMSettingWired; mac:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wired_clear_mac_blacklist_items(setting:PNMSettingWired);cdecl;external;
function nm_setting_wired_get_mtu(setting:PNMSettingWired):Tguint32;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_wired_get_s390_subchannels(setting:PNMSettingWired):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_s390_nettype(setting:PNMSettingWired):Pchar;cdecl;external;
function nm_setting_wired_get_num_s390_options(setting:PNMSettingWired):Tguint32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_wired_get_s390_option(setting:PNMSettingWired; idx:Tguint32; out_key:PPchar; out_value:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_wired_get_s390_option_by_key(setting:PNMSettingWired; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_wired_add_s390_option(setting:PNMSettingWired; key:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_remove_s390_option(setting:PNMSettingWired; key:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_valid_s390_options(setting:PNMSettingWired):^Pchar;cdecl;external;
function nm_setting_wired_get_wake_on_lan(setting:PNMSettingWired):TNMSettingWiredWakeOnLan;cdecl;external;
(* Const before type ignored *)
function nm_setting_wired_get_wake_on_lan_password(setting:PNMSettingWired):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_WIRED_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIRED : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WIRED:=nm_setting_wired_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED(obj : longint) : longint;
begin
  NM_SETTING_WIRED:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WIRED,NMSettingWired);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WIRED_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WIRED,NMSettingWiredClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRED(obj : longint) : longint;
begin
  NM_IS_SETTING_WIRED:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WIRED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRED_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WIRED_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WIRED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRED_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WIRED_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WIRED,NMSettingWiredClass);
end;


end.
