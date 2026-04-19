
unit nm-setting-cdma;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-cdma.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-cdma.h
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
PNMSettingCdma  = ^NMSettingCdma;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_CDMA_H__}
{$define __NM_SETTING_CDMA_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_CDMA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_CDMA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_CDMA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_CDMA_SETTING_NAME = 'cdma';  
  NM_SETTING_CDMA_NUMBER = 'number';  
  NM_SETTING_CDMA_USERNAME = 'username';  
  NM_SETTING_CDMA_PASSWORD = 'password';  
  NM_SETTING_CDMA_PASSWORD_FLAGS = 'password-flags';  
  NM_SETTING_CDMA_MTU = 'mtu';  
type

function nm_setting_cdma_get_type:TGType;cdecl;external;
function nm_setting_cdma_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_cdma_get_number(setting:PNMSettingCdma):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_cdma_get_username(setting:PNMSettingCdma):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_cdma_get_password(setting:PNMSettingCdma):Pchar;cdecl;external;
function nm_setting_cdma_get_password_flags(setting:PNMSettingCdma):TNMSettingSecretFlags;cdecl;external;
function nm_setting_cdma_get_mtu(setting:PNMSettingCdma):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_CDMA_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_CDMA : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_CDMA:=nm_setting_cdma_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA(obj : longint) : longint;
begin
  NM_SETTING_CDMA:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_CDMA,NMSettingCdma);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA_CLASS(klass : longint) : longint;
begin
  NM_SETTING_CDMA_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_CDMA,NMSettingCdmaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_CDMA(obj : longint) : longint;
begin
  NM_IS_SETTING_CDMA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_CDMA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_CDMA_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_CDMA_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_CDMA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_CDMA_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_CDMA_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_CDMA,NMSettingCdmaClass);
end;


end.
