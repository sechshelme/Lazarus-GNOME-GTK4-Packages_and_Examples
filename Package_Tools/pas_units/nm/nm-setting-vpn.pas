unit nm_setting_vpn;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2013 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_VPN_H__}
{$define __NM_SETTING_VPN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_VPN_SETTING_NAME = 'vpn';  
  NM_SETTING_VPN_SERVICE_TYPE = 'service-type';  
  NM_SETTING_VPN_USER_NAME = 'user-name';  
  NM_SETTING_VPN_PERSISTENT = 'persistent';  
  NM_SETTING_VPN_DATA = 'data';  
  NM_SETTING_VPN_SECRETS = 'secrets';  
  NM_SETTING_VPN_TIMEOUT = 'timeout';  
type
{*
 * NMVpnIterFunc:
 * @key: the name of the data or secret item
 * @value: the value of the data or secret item
 * @user_data: User data passed to nm_setting_vpn_foreach_data_item() or
 * nm_setting_vpn_foreach_secret()
 * }

  TNMVpnIterFunc = procedure (key:Pchar; value:Pchar; user_data:Tgpointer);cdecl;

function nm_setting_vpn_get_type:TGType;cdecl;external libnm;
function nm_setting_vpn_new:PNMSetting;cdecl;external libnm;
function nm_setting_vpn_get_service_type(setting:PNMSettingVpn):Pchar;cdecl;external libnm;
function nm_setting_vpn_get_user_name(setting:PNMSettingVpn):Pchar;cdecl;external libnm;
function nm_setting_vpn_get_persistent(setting:PNMSettingVpn):Tgboolean;cdecl;external libnm;
function nm_setting_vpn_get_num_data_items(setting:PNMSettingVpn):Tguint32;cdecl;external libnm;
procedure nm_setting_vpn_add_data_item(setting:PNMSettingVpn; key:Pchar; item:Pchar);cdecl;external libnm;
function nm_setting_vpn_get_data_item(setting:PNMSettingVpn; key:Pchar):Pchar;cdecl;external libnm;
function nm_setting_vpn_remove_data_item(setting:PNMSettingVpn; key:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_vpn_foreach_data_item(setting:PNMSettingVpn; func:TNMVpnIterFunc; user_data:Tgpointer);cdecl;external libnm;
function nm_setting_vpn_get_data_keys(setting:PNMSettingVpn; out_length:Pguint):^Pchar;cdecl;external libnm;
function nm_setting_vpn_get_num_secrets(setting:PNMSettingVpn):Tguint32;cdecl;external libnm;
procedure nm_setting_vpn_add_secret(setting:PNMSettingVpn; key:Pchar; secret:Pchar);cdecl;external libnm;
function nm_setting_vpn_get_secret(setting:PNMSettingVpn; key:Pchar):Pchar;cdecl;external libnm;
function nm_setting_vpn_remove_secret(setting:PNMSettingVpn; key:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_vpn_foreach_secret(setting:PNMSettingVpn; func:TNMVpnIterFunc; user_data:Tgpointer);cdecl;external libnm;
function nm_setting_vpn_get_secret_keys(setting:PNMSettingVpn; out_length:Pguint):^Pchar;cdecl;external libnm;
function nm_setting_vpn_get_timeout(setting:PNMSettingVpn):Tguint32;cdecl;external libnm;
{$endif}
{ __NM_SETTING_VPN_H__  }

// === Konventiert am: 19-4-26 19:21:39 ===

function NM_TYPE_SETTING_VPN : TGType;
function NM_SETTING_VPN(obj : Pointer) : PNMSettingVpn;
function NM_SETTING_VPN_CLASS(klass : Pointer) : PNMSettingVpnClass;
function NM_IS_SETTING_VPN(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_VPN_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_VPN_GET_CLASS(obj : Pointer) : PNMSettingVpnClass;

implementation

function NM_TYPE_SETTING_VPN : TGType;
  begin
    NM_TYPE_SETTING_VPN:=nm_setting_vpn_get_type;
  end;

function NM_SETTING_VPN(obj : Pointer) : PNMSettingVpn;
begin
  Result := PNMSettingVpn(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VPN));
end;

function NM_SETTING_VPN_CLASS(klass : Pointer) : PNMSettingVpnClass;
begin
  Result := PNMSettingVpnClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VPN));
end;

function NM_IS_SETTING_VPN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_VPN);
end;

function NM_IS_SETTING_VPN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_VPN);
end;

function NM_SETTING_VPN_GET_CLASS(obj : Pointer) : PNMSettingVpnClass;
begin
  Result := PNMSettingVpnClass(PGTypeInstance(obj)^.g_class);
end;



end.
