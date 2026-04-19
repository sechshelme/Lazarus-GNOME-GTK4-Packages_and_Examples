unit nm_device_veth;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2020 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_VETH_H__}
{$define __NM_DEVICE_VETH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_VETH_PEER = 'peer';  
{*
 * NMDeviceVeth:
 *
 * Since: 1.30
  }
type

function nm_device_veth_get_type:TGType;cdecl;external libnm;
function nm_device_veth_get_peer(device:PNMDeviceVeth):PNMDevice;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_VETH_H__  }

// === Konventiert am: 19-4-26 19:30:14 ===

function NM_TYPE_DEVICE_VETH : TGType;
function NM_DEVICE_VETH(obj : Pointer) : PNMDeviceVeth;
function NM_DEVICE_VETH_CLASS(klass : Pointer) : PNMDeviceVethClass;
function NM_IS_DEVICE_VETH(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_VETH_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_VETH_GET_CLASS(obj : Pointer) : PNMDeviceVethClass;

implementation

function NM_TYPE_DEVICE_VETH : TGType;
  begin
    NM_TYPE_DEVICE_VETH:=nm_device_veth_get_type;
  end;

function NM_DEVICE_VETH(obj : Pointer) : PNMDeviceVeth;
begin
  Result := PNMDeviceVeth(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VETH));
end;

function NM_DEVICE_VETH_CLASS(klass : Pointer) : PNMDeviceVethClass;
begin
  Result := PNMDeviceVethClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VETH));
end;

function NM_IS_DEVICE_VETH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_VETH);
end;

function NM_IS_DEVICE_VETH_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_VETH);
end;

function NM_DEVICE_VETH_GET_CLASS(obj : Pointer) : PNMDeviceVethClass;
begin
  Result := PNMDeviceVethClass(PGTypeInstance(obj)^.g_class);
end;



end.
