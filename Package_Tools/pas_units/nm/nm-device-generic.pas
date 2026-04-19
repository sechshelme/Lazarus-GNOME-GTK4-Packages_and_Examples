unit nm_device_generic;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_GENERIC_H__}
{$define __NM_DEVICE_GENERIC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_GENERIC_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_GENERIC_TYPE_DESCRIPTION = 'type-description';  
{*
 * NMDeviceGeneric:
  }
type

function nm_device_generic_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_generic_get_hw_address(device:PNMDeviceGeneric):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_GENERIC_H__  }

// === Konventiert am: 19-4-26 19:31:04 ===

function NM_TYPE_DEVICE_GENERIC : TGType;
function NM_DEVICE_GENERIC(obj : Pointer) : PNMDeviceGeneric;
function NM_DEVICE_GENERIC_CLASS(klass : Pointer) : PNMDeviceGenericClass;
function NM_IS_DEVICE_GENERIC(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_GENERIC_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_GENERIC_GET_CLASS(obj : Pointer) : PNMDeviceGenericClass;

implementation

function NM_TYPE_DEVICE_GENERIC : TGType;
  begin
    NM_TYPE_DEVICE_GENERIC:=nm_device_generic_get_type;
  end;

function NM_DEVICE_GENERIC(obj : Pointer) : PNMDeviceGeneric;
begin
  Result := PNMDeviceGeneric(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_GENERIC));
end;

function NM_DEVICE_GENERIC_CLASS(klass : Pointer) : PNMDeviceGenericClass;
begin
  Result := PNMDeviceGenericClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_GENERIC));
end;

function NM_IS_DEVICE_GENERIC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_GENERIC);
end;

function NM_IS_DEVICE_GENERIC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_GENERIC);
end;

function NM_DEVICE_GENERIC_GET_CLASS(obj : Pointer) : PNMDeviceGenericClass;
begin
  Result := PNMDeviceGenericClass(PGTypeInstance(obj)^.g_class);
end;



end.
