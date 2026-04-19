
unit nm-device-vlan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-vlan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-vlan.h
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
PNMDevice  = ^NMDevice;
PNMDeviceVlan  = ^NMDeviceVlan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_VLAN_H__}
{$define __NM_DEVICE_VLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VLAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_VLAN_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_VLAN_CARRIER = 'carrier';  
  NM_DEVICE_VLAN_PARENT = 'parent';  
  NM_DEVICE_VLAN_VLAN_ID = 'vlan-id';  
{*
 * NMDeviceVlan:
  }
type

function nm_device_vlan_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_vlan_get_hw_address(device:PNMDeviceVlan):Pchar;cdecl;external;
function nm_device_vlan_get_carrier(device:PNMDeviceVlan):Tgboolean;cdecl;external;
function nm_device_vlan_get_parent(device:PNMDeviceVlan):PNMDevice;cdecl;external;
function nm_device_vlan_get_vlan_id(device:PNMDeviceVlan):Tguint;cdecl;external;
{$endif}
{ __NM_DEVICE_VLAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VLAN : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_VLAN:=nm_device_vlan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN(obj : longint) : longint;
begin
  NM_DEVICE_VLAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_VLAN,NMDeviceVlan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_VLAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_VLAN,NMDeviceVlanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VLAN(obj : longint) : longint;
begin
  NM_IS_DEVICE_VLAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_VLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VLAN_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_VLAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_VLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VLAN_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_VLAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_VLAN,NMDeviceVlanClass);
end;


end.
