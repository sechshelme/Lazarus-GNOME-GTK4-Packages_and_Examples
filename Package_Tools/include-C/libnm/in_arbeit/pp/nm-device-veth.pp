
unit nm-device-veth;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-veth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-veth.h
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
PNMDevice  = ^NMDevice;
PNMDeviceVeth  = ^NMDeviceVeth;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2020 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_VETH_H__}
{$define __NM_DEVICE_VETH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VETH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VETH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VETH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_VETH_PEER = 'peer';  
{*
 * NMDeviceVeth:
 *
 * Since: 1.30
  }
type

function nm_device_veth_get_type:TGType;cdecl;external;
function nm_device_veth_get_peer(device:PNMDeviceVeth):PNMDevice;cdecl;external;
{$endif}
{ __NM_DEVICE_VETH_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VETH : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_VETH:=nm_device_veth_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH(obj : longint) : longint;
begin
  NM_DEVICE_VETH:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_VETH,NMDeviceVeth);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_VETH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_VETH,NMDeviceVethClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VETH(obj : longint) : longint;
begin
  NM_IS_DEVICE_VETH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_VETH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VETH_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_VETH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_VETH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VETH_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_VETH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_VETH,NMDeviceVethClass);
end;


end.
