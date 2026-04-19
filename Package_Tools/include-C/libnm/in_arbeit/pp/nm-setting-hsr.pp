
unit nm-setting-hsr;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-hsr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-hsr.h
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
PNMSettingHsr  = ^NMSettingHsr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2023 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_HSR_H__}
{$define __NM_SETTING_HSR_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_HSR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HSR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HSR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HSR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HSR_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_HSR_SETTING_NAME = 'hsr';  
  NM_SETTING_HSR_PORT1 = 'port1';  
  NM_SETTING_HSR_PORT2 = 'port2';  
  NM_SETTING_HSR_MULTICAST_SPEC = 'multicast-spec';  
  NM_SETTING_HSR_PRP = 'prp';  
type

function nm_setting_hsr_get_type:TGType;cdecl;external;
function nm_setting_hsr_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_hsr_get_port1(setting:PNMSettingHsr):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_hsr_get_port2(setting:PNMSettingHsr):Pchar;cdecl;external;
function nm_setting_hsr_get_multicast_spec(setting:PNMSettingHsr):Tguint32;cdecl;external;
function nm_setting_hsr_get_prp(setting:PNMSettingHsr):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_HSR_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_HSR : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_HSR:=nm_setting_hsr_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HSR(obj : longint) : longint;
begin
  NM_SETTING_HSR:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_HSR,NMSettingHsr);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HSR(obj : longint) : longint;
begin
  NM_IS_SETTING_HSR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_HSR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HSR_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_HSR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_HSR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HSR_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_HSR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_HSR,NMSettingHsrClass);
end;


end.
