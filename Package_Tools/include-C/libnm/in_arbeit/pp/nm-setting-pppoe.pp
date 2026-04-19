
unit nm-setting-pppoe;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-pppoe.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-pppoe.h
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
PNMSettingPppoe  = ^NMSettingPppoe;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_PPPOE_H__}
{$define __NM_SETTING_PPPOE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_PPPOE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPPOE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPPOE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_PPPOE_SETTING_NAME = 'pppoe';  
  NM_SETTING_PPPOE_PARENT = 'parent';  
  NM_SETTING_PPPOE_SERVICE = 'service';  
  NM_SETTING_PPPOE_USERNAME = 'username';  
  NM_SETTING_PPPOE_PASSWORD = 'password';  
  NM_SETTING_PPPOE_PASSWORD_FLAGS = 'password-flags';  
type

function nm_setting_pppoe_get_type:TGType;cdecl;external;
function nm_setting_pppoe_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_pppoe_get_parent(setting:PNMSettingPppoe):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_pppoe_get_service(setting:PNMSettingPppoe):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_pppoe_get_username(setting:PNMSettingPppoe):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_pppoe_get_password(setting:PNMSettingPppoe):Pchar;cdecl;external;
function nm_setting_pppoe_get_password_flags(setting:PNMSettingPppoe):TNMSettingSecretFlags;cdecl;external;
{$endif}
{ __NM_SETTING_PPPOE_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_PPPOE : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_PPPOE:=nm_setting_pppoe_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE(obj : longint) : longint;
begin
  NM_SETTING_PPPOE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_PPPOE,NMSettingPppoe);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE_CLASS(klass : longint) : longint;
begin
  NM_SETTING_PPPOE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_PPPOE,NMSettingPppoeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPPOE(obj : longint) : longint;
begin
  NM_IS_SETTING_PPPOE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_PPPOE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPPOE_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_PPPOE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_PPPOE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPPOE_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_PPPOE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_PPPOE,NMSettingPppoeClass);
end;


end.
