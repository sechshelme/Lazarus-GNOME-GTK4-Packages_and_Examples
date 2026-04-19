unit nm_setting_adsl;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_ADSL_H__}
{$define __NM_SETTING_ADSL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_ADSL_SETTING_NAME = 'adsl';  
  NM_SETTING_ADSL_USERNAME = 'username';  
  NM_SETTING_ADSL_PASSWORD = 'password';  
  NM_SETTING_ADSL_PASSWORD_FLAGS = 'password-flags';  
  NM_SETTING_ADSL_PROTOCOL = 'protocol';  
  NM_SETTING_ADSL_ENCAPSULATION = 'encapsulation';  
  NM_SETTING_ADSL_VPI = 'vpi';  
  NM_SETTING_ADSL_VCI = 'vci';  
  NM_SETTING_ADSL_PROTOCOL_PPPOA = 'pppoa';  
  NM_SETTING_ADSL_PROTOCOL_PPPOE = 'pppoe';  
  NM_SETTING_ADSL_PROTOCOL_IPOATM = 'ipoatm';  
  NM_SETTING_ADSL_ENCAPSULATION_VCMUX = 'vcmux';  
  NM_SETTING_ADSL_ENCAPSULATION_LLC = 'llc';  
type

function nm_setting_adsl_get_type:TGType;cdecl;external libnm;
function nm_setting_adsl_new:PNMSetting;cdecl;external libnm;
function nm_setting_adsl_get_username(setting:PNMSettingAdsl):Pchar;cdecl;external libnm;
function nm_setting_adsl_get_password(setting:PNMSettingAdsl):Pchar;cdecl;external libnm;
function nm_setting_adsl_get_protocol(setting:PNMSettingAdsl):Pchar;cdecl;external libnm;
function nm_setting_adsl_get_encapsulation(setting:PNMSettingAdsl):Pchar;cdecl;external libnm;
function nm_setting_adsl_get_vpi(setting:PNMSettingAdsl):Tguint32;cdecl;external libnm;
function nm_setting_adsl_get_vci(setting:PNMSettingAdsl):Tguint32;cdecl;external libnm;
function nm_setting_adsl_get_password_flags(setting:PNMSettingAdsl):TNMSettingSecretFlags;cdecl;external libnm;
{$endif}
{ __NM_SETTING_ADSL_H__  }

// === Konventiert am: 19-4-26 19:28:08 ===

function NM_TYPE_SETTING_ADSL : TGType;
function NM_SETTING_ADSL(obj : Pointer) : PNMSettingAdsl;
function NM_SETTING_ADSL_CLASS(klass : Pointer) : PNMSettingAdslClass;
function NM_IS_SETTING_ADSL(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_ADSL_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_ADSL_GET_CLASS(obj : Pointer) : PNMSettingAdslClass;

implementation

function NM_TYPE_SETTING_ADSL : TGType;
  begin
    NM_TYPE_SETTING_ADSL:=nm_setting_adsl_get_type;
  end;

function NM_SETTING_ADSL(obj : Pointer) : PNMSettingAdsl;
begin
  Result := PNMSettingAdsl(g_type_check_instance_cast(obj, NM_TYPE_SETTING_ADSL));
end;

function NM_SETTING_ADSL_CLASS(klass : Pointer) : PNMSettingAdslClass;
begin
  Result := PNMSettingAdslClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_ADSL));
end;

function NM_IS_SETTING_ADSL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_ADSL);
end;

function NM_IS_SETTING_ADSL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_ADSL);
end;

function NM_SETTING_ADSL_GET_CLASS(obj : Pointer) : PNMSettingAdslClass;
begin
  Result := PNMSettingAdslClass(PGTypeInstance(obj)^.g_class);
end;



end.
