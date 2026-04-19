unit nm_setting_user;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_USER_H__}
{$define __NM_SETTING_USER_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_USER_SETTING_NAME = 'user';  
  NM_SETTING_USER_DATA = 'data';  
type

function nm_setting_user_get_type:TGType;cdecl;external libnm;
function nm_setting_user_new:PNMSetting;cdecl;external libnm;
function nm_setting_user_get_keys(setting:PNMSettingUser; out_len:Pguint):^Pchar;cdecl;external libnm;
function nm_setting_user_get_data(setting:PNMSettingUser; key:Pchar):Pchar;cdecl;external libnm;
function nm_setting_user_set_data(setting:PNMSettingUser; key:Pchar; val:Pchar; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_user_check_key(key:Pchar; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_user_check_val(val:Pchar; error:PPGError):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_USER_H__  }

// === Konventiert am: 19-4-26 19:24:42 ===

function NM_TYPE_SETTING_USER : TGType;
function NM_SETTING_USER(obj : Pointer) : PNMSettingUser;
function NM_SETTING_USER_CLASS(klass : Pointer) : PNMSettingUserClass;
function NM_IS_SETTING_USER(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_USER_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_USER_GET_CLASS(obj : Pointer) : PNMSettingUserClass;

implementation

function NM_TYPE_SETTING_USER : TGType;
  begin
    NM_TYPE_SETTING_USER:=nm_setting_user_get_type;
  end;

function NM_SETTING_USER(obj : Pointer) : PNMSettingUser;
begin
  Result := PNMSettingUser(g_type_check_instance_cast(obj, NM_TYPE_SETTING_USER));
end;

function NM_SETTING_USER_CLASS(klass : Pointer) : PNMSettingUserClass;
begin
  Result := PNMSettingUserClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_USER));
end;

function NM_IS_SETTING_USER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_USER);
end;

function NM_IS_SETTING_USER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_USER);
end;

function NM_SETTING_USER_GET_CLASS(obj : Pointer) : PNMSettingUserClass;
begin
  Result := PNMSettingUserClass(PGTypeInstance(obj)^.g_class);
end;



end.
