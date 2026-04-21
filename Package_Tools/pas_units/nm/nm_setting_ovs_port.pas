unit nm_setting_ovs_port;

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
{$ifndef __NM_SETTING_OVS_PORT_H__}
{$define __NM_SETTING_OVS_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_PORT_SETTING_NAME = 'ovs-port';  
  NM_SETTING_OVS_PORT_VLAN_MODE = 'vlan-mode';  
  NM_SETTING_OVS_PORT_TAG = 'tag';  
  NM_SETTING_OVS_PORT_TRUNKS = 'trunks';  
  NM_SETTING_OVS_PORT_LACP = 'lacp';  
  NM_SETTING_OVS_PORT_BOND_MODE = 'bond-mode';  
  NM_SETTING_OVS_PORT_BOND_UPDELAY = 'bond-updelay';  
  NM_SETTING_OVS_PORT_BOND_DOWNDELAY = 'bond-downdelay';  
type

function nm_setting_ovs_port_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_port_new:PNMSetting;cdecl;external libnm;
function nm_setting_ovs_port_get_vlan_mode(self:PNMSettingOvsPort):Pchar;cdecl;external libnm;
function nm_setting_ovs_port_get_tag(self:PNMSettingOvsPort):Tguint;cdecl;external libnm;
function nm_setting_ovs_port_get_lacp(self:PNMSettingOvsPort):Pchar;cdecl;external libnm;
function nm_setting_ovs_port_get_bond_mode(self:PNMSettingOvsPort):Pchar;cdecl;external libnm;
function nm_setting_ovs_port_get_bond_updelay(self:PNMSettingOvsPort):Tguint;cdecl;external libnm;
function nm_setting_ovs_port_get_bond_downdelay(self:PNMSettingOvsPort):Tguint;cdecl;external libnm;
procedure nm_setting_ovs_port_add_trunk(setting:PNMSettingOvsPort; trunk:PNMRange);cdecl;external libnm;
function nm_setting_ovs_port_get_num_trunks(setting:PNMSettingOvsPort):Tguint;cdecl;external libnm;
function nm_setting_ovs_port_get_trunk(setting:PNMSettingOvsPort; idx:Tguint):PNMRange;cdecl;external libnm;
procedure nm_setting_ovs_port_remove_trunk(setting:PNMSettingOvsPort; idx:Tguint);cdecl;external libnm;
function nm_setting_ovs_port_remove_trunk_by_value(setting:PNMSettingOvsPort; start:Tguint; end:Tguint):Tgboolean;cdecl;external libnm;
procedure nm_setting_ovs_port_clear_trunks(setting:PNMSettingOvsPort);cdecl;external libnm;
{$endif}
{ __NM_SETTING_OVS_PORT_H__  }

// === Konventiert am: 19-4-26 19:25:35 ===

function NM_TYPE_SETTING_OVS_PORT : TGType;
function NM_SETTING_OVS_PORT(obj : Pointer) : PNMSettingOvsPort;
function NM_SETTING_OVS_PORT_CLASS(klass : Pointer) : PNMSettingOvsPortClass;
function NM_IS_SETTING_OVS_PORT(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_PORT_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_PORT_GET_CLASS(obj : Pointer) : PNMSettingOvsPortClass;

implementation

function NM_TYPE_SETTING_OVS_PORT : TGType;
  begin
    NM_TYPE_SETTING_OVS_PORT:=nm_setting_ovs_port_get_type;
  end;

function NM_SETTING_OVS_PORT(obj : Pointer) : PNMSettingOvsPort;
begin
  Result := PNMSettingOvsPort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_PORT));
end;

function NM_SETTING_OVS_PORT_CLASS(klass : Pointer) : PNMSettingOvsPortClass;
begin
  Result := PNMSettingOvsPortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_PORT));
end;

function NM_IS_SETTING_OVS_PORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_PORT);
end;

function NM_IS_SETTING_OVS_PORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_PORT);
end;

function NM_SETTING_OVS_PORT_GET_CLASS(obj : Pointer) : PNMSettingOvsPortClass;
begin
  Result := PNMSettingOvsPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
