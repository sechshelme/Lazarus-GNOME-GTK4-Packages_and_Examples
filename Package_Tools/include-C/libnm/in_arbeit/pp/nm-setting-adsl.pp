
unit nm-setting-adsl;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-adsl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-adsl.h
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
PNMSettingAdsl  = ^NMSettingAdsl;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_ADSL_H__}
{$define __NM_SETTING_ADSL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_ADSL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ADSL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ADSL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_ADSL_SETTING_NAME = 'adsl';  
  NM_SETTING_ADSL_USERNAME = 'username';  
  NM_SETTING_ADSL_PASSWORD = 'password';  
  NM_SETTING_ADSL_PASSWORD_FLAGS = 'password-flags';  
  NM_SETTING_ADSL_PROTOCOL = 'protocol';  
  NM_SETTING_ADSL_ENCAPSULATION = 'encapsulation';  
  NM_SETTING_ADSL_VPI = 'vpi';  
  NM_SETTING_ADSL_VCI = 'vci';  
  NM_SETTING_ADSL_PROTOCOL_PPPOA = 'pppoa';  
  NM_SETTING_ADSL_PROTOCOL_PPPOE = 'pppoe';  
  NM_SETTING_ADSL_PROTOCOL_IPOATM = 'ipoatm';  
  NM_SETTING_ADSL_ENCAPSULATION_VCMUX = 'vcmux';  
  NM_SETTING_ADSL_ENCAPSULATION_LLC = 'llc';  
type

function nm_setting_adsl_get_type:TGType;cdecl;external;
function nm_setting_adsl_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_adsl_get_username(setting:PNMSettingAdsl):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_adsl_get_password(setting:PNMSettingAdsl):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_adsl_get_protocol(setting:PNMSettingAdsl):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_adsl_get_encapsulation(setting:PNMSettingAdsl):Pchar;cdecl;external;
function nm_setting_adsl_get_vpi(setting:PNMSettingAdsl):Tguint32;cdecl;external;
function nm_setting_adsl_get_vci(setting:PNMSettingAdsl):Tguint32;cdecl;external;
function nm_setting_adsl_get_password_flags(setting:PNMSettingAdsl):TNMSettingSecretFlags;cdecl;external;
{$endif}
{ __NM_SETTING_ADSL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_ADSL : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_ADSL:=nm_setting_adsl_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL(obj : longint) : longint;
begin
  NM_SETTING_ADSL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_ADSL,NMSettingAdsl);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL_CLASS(klass : longint) : longint;
begin
  NM_SETTING_ADSL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_ADSL,NMSettingAdslClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ADSL(obj : longint) : longint;
begin
  NM_IS_SETTING_ADSL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_ADSL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ADSL_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_ADSL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_ADSL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ADSL_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_ADSL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_ADSL,NMSettingAdslClass);
end;


end.
