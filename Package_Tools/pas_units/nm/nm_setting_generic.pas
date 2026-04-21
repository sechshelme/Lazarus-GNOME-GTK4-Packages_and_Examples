unit nm_setting_generic;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_GENERIC_H__}
{$define __NM_SETTING_GENERIC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_GENERIC_SETTING_NAME = 'generic';  
  NM_SETTING_GENERIC_DEVICE_HANDLER = 'device-handler';  
type

function nm_setting_generic_get_type:TGType;cdecl;external libnm;
function nm_setting_generic_new:PNMSetting;cdecl;external libnm;
function nm_setting_generic_get_device_handler(setting:PNMSettingGeneric):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_GENERIC_H__  }

// === Konventiert am: 19-4-26 19:27:26 ===

function NM_TYPE_SETTING_GENERIC : TGType;
function NM_SETTING_GENERIC(obj : Pointer) : PNMSettingGeneric;
function NM_SETTING_GENERIC_CLASS(klass : Pointer) : PNMSettingGenericClass;
function NM_IS_SETTING_GENERIC(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_GENERIC_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_GENERIC_GET_CLASS(obj : Pointer) : PNMSettingGenericClass;

implementation

function NM_TYPE_SETTING_GENERIC : TGType;
  begin
    NM_TYPE_SETTING_GENERIC:=nm_setting_generic_get_type;
  end;

function NM_SETTING_GENERIC(obj : Pointer) : PNMSettingGeneric;
begin
  Result := PNMSettingGeneric(g_type_check_instance_cast(obj, NM_TYPE_SETTING_GENERIC));
end;

function NM_SETTING_GENERIC_CLASS(klass : Pointer) : PNMSettingGenericClass;
begin
  Result := PNMSettingGenericClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_GENERIC));
end;

function NM_IS_SETTING_GENERIC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_GENERIC);
end;

function NM_IS_SETTING_GENERIC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_GENERIC);
end;

function NM_SETTING_GENERIC_GET_CLASS(obj : Pointer) : PNMSettingGenericClass;
begin
  Result := PNMSettingGenericClass(PGTypeInstance(obj)^.g_class);
end;



end.
