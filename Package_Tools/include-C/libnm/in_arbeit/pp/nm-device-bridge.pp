
unit nm-device-bridge;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-bridge.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-bridge.h
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
PGPtrArray  = ^GPtrArray;
PNMDeviceBridge  = ^NMDeviceBridge;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_BRIDGE_H__}
{$define __NM_DEVICE_BRIDGE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_BRIDGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BRIDGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BRIDGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_BRIDGE_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_BRIDGE_CARRIER = 'carrier';  
  NM_DEVICE_BRIDGE_SLAVES = 'slaves';  
{*
 * NMDeviceBridge:
  }
type

function nm_device_bridge_get_type:TGType;cdecl;external;
{xxxxxxNM_DEPRECATED_IN_1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_bridge_get_hw_address(device:PNMDeviceBridge):Pchar;cdecl;external;
function nm_device_bridge_get_carrier(device:PNMDeviceBridge):Tgboolean;cdecl;external;
{xxxxxxNM_DEPRECATED_IN_1_34_FOR(nm_device_get_ports) }
(* Const before type ignored *)
function nm_device_bridge_get_slaves(device:PNMDeviceBridge):PGPtrArray;cdecl;external;
{$endif}
{ __NM_DEVICE_BRIDGE_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_BRIDGE : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_BRIDGE:=nm_device_bridge_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE(obj : longint) : longint;
begin
  NM_DEVICE_BRIDGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_BRIDGE,NMDeviceBridge);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_BRIDGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_BRIDGE,NMDeviceBridgeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BRIDGE(obj : longint) : longint;
begin
  NM_IS_DEVICE_BRIDGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_BRIDGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BRIDGE_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_BRIDGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_BRIDGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BRIDGE_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_BRIDGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_BRIDGE,NMDeviceBridgeClass);
end;


end.
