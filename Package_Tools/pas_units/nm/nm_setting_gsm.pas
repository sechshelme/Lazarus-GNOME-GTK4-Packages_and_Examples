unit nm_setting_gsm;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_GSM_H__}
{$define __NM_SETTING_GSM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_GSM_SETTING_NAME = 'gsm';  
  NM_SETTING_GSM_AUTO_CONFIG = 'auto-config';  
  NM_SETTING_GSM_USERNAME = 'username';  
  NM_SETTING_GSM_PASSWORD = 'password';  
  NM_SETTING_GSM_PASSWORD_FLAGS = 'password-flags';  
  NM_SETTING_GSM_APN = 'apn';  
  NM_SETTING_GSM_NETWORK_ID = 'network-id';  
  NM_SETTING_GSM_PIN = 'pin';  
  NM_SETTING_GSM_PIN_FLAGS = 'pin-flags';  
  NM_SETTING_GSM_HOME_ONLY = 'home-only';  
  NM_SETTING_GSM_DEVICE_ID = 'device-id';  
  NM_SETTING_GSM_SIM_ID = 'sim-id';  
  NM_SETTING_GSM_SIM_OPERATOR_ID = 'sim-operator-id';  
  NM_SETTING_GSM_MTU = 'mtu';  
  NM_SETTING_GSM_INITIAL_EPS_BEARER_CONFIGURE = 'initial-eps-bearer-configure';  
  NM_SETTING_GSM_INITIAL_EPS_BEARER_APN = 'initial-eps-bearer-apn';  
{ Deprecated  }
  NM_SETTING_GSM_NUMBER = 'number';  
type

function nm_setting_gsm_get_type:TGType;cdecl;external libnm;
function nm_setting_gsm_new:PNMSetting;cdecl;external libnm;
function nm_setting_gsm_get_auto_config(setting:PNMSettingGsm):Tgboolean;cdecl;external libnm;
function nm_setting_gsm_get_username(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_password(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_apn(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_network_id(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_pin(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_home_only(setting:PNMSettingGsm):Tgboolean;cdecl;external libnm;
function nm_setting_gsm_get_device_id(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_sim_id(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_sim_operator_id(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_mtu(setting:PNMSettingGsm):Tguint32;cdecl;external libnm;
function nm_setting_gsm_get_initial_eps_config(setting:PNMSettingGsm):Tgboolean;cdecl;external libnm;
function nm_setting_gsm_get_initial_eps_apn(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_16 }
function nm_setting_gsm_get_number(setting:PNMSettingGsm):Pchar;cdecl;external libnm;
function nm_setting_gsm_get_pin_flags(setting:PNMSettingGsm):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_gsm_get_password_flags(setting:PNMSettingGsm):TNMSettingSecretFlags;cdecl;external libnm;
{$endif}
{ __NM_SETTING_GSM_H__  }

// === Konventiert am: 19-4-26 19:27:22 ===

function NM_TYPE_SETTING_GSM : TGType;
function NM_SETTING_GSM(obj : Pointer) : PNMSettingGsm;
function NM_SETTING_GSM_CLASS(klass : Pointer) : PNMSettingGsmClass;
function NM_IS_SETTING_GSM(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_GSM_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_GSM_GET_CLASS(obj : Pointer) : PNMSettingGsmClass;

implementation

function NM_TYPE_SETTING_GSM : TGType;
  begin
    NM_TYPE_SETTING_GSM:=nm_setting_gsm_get_type;
  end;

function NM_SETTING_GSM(obj : Pointer) : PNMSettingGsm;
begin
  Result := PNMSettingGsm(g_type_check_instance_cast(obj, NM_TYPE_SETTING_GSM));
end;

function NM_SETTING_GSM_CLASS(klass : Pointer) : PNMSettingGsmClass;
begin
  Result := PNMSettingGsmClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_GSM));
end;

function NM_IS_SETTING_GSM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_GSM);
end;

function NM_IS_SETTING_GSM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_GSM);
end;

function NM_SETTING_GSM_GET_CLASS(obj : Pointer) : PNMSettingGsmClass;
begin
  Result := PNMSettingGsmClass(PGTypeInstance(obj)^.g_class);
end;



end.
