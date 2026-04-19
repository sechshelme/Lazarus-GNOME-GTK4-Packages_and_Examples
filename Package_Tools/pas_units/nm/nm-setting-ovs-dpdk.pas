unit nm_setting_ovs_dpdk;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2019 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_DPDK_H__}
{$define __NM_SETTING_OVS_DPDK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_DPDK_SETTING_NAME = 'ovs-dpdk';  
  NM_SETTING_OVS_DPDK_DEVARGS = 'devargs';  
  NM_SETTING_OVS_DPDK_N_RXQ = 'n-rxq';  
  NM_SETTING_OVS_DPDK_N_RXQ_DESC = 'n-rxq-desc';  
  NM_SETTING_OVS_DPDK_N_TXQ_DESC = 'n-txq-desc';  
type

function nm_setting_ovs_dpdk_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_dpdk_new:PNMSetting;cdecl;external libnm;
function nm_setting_ovs_dpdk_get_devargs(self:PNMSettingOvsDpdk):Pchar;cdecl;external libnm;
function nm_setting_ovs_dpdk_get_n_rxq(self:PNMSettingOvsDpdk):Tguint32;cdecl;external libnm;
function nm_setting_ovs_dpdk_get_n_rxq_desc(self:PNMSettingOvsDpdk):Tguint32;cdecl;external libnm;
function nm_setting_ovs_dpdk_get_n_txq_desc(self:PNMSettingOvsDpdk):Tguint32;cdecl;external libnm;
{$endif}
{ __NM_SETTING_OVS_DPDK_H__  }

// === Konventiert am: 19-4-26 19:25:56 ===

function NM_TYPE_SETTING_OVS_DPDK : TGType;
function NM_SETTING_OVS_DPDK(obj : Pointer) : PNMSettingOvsDpdk;
function NM_SETTING_OVS_DPDK_CLASS(klass : Pointer) : PNMSettingOvsDpdkClass;
function NM_IS_SETTING_OVS_DPDK(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_DPDK_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_DPDK_GET_CLASS(obj : Pointer) : PNMSettingOvsDpdkClass;

implementation

function NM_TYPE_SETTING_OVS_DPDK : TGType;
  begin
    NM_TYPE_SETTING_OVS_DPDK:=nm_setting_ovs_dpdk_get_type;
  end;

function NM_SETTING_OVS_DPDK(obj : Pointer) : PNMSettingOvsDpdk;
begin
  Result := PNMSettingOvsDpdk(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_DPDK));
end;

function NM_SETTING_OVS_DPDK_CLASS(klass : Pointer) : PNMSettingOvsDpdkClass;
begin
  Result := PNMSettingOvsDpdkClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_DPDK));
end;

function NM_IS_SETTING_OVS_DPDK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_DPDK);
end;

function NM_IS_SETTING_OVS_DPDK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_DPDK);
end;

function NM_SETTING_OVS_DPDK_GET_CLASS(obj : Pointer) : PNMSettingOvsDpdkClass;
begin
  Result := PNMSettingOvsDpdkClass(PGTypeInstance(obj)^.g_class);
end;



end.
