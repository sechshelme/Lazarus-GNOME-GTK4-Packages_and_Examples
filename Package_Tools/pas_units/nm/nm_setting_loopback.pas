unit nm_setting_loopback;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2022 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_LOOPBACK_H__}
{$define __NM_SETTING_LOOPBACK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_LOOPBACK_SETTING_NAME = 'loopback';  
  NM_SETTING_LOOPBACK_MTU = 'mtu';  
type

function nm_setting_loopback_get_type:TGType;cdecl;external libnm;
function nm_setting_loopback_new:PNMSetting;cdecl;external libnm;
function nm_setting_loopback_get_mtu(setting:PNMSettingLoopback):Tguint32;cdecl;external libnm;
{$endif}
{ __NM_SETTING_LOOPBACK_H__  }

// === Konventiert am: 19-4-26 19:26:21 ===

function NM_TYPE_SETTING_LOOPBACK : TGType;
function NM_SETTING_LOOPBACK(obj : Pointer) : PNMSettingLoopback;
function NM_SETTING_LOOPBACK_CLASS(klass : Pointer) : PNMSettingLoopbackClass;
function NM_IS_SETTING_LOOPBACK(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_LOOPBACK_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_LOOPBACK_GET_CLASS(obj : Pointer) : PNMSettingLoopbackClass;

implementation

function NM_TYPE_SETTING_LOOPBACK : TGType;
  begin
    NM_TYPE_SETTING_LOOPBACK:=nm_setting_loopback_get_type;
  end;

function NM_SETTING_LOOPBACK(obj : Pointer) : PNMSettingLoopback;
begin
  Result := PNMSettingLoopback(g_type_check_instance_cast(obj, NM_TYPE_SETTING_LOOPBACK));
end;

function NM_SETTING_LOOPBACK_CLASS(klass : Pointer) : PNMSettingLoopbackClass;
begin
  Result := PNMSettingLoopbackClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_LOOPBACK));
end;

function NM_IS_SETTING_LOOPBACK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_LOOPBACK);
end;

function NM_IS_SETTING_LOOPBACK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_LOOPBACK);
end;

function NM_SETTING_LOOPBACK_GET_CLASS(obj : Pointer) : PNMSettingLoopbackClass;
begin
  Result := PNMSettingLoopbackClass(PGTypeInstance(obj)^.g_class);
end;



end.
