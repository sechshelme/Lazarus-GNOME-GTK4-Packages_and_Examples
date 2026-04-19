
unit nm-setting-macvlan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-macvlan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-macvlan.h
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
PNMSettingMacvlan  = ^NMSettingMacvlan;
PNMSettingMacvlanMode  = ^NMSettingMacvlanMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_MACVLAN_H__}
{$define __NM_SETTING_MACVLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_MACVLAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MACVLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MACVLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_MACVLAN_SETTING_NAME = 'macvlan';  
  NM_SETTING_MACVLAN_PARENT = 'parent';  
  NM_SETTING_MACVLAN_MODE = 'mode';  
  NM_SETTING_MACVLAN_PROMISCUOUS = 'promiscuous';  
  NM_SETTING_MACVLAN_TAP = 'tap';  
type
{*
 * NMSettingMacvlanMode:
 * @NM_SETTING_MACVLAN_MODE_UNKNOWN: unknown/unset mode
 * @NM_SETTING_MACVLAN_MODE_VEPA: Virtual Ethernet Port Aggregator mode
 * @NM_SETTING_MACVLAN_MODE_BRIDGE: bridge mode
 * @NM_SETTING_MACVLAN_MODE_PRIVATE: private mode
 * @NM_SETTING_MACVLAN_MODE_PASSTHRU: passthru mode
 * @NM_SETTING_MACVLAN_MODE_SOURCE: source mode
 *
 * Since: 1.2
 * }
{< skip > }
{< skip > }

  PNMSettingMacvlanMode = ^TNMSettingMacvlanMode;
  TNMSettingMacvlanMode =  Longint;
  Const
    NM_SETTING_MACVLAN_MODE_UNKNOWN = 0;
    NM_SETTING_MACVLAN_MODE_VEPA = 1;
    NM_SETTING_MACVLAN_MODE_BRIDGE = 2;
    NM_SETTING_MACVLAN_MODE_PRIVATE = 3;
    NM_SETTING_MACVLAN_MODE_PASSTHRU = 4;
    NM_SETTING_MACVLAN_MODE_SOURCE = 5;
    _NM_SETTING_MACVLAN_MODE_NUM = 6;
    NM_SETTING_MACVLAN_MODE_LAST = _NM_SETTING_MACVLAN_MODE_NUM-1;
;

function nm_setting_macvlan_get_type:TGType;cdecl;external;
function nm_setting_macvlan_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_macvlan_get_parent(setting:PNMSettingMacvlan):Pchar;cdecl;external;
function nm_setting_macvlan_get_mode(setting:PNMSettingMacvlan):TNMSettingMacvlanMode;cdecl;external;
function nm_setting_macvlan_get_promiscuous(setting:PNMSettingMacvlan):Tgboolean;cdecl;external;
function nm_setting_macvlan_get_tap(setting:PNMSettingMacvlan):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_MACVLAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_MACVLAN : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_MACVLAN:=nm_setting_macvlan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN(obj : longint) : longint;
begin
  NM_SETTING_MACVLAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_MACVLAN,NMSettingMacvlan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN_CLASS(klass : longint) : longint;
begin
  NM_SETTING_MACVLAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_MACVLANCONFIG,NMSettingMacvlanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MACVLAN(obj : longint) : longint;
begin
  NM_IS_SETTING_MACVLAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_MACVLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_MACVLAN_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_MACVLAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_MACVLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_MACVLAN_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_MACVLAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_MACVLAN,NMSettingMacvlanClass);
end;


end.
