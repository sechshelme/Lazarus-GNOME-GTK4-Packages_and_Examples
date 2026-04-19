unit nm_device_bt;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2008 - 2012 Red Hat, Inc.
 * Copyright (C) 2008 Novell, Inc.
  }
{$ifndef __NM_DEVICE_BT_H__}
{$define __NM_DEVICE_BT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_BT_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_BT_NAME = 'name';  
  NM_DEVICE_BT_CAPABILITIES = 'bt-capabilities';  
{*
 * NMDeviceBt:
  }
type

function nm_device_bt_get_type:TGType;cdecl;external libnm;
{xxxxxxNM_DEPRECATED_IN_1_24_FOR(nm_device_get_hw_address) }
function nm_device_bt_get_hw_address(device:PNMDeviceBt):Pchar;cdecl;external libnm;
function nm_device_bt_get_name(device:PNMDeviceBt):Pchar;cdecl;external libnm;
function nm_device_bt_get_capabilities(device:PNMDeviceBt):TNMBluetoothCapabilities;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_BT_H__  }

// === Konventiert am: 19-4-26 19:31:13 ===

function NM_TYPE_DEVICE_BT : TGType;
function NM_DEVICE_BT(obj : Pointer) : PNMDeviceBt;
function NM_DEVICE_BT_CLASS(klass : Pointer) : PNMDeviceBtClass;
function NM_IS_DEVICE_BT(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_BT_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_BT_GET_CLASS(obj : Pointer) : PNMDeviceBtClass;

implementation

function NM_TYPE_DEVICE_BT : TGType;
  begin
    NM_TYPE_DEVICE_BT:=nm_device_bt_get_type;
  end;

function NM_DEVICE_BT(obj : Pointer) : PNMDeviceBt;
begin
  Result := PNMDeviceBt(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_BT));
end;

function NM_DEVICE_BT_CLASS(klass : Pointer) : PNMDeviceBtClass;
begin
  Result := PNMDeviceBtClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_BT));
end;

function NM_IS_DEVICE_BT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_BT);
end;

function NM_IS_DEVICE_BT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_BT);
end;

function NM_DEVICE_BT_GET_CLASS(obj : Pointer) : PNMDeviceBtClass;
begin
  Result := PNMDeviceBtClass(PGTypeInstance(obj)^.g_class);
end;



end.
