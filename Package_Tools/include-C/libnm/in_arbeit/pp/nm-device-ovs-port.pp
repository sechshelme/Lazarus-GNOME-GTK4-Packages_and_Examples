
unit nm-device-ovs-port;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-ovs-port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-ovs-port.h
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
PGPtrArray  = ^GPtrArray;
PNMDeviceOvsPort  = ^NMDeviceOvsPort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017, 2018 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_OVS_PORT_H__}
{$define __NM_DEVICE_OVS_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_OVS_PORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_OVS_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_OVS_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_OVS_PORT_SLAVES = 'slaves';  
{*
 * NMDeviceOvsPort:
 *
 * Since: 1.10
  }
type

function nm_device_ovs_port_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_34_FOR(nm_device_get_ports) }
(* Const before type ignored *)
function nm_device_ovs_port_get_slaves(device:PNMDeviceOvsPort):PGPtrArray;cdecl;external;
{$endif}
{ __NM_DEVICE_OVS_PORT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_OVS_PORT : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_OVS_PORT:=nm_device_ovs_port_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT(obj : longint) : longint;
begin
  NM_DEVICE_OVS_PORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_OVS_PORT,NMDeviceOvsPort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_OVS_PORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_OVS_PORT,NMDeviceOvsPortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_OVS_PORT(obj : longint) : longint;
begin
  NM_IS_DEVICE_OVS_PORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_OVS_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_OVS_PORT_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_OVS_PORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_OVS_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_OVS_PORT_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_OVS_PORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_OVS_PORT,NMDeviceOvsPortClass);
end;


end.
