unit nm_device_hsr;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2023 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_HSR_H__}
{$define __NM_DEVICE_HSR_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_HSR_PORT1 = 'port1';  
  NM_DEVICE_HSR_PORT2 = 'port2';  
  NM_DEVICE_HSR_SUPERVISION_ADDRESS = 'supervision-address';  
  NM_DEVICE_HSR_MULTICAST_SPEC = 'multicast-spec';  
  NM_DEVICE_HSR_PRP = 'prp';  
{*
 * NMDeviceHsr:
 *
 * Since: 1.46
  }
type

function nm_device_hsr_get_type:TGType;cdecl;external libnm;
function nm_device_hsr_get_port1(device:PNMDeviceHsr):PNMDevice;cdecl;external libnm;
function nm_device_hsr_get_port2(device:PNMDeviceHsr):PNMDevice;cdecl;external libnm;
function nm_device_hsr_get_supervision_address(device:PNMDeviceHsr):Pchar;cdecl;external libnm;
function nm_device_hsr_get_multicast_spec(device:PNMDeviceHsr):Tguint8;cdecl;external libnm;
function nm_device_hsr_get_prp(device:PNMDeviceHsr):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_HSR_H__  }

// === Konventiert am: 19-4-26 19:31:01 ===

function NM_TYPE_DEVICE_HSR : TGType;
function NM_DEVICE_HSR(obj : Pointer) : PNMDeviceHsr;
function NM_DEVICE_HSR_CLASS(klass : Pointer) : PNMDeviceHsClass;
function NM_IS_DEVICE_HSR(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_HSR_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_HSR_GET_CLASS(obj : Pointer) : PNMDeviceHsClass;

implementation

function NM_TYPE_DEVICE_HSR : TGType;
  begin
    NM_TYPE_DEVICE_HSR:=nm_device_hsr_get_type;
  end;

function NM_DEVICE_HSR(obj : Pointer) : PNMDeviceHsr;
begin
  Result := PNMDeviceHsr(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_HSR));
end;

function NM_DEVICE_HSR_CLASS(klass : Pointer) : PNMDeviceHsClass;
begin
  Result := PNMDeviceHsClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_HSR));
end;

function NM_IS_DEVICE_HSR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_HSR);
end;

function NM_IS_DEVICE_HSR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_HSR);
end;

function NM_DEVICE_HSR_GET_CLASS(obj : Pointer) : PNMDeviceHsClass;
begin
  Result := PNMDeviceHsClass(PGTypeInstance(obj)^.g_class);
end;



end.
