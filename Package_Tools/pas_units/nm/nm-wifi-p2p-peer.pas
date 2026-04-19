unit nm_wifi_p2p_peer;

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
{$ifndef __NM_WIFI_P2P_PEER_H__}
{$define __NM_WIFI_P2P_PEER_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

const
  NM_WIFI_P2P_PEER_FLAGS = 'flags';  
  NM_WIFI_P2P_PEER_NAME = 'name';  
  NM_WIFI_P2P_PEER_MANUFACTURER = 'manufacturer';  
  NM_WIFI_P2P_PEER_MODEL = 'model';  
  NM_WIFI_P2P_PEER_MODEL_NUMBER = 'model-number';  
  NM_WIFI_P2P_PEER_SERIAL = 'serial';  
  NM_WIFI_P2P_PEER_WFD_IES = 'wfd-ies';  
  NM_WIFI_P2P_PEER_HW_ADDRESS = 'hw-address';  
  NM_WIFI_P2P_PEER_STRENGTH = 'strength';  
  NM_WIFI_P2P_PEER_LAST_SEEN = 'last-seen';  
{*
 * NMWifiP2PPeer:
 *
 * Since: 1.16
  }
type

function nm_wifi_p2p_peer_get_type:TGType;cdecl;external libnm;
function nm_wifi_p2p_peer_get_flags(peer:PNMWifiP2PPeer):TNM80211ApFlags;cdecl;external libnm;
function nm_wifi_p2p_peer_get_name(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_manufacturer(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_model(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_model_number(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_serial(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_wfd_ies(peer:PNMWifiP2PPeer):PGBytes;cdecl;external libnm;
function nm_wifi_p2p_peer_get_hw_address(peer:PNMWifiP2PPeer):Pchar;cdecl;external libnm;
function nm_wifi_p2p_peer_get_strength(peer:PNMWifiP2PPeer):Tguint8;cdecl;external libnm;
function nm_wifi_p2p_peer_get_last_seen(peer:PNMWifiP2PPeer):longint;cdecl;external libnm;
function nm_wifi_p2p_peer_filter_connections(peer:PNMWifiP2PPeer; connections:PGPtrArray):PGPtrArray;cdecl;external libnm;
function nm_wifi_p2p_peer_connection_valid(peer:PNMWifiP2PPeer; connection:PNMConnection):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_WIFI_P2P_PEER_H__  }

// === Konventiert am: 19-4-26 19:18:42 ===

function NM_TYPE_WIFI_P2P_PEER : TGType;
function NM_WIFI_P2P_PEER(obj : Pointer) : PNMWifiP2PPeer;
function NM_WIFI_P2P_PEER_CLASS(klass : Pointer) : PNMWifiP2PPeerClass;
function NM_IS_WIFI_P2P_PEER(obj : Pointer) : Tgboolean;
function NM_IS_WIFI_P2P_PEER_CLASS(klass : Pointer) : Tgboolean;
function NM_WIFI_P2P_PEER_GET_CLASS(obj : Pointer) : PNMWifiP2PPeerClass;

implementation

function NM_TYPE_WIFI_P2P_PEER : TGType;
  begin
    NM_TYPE_WIFI_P2P_PEER:=nm_wifi_p2p_peer_get_type;
  end;

function NM_WIFI_P2P_PEER(obj : Pointer) : PNMWifiP2PPeer;
begin
  Result := PNMWifiP2PPeer(g_type_check_instance_cast(obj, NM_TYPE_WIFI_P2P_PEER));
end;

function NM_WIFI_P2P_PEER_CLASS(klass : Pointer) : PNMWifiP2PPeerClass;
begin
  Result := PNMWifiP2PPeerClass(g_type_check_class_cast(klass, NM_TYPE_WIFI_P2P_PEER));
end;

function NM_IS_WIFI_P2P_PEER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_WIFI_P2P_PEER);
end;

function NM_IS_WIFI_P2P_PEER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_WIFI_P2P_PEER);
end;

function NM_WIFI_P2P_PEER_GET_CLASS(obj : Pointer) : PNMWifiP2PPeerClass;
begin
  Result := PNMWifiP2PPeerClass(PGTypeInstance(obj)^.g_class);
end;



end.
