unit nm_setting_ovs_other_config;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 - 2020, 2022 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_OTHER_CONFIG_H__}
{$define __NM_SETTING_OVS_OTHER_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_OTHER_CONFIG_SETTING_NAME = 'ovs-other-config';  
  NM_SETTING_OVS_OTHER_CONFIG_DATA = 'data';  
type

function nm_setting_ovs_other_config_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_other_config_new:PNMSetting;cdecl;external libnm;
{*************************************************************************** }
function nm_setting_ovs_other_config_get_data_keys(setting:PNMSettingOvsOtherConfig; out_len:Pguint):^Pchar;cdecl;external libnm;
function nm_setting_ovs_other_config_get_data(setting:PNMSettingOvsOtherConfig; key:Pchar):Pchar;cdecl;external libnm;
procedure nm_setting_ovs_other_config_set_data(setting:PNMSettingOvsOtherConfig; key:Pchar; val:Pchar);cdecl;external libnm;
{*************************************************************************** }
{$endif}
{ __NM_SETTING_OVS_OTHER_CONFIG_H__  }

// === Konventiert am: 19-4-26 19:25:44 ===

function NM_TYPE_SETTING_OVS_OTHER_CONFIG : TGType;
function NM_SETTING_OVS_OTHER_CONFIG(obj : Pointer) : PNMSettingOvsOtherConfig;
function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass : Pointer) : PNMSettingOvsOtherConfigClass;
function NM_IS_SETTING_OVS_OTHER_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingOvsOtherConfigClass;

implementation

function NM_TYPE_SETTING_OVS_OTHER_CONFIG : TGType;
  begin
    NM_TYPE_SETTING_OVS_OTHER_CONFIG:=nm_setting_ovs_other_config_get_type;
  end;

function NM_SETTING_OVS_OTHER_CONFIG(obj : Pointer) : PNMSettingOvsOtherConfig;
begin
  Result := PNMSettingOvsOtherConfig(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_OTHER_CONFIG));
end;

function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass : Pointer) : PNMSettingOvsOtherConfigClass;
begin
  Result := PNMSettingOvsOtherConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_OTHER_CONFIG));
end;

function NM_IS_SETTING_OVS_OTHER_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingOvsOtherConfigClass;
begin
  Result := PNMSettingOvsOtherConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
