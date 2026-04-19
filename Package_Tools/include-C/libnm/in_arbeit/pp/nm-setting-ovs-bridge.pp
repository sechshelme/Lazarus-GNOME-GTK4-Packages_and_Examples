
unit nm-setting-ovs-bridge;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-bridge.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-bridge.h
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
PNMSetting  = ^NMSetting;
PNMSettingOvsBridge  = ^NMSettingOvsBridge;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_BRIDGE_H__}
{$define __NM_SETTING_OVS_BRIDGE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_BRIDGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_BRIDGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_BRIDGE_SETTING_NAME = 'ovs-bridge';  
  NM_SETTING_OVS_BRIDGE_FAIL_MODE = 'fail-mode';  
  NM_SETTING_OVS_BRIDGE_MCAST_SNOOPING_ENABLE = 'mcast-snooping-enable';  
  NM_SETTING_OVS_BRIDGE_RSTP_ENABLE = 'rstp-enable';  
  NM_SETTING_OVS_BRIDGE_STP_ENABLE = 'stp-enable';  
  NM_SETTING_OVS_BRIDGE_DATAPATH_TYPE = 'datapath-type';  
type

function nm_setting_ovs_bridge_get_type:TGType;cdecl;external;
function nm_setting_ovs_bridge_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_bridge_get_fail_mode(self:PNMSettingOvsBridge):Pchar;cdecl;external;
function nm_setting_ovs_bridge_get_mcast_snooping_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external;
function nm_setting_ovs_bridge_get_rstp_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external;
function nm_setting_ovs_bridge_get_stp_enable(self:PNMSettingOvsBridge):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_bridge_get_datapath_type(self:PNMSettingOvsBridge):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_OVS_BRIDGE_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_BRIDGE : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_BRIDGE:=nm_setting_ovs_bridge_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE(obj : longint) : longint;
begin
  NM_SETTING_OVS_BRIDGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_BRIDGE,NMSettingOvsBridge);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_BRIDGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_BRIDGECONFIG,NMSettingOvsBridgeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_BRIDGE(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_BRIDGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_BRIDGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_BRIDGE_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_BRIDGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_BRIDGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_BRIDGE_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_BRIDGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_BRIDGE,NMSettingOvsBridgeClass);
end;


end.
