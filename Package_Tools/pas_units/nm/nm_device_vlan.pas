unit nm_device_vlan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_VLAN_H__}
{$define __NM_DEVICE_VLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_VLAN_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_VLAN_CARRIER = 'carrier';  
  NM_DEVICE_VLAN_PARENT = 'parent';  
  NM_DEVICE_VLAN_VLAN_ID = 'vlan-id';  
{*
 * NMDeviceVlan:
  }
type

function nm_device_vlan_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_vlan_get_hw_address(device:PNMDeviceVlan):Pchar;cdecl;external libnm;
function nm_device_vlan_get_carrier(device:PNMDeviceVlan):Tgboolean;cdecl;external libnm;
function nm_device_vlan_get_parent(device:PNMDeviceVlan):PNMDevice;cdecl;external libnm;
function nm_device_vlan_get_vlan_id(device:PNMDeviceVlan):Tguint;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_VLAN_H__  }

// === Konventiert am: 19-4-26 19:30:12 ===

function NM_TYPE_DEVICE_VLAN : TGType;
function NM_DEVICE_VLAN(obj : Pointer) : PNMDeviceVlan;
function NM_DEVICE_VLAN_CLASS(klass : Pointer) : PNMDeviceVlanClass;
function NM_IS_DEVICE_VLAN(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_VLAN_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_VLAN_GET_CLASS(obj : Pointer) : PNMDeviceVlanClass;

implementation

function NM_TYPE_DEVICE_VLAN : TGType;
  begin
    NM_TYPE_DEVICE_VLAN:=nm_device_vlan_get_type;
  end;

function NM_DEVICE_VLAN(obj : Pointer) : PNMDeviceVlan;
begin
  Result := PNMDeviceVlan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VLAN));
end;

function NM_DEVICE_VLAN_CLASS(klass : Pointer) : PNMDeviceVlanClass;
begin
  Result := PNMDeviceVlanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VLAN));
end;

function NM_IS_DEVICE_VLAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_VLAN);
end;

function NM_IS_DEVICE_VLAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_VLAN);
end;

function NM_DEVICE_VLAN_GET_CLASS(obj : Pointer) : PNMDeviceVlanClass;
begin
  Result := PNMDeviceVlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
