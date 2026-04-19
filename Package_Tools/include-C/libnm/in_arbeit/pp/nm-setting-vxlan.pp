
unit nm-setting-vxlan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-vxlan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-vxlan.h
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
PNMSettingVxlan  = ^NMSettingVxlan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_VXLAN_H__}
{$define __NM_SETTING_VXLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_VXLAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VXLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VXLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_VXLAN_SETTING_NAME = 'vxlan';  
  NM_SETTING_VXLAN_PARENT = 'parent';  
  NM_SETTING_VXLAN_ID = 'id';  
  NM_SETTING_VXLAN_LOCAL = 'local';  
  NM_SETTING_VXLAN_REMOTE = 'remote';  
  NM_SETTING_VXLAN_SOURCE_PORT_MIN = 'source-port-min';  
  NM_SETTING_VXLAN_SOURCE_PORT_MAX = 'source-port-max';  
  NM_SETTING_VXLAN_DESTINATION_PORT = 'destination-port';  
  NM_SETTING_VXLAN_TOS = 'tos';  
  NM_SETTING_VXLAN_TTL = 'ttl';  
  NM_SETTING_VXLAN_AGEING = 'ageing';  
  NM_SETTING_VXLAN_LIMIT = 'limit';  
  NM_SETTING_VXLAN_PROXY = 'proxy';  
  NM_SETTING_VXLAN_LEARNING = 'learning';  
  NM_SETTING_VXLAN_RSC = 'rsc';  
  NM_SETTING_VXLAN_L2_MISS = 'l2-miss';  
  NM_SETTING_VXLAN_L3_MISS = 'l3-miss';  
type

function nm_setting_vxlan_get_type:TGType;cdecl;external;
function nm_setting_vxlan_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_vxlan_get_parent(setting:PNMSettingVxlan):Pchar;cdecl;external;
function nm_setting_vxlan_get_id(setting:PNMSettingVxlan):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_vxlan_get_local(setting:PNMSettingVxlan):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_vxlan_get_remote(setting:PNMSettingVxlan):Pchar;cdecl;external;
function nm_setting_vxlan_get_source_port_min(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_source_port_max(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_destination_port(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_tos(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_ttl(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_ageing(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_limit(setting:PNMSettingVxlan):Tguint;cdecl;external;
function nm_setting_vxlan_get_proxy(setting:PNMSettingVxlan):Tgboolean;cdecl;external;
function nm_setting_vxlan_get_learning(setting:PNMSettingVxlan):Tgboolean;cdecl;external;
function nm_setting_vxlan_get_rsc(setting:PNMSettingVxlan):Tgboolean;cdecl;external;
function nm_setting_vxlan_get_l2_miss(setting:PNMSettingVxlan):Tgboolean;cdecl;external;
function nm_setting_vxlan_get_l3_miss(setting:PNMSettingVxlan):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_VXLAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_VXLAN : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_VXLAN:=nm_setting_vxlan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN(obj : longint) : longint;
begin
  NM_SETTING_VXLAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_VXLAN,NMSettingVxlan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN_CLASS(klass : longint) : longint;
begin
  NM_SETTING_VXLAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_VXLANCONFIG,NMSettingVxlanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VXLAN(obj : longint) : longint;
begin
  NM_IS_SETTING_VXLAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_VXLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VXLAN_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_VXLAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_VXLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VXLAN_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_VXLAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_VXLAN,NMSettingVxlanClass);
end;


end.
