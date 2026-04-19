
unit nm-setting-bridge-port;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-bridge-port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-bridge-port.h
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
PNMBridgeVlan  = ^NMBridgeVlan;
PNMSetting  = ^NMSetting;
PNMSettingBridgePort  = ^NMSettingBridgePort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_BRIDGE_PORT_H__}
{$define __NM_SETTING_BRIDGE_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-bridge.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_BRIDGE_PORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BRIDGE_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BRIDGE_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_BRIDGE_PORT_SETTING_NAME = 'bridge-port';  
  NM_SETTING_BRIDGE_PORT_PRIORITY = 'priority';  
  NM_SETTING_BRIDGE_PORT_PATH_COST = 'path-cost';  
  NM_SETTING_BRIDGE_PORT_HAIRPIN_MODE = 'hairpin-mode';  
  NM_SETTING_BRIDGE_PORT_VLANS = 'vlans';  
type

function nm_setting_bridge_port_get_type:TGType;cdecl;external;
function nm_setting_bridge_port_new:PNMSetting;cdecl;external;
function nm_setting_bridge_port_get_priority(setting:PNMSettingBridgePort):Tguint16;cdecl;external;
function nm_setting_bridge_port_get_path_cost(setting:PNMSettingBridgePort):Tguint16;cdecl;external;
function nm_setting_bridge_port_get_hairpin_mode(setting:PNMSettingBridgePort):Tgboolean;cdecl;external;
procedure nm_setting_bridge_port_add_vlan(setting:PNMSettingBridgePort; vlan:PNMBridgeVlan);cdecl;external;
function nm_setting_bridge_port_get_num_vlans(setting:PNMSettingBridgePort):Tguint;cdecl;external;
function nm_setting_bridge_port_get_vlan(setting:PNMSettingBridgePort; idx:Tguint):PNMBridgeVlan;cdecl;external;
procedure nm_setting_bridge_port_remove_vlan(setting:PNMSettingBridgePort; idx:Tguint);cdecl;external;
function nm_setting_bridge_port_remove_vlan_by_vid(setting:PNMSettingBridgePort; vid_start:Tguint16; vid_end:Tguint16):Tgboolean;cdecl;external;
procedure nm_setting_bridge_port_clear_vlans(setting:PNMSettingBridgePort);cdecl;external;
{$endif}
{ __NM_SETTING_BRIDGE_PORT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_BRIDGE_PORT : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_BRIDGE_PORT:=nm_setting_bridge_port_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT(obj : longint) : longint;
begin
  NM_SETTING_BRIDGE_PORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_BRIDGE_PORT,NMSettingBridgePort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT_CLASS(klass : longint) : longint;
begin
  NM_SETTING_BRIDGE_PORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_BRIDGE_PORT,NMSettingBridgePortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BRIDGE_PORT(obj : longint) : longint;
begin
  NM_IS_SETTING_BRIDGE_PORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_BRIDGE_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BRIDGE_PORT_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_BRIDGE_PORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_BRIDGE_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BRIDGE_PORT_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_BRIDGE_PORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_BRIDGE_PORT,NMSettingBridgePortClass);
end;


end.
