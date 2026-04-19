unit nm_device_infiniband;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2012 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_INFINIBAND_H__}
{$define __NM_DEVICE_INFINIBAND_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_INFINIBAND_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_INFINIBAND_CARRIER = 'carrier';  
{*
 * NMDeviceInfiniband:
  }
type

function nm_device_infiniband_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_infiniband_get_hw_address(device:PNMDeviceInfiniband):Pchar;cdecl;external libnm;
function nm_device_infiniband_get_carrier(device:PNMDeviceInfiniband):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_INFINIBAND_H__  }

// === Konventiert am: 19-4-26 19:30:59 ===

function NM_TYPE_DEVICE_INFINIBAND : TGType;
function NM_DEVICE_INFINIBAND(obj : Pointer) : PNMDeviceInfiniband;
function NM_DEVICE_INFINIBAND_CLASS(klass : Pointer) : PNMDeviceInfinibandClass;
function NM_IS_DEVICE_INFINIBAND(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_INFINIBAND_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_INFINIBAND_GET_CLASS(obj : Pointer) : PNMDeviceInfinibandClass;

implementation

function NM_TYPE_DEVICE_INFINIBAND : TGType;
  begin
    NM_TYPE_DEVICE_INFINIBAND:=nm_device_infiniband_get_type;
  end;

function NM_DEVICE_INFINIBAND(obj : Pointer) : PNMDeviceInfiniband;
begin
  Result := PNMDeviceInfiniband(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_INFINIBAND));
end;

function NM_DEVICE_INFINIBAND_CLASS(klass : Pointer) : PNMDeviceInfinibandClass;
begin
  Result := PNMDeviceInfinibandClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_INFINIBAND));
end;

function NM_IS_DEVICE_INFINIBAND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_INFINIBAND);
end;

function NM_IS_DEVICE_INFINIBAND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_INFINIBAND);
end;

function NM_DEVICE_INFINIBAND_GET_CLASS(obj : Pointer) : PNMDeviceInfinibandClass;
begin
  Result := PNMDeviceInfinibandClass(PGTypeInstance(obj)^.g_class);
end;



end.
