
unit nm-setting-loopback;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-loopback.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-loopback.h
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
PNMSetting  = ^NMSetting;
PNMSettingLoopback  = ^NMSettingLoopback;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2022 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_LOOPBACK_H__}
{$define __NM_SETTING_LOOPBACK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_LOOPBACK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LOOPBACK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LOOPBACK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_LOOPBACK_SETTING_NAME = 'loopback';  
  NM_SETTING_LOOPBACK_MTU = 'mtu';  
type

function nm_setting_loopback_get_type:TGType;cdecl;external;
function nm_setting_loopback_new:PNMSetting;cdecl;external;
function nm_setting_loopback_get_mtu(setting:PNMSettingLoopback):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_LOOPBACK_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_LOOPBACK : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_LOOPBACK:=nm_setting_loopback_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK(obj : longint) : longint;
begin
  NM_SETTING_LOOPBACK:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_LOOPBACK,NMSettingLoopback);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK_CLASS(klass : longint) : longint;
begin
  NM_SETTING_LOOPBACK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_LOOPBACKCONFIG,NMSettingLoopbackClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LOOPBACK(obj : longint) : longint;
begin
  NM_IS_SETTING_LOOPBACK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_LOOPBACK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LOOPBACK_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_LOOPBACK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_LOOPBACK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LOOPBACK_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_LOOPBACK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_LOOPBACK,NMSettingLoopbackClass);
end;


end.
