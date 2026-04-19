
unit nm-setting-generic;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-generic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-generic.h
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
PNMSettingGeneric  = ^NMSettingGeneric;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_GENERIC_H__}
{$define __NM_SETTING_GENERIC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_GENERIC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GENERIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GENERIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_GENERIC_SETTING_NAME = 'generic';  
  NM_SETTING_GENERIC_DEVICE_HANDLER = 'device-handler';  
type

function nm_setting_generic_get_type:TGType;cdecl;external;
function nm_setting_generic_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_generic_get_device_handler(setting:PNMSettingGeneric):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_GENERIC_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_GENERIC : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_GENERIC:=nm_setting_generic_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC(obj : longint) : longint;
begin
  NM_SETTING_GENERIC:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_GENERIC,NMSettingGeneric);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC_CLASS(klass : longint) : longint;
begin
  NM_SETTING_GENERIC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_GENERIC,NMSettingGenericClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GENERIC(obj : longint) : longint;
begin
  NM_IS_SETTING_GENERIC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_GENERIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_GENERIC_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_GENERIC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_GENERIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_GENERIC_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_GENERIC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_GENERIC,NMSettingGenericClass);
end;


end.
