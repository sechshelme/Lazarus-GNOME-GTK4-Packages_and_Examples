
unit nm-setting-bluetooth;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-bluetooth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-bluetooth.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PNMSetting  = ^NMSetting;
PNMSettingBluetooth  = ^NMSettingBluetooth;
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

{ was #define dname def_expr }
function NM_TYPE_SETTING_BLUETOOTH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BLUETOOTH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BLUETOOTH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH_GET_CLASS(obj : longint) : longint;

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

function nm_setting_bluetooth_get_type:TGType;cdecl;external;
function nm_setting_bluetooth_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_bluetooth_get_bdaddr(setting:PNMSettingBluetooth):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_bluetooth_get_connection_type(setting:PNMSettingBluetooth):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_BLUETOOTH_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_BLUETOOTH : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_BLUETOOTH:=nm_setting_bluetooth_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH(obj : longint) : longint;
begin
  NM_SETTING_BLUETOOTH:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_BLUETOOTH,NMSettingBluetooth);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH_CLASS(klass : longint) : longint;
begin
  NM_SETTING_BLUETOOTH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_BLUETOOTH,NMSettingBluetoothClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BLUETOOTH(obj : longint) : longint;
begin
  NM_IS_SETTING_BLUETOOTH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_BLUETOOTH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BLUETOOTH_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_BLUETOOTH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_BLUETOOTH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BLUETOOTH_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_BLUETOOTH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_BLUETOOTH,NMSettingBluetoothClass);
end;


end.
