
unit nm-setting-ovs-port;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-port.h
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
PNMRange  = ^NMRange;
PNMSetting  = ^NMSetting;
PNMSettingOvsPort  = ^NMSettingOvsPort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_PORT_H__}
{$define __NM_SETTING_OVS_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_PORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_PORT_SETTING_NAME = 'ovs-port';  
  NM_SETTING_OVS_PORT_VLAN_MODE = 'vlan-mode';  
  NM_SETTING_OVS_PORT_TAG = 'tag';  
  NM_SETTING_OVS_PORT_TRUNKS = 'trunks';  
  NM_SETTING_OVS_PORT_LACP = 'lacp';  
  NM_SETTING_OVS_PORT_BOND_MODE = 'bond-mode';  
  NM_SETTING_OVS_PORT_BOND_UPDELAY = 'bond-updelay';  
  NM_SETTING_OVS_PORT_BOND_DOWNDELAY = 'bond-downdelay';  
type

function nm_setting_ovs_port_get_type:TGType;cdecl;external;
function nm_setting_ovs_port_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_port_get_vlan_mode(self:PNMSettingOvsPort):Pchar;cdecl;external;
function nm_setting_ovs_port_get_tag(self:PNMSettingOvsPort):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_port_get_lacp(self:PNMSettingOvsPort):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_port_get_bond_mode(self:PNMSettingOvsPort):Pchar;cdecl;external;
function nm_setting_ovs_port_get_bond_updelay(self:PNMSettingOvsPort):Tguint;cdecl;external;
function nm_setting_ovs_port_get_bond_downdelay(self:PNMSettingOvsPort):Tguint;cdecl;external;
procedure nm_setting_ovs_port_add_trunk(setting:PNMSettingOvsPort; trunk:PNMRange);cdecl;external;
function nm_setting_ovs_port_get_num_trunks(setting:PNMSettingOvsPort):Tguint;cdecl;external;
function nm_setting_ovs_port_get_trunk(setting:PNMSettingOvsPort; idx:Tguint):PNMRange;cdecl;external;
procedure nm_setting_ovs_port_remove_trunk(setting:PNMSettingOvsPort; idx:Tguint);cdecl;external;
function nm_setting_ovs_port_remove_trunk_by_value(setting:PNMSettingOvsPort; start:Tguint; end:Tguint):Tgboolean;cdecl;external;
procedure nm_setting_ovs_port_clear_trunks(setting:PNMSettingOvsPort);cdecl;external;
{$endif}
{ __NM_SETTING_OVS_PORT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_PORT : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_PORT:=nm_setting_ovs_port_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT(obj : longint) : longint;
begin
  NM_SETTING_OVS_PORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_PORT,NMSettingOvsPort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_PORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_PORTCONFIG,NMSettingOvsPortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PORT(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_PORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PORT_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_PORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PORT_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_PORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_PORT,NMSettingOvsPortClass);
end;


end.
