
unit nm-wifi-p2p-peer;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-wifi-p2p-peer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-wifi-p2p-peer.h
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
PGBytes  = ^GBytes;
PGPtrArray  = ^GPtrArray;
PNMConnection  = ^NMConnection;
PNMWifiP2PPeer  = ^NMWifiP2PPeer;
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

{ was #define dname def_expr }
function NM_TYPE_WIFI_P2P_PEER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIFI_P2P_PEER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIFI_P2P_PEER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER_GET_CLASS(obj : longint) : longint;

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

function nm_wifi_p2p_peer_get_type:TGType;cdecl;external;
function nm_wifi_p2p_peer_get_flags(peer:PNMWifiP2PPeer):TNM80211ApFlags;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_name(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_manufacturer(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_model(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_model_number(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_serial(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
function nm_wifi_p2p_peer_get_wfd_ies(peer:PNMWifiP2PPeer):PGBytes;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_get_hw_address(peer:PNMWifiP2PPeer):Pchar;cdecl;external;
function nm_wifi_p2p_peer_get_strength(peer:PNMWifiP2PPeer):Tguint8;cdecl;external;
function nm_wifi_p2p_peer_get_last_seen(peer:PNMWifiP2PPeer):longint;cdecl;external;
(* Const before type ignored *)
function nm_wifi_p2p_peer_filter_connections(peer:PNMWifiP2PPeer; connections:PGPtrArray):PGPtrArray;cdecl;external;
function nm_wifi_p2p_peer_connection_valid(peer:PNMWifiP2PPeer; connection:PNMConnection):Tgboolean;cdecl;external;
{$endif}
{ __NM_WIFI_P2P_PEER_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_WIFI_P2P_PEER : longint; { return type might be wrong }
  begin
    NM_TYPE_WIFI_P2P_PEER:=nm_wifi_p2p_peer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER(obj : longint) : longint;
begin
  NM_WIFI_P2P_PEER:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_WIFI_P2P_PEER,NMWifiP2PPeer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER_CLASS(klass : longint) : longint;
begin
  NM_WIFI_P2P_PEER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_WIFI_P2P_PEER,NMWifiP2PPeerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIFI_P2P_PEER(obj : longint) : longint;
begin
  NM_IS_WIFI_P2P_PEER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_WIFI_P2P_PEER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIFI_P2P_PEER_CLASS(klass : longint) : longint;
begin
  NM_IS_WIFI_P2P_PEER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_WIFI_P2P_PEER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIFI_P2P_PEER_GET_CLASS(obj : longint) : longint;
begin
  NM_WIFI_P2P_PEER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_WIFI_P2P_PEER,NMWifiP2PPeerClass);
end;


end.
