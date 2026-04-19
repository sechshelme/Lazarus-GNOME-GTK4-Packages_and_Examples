unit nm_device_dummy;

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
{$ifndef __NM_DEVICE_DUMMY_H__}
{$define __NM_DEVICE_DUMMY_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_DUMMY_HW_ADDRESS = 'hw-address';  
{*
 * NMDeviceDummy:
 *
 * Since: 1.8
  }
type

function nm_device_dummy_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_dummy_get_hw_address(device:PNMDeviceDummy):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_DUMMY_H__  }

// === Konventiert am: 19-4-26 19:31:10 ===

function NM_TYPE_DEVICE_DUMMY : TGType;
function NM_DEVICE_DUMMY(obj : Pointer) : PNMDeviceDummy;
function NM_DEVICE_DUMMY_CLASS(klass : Pointer) : PNMDeviceDummyClass;
function NM_IS_DEVICE_DUMMY(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_DUMMY_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_DUMMY_GET_CLASS(obj : Pointer) : PNMDeviceDummyClass;

implementation

function NM_TYPE_DEVICE_DUMMY : TGType;
  begin
    NM_TYPE_DEVICE_DUMMY:=nm_device_dummy_get_type;
  end;

function NM_DEVICE_DUMMY(obj : Pointer) : PNMDeviceDummy;
begin
  Result := PNMDeviceDummy(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_DUMMY));
end;

function NM_DEVICE_DUMMY_CLASS(klass : Pointer) : PNMDeviceDummyClass;
begin
  Result := PNMDeviceDummyClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_DUMMY));
end;

function NM_IS_DEVICE_DUMMY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_DUMMY);
end;

function NM_IS_DEVICE_DUMMY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_DUMMY);
end;

function NM_DEVICE_DUMMY_GET_CLASS(obj : Pointer) : PNMDeviceDummyClass;
begin
  Result := PNMDeviceDummyClass(PGTypeInstance(obj)^.g_class);
end;



end.
