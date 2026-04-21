unit nm_device_macvlan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_MACVLAN_H__}
{$define __NM_DEVICE_MACVLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_MACVLAN_PARENT = 'parent';  
  NM_DEVICE_MACVLAN_MODE = 'mode';  
  NM_DEVICE_MACVLAN_NO_PROMISC = 'no-promisc';  
  NM_DEVICE_MACVLAN_TAP = 'tap';  
  NM_DEVICE_MACVLAN_HW_ADDRESS = 'hw-address';  
{*
 * NMDeviceMacvlan:
 *
 * Since: 1.2
  }
type

function nm_device_macvlan_get_type:TGType;cdecl;external libnm;
function nm_device_macvlan_get_parent(device:PNMDeviceMacvlan):PNMDevice;cdecl;external libnm;
function nm_device_macvlan_get_mode(device:PNMDeviceMacvlan):Pchar;cdecl;external libnm;
function nm_device_macvlan_get_no_promisc(device:PNMDeviceMacvlan):Tgboolean;cdecl;external libnm;
function nm_device_macvlan_get_tap(device:PNMDeviceMacvlan):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_macvlan_get_hw_address(device:PNMDeviceMacvlan):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_MACVLAN_H__  }

// === Konventiert am: 19-4-26 19:30:45 ===

function NM_TYPE_DEVICE_MACVLAN : TGType;
function NM_DEVICE_MACVLAN(obj : Pointer) : PNMDeviceMacvlan;
function NM_DEVICE_MACVLAN_CLASS(klass : Pointer) : PNMDeviceMacvlanClass;
function NM_IS_DEVICE_MACVLAN(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_MACVLAN_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_MACVLAN_GET_CLASS(obj : Pointer) : PNMDeviceMacvlanClass;

implementation

function NM_TYPE_DEVICE_MACVLAN : TGType;
  begin
    NM_TYPE_DEVICE_MACVLAN:=nm_device_macvlan_get_type;
  end;

function NM_DEVICE_MACVLAN(obj : Pointer) : PNMDeviceMacvlan;
begin
  Result := PNMDeviceMacvlan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_MACVLAN));
end;

function NM_DEVICE_MACVLAN_CLASS(klass : Pointer) : PNMDeviceMacvlanClass;
begin
  Result := PNMDeviceMacvlanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_MACVLAN));
end;

function NM_IS_DEVICE_MACVLAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_MACVLAN);
end;

function NM_IS_DEVICE_MACVLAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_MACVLAN);
end;

function NM_DEVICE_MACVLAN_GET_CLASS(obj : Pointer) : PNMDeviceMacvlanClass;
begin
  Result := PNMDeviceMacvlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
