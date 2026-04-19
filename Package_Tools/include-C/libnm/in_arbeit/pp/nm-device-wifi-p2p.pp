
unit nm-device-wifi-p2p;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-wifi-p2p.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-wifi-p2p.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
PNMDeviceWifiP2P  = ^NMDeviceWifiP2P;
PNMWifiP2PPeer  = ^NMWifiP2PPeer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 - 2019 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_WIFI_P2P_H__}
{$define __NM_DEVICE_WIFI_P2P_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIFI_P2P : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_P2P(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_P2P_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_WIFI_P2P_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_WIFI_P2P_PEERS = 'peers';  
  NM_DEVICE_WIFI_P2P_WFDIES = 'wfdies';  
{*
 * NMDeviceWifiP2P:
 *
 * Since: 1.16
  }
type

function nm_device_wifi_p2p_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_wifi_p2p_get_hw_address(device:PNMDeviceWifiP2P):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_wifi_p2p_get_peer_by_path(device:PNMDeviceWifiP2P; path:Pchar):PNMWifiP2PPeer;cdecl;external;
(* Const before type ignored *)
function nm_device_wifi_p2p_get_peers(device:PNMDeviceWifiP2P):PGPtrArray;cdecl;external;
procedure nm_device_wifi_p2p_start_find(device:PNMDeviceWifiP2P; options:PGVariant; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_wifi_p2p_start_find_finish(device:PNMDeviceWifiP2P; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure nm_device_wifi_p2p_stop_find(device:PNMDeviceWifiP2P; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_wifi_p2p_stop_find_finish(device:PNMDeviceWifiP2P; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_WIFI_P2P_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIFI_P2P : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_WIFI_P2P:=nm_device_wifi_p2p_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P(obj : longint) : longint;
begin
  NM_DEVICE_WIFI_P2P:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_WIFI_P2P,NMDeviceWifiP2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_WIFI_P2P_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_WIFI_P2P,NMDeviceWifiP2PClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_P2P(obj : longint) : longint;
begin
  NM_IS_DEVICE_WIFI_P2P:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_WIFI_P2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIFI_P2P_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_WIFI_P2P_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_WIFI_P2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIFI_P2P_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_WIFI_P2P_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_WIFI_P2P,NMDeviceWifiP2PClass);
end;


end.
