
unit nm-setting-tc-config;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-tc-config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-tc-config.h
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
PGError  = ^GError;
PGVariant  = ^GVariant;
PNMSetting  = ^NMSetting;
PNMSettingTCConfig  = ^NMSettingTCConfig;
PNMTCAction  = ^NMTCAction;
PNMTCQdisc  = ^NMTCQdisc;
PNMTCTfilter  = ^NMTCTfilter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef NM_SETTING_TC_CONFIG_H}
{$define NM_SETTING_TC_CONFIG_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
type

function nm_tc_qdisc_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_tc_qdisc_new(kind:Pchar; parent:Tguint32; error:PPGError):PNMTCQdisc;cdecl;external;
procedure nm_tc_qdisc_ref(qdisc:PNMTCQdisc);cdecl;external;
procedure nm_tc_qdisc_unref(qdisc:PNMTCQdisc);cdecl;external;
function nm_tc_qdisc_equal(qdisc:PNMTCQdisc; other:PNMTCQdisc):Tgboolean;cdecl;external;
function nm_tc_qdisc_dup(qdisc:PNMTCQdisc):PNMTCQdisc;cdecl;external;
(* Const before type ignored *)
function nm_tc_qdisc_get_kind(qdisc:PNMTCQdisc):Pchar;cdecl;external;
function nm_tc_qdisc_get_handle(qdisc:PNMTCQdisc):Tguint32;cdecl;external;
procedure nm_tc_qdisc_set_handle(qdisc:PNMTCQdisc; handle:Tguint32);cdecl;external;
function nm_tc_qdisc_get_parent(qdisc:PNMTCQdisc):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_tc_qdisc_get_attribute_names(qdisc:PNMTCQdisc):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_tc_qdisc_get_attribute(qdisc:PNMTCQdisc; name:Pchar):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure nm_tc_qdisc_set_attribute(qdisc:PNMTCQdisc; name:Pchar; value:PGVariant);cdecl;external;
type

function nm_tc_action_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_tc_action_new(kind:Pchar; error:PPGError):PNMTCAction;cdecl;external;
procedure nm_tc_action_ref(action:PNMTCAction);cdecl;external;
procedure nm_tc_action_unref(action:PNMTCAction);cdecl;external;
function nm_tc_action_equal(action:PNMTCAction; other:PNMTCAction):Tgboolean;cdecl;external;
function nm_tc_action_dup(action:PNMTCAction):PNMTCAction;cdecl;external;
(* Const before type ignored *)
function nm_tc_action_get_kind(action:PNMTCAction):Pchar;cdecl;external;
function nm_tc_action_get_attribute_names(action:PNMTCAction):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_tc_action_get_attribute(action:PNMTCAction; name:Pchar):PGVariant;cdecl;external;
(* Const before type ignored *)
procedure nm_tc_action_set_attribute(action:PNMTCAction; name:Pchar; value:PGVariant);cdecl;external;
type

function nm_tc_tfilter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_tc_tfilter_new(kind:Pchar; parent:Tguint32; error:PPGError):PNMTCTfilter;cdecl;external;
procedure nm_tc_tfilter_ref(tfilter:PNMTCTfilter);cdecl;external;
procedure nm_tc_tfilter_unref(tfilter:PNMTCTfilter);cdecl;external;
function nm_tc_tfilter_equal(tfilter:PNMTCTfilter; other:PNMTCTfilter):Tgboolean;cdecl;external;
function nm_tc_tfilter_dup(tfilter:PNMTCTfilter):PNMTCTfilter;cdecl;external;
(* Const before type ignored *)
function nm_tc_tfilter_get_kind(tfilter:PNMTCTfilter):Pchar;cdecl;external;
function nm_tc_tfilter_get_handle(tfilter:PNMTCTfilter):Tguint32;cdecl;external;
procedure nm_tc_tfilter_set_handle(tfilter:PNMTCTfilter; handle:Tguint32);cdecl;external;
function nm_tc_tfilter_get_parent(tfilter:PNMTCTfilter):Tguint32;cdecl;external;
function nm_tc_tfilter_get_action(tfilter:PNMTCTfilter):PNMTCAction;cdecl;external;
procedure nm_tc_tfilter_set_action(tfilter:PNMTCTfilter; action:PNMTCAction);cdecl;external;
{ was #define dname def_expr }
function NM_TYPE_SETTING_TC_CONFIG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TC_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TC_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_TC_CONFIG_SETTING_NAME = 'tc';  
  NM_SETTING_TC_CONFIG_QDISCS = 'qdiscs';  
  NM_SETTING_TC_CONFIG_TFILTERS = 'tfilters';  
type

function nm_setting_tc_config_get_type:TGType;cdecl;external;
function nm_setting_tc_config_new:PNMSetting;cdecl;external;
function nm_setting_tc_config_get_num_qdiscs(setting:PNMSettingTCConfig):Tguint;cdecl;external;
function nm_setting_tc_config_get_qdisc(setting:PNMSettingTCConfig; idx:Tguint):PNMTCQdisc;cdecl;external;
function nm_setting_tc_config_add_qdisc(setting:PNMSettingTCConfig; qdisc:PNMTCQdisc):Tgboolean;cdecl;external;
procedure nm_setting_tc_config_remove_qdisc(setting:PNMSettingTCConfig; idx:Tguint);cdecl;external;
function nm_setting_tc_config_remove_qdisc_by_value(setting:PNMSettingTCConfig; qdisc:PNMTCQdisc):Tgboolean;cdecl;external;
procedure nm_setting_tc_config_clear_qdiscs(setting:PNMSettingTCConfig);cdecl;external;
function nm_setting_tc_config_get_num_tfilters(setting:PNMSettingTCConfig):Tguint;cdecl;external;
function nm_setting_tc_config_get_tfilter(setting:PNMSettingTCConfig; idx:Tguint):PNMTCTfilter;cdecl;external;
function nm_setting_tc_config_add_tfilter(setting:PNMSettingTCConfig; tfilter:PNMTCTfilter):Tgboolean;cdecl;external;
procedure nm_setting_tc_config_remove_tfilter(setting:PNMSettingTCConfig; idx:Tguint);cdecl;external;
function nm_setting_tc_config_remove_tfilter_by_value(setting:PNMSettingTCConfig; tfilter:PNMTCTfilter):Tgboolean;cdecl;external;
procedure nm_setting_tc_config_clear_tfilters(setting:PNMSettingTCConfig);cdecl;external;
{$endif}
{ NM_SETTING_TC_CONFIG_H  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_TC_CONFIG : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_TC_CONFIG:=nm_setting_tc_config_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG(obj : longint) : longint;
begin
  NM_SETTING_TC_CONFIG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_TC_CONFIG,NMSettingTCConfig);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_SETTING_TC_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_TC_CONFIG,NMSettingTCConfigClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TC_CONFIG(obj : longint) : longint;
begin
  NM_IS_SETTING_TC_CONFIG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_TC_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TC_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_TC_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_TC_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TC_CONFIG_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_TC_CONFIG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_TC_CONFIG,NMSettingTCConfigClass);
end;


end.
