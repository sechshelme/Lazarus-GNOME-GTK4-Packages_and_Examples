unit nm_device_ovs_interface;

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
{$ifndef __NM_DEVICE_OVS_INTERFACE_H__}
{$define __NM_DEVICE_OVS_INTERFACE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{*
 * NMDeviceOvsInterface:
 *
 * Since: 1.10
  }
type

function nm_device_ovs_interface_get_type:TGType;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_OVS_INTERFACE_H__  }

// === Konventiert am: 19-4-26 19:30:33 ===

function NM_TYPE_DEVICE_OVS_INTERFACE : TGType;
function NM_DEVICE_OVS_INTERFACE(obj : Pointer) : PNMDeviceOvsInterface;
function NM_DEVICE_OVS_INTERFACE_CLASS(klass : Pointer) : PNMDeviceOvsInterfaceClass;
function NM_IS_DEVICE_OVS_INTERFACE(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_OVS_INTERFACE_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_OVS_INTERFACE_GET_CLASS(obj : Pointer) : PNMDeviceOvsInterfaceClass;

implementation

function NM_TYPE_DEVICE_OVS_INTERFACE : TGType;
  begin
    NM_TYPE_DEVICE_OVS_INTERFACE:=nm_device_ovs_interface_get_type;
  end;

function NM_DEVICE_OVS_INTERFACE(obj : Pointer) : PNMDeviceOvsInterface;
begin
  Result := PNMDeviceOvsInterface(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OVS_INTERFACE));
end;

function NM_DEVICE_OVS_INTERFACE_CLASS(klass : Pointer) : PNMDeviceOvsInterfaceClass;
begin
  Result := PNMDeviceOvsInterfaceClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OVS_INTERFACE));
end;

function NM_IS_DEVICE_OVS_INTERFACE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_OVS_INTERFACE);
end;

function NM_IS_DEVICE_OVS_INTERFACE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_OVS_INTERFACE);
end;

function NM_DEVICE_OVS_INTERFACE_GET_CLASS(obj : Pointer) : PNMDeviceOvsInterfaceClass;
begin
  Result := PNMDeviceOvsInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



end.
