
unit nm-device-tun;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-tun.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-tun.h
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
PNMDeviceTun  = ^NMDeviceTun;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_TUN_H__}
{$define __NM_DEVICE_TUN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_TUN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TUN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TUN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_TUN_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_TUN_OWNER = 'owner';  
  NM_DEVICE_TUN_GROUP = 'group';  
  NM_DEVICE_TUN_MODE = 'mode';  
  NM_DEVICE_TUN_NO_PI = 'no-pi';  
  NM_DEVICE_TUN_VNET_HDR = 'vnet-hdr';  
  NM_DEVICE_TUN_MULTI_QUEUE = 'multi-queue';  
{*
 * NMDeviceTun:
 *
 * Since: 1.2
  }
type

function nm_device_tun_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_tun_get_hw_address(device:PNMDeviceTun):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_tun_get_mode(device:PNMDeviceTun):Pchar;cdecl;external;
function nm_device_tun_get_owner(device:PNMDeviceTun):Tgint64;cdecl;external;
function nm_device_tun_get_group(device:PNMDeviceTun):Tgint64;cdecl;external;
function nm_device_tun_get_no_pi(device:PNMDeviceTun):Tgboolean;cdecl;external;
function nm_device_tun_get_vnet_hdr(device:PNMDeviceTun):Tgboolean;cdecl;external;
function nm_device_tun_get_multi_queue(device:PNMDeviceTun):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_TUN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_TUN : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_TUN:=nm_device_tun_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN(obj : longint) : longint;
begin
  NM_DEVICE_TUN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_TUN,NMDeviceTun);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_TUN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_TUN,NMDeviceTunClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TUN(obj : longint) : longint;
begin
  NM_IS_DEVICE_TUN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_TUN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TUN_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_TUN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_TUN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TUN_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_TUN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_TUN,NMDeviceTunClass);
end;


end.
