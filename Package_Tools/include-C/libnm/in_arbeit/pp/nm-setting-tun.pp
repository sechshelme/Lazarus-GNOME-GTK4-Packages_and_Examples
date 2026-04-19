
unit nm-setting-tun;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-tun.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-tun.h
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
PNMSettingTun  = ^NMSettingTun;
PNMSettingTunMode  = ^NMSettingTunMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_TUN_H__}
{$define __NM_SETTING_TUN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_TUN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TUN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TUN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_TUN_SETTING_NAME = 'tun';  
  NM_SETTING_TUN_MODE = 'mode';  
  NM_SETTING_TUN_OWNER = 'owner';  
  NM_SETTING_TUN_GROUP = 'group';  
  NM_SETTING_TUN_PI = 'pi';  
  NM_SETTING_TUN_VNET_HDR = 'vnet-hdr';  
  NM_SETTING_TUN_MULTI_QUEUE = 'multi-queue';  
{*
 * NMSettingTunMode:
 * @NM_SETTING_TUN_MODE_UNKNOWN: an unknown device type
 * @NM_SETTING_TUN_MODE_TUN: a TUN device
 * @NM_SETTING_TUN_MODE_TAP: a TAP device
 *
 * #NMSettingTunMode values indicate the device type (TUN/TAP)
 *
 * Since: 1.2
  }
type
  PNMSettingTunMode = ^TNMSettingTunMode;
  TNMSettingTunMode =  Longint;
  Const
    NM_SETTING_TUN_MODE_UNKNOWN = 0;
    NM_SETTING_TUN_MODE_TUN = 1;
    NM_SETTING_TUN_MODE_TAP = 2;
;
type

function nm_setting_tun_get_type:TGType;cdecl;external;
function nm_setting_tun_new:PNMSetting;cdecl;external;
function nm_setting_tun_get_mode(setting:PNMSettingTun):TNMSettingTunMode;cdecl;external;
(* Const before type ignored *)
function nm_setting_tun_get_owner(setting:PNMSettingTun):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_tun_get_group(setting:PNMSettingTun):Pchar;cdecl;external;
function nm_setting_tun_get_pi(setting:PNMSettingTun):Tgboolean;cdecl;external;
function nm_setting_tun_get_vnet_hdr(setting:PNMSettingTun):Tgboolean;cdecl;external;
function nm_setting_tun_get_multi_queue(setting:PNMSettingTun):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_TUN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_TUN : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_TUN:=nm_setting_tun_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN(obj : longint) : longint;
begin
  NM_SETTING_TUN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_TUN,NMSettingTun);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN_CLASS(klass : longint) : longint;
begin
  NM_SETTING_TUN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_TUNCONFIG,NMSettingTunClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TUN(obj : longint) : longint;
begin
  NM_IS_SETTING_TUN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_TUN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TUN_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_TUN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_TUN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TUN_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_TUN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_TUN,NMSettingTunClass);
end;


end.
