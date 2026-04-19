unit nm_device_wifi_p2p;

interface

uses
  fp_glib2, fp_nm;

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

function nm_device_wifi_p2p_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_wifi_p2p_get_hw_address(device:PNMDeviceWifiP2P):Pchar;cdecl;external libnm;
function nm_device_wifi_p2p_get_peer_by_path(device:PNMDeviceWifiP2P; path:Pchar):PNMWifiP2PPeer;cdecl;external libnm;
function nm_device_wifi_p2p_get_peers(device:PNMDeviceWifiP2P):PGPtrArray;cdecl;external libnm;
procedure nm_device_wifi_p2p_start_find(device:PNMDeviceWifiP2P; options:PGVariant; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
function nm_device_wifi_p2p_start_find_finish(device:PNMDeviceWifiP2P; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libnm;
procedure nm_device_wifi_p2p_stop_find(device:PNMDeviceWifiP2P; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libnm;
function nm_device_wifi_p2p_stop_find_finish(device:PNMDeviceWifiP2P; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_WIFI_P2P_H__  }

// === Konventiert am: 19-4-26 19:29:57 ===

function NM_TYPE_DEVICE_WIFI_P2P : TGType;
function NM_DEVICE_WIFI_P2P(obj : Pointer) : PNMDeviceWifiP2P;
function NM_DEVICE_WIFI_P2P_CLASS(klass : Pointer) : PNMDeviceWifiP2PClass;
function NM_IS_DEVICE_WIFI_P2P(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_WIFI_P2P_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_WIFI_P2P_GET_CLASS(obj : Pointer) : PNMDeviceWifiP2PClass;

implementation

function NM_TYPE_DEVICE_WIFI_P2P : TGType;
  begin
    NM_TYPE_DEVICE_WIFI_P2P:=nm_device_wifi_p2p_get_type;
  end;

function NM_DEVICE_WIFI_P2P(obj : Pointer) : PNMDeviceWifiP2P;
begin
  Result := PNMDeviceWifiP2P(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIFI_P2P));
end;

function NM_DEVICE_WIFI_P2P_CLASS(klass : Pointer) : PNMDeviceWifiP2PClass;
begin
  Result := PNMDeviceWifiP2PClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIFI_P2P));
end;

function NM_IS_DEVICE_WIFI_P2P(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_WIFI_P2P);
end;

function NM_IS_DEVICE_WIFI_P2P_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_WIFI_P2P);
end;

function NM_DEVICE_WIFI_P2P_GET_CLASS(obj : Pointer) : PNMDeviceWifiP2PClass;
begin
  Result := PNMDeviceWifiP2PClass(PGTypeInstance(obj)^.g_class);
end;



end.
