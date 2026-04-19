
unit nm-device-macvlan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-macvlan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-macvlan.h
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
PNMDeviceMacvlan  = ^NMDeviceMacvlan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_MACVLAN_H__}
{$define __NM_DEVICE_MACVLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MACVLAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACVLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACVLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_MACVLAN_PARENT = 'parent';  
  NM_DEVICE_MACVLAN_MODE = 'mode';  
  NM_DEVICE_MACVLAN_NO_PROMISC = 'no-promisc';  
  NM_DEVICE_MACVLAN_TAP = 'tap';  
  NM_DEVICE_MACVLAN_HW_ADDRESS = 'hw-address';  
{*
 * NMDeviceMacvlan:
 *
 * Since: 1.2
  }
type

function nm_device_macvlan_get_type:TGType;cdecl;external;
function nm_device_macvlan_get_parent(device:PNMDeviceMacvlan):PNMDevice;cdecl;external;
(* Const before type ignored *)
function nm_device_macvlan_get_mode(device:PNMDeviceMacvlan):Pchar;cdecl;external;
function nm_device_macvlan_get_no_promisc(device:PNMDeviceMacvlan):Tgboolean;cdecl;external;
function nm_device_macvlan_get_tap(device:PNMDeviceMacvlan):Tgboolean;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_macvlan_get_hw_address(device:PNMDeviceMacvlan):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_MACVLAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MACVLAN : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_MACVLAN:=nm_device_macvlan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN(obj : longint) : longint;
begin
  NM_DEVICE_MACVLAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_MACVLAN,NMDeviceMacvlan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_MACVLAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_MACVLAN,NMDeviceMacvlanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACVLAN(obj : longint) : longint;
begin
  NM_IS_DEVICE_MACVLAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_MACVLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACVLAN_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_MACVLAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_MACVLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACVLAN_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_MACVLAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_MACVLAN,NMDeviceMacvlanClass);
end;


end.
