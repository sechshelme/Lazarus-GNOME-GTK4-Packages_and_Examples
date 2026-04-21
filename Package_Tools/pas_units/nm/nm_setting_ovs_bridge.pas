unit nm_setting_ovs_bridge;

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
{$ifndef __NM_SETTING_OVS_BRIDGE_H__}
{$define __NM_SETTING_OVS_BRIDGE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_BRIDGE_SETTING_NAME = 'ovs-bridge';  
  NM_SETTING_OVS_BRIDGE_FAIL_MODE = 'fail-mode';  
  NM_SETTING_OVS_BRIDGE_MCAST_SNOOPING_ENABLE = 'mcast-snooping-enable';  
  NM_SETTING_OVS_BRIDGE_RSTP_ENABLE = 'rstp-enable';  
  NM_SETTING_OVS_BRIDGE_STP_ENABLE = 'stp-enable';  
  NM_SETTING_OVS_BRIDGE_DATAPATH_TYPE = 'datapath-type';  
type

function nm_setting_ovs_bridge_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_bridge_new:PNMSetting;cdecl;external libnm;
function nm_setting_ovs_bridge_get_fail_mode(self:PNMSettingOvsBridge):Pchar;cdecl;external libnm;
function nm_setting_ovs_bridge_get_mcast_snooping_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external libnm;
function nm_setting_ovs_bridge_get_rstp_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external libnm;
function nm_setting_ovs_bridge_get_stp_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external libnm;
function nm_setting_ovs_bridge_get_datapath_type(self:PNMSettingOvsBridge):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_OVS_BRIDGE_H__  }

// === Konventiert am: 19-4-26 19:26:01 ===

function NM_TYPE_SETTING_OVS_BRIDGE : TGType;
function NM_SETTING_OVS_BRIDGE(obj : Pointer) : PNMSettingOvsBridge;
function NM_SETTING_OVS_BRIDGE_CLASS(klass : Pointer) : PNMSettingOvsBridgeClass;
function NM_IS_SETTING_OVS_BRIDGE(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj : Pointer) : PNMSettingOvsBridgeClass;

implementation

function NM_TYPE_SETTING_OVS_BRIDGE : TGType;
  begin
    NM_TYPE_SETTING_OVS_BRIDGE:=nm_setting_ovs_bridge_get_type;
  end;

function NM_SETTING_OVS_BRIDGE(obj : Pointer) : PNMSettingOvsBridge;
begin
  Result := PNMSettingOvsBridge(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_BRIDGE));
end;

function NM_SETTING_OVS_BRIDGE_CLASS(klass : Pointer) : PNMSettingOvsBridgeClass;
begin
  Result := PNMSettingOvsBridgeClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_BRIDGE));
end;

function NM_IS_SETTING_OVS_BRIDGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_BRIDGE);
end;

function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_BRIDGE);
end;

function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj : Pointer) : PNMSettingOvsBridgeClass;
begin
  Result := PNMSettingOvsBridgeClass(PGTypeInstance(obj)^.g_class);
end;



end.
