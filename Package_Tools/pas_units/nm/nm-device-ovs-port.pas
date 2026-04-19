unit nm_device_ovs_port;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017, 2018 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_OVS_PORT_H__}
{$define __NM_DEVICE_OVS_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_OVS_PORT_SLAVES = 'slaves';  
{*
 * NMDeviceOvsPort:
 *
 * Since: 1.10
  }
type

function nm_device_ovs_port_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_34_FOR(nm_device_get_ports) }
function nm_device_ovs_port_get_slaves(device:PNMDeviceOvsPort):PGPtrArray;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_OVS_PORT_H__  }

// === Konventiert am: 19-4-26 19:30:30 ===

function NM_TYPE_DEVICE_OVS_PORT : TGType;
function NM_DEVICE_OVS_PORT(obj : Pointer) : PNMDeviceOvsPort;
function NM_DEVICE_OVS_PORT_CLASS(klass : Pointer) : PNMDeviceOvsPortClass;
function NM_IS_DEVICE_OVS_PORT(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_OVS_PORT_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_OVS_PORT_GET_CLASS(obj : Pointer) : PNMDeviceOvsPortClass;

implementation

function NM_TYPE_DEVICE_OVS_PORT : TGType;
  begin
    NM_TYPE_DEVICE_OVS_PORT:=nm_device_ovs_port_get_type;
  end;

function NM_DEVICE_OVS_PORT(obj : Pointer) : PNMDeviceOvsPort;
begin
  Result := PNMDeviceOvsPort(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OVS_PORT));
end;

function NM_DEVICE_OVS_PORT_CLASS(klass : Pointer) : PNMDeviceOvsPortClass;
begin
  Result := PNMDeviceOvsPortClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OVS_PORT));
end;

function NM_IS_DEVICE_OVS_PORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_OVS_PORT);
end;

function NM_IS_DEVICE_OVS_PORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_OVS_PORT);
end;

function NM_DEVICE_OVS_PORT_GET_CLASS(obj : Pointer) : PNMDeviceOvsPortClass;
begin
  Result := PNMDeviceOvsPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
