
unit nm-setting-wifi-p2p;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wifi-p2p.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wifi-p2p.h
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
PNMSetting  = ^NMSetting;
PNMSettingWifiP2P  = ^NMSettingWifiP2P;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2019 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_WIFI_P2P_H__}
{$define __NM_SETTING_WIFI_P2P_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-wireless-security.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIFI_P2P : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIFI_P2P(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIFI_P2P_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WIFI_P2P_SETTING_NAME = 'wifi-p2p';  
{*
 * NM_SETTING_WIFI_P2P_PEER:
 *
 * The mac address of the peer to connect to.
  }
  NM_SETTING_WIFI_P2P_PEER = 'peer';  
  NM_SETTING_WIFI_P2P_WPS_METHOD = 'wps-method';  
  NM_SETTING_WIFI_P2P_WFD_IES = 'wfd-ies';  
type

function nm_setting_wifi_p2p_get_type:TGType;cdecl;external;
function nm_setting_wifi_p2p_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_wifi_p2p_get_peer(setting:PNMSettingWifiP2P):Pchar;cdecl;external;
function nm_setting_wifi_p2p_get_wps_method(setting:PNMSettingWifiP2P):TNMSettingWirelessSecurityWpsMethod;cdecl;external;
function nm_setting_wifi_p2p_get_wfd_ies(setting:PNMSettingWifiP2P):PGBytes;cdecl;external;
{$endif}
{ __NM_SETTING_WIFI_P2P_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIFI_P2P : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WIFI_P2P:=nm_setting_wifi_p2p_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P(obj : longint) : longint;
begin
  NM_SETTING_WIFI_P2P:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WIFI_P2P,NMSettingWifiP2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WIFI_P2P_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WIFI_P2P,NMSettingWifiP2PClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIFI_P2P(obj : longint) : longint;
begin
  NM_IS_SETTING_WIFI_P2P:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WIFI_P2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIFI_P2P_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WIFI_P2P_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WIFI_P2P);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIFI_P2P_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WIFI_P2P_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WIFI_P2P,NMSettingWifiP2PClass);
end;


end.
