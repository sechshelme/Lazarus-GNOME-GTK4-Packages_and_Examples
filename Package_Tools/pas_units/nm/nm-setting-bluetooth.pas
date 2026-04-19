unit nm_setting_bluetooth;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2009 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_BLUETOOTH_H__}
{$define __NM_SETTING_BLUETOOTH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_BLUETOOTH_SETTING_NAME = 'bluetooth';  
  NM_SETTING_BLUETOOTH_BDADDR = 'bdaddr';  
  NM_SETTING_BLUETOOTH_TYPE = 'type';  
{*
 * NM_SETTING_BLUETOOTH_TYPE_DUN:
 *
 * Connection type describing a connection to devices that support the Bluetooth
 * DUN profile.
  }
  NM_SETTING_BLUETOOTH_TYPE_DUN = 'dun';  
{*
 * NM_SETTING_BLUETOOTH_TYPE_PANU:
 *
 * Connection type describing PANU connection to a Bluetooth NAP (Network
 * Access Point).
  }
  NM_SETTING_BLUETOOTH_TYPE_PANU = 'panu';  
{*
 * NM_SETTING_BLUETOOTH_TYPE_NAP:
 *
 * Connection type describing a Bluetooth NAP (Network Access Point),
 * which accepts PANU clients.
  }
  NM_SETTING_BLUETOOTH_TYPE_NAP = 'nap';  
type

function nm_setting_bluetooth_get_type:TGType;cdecl;external libnm;
function nm_setting_bluetooth_new:PNMSetting;cdecl;external libnm;
function nm_setting_bluetooth_get_bdaddr(setting:PNMSettingBluetooth):Pchar;cdecl;external libnm;
function nm_setting_bluetooth_get_connection_type(setting:PNMSettingBluetooth):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_BLUETOOTH_H__  }

// === Konventiert am: 19-4-26 19:28:05 ===

function NM_TYPE_SETTING_BLUETOOTH : TGType;
function NM_SETTING_BLUETOOTH(obj : Pointer) : PNMSettingBluetooth;
function NM_SETTING_BLUETOOTH_CLASS(klass : Pointer) : PNMSettingBluetoothClass;
function NM_IS_SETTING_BLUETOOTH(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_BLUETOOTH_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_BLUETOOTH_GET_CLASS(obj : Pointer) : PNMSettingBluetoothClass;

implementation

function NM_TYPE_SETTING_BLUETOOTH : TGType;
  begin
    NM_TYPE_SETTING_BLUETOOTH:=nm_setting_bluetooth_get_type;
  end;

function NM_SETTING_BLUETOOTH(obj : Pointer) : PNMSettingBluetooth;
begin
  Result := PNMSettingBluetooth(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BLUETOOTH));
end;

function NM_SETTING_BLUETOOTH_CLASS(klass : Pointer) : PNMSettingBluetoothClass;
begin
  Result := PNMSettingBluetoothClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BLUETOOTH));
end;

function NM_IS_SETTING_BLUETOOTH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_BLUETOOTH);
end;

function NM_IS_SETTING_BLUETOOTH_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_BLUETOOTH);
end;

function NM_SETTING_BLUETOOTH_GET_CLASS(obj : Pointer) : PNMSettingBluetoothClass;
begin
  Result := PNMSettingBluetoothClass(PGTypeInstance(obj)^.g_class);
end;



end.
