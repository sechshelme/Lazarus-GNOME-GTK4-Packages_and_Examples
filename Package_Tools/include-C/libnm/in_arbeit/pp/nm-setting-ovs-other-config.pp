
unit nm-setting-ovs-other-config;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-other-config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-other-config.h
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
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingOvsOtherConfig  = ^NMSettingOvsOtherConfig;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 - 2020, 2022 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_OTHER_CONFIG_H__}
{$define __NM_SETTING_OVS_OTHER_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_OTHER_CONFIG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_OTHER_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_OTHER_CONFIG_SETTING_NAME = 'ovs-other-config';  
  NM_SETTING_OVS_OTHER_CONFIG_DATA = 'data';  
type

function nm_setting_ovs_other_config_get_type:TGType;cdecl;external;
function nm_setting_ovs_other_config_new:PNMSetting;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_ovs_other_config_get_data_keys(setting:PNMSettingOvsOtherConfig; out_len:Pguint):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_ovs_other_config_get_data(setting:PNMSettingOvsOtherConfig; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_setting_ovs_other_config_set_data(setting:PNMSettingOvsOtherConfig; key:Pchar; val:Pchar);cdecl;external;
{*************************************************************************** }
{$endif}
{ __NM_SETTING_OVS_OTHER_CONFIG_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_OTHER_CONFIG : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_OTHER_CONFIG:=nm_setting_ovs_other_config_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG(obj : longint) : longint;
begin
  NM_SETTING_OVS_OTHER_CONFIG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_OTHER_CONFIG,NMSettingOvsOtherConfig);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_OTHER_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_OTHER_CONFIG,NMSettingOvsOtherConfigClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_OTHER_CONFIG(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_OTHER_CONFIG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_OTHER_CONFIG,NMSettingOvsOtherConfigClass);
end;


end.
