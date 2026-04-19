unit nm_setting_ovs_patch;

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
{$ifndef __NM_SETTING_OVS_PATCH_H__}
{$define __NM_SETTING_OVS_PATCH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_PATCH_SETTING_NAME = 'ovs-patch';  
  NM_SETTING_OVS_PATCH_PEER = 'peer';  
type

function nm_setting_ovs_patch_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_patch_new:PNMSetting;cdecl;external libnm;
function nm_setting_ovs_patch_get_peer(self:PNMSettingOvsPatch):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_OVS_PATCH_H__  }

// === Konventiert am: 19-4-26 19:25:39 ===

function NM_TYPE_SETTING_OVS_PATCH : TGType;
function NM_SETTING_OVS_PATCH(obj : Pointer) : PNMSettingOvsPatch;
function NM_SETTING_OVS_PATCH_CLASS(klass : Pointer) : PNMSettingOvsPatchClass;
function NM_IS_SETTING_OVS_PATCH(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_PATCH_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_PATCH_GET_CLASS(obj : Pointer) : PNMSettingOvsPatchClass;

implementation

function NM_TYPE_SETTING_OVS_PATCH : TGType;
  begin
    NM_TYPE_SETTING_OVS_PATCH:=nm_setting_ovs_patch_get_type;
  end;

function NM_SETTING_OVS_PATCH(obj : Pointer) : PNMSettingOvsPatch;
begin
  Result := PNMSettingOvsPatch(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_PATCH));
end;

function NM_SETTING_OVS_PATCH_CLASS(klass : Pointer) : PNMSettingOvsPatchClass;
begin
  Result := PNMSettingOvsPatchClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_PATCH));
end;

function NM_IS_SETTING_OVS_PATCH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_PATCH);
end;

function NM_IS_SETTING_OVS_PATCH_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_PATCH);
end;

function NM_SETTING_OVS_PATCH_GET_CLASS(obj : Pointer) : PNMSettingOvsPatchClass;
begin
  Result := PNMSettingOvsPatchClass(PGTypeInstance(obj)^.g_class);
end;



end.
