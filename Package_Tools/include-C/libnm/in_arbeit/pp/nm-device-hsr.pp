
unit nm-device-hsr;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-hsr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-hsr.h
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
PNMDeviceHsr  = ^NMDeviceHsr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2023 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_HSR_H__}
{$define __NM_DEVICE_HSR_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_HSR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_HSR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_HSR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_HSR_PORT1 = 'port1';  
  NM_DEVICE_HSR_PORT2 = 'port2';  
  NM_DEVICE_HSR_SUPERVISION_ADDRESS = 'supervision-address';  
  NM_DEVICE_HSR_MULTICAST_SPEC = 'multicast-spec';  
  NM_DEVICE_HSR_PRP = 'prp';  
{*
 * NMDeviceHsr:
 *
 * Since: 1.46
  }
type

function nm_device_hsr_get_type:TGType;cdecl;external;
function nm_device_hsr_get_port1(device:PNMDeviceHsr):PNMDevice;cdecl;external;
function nm_device_hsr_get_port2(device:PNMDeviceHsr):PNMDevice;cdecl;external;
(* Const before type ignored *)
function nm_device_hsr_get_supervision_address(device:PNMDeviceHsr):Pchar;cdecl;external;
function nm_device_hsr_get_multicast_spec(device:PNMDeviceHsr):Tguint8;cdecl;external;
function nm_device_hsr_get_prp(device:PNMDeviceHsr):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_HSR_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_HSR : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_HSR:=nm_device_hsr_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR(obj : longint) : longint;
begin
  NM_DEVICE_HSR:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_HSR,NMDeviceHsr);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_HSR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_HSR,NMDeviceHsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_HSR(obj : longint) : longint;
begin
  NM_IS_DEVICE_HSR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_HSR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_HSR_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_HSR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_HSR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_HSR_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_HSR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_HSR,NMDeviceHsrClass);
end;


end.
