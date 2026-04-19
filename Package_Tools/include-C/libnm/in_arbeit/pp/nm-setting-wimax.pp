
unit nm-setting-wimax;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wimax.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wimax.h
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
PNMSettingWimax  = ^NMSettingWimax;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_SETTING_WIMAX_H__}
{$define __NM_SETTING_WIMAX_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIMAX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIMAX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIMAX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WIMAX_SETTING_NAME = 'wimax';  
  NM_SETTING_WIMAX_NETWORK_NAME = 'network-name';  
  NM_SETTING_WIMAX_MAC_ADDRESS = 'mac-address';  
type
{xxxx NM_DEPRECATED_IN__1_2 }

function nm_setting_wimax_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_setting_wimax_new:PNMSetting;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_setting_wimax_get_network_name(setting:PNMSettingWimax):Pchar;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_setting_wimax_get_mac_address(setting:PNMSettingWimax):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_WIMAX_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIMAX : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WIMAX:=nm_setting_wimax_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX(obj : longint) : longint;
begin
  NM_SETTING_WIMAX:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WIMAX,NMSettingWimax);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WIMAX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WIMAX,NMSettingWimaxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIMAX(obj : longint) : longint;
begin
  NM_IS_SETTING_WIMAX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WIMAX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIMAX_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WIMAX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WIMAX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIMAX_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WIMAX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WIMAX,NMSettingWimaxClass);
end;


end.
