
unit nm-setting-gsm;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-gsm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-gsm.h
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
PNMSettingGsm  = ^NMSettingGsm;
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

{ was #define dname def_expr }
function NM_TYPE_SETTING_GSM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GSM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GSM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM_GET_CLASS(obj : longint) : longint;

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

function nm_setting_gsm_get_type:TGType;cdecl;external;
function nm_setting_gsm_new:PNMSetting;cdecl;external;
function nm_setting_gsm_get_auto_config(setting:PNMSettingGsm):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_username(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_password(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_apn(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_network_id(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_pin(setting:PNMSettingGsm):Pchar;cdecl;external;
function nm_setting_gsm_get_home_only(setting:PNMSettingGsm):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_device_id(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_sim_id(setting:PNMSettingGsm):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_sim_operator_id(setting:PNMSettingGsm):Pchar;cdecl;external;
function nm_setting_gsm_get_mtu(setting:PNMSettingGsm):Tguint32;cdecl;external;
function nm_setting_gsm_get_initial_eps_config(setting:PNMSettingGsm):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_gsm_get_initial_eps_apn(setting:PNMSettingGsm):Pchar;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_16 }
(* Const before type ignored *)
function nm_setting_gsm_get_number(setting:PNMSettingGsm):Pchar;cdecl;external;
function nm_setting_gsm_get_pin_flags(setting:PNMSettingGsm):TNMSettingSecretFlags;cdecl;external;
function nm_setting_gsm_get_password_flags(setting:PNMSettingGsm):TNMSettingSecretFlags;cdecl;external;
{$endif}
{ __NM_SETTING_GSM_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_GSM : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_GSM:=nm_setting_gsm_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM(obj : longint) : longint;
begin
  NM_SETTING_GSM:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_GSM,NMSettingGsm);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM_CLASS(klass : longint) : longint;
begin
  NM_SETTING_GSM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_GSM,NMSettingGsmClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GSM(obj : longint) : longint;
begin
  NM_IS_SETTING_GSM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_GSM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GSM_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_GSM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_GSM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GSM_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_GSM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_GSM,NMSettingGsmClass);
end;


end.
