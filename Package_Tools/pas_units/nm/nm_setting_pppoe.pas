unit nm_setting_pppoe;

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
{$ifndef __NM_SETTING_PPPOE_H__}
{$define __NM_SETTING_PPPOE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_PPPOE_SETTING_NAME = 'pppoe';  
  NM_SETTING_PPPOE_PARENT = 'parent';  
  NM_SETTING_PPPOE_SERVICE = 'service';  
  NM_SETTING_PPPOE_USERNAME = 'username';  
  NM_SETTING_PPPOE_PASSWORD = 'password';  
  NM_SETTING_PPPOE_PASSWORD_FLAGS = 'password-flags';  
type

function nm_setting_pppoe_get_type:TGType;cdecl;external libnm;
function nm_setting_pppoe_new:PNMSetting;cdecl;external libnm;
function nm_setting_pppoe_get_parent(setting:PNMSettingPppoe):Pchar;cdecl;external libnm;
function nm_setting_pppoe_get_service(setting:PNMSettingPppoe):Pchar;cdecl;external libnm;
function nm_setting_pppoe_get_username(setting:PNMSettingPppoe):Pchar;cdecl;external libnm;
function nm_setting_pppoe_get_password(setting:PNMSettingPppoe):Pchar;cdecl;external libnm;
function nm_setting_pppoe_get_password_flags(setting:PNMSettingPppoe):TNMSettingSecretFlags;cdecl;external libnm;
{$endif}
{ __NM_SETTING_PPPOE_H__  }

// === Konventiert am: 19-4-26 19:25:24 ===

function NM_TYPE_SETTING_PPPOE : TGType;
function NM_SETTING_PPPOE(obj : Pointer) : PNMSettingPppoe;
function NM_SETTING_PPPOE_CLASS(klass : Pointer) : PNMSettingPppoeClass;
function NM_IS_SETTING_PPPOE(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_PPPOE_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_PPPOE_GET_CLASS(obj : Pointer) : PNMSettingPppoeClass;

implementation

function NM_TYPE_SETTING_PPPOE : TGType;
  begin
    NM_TYPE_SETTING_PPPOE:=nm_setting_pppoe_get_type;
  end;

function NM_SETTING_PPPOE(obj : Pointer) : PNMSettingPppoe;
begin
  Result := PNMSettingPppoe(g_type_check_instance_cast(obj, NM_TYPE_SETTING_PPPOE));
end;

function NM_SETTING_PPPOE_CLASS(klass : Pointer) : PNMSettingPppoeClass;
begin
  Result := PNMSettingPppoeClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_PPPOE));
end;

function NM_IS_SETTING_PPPOE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_PPPOE);
end;

function NM_IS_SETTING_PPPOE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_PPPOE);
end;

function NM_SETTING_PPPOE_GET_CLASS(obj : Pointer) : PNMSettingPppoeClass;
begin
  Result := PNMSettingPppoeClass(PGTypeInstance(obj)^.g_class);
end;



end.
