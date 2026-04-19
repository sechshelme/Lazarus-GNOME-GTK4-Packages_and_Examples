unit nm_setting_vlan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_VLAN_H__}
{$define __NM_SETTING_VLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_VLAN_SETTING_NAME = 'vlan';  
  NM_SETTING_VLAN_PARENT = 'parent';  
  NM_SETTING_VLAN_ID = 'id';  
  NM_SETTING_VLAN_FLAGS = 'flags';  
  NM_SETTING_VLAN_PROTOCOL = 'protocol';  
  NM_SETTING_VLAN_INGRESS_PRIORITY_MAP = 'ingress-priority-map';  
  NM_SETTING_VLAN_EGRESS_PRIORITY_MAP = 'egress-priority-map';  
type
{*
 * NMVlanPriorityMap:
 * @NM_VLAN_INGRESS_MAP: map for incoming data
 * @NM_VLAN_EGRESS_MAP: map for outgoing data
 *
 * A selector for traffic priority maps; these map Linux SKB priorities
 * to 802.1p priorities used in VLANs.
 * }

  PNMVlanPriorityMap = ^TNMVlanPriorityMap;
  TNMVlanPriorityMap =  Longint;
  Const
    NM_VLAN_INGRESS_MAP = 0;
    NM_VLAN_EGRESS_MAP = 1;
;
{*
 * NMVlanFlags:
 * @NM_VLAN_FLAG_REORDER_HEADERS: indicates that this interface should reorder
 *  outgoing packet headers to look more like a non-VLAN Ethernet interface
 * @NM_VLAN_FLAG_GVRP: indicates that this interface should use GVRP to register
 *  itself with its switch
 * @NM_VLAN_FLAG_LOOSE_BINDING: indicates that this interface's operating
 *  state is tied to the underlying network interface but other details
 *  (like routing) are not.
 * @NM_VLAN_FLAG_MVRP: indicates that this interface should use MVRP to register
 *  itself with its switch
 *
 * #NMVlanFlags values control the behavior of the VLAN interface.
 * }
{< flags > }{ NOTE: if adding flags update nm-setting-vlan.c::verify()  }
{ NOTE: these flags must correspond to the value from the kernel
     * header files.  }
type
  PNMVlanFlags = ^TNMVlanFlags;
  TNMVlanFlags =  Longint;
  Const
    NM_VLAN_FLAG_REORDER_HEADERS = $1;
    NM_VLAN_FLAG_GVRP = $2;
    NM_VLAN_FLAG_LOOSE_BINDING = $4;
    NM_VLAN_FLAG_MVRP = $8;
;
  NM_VLAN_FLAGS_ALL = ((NM_VLAN_FLAG_REORDER_HEADERS or NM_VLAN_FLAG_GVRP) or NM_VLAN_FLAG_LOOSE_BINDING) or NM_VLAN_FLAG_MVRP;  

function nm_setting_vlan_get_type:TGType;cdecl;external libnm;
function nm_setting_vlan_new:PNMSetting;cdecl;external libnm;
function nm_setting_vlan_get_parent(setting:PNMSettingVlan):Pchar;cdecl;external libnm;
function nm_setting_vlan_get_id(setting:PNMSettingVlan):Tguint32;cdecl;external libnm;
function nm_setting_vlan_get_flags(setting:PNMSettingVlan):Tguint32;cdecl;external libnm;
function nm_setting_vlan_get_protocol(setting:PNMSettingVlan):Pchar;cdecl;external libnm;
function nm_setting_vlan_get_num_priorities(setting:PNMSettingVlan; map:TNMVlanPriorityMap):Tgint32;cdecl;external libnm;
function nm_setting_vlan_get_priority(setting:PNMSettingVlan; map:TNMVlanPriorityMap; idx:Tguint32; out_from:Pguint32; out_to:Pguint32):Tgboolean;cdecl;external libnm;
function nm_setting_vlan_add_priority(setting:PNMSettingVlan; map:TNMVlanPriorityMap; from:Tguint32; to:Tguint32):Tgboolean;cdecl;external libnm;
procedure nm_setting_vlan_remove_priority(setting:PNMSettingVlan; map:TNMVlanPriorityMap; idx:Tguint32);cdecl;external libnm;
function nm_setting_vlan_remove_priority_by_value(setting:PNMSettingVlan; map:TNMVlanPriorityMap; from:Tguint32; to:Tguint32):Tgboolean;cdecl;external libnm;
function nm_setting_vlan_remove_priority_str_by_value(setting:PNMSettingVlan; map:TNMVlanPriorityMap; str:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_vlan_clear_priorities(setting:PNMSettingVlan; map:TNMVlanPriorityMap);cdecl;external libnm;
function nm_setting_vlan_add_priority_str(setting:PNMSettingVlan; map:TNMVlanPriorityMap; str:Pchar):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_VLAN_H__  }

// === Konventiert am: 19-4-26 19:21:44 ===

function NM_TYPE_SETTING_VLAN : TGType;
function NM_SETTING_VLAN(obj : Pointer) : PNMSettingVlan;
function NM_SETTING_VLAN_CLASS(klass : Pointer) : PNMSettingVlanClass;
function NM_IS_SETTING_VLAN(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_VLAN_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_VLAN_GET_CLASS(obj : Pointer) : PNMSettingVlanClass;

implementation

function NM_TYPE_SETTING_VLAN : TGType;
  begin
    NM_TYPE_SETTING_VLAN:=nm_setting_vlan_get_type;
  end;

function NM_SETTING_VLAN(obj : Pointer) : PNMSettingVlan;
begin
  Result := PNMSettingVlan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VLAN));
end;

function NM_SETTING_VLAN_CLASS(klass : Pointer) : PNMSettingVlanClass;
begin
  Result := PNMSettingVlanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VLAN));
end;

function NM_IS_SETTING_VLAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_VLAN);
end;

function NM_IS_SETTING_VLAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_VLAN);
end;

function NM_SETTING_VLAN_GET_CLASS(obj : Pointer) : PNMSettingVlanClass;
begin
  Result := PNMSettingVlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
