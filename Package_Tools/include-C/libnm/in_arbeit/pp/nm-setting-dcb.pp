
unit nm-setting-dcb;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-dcb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-dcb.h
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
PNMSettingDcb  = ^NMSettingDcb;
PNMSettingDcbFlags  = ^NMSettingDcbFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_DCB_H__}
{$define __NM_SETTING_DCB_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_DCB : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_DCB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_DCB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_DCB_SETTING_NAME = 'dcb';  
{*
 * NMSettingDcbFlags:
 * @NM_SETTING_DCB_FLAG_NONE: no flag
 * @NM_SETTING_DCB_FLAG_ENABLE: the feature is enabled
 * @NM_SETTING_DCB_FLAG_ADVERTISE: the feature is advertised
 * @NM_SETTING_DCB_FLAG_WILLING: the feature is willing to change based on
 * peer configuration advertisements
 *
 * DCB feature flags.
 * }
{< flags > }type
  PNMSettingDcbFlags = ^TNMSettingDcbFlags;
  TNMSettingDcbFlags =  Longint;
  Const
    NM_SETTING_DCB_FLAG_NONE = $00000000;
    NM_SETTING_DCB_FLAG_ENABLE = $00000001;
    NM_SETTING_DCB_FLAG_ADVERTISE = $00000002;
    NM_SETTING_DCB_FLAG_WILLING = $00000004;
;
{*
 * NM_SETTING_DCB_FCOE_MODE_FABRIC:
 *
 * Indicates that the FCoE controller should use "fabric" mode (default)
  }
  NM_SETTING_DCB_FCOE_MODE_FABRIC = 'fabric';  
{*
 * NM_SETTING_DCB_FCOE_MODE_VN2VN:
 *
 * Indicates that the FCoE controller should use "VN2VN" mode.
  }
  NM_SETTING_DCB_FCOE_MODE_VN2VN = 'vn2vn';  
{ Properties  }
  NM_SETTING_DCB_APP_FCOE_FLAGS = 'app-fcoe-flags';  
  NM_SETTING_DCB_APP_FCOE_PRIORITY = 'app-fcoe-priority';  
  NM_SETTING_DCB_APP_FCOE_MODE = 'app-fcoe-mode';  
  NM_SETTING_DCB_APP_ISCSI_FLAGS = 'app-iscsi-flags';  
  NM_SETTING_DCB_APP_ISCSI_PRIORITY = 'app-iscsi-priority';  
  NM_SETTING_DCB_APP_FIP_FLAGS = 'app-fip-flags';  
  NM_SETTING_DCB_APP_FIP_PRIORITY = 'app-fip-priority';  
  NM_SETTING_DCB_PRIORITY_FLOW_CONTROL_FLAGS = 'priority-flow-control-flags';  
  NM_SETTING_DCB_PRIORITY_FLOW_CONTROL = 'priority-flow-control';  
  NM_SETTING_DCB_PRIORITY_GROUP_FLAGS = 'priority-group-flags';  
  NM_SETTING_DCB_PRIORITY_GROUP_ID = 'priority-group-id';  
  NM_SETTING_DCB_PRIORITY_GROUP_BANDWIDTH = 'priority-group-bandwidth';  
  NM_SETTING_DCB_PRIORITY_BANDWIDTH = 'priority-bandwidth';  
  NM_SETTING_DCB_PRIORITY_STRICT_BANDWIDTH = 'priority-strict-bandwidth';  
  NM_SETTING_DCB_PRIORITY_TRAFFIC_CLASS = 'priority-traffic-class';  
type

function nm_setting_dcb_get_type:TGType;cdecl;external;
function nm_setting_dcb_new:PNMSetting;cdecl;external;
function nm_setting_dcb_get_app_fcoe_flags(setting:PNMSettingDcb):TNMSettingDcbFlags;cdecl;external;
function nm_setting_dcb_get_app_fcoe_priority(setting:PNMSettingDcb):longint;cdecl;external;
(* Const before type ignored *)
function nm_setting_dcb_get_app_fcoe_mode(setting:PNMSettingDcb):Pchar;cdecl;external;
function nm_setting_dcb_get_app_iscsi_flags(setting:PNMSettingDcb):TNMSettingDcbFlags;cdecl;external;
function nm_setting_dcb_get_app_iscsi_priority(setting:PNMSettingDcb):longint;cdecl;external;
function nm_setting_dcb_get_app_fip_flags(setting:PNMSettingDcb):TNMSettingDcbFlags;cdecl;external;
function nm_setting_dcb_get_app_fip_priority(setting:PNMSettingDcb):longint;cdecl;external;
{ Priority Flow Control  }
function nm_setting_dcb_get_priority_flow_control_flags(setting:PNMSettingDcb):TNMSettingDcbFlags;cdecl;external;
function nm_setting_dcb_get_priority_flow_control(setting:PNMSettingDcb; user_priority:Tguint):Tgboolean;cdecl;external;
procedure nm_setting_dcb_set_priority_flow_control(setting:PNMSettingDcb; user_priority:Tguint; enabled:Tgboolean);cdecl;external;
{ Priority Groups  }
function nm_setting_dcb_get_priority_group_flags(setting:PNMSettingDcb):TNMSettingDcbFlags;cdecl;external;
function nm_setting_dcb_get_priority_group_id(setting:PNMSettingDcb; user_priority:Tguint):Tguint;cdecl;external;
procedure nm_setting_dcb_set_priority_group_id(setting:PNMSettingDcb; user_priority:Tguint; group_id:Tguint);cdecl;external;
function nm_setting_dcb_get_priority_group_bandwidth(setting:PNMSettingDcb; group_id:Tguint):Tguint;cdecl;external;
procedure nm_setting_dcb_set_priority_group_bandwidth(setting:PNMSettingDcb; group_id:Tguint; bandwidth_percent:Tguint);cdecl;external;
function nm_setting_dcb_get_priority_bandwidth(setting:PNMSettingDcb; user_priority:Tguint):Tguint;cdecl;external;
procedure nm_setting_dcb_set_priority_bandwidth(setting:PNMSettingDcb; user_priority:Tguint; bandwidth_percent:Tguint);cdecl;external;
function nm_setting_dcb_get_priority_strict_bandwidth(setting:PNMSettingDcb; user_priority:Tguint):Tgboolean;cdecl;external;
procedure nm_setting_dcb_set_priority_strict_bandwidth(setting:PNMSettingDcb; user_priority:Tguint; strict:Tgboolean);cdecl;external;
function nm_setting_dcb_get_priority_traffic_class(setting:PNMSettingDcb; user_priority:Tguint):Tguint;cdecl;external;
procedure nm_setting_dcb_set_priority_traffic_class(setting:PNMSettingDcb; user_priority:Tguint; traffic_class:Tguint);cdecl;external;
{$endif}
{ __NM_SETTING_DCB_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_DCB : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_DCB:=nm_setting_dcb_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB(obj : longint) : longint;
begin
  NM_SETTING_DCB:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_DCB,NMSettingDcb);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB_CLASS(klass : longint) : longint;
begin
  NM_SETTING_DCB_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_DCB,NMSettingDcbClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_DCB(obj : longint) : longint;
begin
  NM_IS_SETTING_DCB:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_DCB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_DCB_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_DCB_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_DCB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_DCB_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_DCB_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_DCB,NMSettingDcbClass);
end;


end.
