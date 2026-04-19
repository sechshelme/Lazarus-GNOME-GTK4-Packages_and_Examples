
unit nm-setting-user;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-user.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-user.h
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
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingUser  = ^NMSettingUser;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_USER_H__}
{$define __NM_SETTING_USER_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_USER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_USER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_USER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_USER_SETTING_NAME = 'user';  
  NM_SETTING_USER_DATA = 'data';  
type

function nm_setting_user_get_type:TGType;cdecl;external;
function nm_setting_user_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_user_get_keys(setting:PNMSettingUser; out_len:Pguint):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_user_get_data(setting:PNMSettingUser; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_user_set_data(setting:PNMSettingUser; key:Pchar; val:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_user_check_key(key:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_user_check_val(val:Pchar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_USER_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_USER : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_USER:=nm_setting_user_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER(obj : longint) : longint;
begin
  NM_SETTING_USER:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_USER,NMSettingUser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER_CLASS(klass : longint) : longint;
begin
  NM_SETTING_USER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_USER,NMSettingUserClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_USER(obj : longint) : longint;
begin
  NM_IS_SETTING_USER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_USER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_USER_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_USER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_USER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_USER_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_USER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_USER,NMSettingUserClass);
end;


end.
