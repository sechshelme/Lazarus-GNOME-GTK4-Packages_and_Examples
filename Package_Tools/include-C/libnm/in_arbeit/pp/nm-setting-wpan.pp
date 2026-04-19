
unit nm-setting-wpan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wpan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wpan.h
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
PNMSettingWpan  = ^NMSettingWpan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Lubomir Rintel <lkundrak@v3.sk>
  }
{$ifndef __NM_SETTING_WPAN_H__}
{$define __NM_SETTING_WPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_WPAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WPAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WPAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WPAN_SETTING_NAME = 'wpan';  
  NM_SETTING_WPAN_MAC_ADDRESS = 'mac-address';  
  NM_SETTING_WPAN_PAN_ID = 'pan-id';  
  NM_SETTING_WPAN_SHORT_ADDRESS = 'short-address';  
  NM_SETTING_WPAN_PAGE = 'page';  
  NM_SETTING_WPAN_CHANNEL = 'channel';  
  NM_SETTING_WPAN_PAGE_DEFAULT = -(1);  
  NM_SETTING_WPAN_CHANNEL_DEFAULT = -(1);  
type

function nm_setting_wpan_get_type:TGType;cdecl;external;
function nm_setting_wpan_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_wpan_get_mac_address(setting:PNMSettingWpan):Pchar;cdecl;external;
function nm_setting_wpan_get_pan_id(setting:PNMSettingWpan):Tguint16;cdecl;external;
function nm_setting_wpan_get_short_address(setting:PNMSettingWpan):Tguint16;cdecl;external;
function nm_setting_wpan_get_page(setting:PNMSettingWpan):Tgint16;cdecl;external;
function nm_setting_wpan_get_channel(setting:PNMSettingWpan):Tgint16;cdecl;external;
{$endif}
{ __NM_SETTING_WPAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WPAN : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WPAN:=nm_setting_wpan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN(obj : longint) : longint;
begin
  NM_SETTING_WPAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WPAN,NMSettingWpan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WPAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WPANCONFIG,NMSettingWpanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WPAN(obj : longint) : longint;
begin
  NM_IS_SETTING_WPAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WPAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WPAN_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WPAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WPAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WPAN_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WPAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WPAN,NMSettingWpanClass);
end;


end.
