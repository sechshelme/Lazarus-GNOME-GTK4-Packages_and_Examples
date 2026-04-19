
unit nm-device-wireguard;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-wireguard.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-wireguard.h
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
PGBytes  = ^GBytes;
PNMDeviceWireGuard  = ^NMDeviceWireGuard;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Javier Arteaga <jarteaga@jbeta.is>
  }
{$ifndef __NM_DEVICE_WIREGUARD_H__}
{$define __NM_DEVICE_WIREGUARD_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIREGUARD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIREGUARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIREGUARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD_GET_CLASS(obj : longint) : longint;

{*
 * NMDeviceWireGuard:
 *
 * Since: 1.14
  }
type

const
  NM_DEVICE_WIREGUARD_PUBLIC_KEY = 'public-key';  
  NM_DEVICE_WIREGUARD_LISTEN_PORT = 'listen-port';  
  NM_DEVICE_WIREGUARD_FWMARK = 'fwmark';  

function nm_device_wireguard_get_type:TGType;cdecl;external;
function nm_device_wireguard_get_public_key(device:PNMDeviceWireGuard):PGBytes;cdecl;external;
function nm_device_wireguard_get_listen_port(device:PNMDeviceWireGuard):Tguint16;cdecl;external;
function nm_device_wireguard_get_fwmark(device:PNMDeviceWireGuard):Tguint32;cdecl;external;
{$endif}
{ __NM_DEVICE_WIREGUARD_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIREGUARD : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_WIREGUARD:=nm_device_wireguard_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD(obj : longint) : longint;
begin
  NM_DEVICE_WIREGUARD:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_WIREGUARD,NMDeviceWireGuard);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_WIREGUARD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_WIREGUARD,NMDeviceWireGuardClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIREGUARD(obj : longint) : longint;
begin
  NM_IS_DEVICE_WIREGUARD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_WIREGUARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIREGUARD_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_WIREGUARD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_WIREGUARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIREGUARD_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_WIREGUARD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_WIREGUARD,NMDeviceWireGuardClass);
end;


end.
